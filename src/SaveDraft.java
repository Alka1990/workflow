
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SaveDraft extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(SaveDraft.class);

  public SaveDraft() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement pstmt = null;
    PreparedStatement ps = null;
    Statement st = null;
    Statement st2 = null;
    ResultSet rs1 = null;
    int Case_Id = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Integer> cidarr = new ArrayList<Integer>();
    boolean cid = false;
    String Patient_Name = request.getParameter("pn");
    String Doctor_Name = request.getParameter("dn");
    String crm = request.getParameter("crm");
    String dno = request.getParameter("dno");
    String bgn = request.getParameter("bgn");
    String cat = request.getParameter("cat");
    String ua = request.getParameter("ua");
    String la = request.getParameter("la");
    String oth = request.getParameter("oth");
    HttpSession session = request.getSession();
    String userid = (String) session.getAttribute("userid");
    String address = "";
    String phoneNumber = "";
    String clinicName = "";
    String buyersAddress = "";
    String buyersClinicName = "";
    Enumeration<String> list = request.getParameterNames();

    String value;
    while (list.hasMoreElements()) {
      String paramName = (String) list.nextElement();
      String[] paramValues;
      if (paramName.contains("addr")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          address = String.valueOf(address) + value + "#";
        }
      } else if (paramName.contains("pno")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          phoneNumber = String.valueOf(phoneNumber) + value + "#";
        }
      } else if (paramName.contains("cni")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          clinicName = String.valueOf(clinicName) + value + "#";
        }
      } else if (paramName.contains("bcn")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersClinicName = String.valueOf(buyersClinicName) + value + "#";
        }
      } else if (paramName.contains("badd")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersAddress = String.valueOf(buyersAddress) + value + "#";
        }
      }
    }

    ArrayList<String> list2 = new ArrayList();
    list2.add(address);
    list2.add(phoneNumber);
    list2.add(clinicName);
    list2.add(buyersClinicName);
    list2.add(buyersAddress);

    for (int i = 0; i < list2.size(); ++i) {
      if (((String) list2.get(i)).length() > 0) {
        value = ((String) list2.get(i)).substring(0, ((String) list2.get(i)).length() - 1);
        list2.set(i, value);
      }
    }

    try {
      con = LoginDAO.getConnectionDetails();
      Class.forName("com.mysql.jdbc.Driver");
      st = con.createStatement();
      st2 = con.createStatement();
      String sql1 = "SELECT Case_Id FROM patient_details";
      rs1 = st.executeQuery(sql1);

      while (rs1.next()) {
        int cid1 = rs1.getInt("Case_Id");
        cidarr.add(cid1);
      }

      if (cidarr.contains(Case_Id)) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('CASE ID ALREADY EXISTS!');");
        out.println("location='maindetails.jsp';");
        out.println("</script>");
      } else {
        value = "INSERT INTO patient_details(Case_Id,Patient_Name,Doctor_Name,clinic_Name,address,phone,plan_date,plan_time,crm_name,delivery_note_no,bclinic,badd,bgst_no,category,upper_aligner,lower_aligner,others,USER_ID,initiated_by,initiated_Date,DECISION,STAGE,NEXT_STAGE,draftflag,created_date,HoldFlag)VALUES('"
            + Case_Id + "','" + Patient_Name + "','" + Doctor_Name + "','" + (String) list2.get(2) + "','"
            + (String) list2.get(0) + "','" + (String) list2.get(1) + "'," + "curdate(),curtime(),'" + crm + "','" + dno
            + "','" + (String) list2.get(3) + "','" + (String) list2.get(4) + "','" + bgn + "','" + cat + "'," + "'"
            + ua + "','" + la + "','" + oth + "','" + userid + "','" + userid
            + "',now(),'created','Intro','Intro','Y',now(),'N')";
        st.executeUpdate(value);
        ps = con.prepareStatement(
            "insert into decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('Intro','',now(),'Intro','"
                + userid + "','" + Case_Id + "')");
        ps.execute();
      }

      out.println("Records successfully saved to draft!");
      con.close();
    } catch (Exception var382) {
      LOGGER.info("Error At AddComment=" + var382.getMessage());
    } finally {
      if (rs1 != null) {
        try {
          rs1.close();
        } catch (Exception var380) {
        } finally {
          rs1 = null;
        }
      }

      if (st != null) {
        try {
          st.close();
        } catch (Exception var378) {
        } finally {
          st = null;
        }
      }

      if (ps != null) {
        try {
          ps.close();
        } catch (Exception var376) {
        } finally {
          ps = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var374) {
        } finally {
          con = null;
        }
      }

      out.flush();
      System.gc();
    }

  }
}
