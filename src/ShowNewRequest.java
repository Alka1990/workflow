
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.Newcase1;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/ShowNewRequest" })
public class ShowNewRequest extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(ShowNewRequest.class);

  public ShowNewRequest() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String query = request.getParameter("request") == null ? "" : request.getParameter("request");
    String sql = "";
    if (query.equals("Impression")) {
      System.out.println("1");
      sql = "SELECT * FROM cc_crm where scan is not NULL and scan='" + query
          + "' and date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(), '%m/%d/%Y')";
    } else if (query.equals("Scan")) {
      System.out.println("2");
      sql = "SELECT * FROM cc_crm where scan is not NULL and scan='" + query
          + "' and date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(), '%m/%d/%Y') ";
    } else if (query.equals("New")) {
      System.out.println("3");
      sql = "SELECT * FROM cc_crm where  date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(),'%m/%d/%Y')";
    }

    List<Newcase1> list = new ArrayList();
    Connection con = null;
    ResultSet rs = null;

    try {
      con = LoginDAO.getConnectionDetails();
      PreparedStatement ps1 = con.prepareStatement(sql);
      System.out.println("ShowNewRequest==" + ps1.toString());
      rs = ps1.executeQuery();

      while (rs.next()) {
        Newcase1 nc = new Newcase1();
        nc.setCaseid(rs.getString("case_id"));
        nc.setRdoctorname(rs.getString("registered_doctor"));
        nc.setCdoctorname(rs.getString("Doctor_Name"));
        nc.setCase_stage(rs.getString("case_stage"));
        nc.setCrm(rs.getString("crm_name"));
        list.add(nc);
      }

      request.setAttribute("requestnew", list);
      RequestDispatcher rd = request.getRequestDispatcher("shownewrequest.jsp");
      rd.forward(request, response);
    } catch (Exception var18) {
      LOGGER.info("Error At ShowNewRequest=" + var18.getMessage());
    } finally {
      try {
        con.close();
      } catch (Exception var17) {
        LOGGER.info("Error At ShowNewRequest=" + var17.getMessage());
      }

    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }
}
