
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/UnHoldCaseValue" })
public class UnHoldCaseValue extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(UnHoldCaseValue.class);

  public UnHoldCaseValue() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      HttpSession session = request.getSession();
      String caseId = request.getParameter("case_number");
      String logUser = (String) session.getAttribute("userid");
      String remarks = request.getParameter("remarks");
      System.out.println("UnHoldCaseValue logUser " + logUser);
      String respon = LoginDAO.setUnHoldCase(logUser, caseId, remarks);
      request.setAttribute("caseid", caseId);
      PrintWriter out = response.getWriter();
      out.print(respon);
    } catch (Exception var9) {
      LOGGER.info("Error At UnHoldCaseValue=" + var9.getMessage());
    }

  }
}
