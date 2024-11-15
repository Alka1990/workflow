
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/changedetail" })
public class changedetail extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(changedetail.class);

  public changedetail() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String patient_name = request.getParameter("p_name");
    String registered_doctor = request.getParameter("r_doctor");
    String priority = request.getParameter("priority1");
    String caseid = request.getParameter("case_id1");
    System.out.println(patient_name);
    System.out.println(registered_doctor);
    System.out.println(priority);
    System.out.println(caseid);
    Connection con = null;
    PreparedStatement ps = null;

    try {
      Class.forName("com.mysql.jdbc.Driver");
      con = LoginDAO.getConnectionDetails();
      ps = con.prepareStatement("update patient_details set patient_name='" + patient_name + "',registered_doctor='"
          + registered_doctor + "',priority='" + priority + "' where case_id='" + caseid + "'");
      ps.executeUpdate();
      response.sendRedirect("Dashboard.jsp");
    } catch (Exception var11) {
      LOGGER.info("Error At AddComment=" + var11.getMessage());
    }

  }
}
