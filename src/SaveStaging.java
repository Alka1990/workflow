
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SaveStaging" })
public class SaveStaging extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SaveStaging.class);
  private static final String SQL_INSERT = "INSERT INTO Stagging (caseid,d_name,patient_name,crm,review_attach ,ipr_sheet_,soft_tissus,date,decesion,remark) VALUES (?,?,?,?,?,?,?,now(),?,?)";

  public SaveStaging() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    PreparedStatement preparedStatement1 = null;
    PreparedStatement pstmtstag = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement preparedStatement = null;
    Statement st3 = null;
    ResultSet rs1 = null;
    ResultSet stgrs = null;
    Connection con = null;
    HttpSession session = request.getSession(false);
    String UserId = (String) session.getAttribute("userid");
    String case_id = request.getParameter("caseid");
    String doctor_name = request.getParameter("d_name");
    String patient_name = request.getParameter("patient_name");
    String crm = request.getParameter("crm");
    String from_type = request.getParameter("from_type");
    String to_type = request.getParameter("to_type");
    String aln_upper = request.getParameter("aln_upper");
    String aln_lower = request.getParameter("aln_lower");
    String thick_upper = request.getParameter("thick_upper");
    String thick_lower = request.getParameter("thick_lower");
    String margin_upper = request.getParameter("margin_upper");
    String margin_lower = request.getParameter("margin_lower");
    String molor_upper = request.getParameter("molor_upper");
    String molor_lower = request.getParameter("molor_lower");
    String sheet_type = request.getParameter("sheet_type");
    String review_attach = request.getParameter("review_attach");
    String ipr_sheet_ = request.getParameter("ipr_sheet_");
    String soft_tissus = request.getParameter("soft_tissus");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    int seclaststg = 0;
    String sql1 = "";
    String query3 = "";

    try {
      con = LoginDAO.getConnectionDetails();
      String query = request.getParameter("query") == null ? "" : request.getParameter("query");
      String upper_aligner_from = request.getParameter("upper_aligner_from") == null ? ""
          : request.getParameter("upper_aligner_from");
      String upper_aligner_to = request.getParameter("upper_aligner_to") == null ? ""
          : request.getParameter("upper_aligner_to");
      String lower_aligner_from = request.getParameter("lower_aligner_from") == null ? ""
          : request.getParameter("lower_aligner_from");
      String lower_aligner_to = request.getParameter("lower_aligner_to") == null ? ""
          : request.getParameter("lower_aligner_to");
      int row;
      int i;
      if (query.equals("stagingnew")) {
        query = " INSERT INTO stagging (caseid,d_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to ,thick_upper,thick_lower,margin_upper,margin_lower,molor_upper,molor_lower,sheet_type,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
        pstmtstag = con.prepareStatement(query, 1);
        pstmtstag.setString(1, case_id);
        pstmtstag.setString(2, doctor_name);
        pstmtstag.setString(3, patient_name);
        pstmtstag.setString(4, crm);
        pstmtstag.setString(5, upper_aligner_from);
        pstmtstag.setString(6, upper_aligner_to);
        pstmtstag.setString(7, lower_aligner_from);
        pstmtstag.setString(8, lower_aligner_to);
        pstmtstag.setString(9, thick_upper);
        pstmtstag.setString(10, thick_lower);
        pstmtstag.setString(11, margin_upper);
        pstmtstag.setString(12, margin_lower);
        pstmtstag.setString(13, molor_upper);
        pstmtstag.setString(14, molor_lower);
        pstmtstag.setString(15, sheet_type);
        row = pstmtstag.executeUpdate();
        stgrs = pstmtstag.getGeneratedKeys();
        if (stgrs.next()) {
          seclaststg = stgrs.getInt(1);
        }

        if (row > 0) {
          pstmt = con.prepareStatement("update cc_crm set staging_id=? where Case_Id=? ");
          pstmt.setInt(1, seclaststg);
          pstmt.setString(2, case_id);
          i = pstmt.executeUpdate();
          if (i > 0) {
            String sqlselect = " select case_id,crm_name,Patient_Name,Doctor_Name from  cc_crm where case_id='"
                + case_id + "' ";
            pstmt1 = con.prepareStatement(sqlselect);

            for (rs1 = pstmt1.executeQuery(); rs1.next(); doctor_name = rs1.getString("Doctor_Name")) {
              case_id = rs1.getString("case_id");
              crm = rs1.getString("crm_name");
              patient_name = rs1.getString("patient_name");
            }

            String id = "SelectStaging?caseId=" + case_id + "&crm=" + crm + "&patient_Name=" + patient_name + "&cdoc="
                + doctor_name;
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='" + id + "';");
            out.println("</script>");
          }
        }
      } else {
        preparedStatement = con.prepareStatement(
            "INSERT INTO Stagging (caseid,d_name,patient_name,crm,review_attach ,ipr_sheet_,soft_tissus,date,decesion,remark) VALUES (?,?,?,?,?,?,?,now(),?,?)");
        preparedStatement.setString(1, case_id);
        preparedStatement.setString(2, doctor_name);
        preparedStatement.setString(3, patient_name);
        preparedStatement.setString(4, crm);
        preparedStatement.setString(5, review_attach);
        preparedStatement.setString(6, ipr_sheet_);
        preparedStatement.setString(7, soft_tissus);
        preparedStatement.setString(8, decesion);
        preparedStatement.setString(9, remark);
        row = preparedStatement.executeUpdate();
        if (row == 1) {
          if (decesion.equals("STG")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',stg_at=now()  where Case_Id='" + case_id + "' ";
          } else {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='" + case_id
                + "' ";
          }

          preparedStatement1 = con.prepareStatement(sql1);
          i = preparedStatement1.executeUpdate();
          if (i > 0) {
            st3 = con.createStatement();
            query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
                + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + case_id + "')";
            int j = st3.executeUpdate(query3);
            if (j > 0) {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='Newcase1';");
              out.println("</script>");
              con.close();
            }
          }
        }
      }
    } catch (Exception var19341) {
      LOGGER.info("Error At SaveStaging=" + var19341.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException var19338) {
        LOGGER.info("@Exception=" + var19338);
      } catch (SQLException var19339) {
        LOGGER.info("@Exception=" + var19339);
      } finally {
        if (rs1 != null) {
          try {
            rs1.close();
          } catch (Exception var19336) {
          } finally {
            rs1 = null;
          }
        }

        if (stgrs != null) {
          try {
            stgrs.close();
          } catch (Exception var19334) {
          } finally {
            stgrs = null;
          }
        }

        if (st3 != null) {
          try {
            st3.close();
          } catch (Exception var19332) {
          } finally {
            st3 = null;
          }
        }

        if (pstmt != null) {
          try {
            pstmt.close();
          } catch (Exception var19330) {
          } finally {
            pstmt = null;
          }
        }

        if (pstmt1 != null) {
          try {
            pstmt1.close();
          } catch (Exception var19328) {
          } finally {
            pstmt1 = null;
          }
        }

        if (pstmtstag != null) {
          try {
            pstmtstag.close();
          } catch (Exception var19326) {
          } finally {
            pstmtstag = null;
          }
        }

        if (preparedStatement1 != null) {
          try {
            preparedStatement1.close();
          } catch (Exception var19324) {
          } finally {
            preparedStatement1 = null;
          }
        }

        if (preparedStatement != null) {
          try {
            preparedStatement.close();
          } catch (Exception var19322) {
          } finally {
            preparedStatement = null;
          }
        }

        if (con != null) {
          try {
            con.close();
          } catch (Exception var19320) {
          } finally {
            con = null;
          }
        }

      }

    }

  }
}
