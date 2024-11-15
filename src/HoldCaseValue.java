
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

@WebServlet({ "/HoldCaseValue" })
public class HoldCaseValue extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(HoldCaseValue.class);

  public HoldCaseValue() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      HttpSession session = request.getSession();
      String caseId = request.getParameter("case_number");
      String logUser = (String) session.getAttribute("userid");
      String remarks = request.getParameter("remarks");
      String casetage = request.getParameter("casetage");
      String respon = "";
      System.out
          .println("caseId: " + caseId + " logUser: " + logUser + " remarks: " + remarks + " casetage: " + casetage);
      if (casetage.equals("REJ")) {
        respon = LoginDAO.rejectCase(logUser, caseId, remarks, casetage);
      } else {
        respon = LoginDAO.setHoldCase(logUser, caseId, remarks);
      }

      request.setAttribute("caseid", caseId);
      PrintWriter out = response.getWriter();
      System.out.println(this.getClass() + " respon: " + respon);
      out.print(respon);
    } catch (Exception var10) {
      LOGGER.info("Error At HoldCaseValue=" + var10.getMessage());
    }

  }
}
