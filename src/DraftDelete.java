
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/DraftDelete" })
public class DraftDelete extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(DraftDelete.class);
  private static final long serialVersionUID = 1L;

  public DraftDelete() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    String sql = "";
    String query = "";
    String password = "";
    String decline = "";
    String loguser = "";
    String caseid = "";
    HttpSession session = request.getSession();
    password = request.getParameter("password") == null ? "" : request.getParameter("password");
    caseid = request.getParameter("caseid") == null ? "" : request.getParameter("caseid");
    if (request.getParameter("pass") == null) {
      String var10000 = "";
    } else {
      request.getParameter("pass");
    }

    decline = request.getParameter("decline") == null ? "" : request.getParameter("decline");
    System.out.println(
        "check " + caseid + "  ||" + password + " || " + decline + " || " + (String) session.getAttribute("userid"));

    try {
      con = LoginDAO.getConnectionDetails();
      if (LoginDAO.validate((String) session.getAttribute("userid"), password)) {
        String nextstage = "";
        String stage = "Delete";
        sql = " UPDATE patient_details SET delete_reason='" + decline + "' , next_stage='" + nextstage + "', stage='"
            + stage + "',draftflag='N' , delete_status='Y' where case_id='" + caseid + "' ";
        pstmt = con.prepareStatement(sql);
        int i = pstmt.executeUpdate();
        if (i > 0) {
          pstmt2 = con.prepareStatement(
              "insert into decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('Delete','"
                  + decline + "',sysdate(),'Delete','" + (String) session.getAttribute("userid") + "','" + caseid
                  + "')");
          pstmt2.execute();
          int j = pstmt2.executeUpdate();
          if (j > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + caseid + " has been successfully Deleted!');");
            out.println("location='Dashboard.jsp';");
            out.println("</script>");
          } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('ERROR OCCUR !');");
            out.println("location='Dashboard.jsp';");
            out.println("</script>");
          }
        }
      } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Wrong Password');");
        out.println("location='Dashboard.jsp';");
        out.println("</script>");
      }
    } catch (Exception var369) {
      LOGGER.info("Error At AddComment=" + var369.getMessage());
    } finally {
      if (rs != null) {
        try {
          ((ResultSet) rs).close();
        } catch (Exception var367) {
        } finally {
          rs = null;
        }
      }

      if (pstmt != null) {
        try {
          pstmt.close();
        } catch (Exception var365) {
        } finally {
          pstmt = null;
        }
      }

      if (pstmt2 != null) {
        try {
          pstmt2.close();
        } catch (Exception var363) {
        } finally {
          pstmt2 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var361) {
        } finally {
          con = null;
        }
      }

      out.flush();
      System.gc();
    }

  }
}
