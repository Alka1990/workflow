
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
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/ThreeDPrinting" })
public class ThreeDPrinting extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(ThreeDPrinting.class);
  private static final String SQL_INSERT = "INSERT INTO threeDPrinting (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,mode,print,decesion,remark,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,now())";

  public ThreeDPrinting() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    String UserId = (String) session.getAttribute("userid");
    String crm = request.getParameter("crm");
    String doctor_name = request.getParameter("doctor_name");
    String patient_name = request.getParameter("patient_name");
    String caseid = request.getParameter("caseid");
    String upper_aligner_from = request.getParameter("upper_aligner_from");
    String upper_aligner_to = request.getParameter("upper_aligner_to");
    String lower_aligner_from = request.getParameter("lower_aligner_from");
    String lower_aligner_to = request.getParameter("lower_aligner_to");
    String mode = request.getParameter("mode");
    String print = request.getParameter("print");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      String query = request.getParameter("query") == null ? "" : request.getParameter("query");
      ResultSet rscrm = null;
      String sql1 = "";
      PreparedStatement pstmt3dp;
      int row;
      if (query.equals("3dp")) {
        pstmt3dp = con.prepareStatement(
            " INSERT INTO threedprinting (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,print,mode,date) VALUES (?,?,?,?,?,?,?,?,?,?,now())");
        pstmt3dp.setString(1, caseid);
        pstmt3dp.setString(2, doctor_name);
        pstmt3dp.setString(3, patient_name);
        pstmt3dp.setString(4, crm);
        pstmt3dp.setString(5, upper_aligner_from);
        pstmt3dp.setString(6, upper_aligner_to);
        pstmt3dp.setString(7, lower_aligner_from);
        pstmt3dp.setString(8, lower_aligner_to);
        pstmt3dp.setString(9, print);
        pstmt3dp.setString(10, mode);
        row = pstmt3dp.executeUpdate();
        if (row > 0) {
          System.out.println(
              "crm_name==select savestaging  " + crm + " patient_name " + patient_name + " doctor_name " + doctor_name);
          String id = "Multifrm?caseId=" + caseid + "&crm=" + crm + "&patient_Name=" + patient_name + "&cdoc="
              + doctor_name;
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='" + id + "';");
          out.println("</script>");
        }
      } else {
        pstmt3dp = con.prepareStatement(
            "INSERT INTO threeDPrinting (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,mode,print,decesion,remark,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,now())");
        pstmt3dp.setString(1, caseid);
        pstmt3dp.setString(2, doctor_name);
        pstmt3dp.setString(3, patient_name);
        pstmt3dp.setString(4, crm);
        pstmt3dp.setString(5, upper_aligner_from);
        pstmt3dp.setString(6, upper_aligner_to);
        pstmt3dp.setString(7, lower_aligner_from);
        pstmt3dp.setString(8, lower_aligner_to);
        pstmt3dp.setString(9, mode);
        pstmt3dp.setString(10, print);
        pstmt3dp.setString(11, decesion);
        pstmt3dp.setString(12, remark);
        row = pstmt3dp.executeUpdate();
        if (row > 0) {
          if (decesion.equals("3DP")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',3dp_at=now()  where Case_Id='" + caseid + "' ";
          } else {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='" + caseid
                + "' ";
          }

          PreparedStatement preparedStatement1 = con1.prepareStatement(sql1);
          int i = preparedStatement1.executeUpdate();
          if (i > 0) {
            Connection con3 = LoginDAO.getConnectionDetails();
            Statement st3 = con3.createStatement();
            String query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
                + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + caseid + "')";
            int j = st3.executeUpdate(query3);
            if (j > 0) {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='Newcase1';");
              out.println("</script>");
              con.close();
            }
          }
        }
      }
    } catch (Exception var44) {
      LOGGER.info("Error At ThreeDPrinting=" + var44.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException var42) {
        LOGGER.info("@Exception=" + var42);
      } catch (SQLException var43) {
        LOGGER.info("@Exception=" + var43);
      }

    }

  }
}
