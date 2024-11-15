
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SeenCaseComment" })
public class SeenCaseComment extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(SeenCaseComment.class);

  public SeenCaseComment() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    Connection conn = null;

    try {
      conn = LoginDAO.getConnectionDetails();
      String n = request.getParameter("userName");
      LOGGER.info("====" + n);
    } catch (Exception var6) {
      LOGGER.info("Error At AddComment=" + var6.getMessage());
    }

  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    HttpSession session = request.getSession(false);
    Connection con = null;
    Connection conn = null;
    PrintWriter out = response.getWriter();

    try {
      con = LoginDAO.getConnectionDetails();
      String n = request.getParameter("userName");
      LOGGER.info("====" + n);
      String var8 = "select * from add_comment where case_id='" + n + "'";
    } catch (Exception var19) {
      try {
        con.close();
      } catch (SQLException var18) {
        var18.printStackTrace();
      }
    } finally {
      try {
        con.close();
      } catch (SQLException var17) {
        var17.printStackTrace();
      }

    }

  }
}
