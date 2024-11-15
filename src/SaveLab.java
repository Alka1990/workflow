
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

@WebServlet({ "/SaveLab" })
public class SaveLab extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SaveLab.class);
  private static final String SQL_INSERT = "INSERT INTO lab (caseid,doctor_name,patient_name,crm,making,waxing,thermoform,name_cat,hand_tooling,decesion,remark,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,upper_att,lower_att,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";

  public SaveLab() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    String UserId = (String) session.getAttribute("userid");
    String crm = request.getParameter("crm");
    String doctor_name = request.getParameter("doctor_name");
    String patient_name = request.getParameter("patient_name");
    String caseid = request.getParameter("caseid");
    String making = request.getParameter("making");
    String waxing = request.getParameter("waxing");
    String name_cat = request.getParameter("name_cat");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String thermoform = request.getParameter("thermoform");
    String hand_tooling = request.getParameter("hand_tooling");
    String upper_aligner_from = request.getParameter("upper_aligner_from");
    String upper_aligner_to = request.getParameter("upper_aligner_to");
    String lower_aligner_from = request.getParameter("lower_aligner_from");
    String lower_aligner_to = request.getParameter("lower_aligner_to");
    String upper_att = request.getParameter("upper_att");
    String lower_att = request.getParameter("lower_att");
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    Connection con3 = null;
    Statement st3 = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement labps = null;
    PreparedStatement preparedStatement1 = null;
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;
    String sql1 = "";

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      int row;
      if (query.equals("lab")) {
        labps = con.prepareStatement(
            " INSERT INTO lab (caseid,doctor_name,patient_name,crm,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,date) VALUES (?,?,?,?,?,?,?,?,now())");
        labps.setString(1, caseid);
        labps.setString(2, doctor_name);
        labps.setString(3, patient_name);
        labps.setString(4, crm);
        labps.setString(5, upper_aligner_from);
        labps.setString(6, upper_aligner_to);
        labps.setString(7, lower_aligner_from);
        labps.setString(8, lower_aligner_to);
        row = labps.executeUpdate();
        if (row > 0) {
          String id = "Multifrm?caseId=" + caseid + "&crm=" + crm + "&patient_Name=" + patient_name + "&cdoc="
              + doctor_name;
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='" + id + "';");
          out.println("</script>");
        }
      } else {
        preparedStatement = con.prepareStatement(
            "INSERT INTO lab (caseid,doctor_name,patient_name,crm,making,waxing,thermoform,name_cat,hand_tooling,decesion,remark,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,upper_att,lower_att,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())");
        preparedStatement.setString(1, caseid);
        preparedStatement.setString(2, doctor_name);
        preparedStatement.setString(3, patient_name);
        preparedStatement.setString(4, crm);
        preparedStatement.setString(5, making);
        preparedStatement.setString(6, waxing);
        preparedStatement.setString(7, thermoform);
        preparedStatement.setString(8, name_cat);
        preparedStatement.setString(9, hand_tooling);
        preparedStatement.setString(10, decesion);
        preparedStatement.setString(11, remark);
        preparedStatement.setString(12, upper_aligner_from);
        preparedStatement.setString(13, upper_aligner_to);
        preparedStatement.setString(14, lower_aligner_from);
        preparedStatement.setString(15, lower_aligner_to);
        preparedStatement.setString(16, upper_att);
        preparedStatement.setString(17, lower_att);
        row = preparedStatement.executeUpdate();
        if (row == 1) {
          if (decesion.equals("3DPCOR") && !remark.equals("")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',3dpcor_at=now()  where Case_Id='" + caseid + "' ";
          } else if (decesion.equals("LAB")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',lab_at=now()  where Case_Id='" + caseid + "' ";
          } else if (decesion.equals("LABCOR") && !remark.equals("")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',labcor_at=now()  where Case_Id='" + caseid + "' ";
          } else if (decesion.equals("FQC")) {
            sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                + "',fqc_at=now()  where Case_Id='" + caseid + "' ";
          }

          preparedStatement1 = con1.prepareStatement(sql1);
          int i = preparedStatement1.executeUpdate();
          if (i > 0) {
            con3 = LoginDAO.getConnectionDetails();
            st3 = con3.createStatement();
            String query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
                + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + caseid + "')";
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
    } catch (Exception var1306) {
      LOGGER.info("Error At SaveLab=" + var1306.getMessage());
    } finally {
      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var1304) {
        } finally {
          st3 = null;
        }
      }

      if (preparedStatement1 != null) {
        try {
          preparedStatement1.close();
        } catch (Exception var1302) {
        } finally {
          preparedStatement1 = null;
        }
      }

      if (labps != null) {
        try {
          labps.close();
        } catch (Exception var1300) {
        } finally {
          labps = null;
        }
      }

      if (preparedStatement != null) {
        try {
          preparedStatement.close();
        } catch (Exception var1298) {
        } finally {
          preparedStatement = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var1296) {
        } finally {
          con = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var1294) {
        } finally {
          con1 = null;
        }
      }

      if (con2 != null) {
        try {
          con2.close();
        } catch (Exception var1292) {
        } finally {
          con2 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var1290) {
        } finally {
          con3 = null;
        }
      }

    }

  }
}
