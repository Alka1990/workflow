
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

@WebServlet({ "/SaveCADUpload" })
public class SaveCADUpload extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SaveCADUpload.class);
  private static final String SQL_INSERT = "INSERT INTO upload (case_id,doctor_name,patient_name,crm,date,pre_post,gif,report,ipr_sheet,treat_report,ipr_filled,decesion,remark) VALUES (?,?,?,?,now(),?,?,?,?,?,?,?,?)";

  public SaveCADUpload() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    HttpSession session = request.getSession(false);
    String UserId = (String) session.getAttribute("userid");
    String pre_post = request.getParameter("pre_post");
    String crm = request.getParameter("crm");
    String doctor_name = request.getParameter("doctor_name");
    String patient_name = request.getParameter("patient_name");
    String gif = request.getParameter("gif");
    String case_id = request.getParameter("case_id");
    String report = request.getParameter("report");
    String ipr_sheet = request.getParameter("ipr_sheet");
    String treat_report = request.getParameter("treat_report");
    String treatmentreport = request.getParameter("treatmentreport");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String ipr_filled = request.getParameter("ipr_filled");
    String sql1 = "";
    System.out.println("decesion stage  " + decesion);
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      PreparedStatement preparedStatement = con.prepareStatement(
          "INSERT INTO upload (case_id,doctor_name,patient_name,crm,date,pre_post,gif,report,ipr_sheet,treat_report,ipr_filled,decesion,remark) VALUES (?,?,?,?,now(),?,?,?,?,?,?,?,?)");
      preparedStatement.setString(1, case_id);
      preparedStatement.setString(2, doctor_name);
      preparedStatement.setString(3, patient_name);
      preparedStatement.setString(4, crm);
      preparedStatement.setString(5, pre_post);
      preparedStatement.setString(6, gif);
      preparedStatement.setString(7, report);
      preparedStatement.setString(8, ipr_sheet);
      preparedStatement.setString(9, treat_report);
      preparedStatement.setString(10, ipr_filled);
      preparedStatement.setString(11, decesion);
      preparedStatement.setString(12, remark);
      int row = preparedStatement.executeUpdate();
      if (row > 0) {
        if (decesion.equals("UPL")) {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
              + "',upl_at=now()  where Case_Id='" + case_id + "' ";
        }

        if (decesion.equals("STG")) {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
              + "',stg_at=now()  where Case_Id='" + case_id + "' ";
        } else if (decesion.equals("PLNCOR") && !remark.equals("")) {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
              + "' ,plncor_at=now() where Case_Id='" + case_id + "' ";
        }

        PreparedStatement preparedStatement1 = con1.prepareStatement(sql1);
        int i = preparedStatement1.executeUpdate();
        if (i > 0) {
          Connection con3 = LoginDAO.getConnectionDetails();
          Statement st3 = con3.createStatement();
          String query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
              + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + case_id + "')";
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
    } catch (Exception var44) {
      LOGGER.info("Error At AddComment=" + var44.getMessage());
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
