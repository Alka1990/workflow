
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/test" })
public class TestLog4jServlet extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(TestLog4jServlet.class);

  public TestLog4jServlet() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    LOGGER.info("This is a logging statement from log4j");
    String html = "<html><h2>Log4j has been initialized successfully!</h2></html>";
    response.getWriter().println(html);
  }
}
