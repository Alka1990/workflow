
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class welcome extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(welcome.class);

  public welcome() {
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String n = request.getParameter("user_id");
    out.print("Welcome, " + n);
    request.setAttribute("username", n);
    String profile = (String) request.getAttribute("profile");
    RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
    rd.include(request, response);
    out.close();
  }
}
