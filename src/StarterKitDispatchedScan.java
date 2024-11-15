
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

@WebServlet({ "/StarterKitDispatchedScan" })
public class StarterKitDispatchedScan extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(StarterKitDispatchedScan.class);
  private static final String SQL_INSERT = "INSERT INTO dispatched_scan (case_id,doctor_name,patient_name,crm,dispatch,dispatch_no,tracking_id,delivery_nn,mode_of_dispatch,decesion,remark,no_of_aligners,address,default_address,confirm_status,date,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,upper_att,lower_att) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?)";

  public StarterKitDispatchedScan() {
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
    String case_id = request.getParameter("case_id");
    String tracking_id = request.getParameter("tracking_id");
    String delivery_nn = request.getParameter("delivery_nn");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String mode_of_dispatch = request.getParameter("modeofdispatch");
    String address1 = request.getParameter("address1") == null ? "" : request.getParameter("address1");
    String address2 = request.getParameter("address2") == null ? "" : request.getParameter("address2");
    String address3 = request.getParameter("address3") == null ? "" : request.getParameter("address3");
    String address4 = request.getParameter("address4") == null ? "" : request.getParameter("address4");
    String address5 = request.getParameter("address5") == null ? "" : request.getParameter("address5");
    String default_address = request.getParameter("default_address") == null ? ""
        : request.getParameter("default_address");
    String confirm_status = request.getParameter("confirm_status");
    Connection con = null;
    Connection con1 = null;
    Connection con3 = null;
    Statement st3 = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement preparedStatement1 = null;
    String sql1 = "";

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con3 = LoginDAO.getConnectionDetails();
      st3 = con3.createStatement();
      preparedStatement = con.prepareStatement(
          "INSERT INTO dispatched_scan (case_id,doctor_name,patient_name,crm,dispatch,dispatch_no,tracking_id,delivery_nn,mode_of_dispatch,decesion,remark,no_of_aligners,address,default_address,confirm_status,date,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,upper_att,lower_att) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?)");
      preparedStatement.setString(1, case_id);
      preparedStatement.setString(2, doctor_name);
      preparedStatement.setString(3, patient_name);
      preparedStatement.setString(4, crm);
      preparedStatement.setString(7, tracking_id);
      preparedStatement.setString(8, delivery_nn);
      preparedStatement.setString(9, mode_of_dispatch);
      preparedStatement.setString(10, decesion);
      preparedStatement.setString(11, remark);
      if (default_address.equals("1")) {
        preparedStatement.setString(13, address1);
      } else if (default_address.equals("2")) {
        preparedStatement.setString(13, address2);
      } else if (default_address.equals("3")) {
        preparedStatement.setString(13, address3);
      } else if (default_address.equals("4")) {
        preparedStatement.setString(13, address4);
      } else if (default_address.equals("5")) {
        preparedStatement.setString(13, address5);
      }

      preparedStatement.setString(14, default_address);
      preparedStatement.setString(15, confirm_status);
      int row = preparedStatement.executeUpdate();
      if (row > 0) {
        if (decesion.equals("Starter Kit Dispatch")) {
          sql1 = " update cc_crm set remark='" + remark + "',starter_case_stage='" + decesion + "'where Case_Id='"
              + case_id + "' ";
        } else if (decesion.equals("PCKCOR")) {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
              + "',pckcor_at=now()  where Case_Id='" + case_id + "' ";
        } else {
          sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='" + case_id
              + "' ";
        }

        preparedStatement1 = con1.prepareStatement(sql1);
        int i = preparedStatement1.executeUpdate();
        if (i > 0) {
          String query3 = "INSERT INTO decision_history values('" + decesion + "','" + remark + "' ,now(),'" + decesion
              + "','" + UserId + "','" + case_id + "')";
          int j = st3.executeUpdate(query3);
          (new StringBuilder("192.168.0.220/:8080/Registeration/Loginfetchedit?cid=")).append(case_id).toString();
          if (j > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Case_Stage';");
            out.println("</script>");
          }
        }
      }
    } catch (Exception var771) {
      LOGGER.info("Error At StarterKitDispatchedScan=" + var771.getMessage());
    } finally {
      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var769) {
        } finally {
          st3 = null;
        }
      }

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

      if (con != null) {
        try {
          con.close();
        } catch (Exception var763) {
        } finally {
          con = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var761) {
        } finally {
          con1 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var759) {
        } finally {
          con3 = null;
        }
      }

    }

  }
}
