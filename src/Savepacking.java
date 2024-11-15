
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

@WebServlet({ "/Savepacking" })
public class Savepacking extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(Savepacking.class);
  private static final String SQL_INSERT = "INSERT INTO packing (case_id,doctor_name,patient_name,crm,ultra_sonic,air,pouch_seal,decesion,remark,confirm_status,date) VALUES (?,?,?,?,?,?,?,?,?,?,now())";

  public Savepacking() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    String UserId = (String) session.getAttribute("userid");
    String crm = request.getParameter("crm");
    String doctor_name = request.getParameter("doctor_name");
    String patient_name = request.getParameter("patient_name");
    String case_id = request.getParameter("case_id");
    String ultra_sonic = request.getParameter("ultra_sonic");
    String air = request.getParameter("air");
    String pouch_scan = request.getParameter("pouch_seal");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String confirm_status = request.getParameter("confirm_status");
    Connection con = null;
    String sql1 = "";

    try {
      con = LoginDAO.getConnectionDetails();
      PreparedStatement preparedStatement = con.prepareStatement(
          "INSERT INTO packing (case_id,doctor_name,patient_name,crm,ultra_sonic,air,pouch_seal,decesion,remark,confirm_status,date) VALUES (?,?,?,?,?,?,?,?,?,?,now())");
      preparedStatement.setString(1, case_id);
      preparedStatement.setString(2, doctor_name);
      preparedStatement.setString(3, patient_name);
      preparedStatement.setString(4, crm);
      preparedStatement.setString(5, ultra_sonic);
      preparedStatement.setString(6, air);
      preparedStatement.setString(7, pouch_scan);
      preparedStatement.setString(8, decesion);
      preparedStatement.setString(9, remark);
      preparedStatement.setString(10, confirm_status);
      int row = preparedStatement.executeUpdate();
      if (row == 1) {
        if (decesion.equals("PCK")) {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
              + "' ,pck_at=now() where Case_Id='" + case_id + "' ";
        } else {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='" + case_id
              + "' ";
        }

        PreparedStatement preparedStatement1 = con.prepareStatement(sql1);
        int i = preparedStatement1.executeUpdate();
        if (i > 0) {
          con = LoginDAO.getConnectionDetails();
          Statement st3 = con.createStatement();
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
    } catch (Exception var37) {
      LOGGER.info("Error At Savepacking=" + var37.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException var35) {
        LOGGER.info("@Exception=" + var35);
      } catch (SQLException var36) {
        LOGGER.info("@Exception=" + var36);
      }

    }

  }
}
