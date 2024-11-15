
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SeenComment" })
public class SeenComment extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(SeenComment.class);
  private static final long serialVersionUID = 1L;

  public SeenComment() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    HttpSession session = request.getSession(false);
    Connection con = null;
    Connection conn = null;
    PrintWriter out = response.getWriter();

    try {
      con = LoginDAO.getConnectionDetails();
      conn = LoginDAO.getConnectionDetails();
      String userid = (String) session.getAttribute("userid");
      String getData = request.getParameter("uname");
      String[] arrOfStr = getData.split(",");
      int comment_id = Integer.parseInt(arrOfStr[1]);
      String Decision = arrOfStr[0];
      String caseID = arrOfStr[2];
      System.out.println(getData);
      String sql = " UPDATE comment SET seen_by='" + userid + "',status='Y' ,seen_at=now()  where comment_id="
          + comment_id + " ";
      PreparedStatement ps = con.prepareStatement(sql);
      int i = ps.executeUpdate();
      if (i > 0) {
        String sql1 = " UPDATE cc_crm SET case_stage='" + Decision + "' where case_id='" + caseID + "'";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        int j = ps1.executeUpdate();
        if (j > 0) {
          out.print("comment has been successfully Saved");
        } else {
          out.print("comment has been  not Saved");
        }
      }
    } catch (Exception var29) {
      try {
        con.close();
      } catch (SQLException var28) {
        var28.printStackTrace();
      }
    } finally {
      try {
        con.close();
      } catch (SQLException var27) {
        var27.printStackTrace();
      }

    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
