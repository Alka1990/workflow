
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.mysql.jdbc.Connection;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
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

@WebServlet({ "/Images" })
public class Images extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(Images.class);

  public Images() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String imgid = request.getParameter("imgid");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String case_id = "";
    String doctor_name = "";
    String upper_img = "";
    String patient_name = "";
    String clinic_name = "";
    String file_path = "";
    String options = "";
    new LoginDAO();

    try {
      con = (Connection) LoginDAO.getConnectionDetails();
      ps = con.prepareStatement("SELECT * FROM uploadsimages where id=" + imgid + " ");

      for (rs = ps.executeQuery(); rs.next(); file_path = rs.getString("file_path")) {
        case_id = rs.getString("case_id");
        doctor_name = rs.getString("doctor_name");
        patient_name = rs.getString("patient_name");
        clinic_name = rs.getString("clinic_name");
        options = rs.getString("options");
        upper_img = rs.getString("upper_img");
      }

      request.setAttribute("case_id", case_id);
      request.setAttribute("doctor_name", doctor_name);
      request.setAttribute("patient_name", patient_name);
      request.setAttribute("clinic_name", clinic_name);
      request.setAttribute("options", options);
      request.setAttribute("upper_img", upper_img);
      request.setAttribute("file_path", file_path);
      RequestDispatcher rd = request.getRequestDispatcher("showimages.jsp");
      rd.forward(request, response);
    } catch (SQLException | ClassNotFoundException var16) {
      var16.printStackTrace();
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
