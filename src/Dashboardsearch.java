
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.ViewVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Dashboardsearch" })
public class Dashboardsearch extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Dashboardsearch.class);

  public Dashboardsearch() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String stagename = request.getParameter("stagename1");
    System.out.println("this is stage name  " + stagename);

    try {
      List<ViewVO> viewVO = LoginDAO.searchCasebystage(stagename);
      request.setAttribute("viewVOList", viewVO);
      if (viewVO.size() == 0) {
        System.out.println("No pending Case IDs found!");
      }

      RequestDispatcher rd = request.getRequestDispatcher("View.jsp");
      rd.include(request, response);
    } catch (Exception var6) {
      LOGGER.info("Error At AddComment=" + var6.getMessage());
    }

  }
}
