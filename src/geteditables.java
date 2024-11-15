
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/geteditables" })
public class geteditables extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(geteditables.class);

  public geteditables() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String stage = request.getParameter("stage");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String currentstage = "";

    try {
      con = LoginDAO.getConnectionDetails();
      String decquery = "select * from editable where stage_code='" + stage + "'";
      ps = con.prepareStatement(decquery);

      for (rs = ps.executeQuery(); rs
          .next(); currentstage = String.valueOf(currentstage) + "," + rs.getString("inputid")) {
      }
    } catch (Exception var25) {
      LOGGER.info("Error At AddComment=" + var25.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

    }

    response.getWriter().write(currentstage);
  }
}
