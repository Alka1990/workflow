import com.vo.DigiCommentVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SearchCaseResult" })
public class SearchCaseResult extends HttpServlet {
  private static final long serialVersionUID = 1L;

  static final Logger LOGGER = LogManager.getLogger(SearchCaseResult.class);

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "";
    String caseId = request.getParameter("case_number");
    List<DigiCommentVO> list = new ArrayList<>();
    System.out.println("SearchCaseResult post hit");
    try {
      con = LoginDAO.getDigiConnectionDetails();
      sql = " select * from comment where case_id='" + caseId + "' ";
      System.out.println("sql  " + sql);
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      while (rs.next()) {
        DigiCommentVO dcvo = new DigiCommentVO();
        dcvo.setCommentId(rs.getString("comment_id"));
        dcvo.setCaseId(rs.getString("case_id"));
        dcvo.setComment(rs.getString("comment"));
        dcvo.setDate(rs.getString("date"));
        dcvo.setStage(rs.getString("stage"));
        dcvo.setUserName(rs.getString("user_name"));
        list.add(dcvo);
      }
      request.setAttribute("digicomtlist", list);
      RequestDispatcher rd = request.getRequestDispatcher("SearchDigicmtDisplay.jsp");
      rd.forward((ServletRequest) request, (ServletResponse) response);
    } catch (Exception exception) {
    }
  }
}
