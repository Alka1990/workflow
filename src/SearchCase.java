
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.SearchVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

@WebServlet({ "/SearchCase" })
public class SearchCase extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SearchCase.class);

  public SearchCase() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
      con = LoginDAO.getConnectionDetails();
      List<SearchVO> list = new ArrayList();
      pstmt = con.prepareStatement(" select * from cc_crm");
      rs = pstmt.executeQuery();

      while (rs.next()) {
        SearchVO searchvo = new SearchVO();
        searchvo.setCase_Id(rs.getString("Case_Id"));
        searchvo.setPatient_Name(rs.getString("Patient_Name"));
        searchvo.setDoctor_Name(rs.getString("doctor_Name"));
        searchvo.setRegistered_doctor(rs.getString("registered_doctor"));
        searchvo.setPhone(rs.getString("phone"));
        searchvo.setCrm_name(rs.getString("Crm_name"));
        searchvo.setClinic_Name(rs.getString("Clinic_Name"));
        searchvo.setBatch_stage(rs.getString("case_stage"));
        searchvo.setStarterkit_stage(rs.getString("starter_case_stage"));
        list.add(searchvo);
      }

      request.setAttribute("searchvo", list);
      RequestDispatcher rd = request.getRequestDispatcher("SearchParam.jsp");
      rd.include(request, response);
    } catch (ClassNotFoundException var8) {
      LOGGER.info("Error At SearchCase=" + var8.getMessage());
    } catch (SQLException var9) {
      LOGGER.info("Error At SearchCase=" + var9.getMessage());
    }

  }
}
