
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

@WebServlet({ "/FetchTrackdata" })
public class FetchTrackdata extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public FetchTrackdata() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt1 = null;
    ResultSet rs = null;
    Connection con = null;
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    String case_id = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
    String patient_name = "";
    String doctor_name = "";

    try {
      con = LoginDAO.getConnectionDetails();
      if (query.equals("fetchdata")) {
        pstmt1 = con.prepareStatement(" select * from cc_crm where case_id=?");
        pstmt1.setString(1, case_id);
        rs = pstmt1.executeQuery();
        if (rs.next()) {
          doctor_name = rs.getString("Doctor_Name");
          patient_name = rs.getString("Patient_Name");
        }

        out.println(String.valueOf(patient_name) + "," + doctor_name);
      } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your Data Found');");
        out.println("location='addbarcodeinfo.jsp';");
        out.println("</script>");
      }
    } catch (ClassNotFoundException var12) {
      var12.printStackTrace();
    } catch (SQLException var13) {
      var13.printStackTrace();
    }

  }
}
