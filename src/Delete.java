
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Delete extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Delete.class);

  public Delete() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();

    try {
      String draft_id = request.getParameter("a");
      System.out.println(draft_id);
      Connection con = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      ResultSet rs1 = null;
      Class.forName("com.mysql.jdbc.Driver");
      con = LoginDAO.getConnectionDetails();
      String query = "delete from patient_details where case_id='" + draft_id + "'";
      ps = con.prepareStatement(query);
      ps.executeUpdate();
      out.print("Draft deleted");
    } catch (Exception var10) {
      LOGGER.info("Error At AddComment=" + var10.getMessage());
    }

  }
}
