
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/showdraft" })
public class showdraft extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(showdraft.class);

  public showdraft() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String logusername = request.getParameter("logusername");
    String caseId = request.getParameter("caseId");
    request.setAttribute("abc", caseId);
    request.setAttribute("def", logusername);
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://107.167.80.130:3306/workflow", "render_digiplan", "Render123#");
      String a = "select decision from patient_details where case_id='" + caseId + "'";
      ps = con.prepareStatement(a);
      rs = ps.executeQuery();
      rs.next();
      request.setAttribute("decisionshow", rs.getString(1));
    } catch (Exception var30) {
      LOGGER.info("Error At Searchcase=" + var30.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var29) {
          var29.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var28) {
          LOGGER.info("Error At Searchcase=" + var28.getMessage());
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var27) {
          LOGGER.info("Error At Searchcase=" + var27.getMessage());
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var26) {
          LOGGER.info("Error At Searchcase=" + var26.getMessage());
        }
      }

    }

    RequestDispatcher rd = request.getRequestDispatcher("showdraft.jsp");
    rd.forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
