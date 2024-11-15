// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/AccountHandler" })
public class AccountHandler extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(AccountHandler.class);
  private static final long serialVersionUID = 1L;

  public AccountHandler() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    PreparedStatement pstmt3 = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;
    Connection con3 = null;
    int totalpaid = 0;
    boolean RNewAmount = false;
    int dbRemainAmount = 0;
    boolean planAmount = false;
    int dbTotalAmount = 0;
    int dbsubmitted_amount = 0;
    boolean dbpaid_amount = false;
    boolean remainingamt = false;
    boolean finaltotal = false;
    String dbmod = "";
    String dbcrm = "";
    String dbdoctor_name = "";
    String dbpatient_name = "";
    String dbinvoice_no = "";
    String dbinvoice_date = "";
    String user = "";
    HttpSession session = request.getSession();
    user = (String) session.getAttribute("userid");
    System.out.println("####user...... " + user);
    String crm = request.getParameter("CRM") == null ? "" : request.getParameter("CRM");
    String DoctorName = request.getParameter("DoctorName") == null ? "" : request.getParameter("DoctorName");
    String PatientName = request.getParameter("PatientName") == null ? "" : request.getParameter("PatientName");
    String caseid = request.getParameter("caseid") == null ? "" : request.getParameter("caseid");
    String remarks = request.getParameter("remarks") == null ? "" : request.getParameter("remarks");
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    int NewAmount = Integer
        .parseInt(request.getParameter("NewAmount") == null ? "0" : request.getParameter("NewAmount"));
    int RevokeAmount = Integer
        .parseInt(request.getParameter("RevAmount") == null ? "0" : request.getParameter("RevAmount"));

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      con3 = LoginDAO.getConnectionDetails();
      if (query.equals("newamt")) {
        String sql = "SELECT case_id FROM  cc_crm where case_id='" + caseid + "'";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rst = stmt.executeQuery();
        if (rst.next()) {
          pstmt1 = con.prepareStatement(
              " select submitted_amount,payment,remain_amount,invoice_no,invoice_date from account where case_id=? order by account_id desc ");
          pstmt1.setString(1, caseid);
          rs1 = pstmt1.executeQuery();
          if (rs1.next()) {
            totalpaid = rs1.getInt("submitted_amount");
            dbTotalAmount = rs1.getInt("payment");
            dbRemainAmount = rs1.getInt("remain_amount");
            dbinvoice_no = rs1.getString("invoice_no");
            dbinvoice_date = rs1.getString("invoice_date");
            if (dbinvoice_date != null) {
              System.out.println("###pass...aaA");
              dbinvoice_date = rs1.getString("invoice_date");
            }
          }

          int RNewAmount1 = NewAmount - totalpaid;
          PreparedStatement pstmt01 = con1.prepareStatement(
              " INSERT INTO account_change(case_id,new_amount,previous_amount,reason,user,date)VALUES(?,?,?,?,?,now()) ");
          pstmt01.setString(1, caseid);
          pstmt01.setInt(2, NewAmount);
          pstmt01.setInt(3, dbTotalAmount);
          pstmt01.setString(4, remarks);
          pstmt01.setString(5, user);
          pstmt01.executeUpdate();
          pstmt = con.prepareStatement(
              " INSERT INTO account (crm, doctor_name,patient_name,payment,remain_amount,case_id,submitted_amount,date,invoice_no,invoice_date,user)  values(?,?,?,?,?,?,?,now(),?,?,?) ");
          pstmt.setString(1, crm);
          pstmt.setString(2, DoctorName);
          pstmt.setString(3, PatientName);
          pstmt.setInt(4, NewAmount);
          pstmt.setInt(5, RNewAmount1);
          pstmt.setString(6, caseid);
          pstmt.setInt(7, totalpaid);
          pstmt.setString(8, dbinvoice_no);
          pstmt.setString(9, dbinvoice_date);
          pstmt.setString(10, user);
          int rowaffected = pstmt.executeUpdate();
          if (rowaffected > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Amount Updated Successfully!');");
            out.println("location='Case_Stage';");
            out.println("</script>");
            con.close();
          }
        } else {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Case id " + caseid + " does not exists!');");
          out.println("location='accountupdateamount.jsp';");
          out.println("</script>");
        }
      }

      if (query.equals("revokeamt")) {
        pstmt2 = con2.prepareStatement(
            " select remain_amount,payment,submitted_amount,payment_mode,crm,doctor_name,patient_name,user from account where case_id=? order by account_id desc limit 1");
        pstmt2.setString(1, caseid);
        rs2 = pstmt2.executeQuery();
        if (rs2.next()) {
          dbRemainAmount = rs2.getInt("remain_amount");
          dbTotalAmount = rs2.getInt("payment");
          dbsubmitted_amount = rs2.getInt("submitted_amount");
          dbmod = rs2.getString("payment_mode");
          dbcrm = rs2.getString("crm");
          dbdoctor_name = rs2.getString("doctor_name");
          dbpatient_name = rs2.getString("patient_name");
          user = rs2.getString("user");
        }

        int paidAmount = dbTotalAmount - dbRemainAmount;
        boolean amountCheck = RevokeAmount <= paidAmount;
        if (!amountCheck) {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Revoke amount is higher than paid amount!');");
          out.println("window.location='AccountRevokedataShow?id=" + caseid + "';");
          out.println("</script>");
        } else {
          int remainingamt1 = dbRemainAmount + RevokeAmount;
          pstmt3 = con3.prepareStatement(
              " insert into account(case_id,payment,remain_amount,remarks,revoke_amount,submitted_amount,user,date) values(?,?,?,?,?,?,?,now()) ");
          pstmt3.setString(1, caseid);
          pstmt3.setInt(2, dbTotalAmount);
          pstmt3.setInt(3, remainingamt1);
          pstmt3.setString(4, remarks);
          pstmt3.setInt(5, RevokeAmount);
          pstmt3.setInt(6, dbsubmitted_amount - RevokeAmount);
          pstmt3.setString(7, user);
          System.out.println("account handlerpstmt3: " + pstmt3.toString());
          int rowaffected = pstmt3.executeUpdate();
          if (rowaffected > 0) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Amount Revoked Successfully!');");
            String value = "AccountRevokedataShow?id=" + caseid;
            out.println("location='" + value + "';");
            out.println("</script>");
          }
        }
      }
    } catch (Exception var1989) {
      var1989.printStackTrace();
      System.out.println("exception " + var1989.getMessage());
      LOGGER.info("Error At =" + var1989.getMessage());
    } finally {
      if (rs1 != null) {
        try {
          rs1.close();
        } catch (Exception var1987) {
          var1987.printStackTrace();
        } finally {
          rs1 = null;
        }
      }

      if (rs2 != null) {
        try {
          rs2.close();
        } catch (Exception var1985) {
          var1985.printStackTrace();
        } finally {
          rs2 = null;
        }
      }

      if (pstmt != null) {
        try {
          pstmt.close();
        } catch (Exception var1983) {
          var1983.printStackTrace();
        } finally {
          pstmt = null;
        }
      }

      if (pstmt1 != null) {
        try {
          pstmt1.close();
        } catch (Exception var1981) {
          var1981.printStackTrace();
        } finally {
          pstmt1 = null;
        }
      }

      if (pstmt2 != null) {
        try {
          pstmt2.close();
        } catch (Exception var1979) {
          var1979.printStackTrace();
        } finally {
          pstmt2 = null;
        }
      }

      if (pstmt3 != null) {
        try {
          pstmt3.close();
        } catch (Exception var1977) {
          var1977.printStackTrace();
        } finally {
          pstmt3 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var1975) {
          var1975.printStackTrace();
        } finally {
          con = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var1973) {
          var1973.printStackTrace();
        } finally {
          con1 = null;
        }
      }

      if (con2 != null) {
        try {
          con2.close();
        } catch (Exception var1971) {
          var1971.printStackTrace();
        } finally {
          con2 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var1969) {
          var1969.printStackTrace();
        } finally {
          con3 = null;
        }
      }

      out.flush();
      System.gc();
    }

  }
}
