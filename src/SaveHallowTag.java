
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SaveHallowTag" })
public class SaveHallowTag extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SaveHallowTag.class);
  private static final String SQL_INSERT = "INSERT INTO hollow_tagging (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,decesion,remark,date) VALUES (?,?,?,?,?,?,?,?,?,?,now())";

  public SaveHallowTag() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    Connection con = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement preparedStatement1 = null;
    Statement st3 = null;
    ResultSet rs1 = null;
    String UserId = (String) session.getAttribute("userid");
    String crm = request.getParameter("crm");
    String doctor_name = request.getParameter("doctor_name");
    String patient_name = request.getParameter("patient_name");
    String caseid = request.getParameter("caseid");
    String from_type = request.getParameter("from_type");
    String to_type = request.getParameter("to_type");
    String from_done = request.getParameter("from_done");
    String to_done = request.getParameter("to_done");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    String upper_aligner_from = request.getParameter("upper_aligner_from") == null ? ""
        : request.getParameter("upper_aligner_from");
    String upper_aligner_to = request.getParameter("upper_aligner_to") == null ? ""
        : request.getParameter("upper_aligner_to");
    String lower_aligner_from = request.getParameter("lower_aligner_from") == null ? ""
        : request.getParameter("lower_aligner_from");
    String lower_aligner_to = request.getParameter("lower_aligner_to") == null ? ""
        : request.getParameter("lower_aligner_to");
    String sql1 = "";

    try {
      con = LoginDAO.getConnectionDetails();
      int i;
      String query3;
      if (query.equals("hallowtaggrid")) {
        PreparedStatement pstmtstag = con.prepareStatement(
            " INSERT INTO hollow_tagging (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,date) VALUES (?,?,?,?,?,?,?,?,now())");
        pstmtstag.setString(1, caseid);
        pstmtstag.setString(2, doctor_name);
        pstmtstag.setString(3, patient_name);
        pstmtstag.setString(4, crm);
        pstmtstag.setString(5, upper_aligner_from);
        pstmtstag.setString(6, upper_aligner_to);
        pstmtstag.setString(7, lower_aligner_from);
        pstmtstag.setString(8, lower_aligner_to);
        i = pstmtstag.executeUpdate();
        if (i > 0) {
          query3 = " select case_id,crm_name,Patient_Name,Doctor_Name from  cc_crm where case_id='" + caseid + "' ";
          pstmt1 = con.prepareStatement(query3);

          for (rs1 = pstmt1.executeQuery(); rs1.next(); doctor_name = rs1.getString("Doctor_Name")) {
            caseid = rs1.getString("case_id");
            patient_name = rs1.getString("patient_name");
          }

          String id = "Multifrm?caseId=" + caseid + "&crm=" + crm + "&patient_Name=" + patient_name + "&cdoc="
              + doctor_name;
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='" + id + "';");
          out.println("</script>");
        }
      } else {
        preparedStatement = con.prepareStatement(
            "INSERT INTO hollow_tagging (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,decesion,remark,date) VALUES (?,?,?,?,?,?,?,?,?,?,now())");
        preparedStatement.setString(1, caseid);
        preparedStatement.setString(2, doctor_name);
        preparedStatement.setString(3, patient_name);
        preparedStatement.setString(4, crm);
        preparedStatement.setString(5, upper_aligner_from);
        preparedStatement.setString(6, upper_aligner_to);
        preparedStatement.setString(7, lower_aligner_from);
        preparedStatement.setString(8, lower_aligner_to);
        preparedStatement.setString(9, decesion);
        preparedStatement.setString(10, remark);
        int row = preparedStatement.executeUpdate();
        if (row == 1) {
          if (decesion.equals("MPT")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',mpt_at=now() where Case_Id='" + caseid + "' ";
          } else if (decesion.equals("PRECOR") && !remark.equals("")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',precor_at=now() where Case_Id='" + caseid + "' ";
          } else {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='" + caseid
                + "' ";
          }

          preparedStatement1 = con.prepareStatement(sql1);
          i = preparedStatement1.executeUpdate();
          if (i > 0) {
            con = LoginDAO.getConnectionDetails();
            st3 = con.createStatement();
            query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
                + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + caseid + "')";
            int j = st3.executeUpdate(query3);
            if (j > 0) {
              if (decesion.equalsIgnoreCase("MPT")) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Case successfully sent to 3D Printing');");
                out.println("location='Newcase1';");
                out.println("</script>");
              }

              out.println("<script type=\"text/javascript\">");
              out.println("alert('Case successfully sent to Prerequisite Correction!');");
              out.println("location='Newcase1';");
              out.println("</script>");
              con.close();
            }
          }
        }
      }
    } catch (Exception var769) {
      LOGGER.info("Error At SaveHallowTag=" + var769.getMessage());
    } finally {
      if (preparedStatement != null) {
        try {
          preparedStatement.close();
        } catch (Exception var767) {
        } finally {
          preparedStatement = null;
        }
      }

      if (preparedStatement1 != null) {
        try {
          preparedStatement1.close();
        } catch (Exception var765) {
        } finally {
          preparedStatement1 = null;
        }
      }

      if (pstmt1 != null) {
        try {
          pstmt1.close();
        } catch (Exception var763) {
        } finally {
          pstmt1 = null;
        }
      }

      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var761) {
        } finally {
          st3 = null;
        }
      }

      if (rs1 != null) {
        try {
          rs1.close();
        } catch (Exception var759) {
        } finally {
          rs1 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var757) {
        } finally {
          con = null;
        }
      }

    }

  }
}
