
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/HoldCase" })
public class HoldCase extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(HoldCase.class);

  public HoldCase() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      HttpSession session = request.getSession(false);
      String userName = request.getParameter("username");
      request.setAttribute("username", userName);
      RequestDispatcher rd;
      if (request.getParameter("createSubmitHold") != null) {
        rd = request.getRequestDispatcher("HoldCase.jsp");
        rd.forward(request, response);
      }

      if (request.getParameter("createSubmitUnhold") != null) {
        rd = request.getRequestDispatcher("UnHoldCase.jsp");
        rd.forward(request, response);
      }

      if (request.getParameter("cancelcase") != null) {
        rd = request.getRequestDispatcher("cancelcase.jsp");
        rd.forward(request, response);
      }
    } catch (Exception var6) {
      LOGGER.info("Error At HoldCase=" + var6.getMessage());
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
