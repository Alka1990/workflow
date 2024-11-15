
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.ViewVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/modifydetails" })
public class modifydetails extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(modifydetails.class);

  public modifydetails() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    String n = (String) session.getAttribute("userid");

    try {
      List<ViewVO> viewVO = LoginDAO.getprevious(n);
      request.setAttribute("viewVOList", viewVO);
      viewVO.size();
      RequestDispatcher rd = request.getRequestDispatcher("View.jsp");
      rd.include(request, response);
    } catch (ClassNotFoundException var7) {
      LOGGER.info("Error At AddComment=" + var7.getMessage());
    } catch (SQLException var8) {
      LOGGER.info("Error At AddComment=" + var8.getMessage());
    }

  }
}
