
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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

@WebServlet({ "/modifysubmit" })
public class modifysubmit extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(modifysubmit.class);

  public modifysubmit() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      HttpSession session = request.getSession(false);
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      Connection con = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      CallableStatement callable = null;
      con = LoginDAO.getConnectionDetails();
      String reviewnumber = request.getParameter("reviewnumber");
      String userid = (String) session.getAttribute("userid");
      String caseId = request.getParameter("caseId");
      String registered_doctor = request.getParameter("registered_doctor");
      String prerequisite = request.getParameter("prerequisite");
      String case_number = request.getParameter("case_number");
      String payment_grid_table = request.getParameter("payment_grid_table");
      String no_of_aligners_table = request.getParameter("table3Content");
      String user_id = request.getParameter("user_id");
      String clinic_name = request.getParameter("clinic_name");
      String clinic_address = request.getParameter("clinic_address");
      String gp = request.getParameter("gp");
      String city = request.getParameter("city");
      String patient_name = request.getParameter("patient_name");
      String patient_age = request.getParameter("patient_age");
      String referred_by = request.getParameter("referred_by");
      String type_of_account = request.getParameter("type_of_account");
      String channel = request.getParameter("channel");
      String kol = request.getParameter("kol");
      String discount = request.getParameter("discount");
      String starter_kit = request.getParameter("starter_kit");
      String no_of_aligners = request.getParameter("no_of_aligners");
      String scanning = request.getParameter("scanning");
      String pickup = request.getParameter("pickup");
      String dispatch = request.getParameter("dispatch");
      String dispatch_to = request.getParameter("dispatch_to");
      String advance_starter = request.getParameter("advance_starter");
      String advance_scanning = request.getParameter("advance_scanning");
      String scanning_service = request.getParameter("scanning_service");
      String dispatch_date = request.getParameter("dispatch_date");
      String person_dispatch = request.getParameter("person_dispatch");
      String person_scan = request.getParameter("person_scan");
      String bill_to = request.getParameter("bill_to");
      String gst_number = request.getParameter("gst_number");
      String payment_mode = request.getParameter("payment_mode");
      String wo_number = request.getParameter("wo_number");
      String wo_date = request.getParameter("wo_date");
      String decision = request.getParameter("decision");
      String no_of_stages = request.getParameter("no_of_stages");
      String current_stage = request.getParameter("current_stage");
      String no_of_aligners_u_p = request.getParameter("no_of_aligners_u_p");
      String no_of_aligners_u_a = request.getParameter("no_of_aligners_u_a");
      String no_of_aligners_l_a = request.getParameter("no_of_aligners_l_a");
      String no_of_aligners_l_p = request.getParameter("no_of_aligners_l_p");
      String attachment_applicable = request.getParameter("attachment_applicable");
      String dispatch_grid = request.getParameter("dispatch_grid");
      String dispatch_date2 = request.getParameter("dispatch_date2");
      String data_grid = request.getParameter("data_grid");
      String final_amount = request.getParameter("final_amount");
      String status_grid = request.getParameter("status_grid");
      String payment_grid = request.getParameter("payment_grid");
      String batch_number = request.getParameter("batch_number");
      String work_date = request.getParameter("work_date");
      String next_work = request.getParameter("next_work");
      String next_work_date = request.getParameter("next_work_date");
      String refinement_package = request.getParameter("refinement_package");
      String case_review = request.getParameter("case_review");
      String corporate_account = request.getParameter("corporate_account");
      String priority = request.getParameter("priority");
      String nextStage = request.getParameter("nextStage");
      String remarks = request.getParameter("remarks");
      String[] profiles = payment_grid_table.split("#");
      String[][] paymentTable = new String[100][100];

      int j;
      for (int i = 0; i < profiles.length; ++i) {
        String[] x = profiles[i].split("~");

        for (j = 0; j < x.length; ++j) {
          paymentTable[i][j] = x[j];
        }
      }

      String[] aligners = no_of_aligners_table.split("#");
      String[][] alignerstable = new String[100][100];

      int k;
      for (j = 0; j < aligners.length; ++j) {
        String[] x2 = aligners[j].split("~");

        for (k = 0; k < x2.length; ++k) {
          alignerstable[j][k] = x2[k];
        }
      }

      String[] review_grid = reviewnumber.split("#");
      String[][] reviewtable = new String[100][100];

      for (k = 0; k < review_grid.length; ++k) {
        String[] x1 = review_grid[k].split("~");

        for (int y = 0; y < x1.length; ++y) {
          reviewtable[k][y] = x1[y];
        }
      }

      Long caseid = Long.parseLong(caseId);
      String updquery = "update patient_details set prerequisite='" + prerequisite + "' ,case_number='" + case_number
          + "' ,registered_doctor='" + registered_doctor + "' ,clinic_name='" + clinic_name + "' ,clinic_address='"
          + clinic_address + "' ,gp='" + gp + "' ,city='" + city + "' ,patient_name='" + patient_name
          + "' ,patient_age='" + patient_age + "' ,type_of_account='" + type_of_account + "' ,referred_by='"
          + referred_by + "' ,channel='" + channel + "' ,corporate_account='" + corporate_account + "' ,kol='" + kol
          + "' ,discount='" + discount + "' ,no_of_aligners='" + no_of_aligners + "' ,starter_kit='" + starter_kit
          + "' ,scanning='" + scanning + "' ,pickup='" + pickup + "' ,dispatch='" + dispatch + "' ,dispatch_to='"
          + dispatch_to + "' ,advance_starter='" + advance_starter + "' ,advance_scanning='" + advance_scanning
          + "' , scanning_service='" + scanning_service + "' ,dispatch_date='" + dispatch_date + "' ,person_dispatch='"
          + person_dispatch + "' ,person_scan='" + person_scan + "' ,bill_to='" + bill_to + "' ,gst_number='"
          + gst_number + "' ,payment_mode='" + payment_mode + "' ,wo_number='" + wo_number + "' ,wo_date='" + wo_date
          + "' ,priority='" + priority + "' ,no_of_stages='" + no_of_stages + "' ,current_stage='" + current_stage
          + "' ,no_of_aligners_u_a='" + no_of_aligners_u_a + "' ,no_of_aligners_u_p='" + no_of_aligners_u_p
          + "' ,no_of_aligners_l_a='" + no_of_aligners_l_a + "' ,no_of_aligners_l_p='" + no_of_aligners_l_p
          + "' ,attachment_applicable='" + attachment_applicable + "' ,dispatch_grid='" + dispatch_grid
          + "' ,data_grid='" + data_grid + "' ,dispatch_date2='" + dispatch_date2 + "' ,final_amount='" + final_amount
          + "' ,status_grid='" + status_grid + "' ,payment_grid='" + payment_grid + "' ,batch_number='" + batch_number
          + "' ,work_date='" + work_date + "' ,next_work='" + next_work + "' ,next_work_date='" + next_work_date
          + "' ,case_review='" + case_review + "' ,refinement_package='" + refinement_package + "',crmname='" + user_id
          + "'  WHERE    CASE_ID = " + caseId;
      ps = con.prepareStatement(updquery);
      ps.executeUpdate();
      String query2 = "";

      try {
        query2 = "delete from payment_grid where case_id=" + caseId;
        ps.executeUpdate(query2);

        int z;
        for (z = 0; z < profiles.length; ++z) {
          if (paymentTable[z][1] != null || paymentTable[z][2] != null) {
            query2 = "insert into payment_grid values('" + caseId + "','" + paymentTable[z][0] + "','"
                + paymentTable[z][1] + "','" + paymentTable[z][2] + "',sysdate())";
            ps.executeUpdate(query2);
          }
        }

        query2 = "delete from reviewnumbergrid where case_id=" + caseId;
        ps.executeUpdate(query2);

        for (z = 0; z < review_grid.length; ++z) {
          if (reviewtable[z][1] != null || reviewtable[z][2] != null || reviewtable[z][3] != null) {
            query2 = "insert into reviewnumbergrid values('" + caseId + "','" + reviewtable[z][0] + "','"
                + reviewtable[z][1] + "','" + reviewtable[z][2] + "','" + reviewtable[z][3] + "',sysdate())";
            ps.executeUpdate(query2);
          }
        }

        query2 = "delete from no_of_aligers_table where case_id=" + caseId;
        ps.executeUpdate(query2);

        for (z = 0; z < aligners.length; ++z) {
          if (alignerstable[z][1] != null || alignerstable[z][2] != null || alignerstable[z][3] != null) {
            query2 = "insert into no_of_aligers_table values('" + alignerstable[z][0] + "','" + alignerstable[z][1]
                + "','" + alignerstable[z][2] + "','" + alignerstable[z][3] + "','" + caseId + "',sysdate())";
            ps.executeUpdate(query2);
          }
        }
      } catch (Exception var81) {
        LOGGER.info("Error At AddComment=" + var81.getMessage());
      }

      response.getWriter().write("case " + caseId + " updated successfully");
    } catch (Exception var82) {
      LOGGER.info("Error At AddComment=" + var82.getMessage());
    }

  }
}
