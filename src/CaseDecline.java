
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

@WebServlet({ "/CaseDecline" })
public class CaseDecline extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(CaseDecline.class);
  private static final long serialVersionUID = 1L;

  public CaseDecline() {
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
    PreparedStatement pstmt3 = null;
    ResultSet rs = null;
    String sql = "";
    String query = "";
    String password = "";
    String decline = "";
    String loguser = "";
    String caseid = "";
    HttpSession session = request.getSession();
    password = request.getParameter("pass") == null ? "" : request.getParameter("pass");
    caseid = request.getParameter("caseid") == null ? "" : request.getParameter("caseid");
    decline = request.getParameter("decline") == null ? "" : request.getParameter("decline");

    try {
      con = LoginDAO.getConnectionDetails();
      if (LoginDAO.validate((String) session.getAttribute("userid"), password)) {
        String nextstage = "Decline";
        String stage = "Decline";
        sql = " UPDATE patient_details SET decline_reason='" + decline + "' , next_stage='" + nextstage + "', stage='"
            + stage + "', decline_status='Y' where case_id='" + caseid + "' ";
        pstmt = con.prepareStatement(sql);
        int i = pstmt.executeUpdate();
        if (i > 0) {
          pstmt2 = con.prepareStatement(
              "insert into decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('Decline','"
                  + decline + "',sysdate(),'Decline','" + (String) session.getAttribute("userid") + "','" + caseid
                  + "')");
          pstmt2.execute();
          int j = pstmt2.executeUpdate();
          pstmt3 = con.prepareStatement("update newcase set flag='N' where caseid='" + caseid + "';");
          pstmt3.execute();
          pstmt3.executeUpdate();
          if (j > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + caseid + " has been successfully Decline!');");
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
    } catch (Exception var546) {
      LOGGER.info("Error At AddComment=" + var546.getMessage());
    } finally {
      if (rs != null) {
        try {
          ((ResultSet) rs).close();
        } catch (Exception var544) {
        } finally {
          rs = null;
        }
      }

      if (pstmt != null) {
        try {
          pstmt.close();
        } catch (Exception var542) {
        } finally {
          pstmt = null;
        }
      }

      if (pstmt2 != null) {
        try {
          pstmt2.close();
        } catch (Exception var540) {
        } finally {
          pstmt2 = null;
        }
      }

      if (pstmt3 != null) {
        try {
          pstmt3.close();
        } catch (Exception var538) {
        } finally {
          pstmt3 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var536) {
        } finally {
          con = null;
        }
      }

      out.flush();
      System.gc();
    }

  }
}
