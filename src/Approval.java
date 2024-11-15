
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Approval" })
public class Approval extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Approval.class);

  public Approval() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String logusername = request.getParameter("logusername");
      String caseId = request.getParameter("caseId");
      String NxtStage = request.getParameter("NxtStage");
      String SearchStage = request.getParameter("SearchStage");
      System.out.println("SearchStage=============" + SearchStage);
      String errorAletrt = "N";
      request.setAttribute("abc", caseId);
      request.setAttribute("def", logusername);
      String caseLock = "N";
      if (!caseLock.equals("N") && !caseLock.equals("Y")) {
        String[] array = caseLock.split("~");
        if (array[0].equals(logusername.toLowerCase())) {
          errorAletrt = "Case is Locked by " + array[1];
          request.setAttribute("CaseLock", errorAletrt);
          RequestDispatcher rd;
          if (SearchStage.equals("Y")) {
            rd = request.getRequestDispatcher("SearchCase");
            rd.forward(request, response);
          } else {
            rd = request.getRequestDispatcher("Pending");
            rd.forward(request, response);
          }
        }
      } else {
        request.setAttribute("caseId", caseId);
        RequestDispatcher rd = request.getRequestDispatcher("Approval.jsp");
        rd.forward(request, response);
      }
    } catch (Exception var11) {
      LOGGER.info("Error At Approval =" + var11.getMessage());
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
