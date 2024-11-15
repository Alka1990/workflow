
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SaveNewFile" })
public class SaveNewFile {
  static final Logger LOGGER = LogManager.getLogger(SaveNewFile.class);

  public SaveNewFile() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    String Existing = request.getParameter("Existing");
    String incase = request.getParameter("incase");
    String Location = request.getParameter("Location");
    String city = request.getParameter("city");
    String RDoctor = request.getParameter("RDoctor");
    String crm = request.getParameter("crm");
    String Clinic = request.getParameter("Clinic");
    String CDoctor = request.getParameter("CDoctor");
    String Photograph = request.getParameter("Photograph");
    String SKit = request.getParameter("SKit");
    String TRequest = request.getParameter("TRequest");
    String Shown = request.getParameter("Shown");
    String TAccount = request.getParameter("TAccount");
    String PPF = request.getParameter("PPF");
    String CAccount = request.getParameter("CAccount");
    String KOL = request.getParameter("KOL");
    String Cpkg = request.getParameter("Cpkg");
    String Pname = request.getParameter("Pname");
    String Dispatchcr = request.getParameter("Dispatchcr");
    String DispatchAdr = request.getParameter("DispatchAdr");
    String BillAdr = request.getParameter("DispatchAdr");
    Connection con = null;

    try {
      con = LoginDAO.getConnectionDetails();
      Class.forName("com.mysql.jdbc.Driver");
      Statement st = null;
      Statement st2 = null;
      st = con.createStatement();
      st2 = con.createStatement();
      String query = "INSERT INTO patient_details () VALUES('" + Existing + "') ";
      st.executeUpdate(query);
      out.println("<script type=\"text/javascript\">");
      out.println("alert('SUCCESSFULLY SAVED!');");
      out.println("location='Dashboard.jsp';");
      out.println("</script>");
      con.close();
    } catch (Exception var30) {
      LOGGER.info("Error At AddComment=" + var30.getMessage());
    }

  }
}
