
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SaveAccount" })
public class SaveAccount extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(SaveAccount.class);
  private static final long serialVersionUID = 1L;
  private String Null;

  public SaveAccount() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    Connection con = null;
    String crm = request.getParameter("CRM");
    String DoctorName = request.getParameter("DoctorName");
    String PatientName = request.getParameter("PatientName");
    String caseid = request.getParameter("caseid");
    String modepayment = request.getParameter("modepayment");
    String total = request.getParameter("total");
    String remainAmount = request.getParameter("RemainAmount");
    String user = request.getParameter("user");
    String invoice_no = request.getParameter("invoice_no");
    String invoice_date = request.getParameter("invoice_date");
    String isInvoiceExist = LoginDAO.getInvoiceNo(invoice_no);
    System.out.println("SaveAccount invoiceres: " + isInvoiceExist);
    String paidAmount = request.getParameter("PaidAmount") == null ? "0" : request.getParameter("PaidAmount");
    System.out.println("paidAmount : " + paidAmount + " total : " + total);
    String sql1 = "";
    String query = "";
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;

    try {
      boolean amountCheck = Integer.parseInt(paidAmount) <= Integer.parseInt(total);
      if (!amountCheck) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Paid amount should be less than plan amount!');");
        out.println("location='account.jsp';");
        out.println("</script>");
      } else {
        con = LoginDAO.getConnectionDetails();
        st = con.createStatement();
        st1 = con.createStatement();
        String redirecturl = "SearchAccountNumber";
        String sql = "SELECT * FROM  cc_crm where case_id='" + caseid + "'";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rst = stmt.executeQuery();
        if (rst.next()) {
          sql1 = " SELECT * FROM  account where case_id='" + caseid + "' ";
          rs = st.executeQuery(sql1);
          if (rs.next()) {
            out.println("<script type=\"text/javascript\">");
            out.println(
                "alert('case id " + caseid + " already exist,you cannot add more than once,try to update it.');");
            out.println("location='" + redirecturl + "';");
            out.println("</script>");
          } else if (isInvoiceExist.equals("false")) {
            if (invoice_date.equals("")) {
              System.out.println("pass...aaA");
              query = " INSERT INTO account(crm, doctor_name , patient_name, case_id ,payment_mode,payment,submitted_amount,remain_amount,paid_amount,user,invoice_no,invoice_date) VALUES('"
                  + crm + "','" + DoctorName + "','" + PatientName + "','" + caseid + "','" + modepayment + "','"
                  + total + "','" + paidAmount + "','" + remainAmount + "','" + paidAmount + "','" + user + "','"
                  + invoice_no + "',NULL) ";
            } else {
              System.out.println("fail...");
              query = " INSERT INTO account(crm, doctor_name , patient_name, case_id ,payment_mode,payment,submitted_amount,remain_amount,paid_amount,user,invoice_no,invoice_date) VALUES('"
                  + crm + "','" + DoctorName + "','" + PatientName + "','" + caseid + "','" + modepayment + "','"
                  + total + "','" + paidAmount + "','" + remainAmount + "','" + paidAmount + "','" + user + "','"
                  + invoice_no + "','" + invoice_date + "') ";
            }

            int row = st1.executeUpdate(query);
            if (row > 0) {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='account.jsp';");
              out.println("</script>");
              con.close();
            }
          } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invoice no is already exist!');");
            out.println("window.location='AccountdataShow?account_number=" + caseid + "';");
            out.println("</script>");
          }
        } else {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Case id " + caseid + " does not exists!');");
          out.println("location='account.jsp';");
          out.println("</script>");
        }
      }
    } catch (Exception var37) {
      var37.printStackTrace();
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (SQLException | ClassNotFoundException var36) {
        LOGGER.info("Error At SaveAccount=" + var36.getMessage());
      }

    }

  }
}
