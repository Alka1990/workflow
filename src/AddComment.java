import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({"/AddComment"})
public class AddComment extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  static final Logger LOGGER = LogManager.getLogger(AddComment.class);
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    Connection con = null;
    HttpSession session = request.getSession(false);
    String comment_by = (String)session.getAttribute("userid");
    String case_id = (request.getParameter("caseid2") == null) ? "" : request.getParameter("caseid2");
    String comment = (request.getParameter("comment") == null) ? "" : request.getParameter("comment");
    try {
      con = LoginDAO.getConnectionDetails();
      Statement st = null;
      st = con.createStatement();
      String query = "insert into add_comment(case_id,comment,comment_by,comment_at)values('" + case_id + "','" + comment + "','" + comment_by + "',now())";
      pstmt = con.prepareStatement(query);
      int i = pstmt.executeUpdate();
      if (i > 0) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your Comment Saved Successfully');");
        out.println("location='SearchParam.jsp';");
        out.println("</script>");
      } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your Comment Not Saved ');");
        out.println("location='SearchParam.jsp';");
        out.println("</script>");
      } 
    } catch (Exception e) {
      LOGGER.info("Error At AddComment=" + e.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException|java.sql.SQLException e) {
        LOGGER.info("Error At AddComment=" + e.getMessage());
      } 
    } 
  }
}
