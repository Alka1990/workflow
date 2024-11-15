
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.PendingVO;
import com.vo.ViewVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
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

@WebServlet({ "/SearchCaseValue" })
public class SearchCaseValue extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(SearchCaseValue.class);

  public SearchCaseValue() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String caseId = request.getParameter("case_number");
      List<ViewVO> viewVO = null;
      if (caseId != "") {
        viewVO = LoginDAO.searchCase(caseId);
      }

      new ArrayList();
      List<PendingVO> pendingVOList = new ArrayList();
      List<ViewVO> ViewVOList = new ArrayList();

      for (int i = 0; i < viewVO.size(); ++i) {
        PendingVO pendingVO = new PendingVO();
        pendingVO.setCaseid(((ViewVO) viewVO.get(i)).getCaseid());
        pendingVO.setUserid(((ViewVO) viewVO.get(i)).getUserid());
        pendingVO.setDecision(((ViewVO) viewVO.get(i)).getDecision());
        pendingVO.setStatus(((ViewVO) viewVO.get(i)).getStatus());
        pendingVO.setStage(((ViewVO) viewVO.get(i)).getStage());
        pendingVO.setNext_stage(((ViewVO) viewVO.get(i)).getNext_stage());
        pendingVO.setCraeted(((ViewVO) viewVO.get(i)).getCraeted());
        pendingVO.setInitDate(((ViewVO) viewVO.get(i)).getInitDate());
        pendingVO.setInituserid(((ViewVO) viewVO.get(i)).getInituserid());
        pendingVO.setCaserid(((ViewVO) viewVO.get(i)).getCaserid());
        pendingVO.setPriority(((ViewVO) viewVO.get(i)).getPriority());
        pendingVOList.add(pendingVO);
      }

      request.setAttribute("pendingVOList", pendingVOList);
      request.setAttribute("viewVOList", ViewVOList);
      RequestDispatcher rd = request.getRequestDispatcher("SearchDisplay.jsp");
      rd.forward(request, response);
    } catch (ClassNotFoundException var10) {
      LOGGER.info("Error At Searchcase ClassNotFoundException=" + var10.getMessage());
    } catch (SQLException var11) {
      LOGGER.info("Error At Searchcase=" + var11.getMessage());
    }

  }
}
