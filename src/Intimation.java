
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Intimation" })
public class Intimation extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Intimation.class);

  public Intimation() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    double caseid = Double.parseDouble(request.getParameter("caseid"));
    String next_stage = "";
    Connection con = null;
    ResultSet rs = null;
    ArrayList<String> emaillist = new ArrayList();

    try {
      con = LoginDAO.getConnectionDetails();
      String query = "select next_stage from patient_details where case_id='" + caseid + "'";
      PreparedStatement ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        next_stage = rs.getString("next_stage");
      }

      query = "select * from user_mstr u inner join profile_stage_map p where u.profile_id=p.profile_id and p.stage_code='"
          + next_stage + "'";
      con.prepareStatement(query);

      while (rs.next()) {
        emaillist.add(rs.getString("Email_ID"));
      }

      sendmail1.send(emaillist);
    } catch (Exception var19) {
      LOGGER.info("Error At AddComment=" + var19.getMessage());
    } finally {
      try {
        con.close();
      } catch (SQLException var18) {
        var18.printStackTrace();
      }

    }

  }
}
