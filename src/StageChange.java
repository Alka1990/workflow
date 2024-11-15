
// Source code is decompiled from a .class file using FernFlower decompiler.
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

@WebServlet({ "/StageChange" })
public class StageChange extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(StageChange.class);
  private static final long serialVersionUID = 1L;

  public StageChange() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    String case_id = request.getParameter("case_id");
    String decesion = request.getParameter("case_stage");
    String remark = request.getParameter("remark");
    String UserId = (String) session.getAttribute("userid");
    request.setAttribute("case_id", case_id);
    Connection con = null;
    Connection con2 = null;
    Connection con3 = null;
    Statement st3 = null;
    PreparedStatement ps = null;
    String sql = "";

    try {
      con = LoginDAO.getConnectionDetails();
      con3 = LoginDAO.getConnectionDetails();
      st3 = con3.createStatement();
      if (decesion.equals("MTPSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion + "', starter_satus='N',mtpstrkit_at=now(),remark='"
            + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("3DPSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion + "', starter_satus='N',3dpstrkit_at=now(),remark='"
            + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("3DPSTRKITCOR") && !remark.equals("")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion
            + "', starter_satus='N',3dpstrkitcor_at=now(),remark='" + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("LABSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion + "', starter_satus='N',labstrkit_at=now(),remark='"
            + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("LABSTRKITCOR") && !remark.equals("")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion
            + "', starter_satus='N',labstrkitcor_at=now(),remark='" + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("FQCSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion + "', starter_satus='N',fqcstrkit_at=now(),remark='"
            + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("PCKSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion + "', starter_satus='N',pckstrkit_at=now(),remark='"
            + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("PCKSTRKITCOR") && !remark.equals("")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion
            + "', starter_satus='N',pckstrkitcor_at=now(),remark='" + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("DPHSTRKIT")) {
        sql = " UPDATE cc_crm SET starter_case_stage='" + decesion
            + "', starter_satus='N',dispatchstrkit=now(),remark='" + remark + "' where case_id=" + case_id + " ";
      }

      if (decesion.equals("WFCCOR")) {
        sql = " UPDATE cc_crm SET starter_case_stage='',case_stage='" + decesion + "',wfccor_at=now(),remark='" + remark
            + "' where case_id=" + case_id + " ";
      }

      ps = con.prepareStatement(sql);
      int i = ps.executeUpdate();
      if (i > 0) {
        String query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
            + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + case_id + "')";
        int j = st3.executeUpdate(query3);
        if (j > 0) {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='Newcase1';");
          out.println("</script>");
        }
      }
    } catch (Exception var543) {
      LOGGER.info("Error At StageChange=" + var543.getMessage());
    } finally {
      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var541) {
        } finally {
          st3 = null;
        }
      }

      if (ps != null) {
        try {
          ps.close();
        } catch (Exception var539) {
        } finally {
          ps = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var537) {
        } finally {
          con = null;
        }
      }

      if (con2 != null) {
        try {
          ((Connection) con2).close();
        } catch (Exception var535) {
        } finally {
          con2 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var533) {
        } finally {
          con3 = null;
        }
      }

    }

  }
}
