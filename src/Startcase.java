
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Startcase" })
public class Startcase extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Startcase.class);

  public Startcase() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();
    String caseid = request.getParameter("caseid");
    String userid = (String) session.getAttribute("userid");
    Connection con = null;
    ResultSet rs = null;

    try {
      con = LoginDAO.getConnectionDetails();
      PreparedStatement ps = con.prepareStatement("select * from newcase where caseid='" + caseid + "'");
      rs = ps.executeQuery();
      if (rs.next()) {
        ps = con.prepareStatement(
            "insert into patient_details(decision,user_id,stage,next_stage,case_id,initiated_date,created_date,Doctor_Name,clinic_name,patient_name,draftflag) values('Start Stage','Start Stage','Intro','initial stage','"
                + caseid + "',sysdate(),'" + rs.getString("date") + "'," + "'" + rs.getString("doctorname") + "','"
                + rs.getString("clinicname") + "'," + "'" + rs.getString("patientname") + "','N')");
        ps.execute();
        ps = con.prepareStatement("update newcase set flag='n' where caseid='" + caseid + "'");
        ps.executeUpdate();
        ps = con.prepareStatement(
            "insert into decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('Case Initiated','Started',sysdate(),'New Case','"
                + userid + "','" + caseid + "')");
        ps.execute();
      }

      out.print("Case " + caseid + " Initiated Successfully");
    } catch (Exception var18) {
      LOGGER.info("Error At Searchcase=" + var18.getMessage());
    } finally {
      try {
        con.close();
      } catch (SQLException var17) {
        LOGGER.info("Error At Searchcase=" + var17.getMessage());
      }

    }

  }
}
