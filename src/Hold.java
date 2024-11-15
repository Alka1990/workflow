
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

@WebServlet({ "/Hold" })
public class Hold extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Hold.class);

  public Hold() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    String n = (String) session.getAttribute("userid");
    System.out.println("Hold n : " + n);

    try {
      List<ViewVO> viewVO = LoginDAO.getHoldCase(n);
      request.setAttribute("viewVOList", viewVO);
      request.setAttribute("username", n);
      viewVO.size();
      RequestDispatcher rd = request.getRequestDispatcher("Hold.jsp");
      rd.include(request, response);
    } catch (ClassNotFoundException var7) {
      LOGGER.info("Error At AddComment=" + var7.getMessage());
    } catch (SQLException var8) {
      LOGGER.info("Error At AddComment=" + var8.getMessage());
    }

  }
}
