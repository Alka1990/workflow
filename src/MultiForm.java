
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Multiform" })
public class MultiForm extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(MultiForm.class);
  private static final long serialVersionUID = 1L;

  public MultiForm() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String n = request.getParameter("caseId");
    String crm = request.getParameter("crm");
    String rdoc = request.getParameter("rdoc");
    String cdoc = request.getParameter("cdoc");
    out.print("Hello==== " + n + " | crm=" + crm + " || rdoc" + rdoc + " || cdoc=" + cdoc);
    response.sendRedirect("planning.jsp?caseId=" + n + "&crm=" + crm + "&cdoc=" + cdoc);
  }
}
