
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

@WebServlet({ "/SearchDigiComments" })
public class SearchDigiComments extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SearchDigiComments.class);

  public SearchDigiComments() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    String userid = (String) session.getAttribute("userid");
    request.setAttribute("username", userid);
    System.out.println("userid : " + userid);
    RequestDispatcher rd = request.getRequestDispatcher("searchdigicomments.jsp");
    rd.include(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
