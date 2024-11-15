
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.ProfileVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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

@WebServlet({ "/CreateServlet1" })
public class CreateServlet1 extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(CreateServlet1.class);

  public CreateServlet1() {
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
      String table4data = request.getParameter("table4data");
      String selectvalue = request.getParameter("selectvalue");
      String Att = request.getParameter("Att");
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

      String[] planning = table4data.split("#");
      String[][] planninggrid = new String[100][100];

      int k;
      for (j = 0; j < planning.length; ++j) {
        String[] x11 = planning[j].split("~");

        for (k = 0; k < x11.length; ++k) {
          planninggrid[j][k] = x11[k];
        }
      }

      String[] aligners = no_of_aligners_table.split("#");
      String[][] alignerstable = new String[100][100];

      int m;
      for (k = 0; k < aligners.length; ++k) {
        String[] x2 = aligners[k].split("~");

        for (m = 0; m < x2.length; ++m) {
          alignerstable[k][m] = x2[m];
        }
      }

      String[] selectvaluegrid = selectvalue.split("#");
      String[][] selectvaluematrix = new String[100][100];

      int n;
      for (m = 0; m < selectvaluegrid.length; ++m) {
        String[] x5 = selectvaluegrid[m].split("~");

        for (n = 0; n < x5.length; ++n) {
          selectvaluematrix[m][n] = x5[n];
        }
      }

      if (selectvalue != "" && decision.contentEquals("Batch Completed")) {
        NextDispatchDate nextdate = new NextDispatchDate();
        nextdate.findandadd(selectvalue, caseId, case_number);
      }

      String[] review_grid = reviewnumber.split("#");
      String[][] reviewtable = new String[100][100];

      for (n = 0; n < review_grid.length; ++n) {
        String[] x1 = review_grid[n].split("~");

        for (int y = 0; y < x1.length; ++y) {
          reviewtable[n][y] = x1[y];
        }
      }

      String[] attarray = Att.split("#");
      Long caseid = Long.parseLong(caseId);
      String stageform = nextStage;
      String status = "";
      String stage = "";
      String nextstage = "";
      String decsCode = "";
      String decs_code = "";
      String updateRoutingFlag = "";
      String cancelRoutingFlag = "";
      String RoutingFlag = LoginDAO.updatecaseRouting(caseId, nextStage);
      String[] routing = RoutingFlag.split("~");
      updateRoutingFlag = routing[0];
      cancelRoutingFlag = routing[1];
      if (cancelRoutingFlag.equals("Y")) {
        response.setContentType("text/html");
        out.print("Not Allowed to Submit As Case is Distributed");
        request.setAttribute("username", userid);
        out.close();
      } else {
        Statement insertStmnt = con.createStatement();
        String updquery = "";
        if (updateRoutingFlag.equals("Y")) {
          String decquery = "select DECS_CODE from DECISION_MASTER where DISPLAY_NAME='<DECISION>'";
          decquery = decquery.replace("<DECISION>", decision);
          ps = con.prepareStatement(decquery);
          rs = ps.executeQuery();
          if (rs.next()) {
            decs_code = rs.getString("DECS_CODE");
          }

          updquery = "select USER_ID, CASE_ID, decision, status, stage, next_stage,  created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10,initiated_Date from CASE_MSTR where CASE_ID = "
              + caseid;
          ps = con.prepareStatement(updquery);
          rs = ps.executeQuery();

          while (rs.next()) {
            updquery = "INSERT INTO CASE_MSTR_HISTORY (CASE_ID,USER_ID,initiated_by,inserted_date,initiated_Date,DECISION, STATUS, STAGE, NEXT_STAGE,prerequisite,case_number,registered_doctor,clinic_name,clinic_address,gp,city,patient_name,patient_age,type_of_account,referred_by,channel,corporate_account,kol,discount,no_of_aligners,starter_kit,scanning,pickup,dispatch,dispatch_to,advance_starter,advance_scanning, scanning_service,dispatch_date,person_dispatch,person_scan,bill_to,gst_number,payment_mode,wo_number,wo_date,priority,created_date,no_of_stages,current_stage,no_of_aligners_u_a,no_of_aligners_u_p,no_of_aligners_l_a,no_of_aligners_l_p,attachment_applicable,dispatch_grid,data_grid,dispatch_date2,final_amount,status_grid,payment_grid,batch_number,work_date,next_work,next_work_date,case_review,refinement_package,crmname)select CASE_ID,USER_ID,initiated_by,sysDate(),initiated_Date,DECISION, STATUS, STAGE, NEXT_STAGE,prerequisite,case_number,registered_doctor,clinic_name,clinic_address,gp,city,patient_name,patient_age,type_of_account,referred_by,channel,corporate_account,kol,discount,no_of_aligners,starter_kit,scanning,pickup,dispatch,dispatch_to,advance_starter,advance_scanning, scanning_service,dispatch_date,person_dispatch,person_scan,bill_to,gst_number,payment_mode,wo_number,wo_date,priority,created_date,no_of_stages,current_stage,no_of_aligners_u_a,no_of_aligners_u_p,no_of_aligners_l_a,no_of_aligners_l_p,attachment_applicable,dispatch_grid,data_grid,dispatch_date2,final_amount,status_grid,payment_grid,batch_number,work_date,next_work,next_work_date,case_review,refinement_package,crmname from CASE_MSTR where CASE_ID="
                + caseid;
            insertStmnt.executeUpdate(updquery);
            updquery = "update CASE_MSTR_HISTORY set USER_ID='" + userid + "',decision='" + decs_code + "',status='"
                + status + "',stage='" + stageform + "',next_stage='" + stageform + "' where CASE_ID = " + caseid;
            insertStmnt.executeUpdate(updquery);
            updquery = "Insert into Decision_History(decision,Remarks,date_time,stage, UserId,caseid) values( '"
                + decision + "','" + remarks + "', sysdate(),'" + stageform + "','" + userid + "','" + caseid + "') ";
            insertStmnt.executeUpdate(updquery);
            out.print("Case " + caseid + " submitted successfully");
            out.close();
          }
        } else {
          ProfileVO profileVO = LoginDAO.ProfileMapping(userid, decision, nextStage, caseid);
          status = profileVO.getStatusCode();
          stage = profileVO.getStageCode();
          nextstage = profileVO.getNextStage();
          decsCode = profileVO.getDecisionCode();
          String decquery = "select DECS_CODE from DECISION_MASTER where DISPLAY_NAME='<DECISION>'";
          decquery = decquery.replace("<DECISION>", decision);
          ps = con.prepareStatement(decquery);
          rs = ps.executeQuery();
          if (rs.next()) {
            decs_code = rs.getString("DECS_CODE");
          }

          String instquery = "INSERT INTO CASE_MSTR_HISTORY (CASE_ID,USER_ID,initiated_by,inserted_date,initiated_Date,DECISION, STATUS, STAGE, NEXT_STAGE,prerequisite,case_number,registered_doctor,clinic_name,clinic_address,gp,city,patient_name,patient_age,type_of_account,referred_by,channel,corporate_account,kol,discount,no_of_aligners,starter_kit,scanning,pickup,dispatch,dispatch_to,advance_starter,advance_scanning, scanning_service,dispatch_date,person_dispatch,person_scan,bill_to,gst_number,payment_mode,wo_number,wo_date,priority,created_date,no_of_stages,current_stage,no_of_aligners_u_a,no_of_aligners_u_p,no_of_aligners_l_a,no_of_aligners_l_p,attachment_applicable,dispatch_grid,data_grid,dispatch_date2,final_amount,status_grid,payment_grid,batch_number,work_date,next_work,next_work_date,case_review,refinement_package,crmname)select CASE_ID,USER_ID,initiated_by,sysDate(),initiated_Date,DECISION, STATUS, STAGE, NEXT_STAGE,prerequisite,case_number,registered_doctor,clinic_name,clinic_address,gp,city,patient_name,patient_age,type_of_account,referred_by,channel,corporate_account,kol,discount,no_of_aligners,starter_kit,scanning,pickup,dispatch,dispatch_to,advance_starter,advance_scanning, scanning_service,dispatch_date,person_dispatch,person_scan,bill_to,gst_number,payment_mode,wo_number,wo_date,priority,created_date,no_of_stages,current_stage,no_of_aligners_u_a,no_of_aligners_u_p,no_of_aligners_l_a,no_of_aligners_l_p,attachment_applicable,dispatch_grid,data_grid,dispatch_date2,final_amount,status_grid,payment_grid,batch_number,work_date,next_work,next_work_date,case_review,refinement_package,crmname from CASE_MSTR where CASE_ID="
              + caseid;
          insertStmnt.executeUpdate(instquery);
          updquery = "Insert into Decision_History(decision,Remarks,date_time,stage, UserId,caseid) values( '"
              + decision + "','" + remarks + "', sysdate(),'" + nextStage + "','" + userid + "','" + caseid + "') ";
          insertStmnt.executeUpdate(updquery);
          String query = "insert into payment_grid_history select * from payment_grid where case_id='" + caseId + "'";
          insertStmnt.executeUpdate(query);
          query = "insert into planning_grid_history select * from planning_grid where case_id='" + caseId + "'";
          insertStmnt.executeUpdate(query);
          query = "insert into reviewnumbergridhistory select * from reviewnumbergrid where case_id='" + caseId + "'";
          insertStmnt.executeUpdate(query);
          query = "insert into no_of_aligers_table_history select * from no_of_aligers_table where case_id='" + caseId
              + "'";
          insertStmnt.executeUpdate(query);
          updquery = "update CASE_MSTR set  USER_ID='" + userid + "',DECISION='" + decs_code + "' , STATUS='"
              + profileVO.getStatusCode() + "' , STAGE='" + profileVO.getStageCode() + "' , NEXT_STAGE='"
              + profileVO.getNextStage() + "' ,prerequisite='" + prerequisite + "' ,case_number='" + case_number
              + "' ,registered_doctor='" + registered_doctor + "' ,clinic_name='" + clinic_name + "' ,clinic_address='"
              + clinic_address + "' ,gp='" + gp + "' ,city='" + city + "' ,patient_name='" + patient_name
              + "' ,patient_age='" + patient_age + "' ,type_of_account='" + type_of_account + "' ,referred_by='"
              + referred_by + "' ,channel='" + channel + "' ,corporate_account='" + corporate_account + "' ,kol='" + kol
              + "' ,discount='" + discount + "' ,no_of_aligners='" + no_of_aligners + "' ,starter_kit='" + starter_kit
              + "' ,scanning='" + scanning + "' ,pickup='" + pickup + "' ,dispatch='" + dispatch + "' ,dispatch_to='"
              + dispatch_to + "' ,advance_starter='" + advance_starter + "' ,advance_scanning='" + advance_scanning
              + "' , scanning_service='" + scanning_service + "' ,dispatch_date='" + dispatch_date
              + "' ,person_dispatch='" + person_dispatch + "' ,person_scan='" + person_scan + "' ,bill_to='" + bill_to
              + "' ,gst_number='" + gst_number + "' ,payment_mode='" + payment_mode + "' ,wo_number='" + wo_number
              + "' ,wo_date='" + wo_date + "' ,priority='" + priority + "' ,created_date=sysdate() ,no_of_stages='"
              + no_of_stages + "' ,current_stage='" + current_stage + "' ,no_of_aligners_u_a='" + no_of_aligners_u_a
              + "' ,no_of_aligners_u_p='" + no_of_aligners_u_p + "' ,no_of_aligners_l_a='" + no_of_aligners_l_a
              + "' ,no_of_aligners_l_p='" + no_of_aligners_l_p + "' ,attachment_applicable='" + attachment_applicable
              + "' ,dispatch_grid='" + dispatch_grid + "' ,data_grid='" + data_grid + "' ,dispatch_date2='"
              + dispatch_date2 + "' ,final_amount='" + final_amount + "' ,status_grid='" + status_grid
              + "' ,payment_grid='" + payment_grid + "' ,batch_number='" + batch_number + "' ,work_date='" + work_date
              + "' ,next_work='" + next_work + "' ,next_work_date='" + next_work_date + "' ,case_review='" + case_review
              + "' ,refinement_package='" + refinement_package + "',crmname='" + user_id + "'  WHERE    CASE_ID = "
              + caseId;
          insertStmnt.executeUpdate(updquery);
          String query2 = "";

          try {
            int z;
            try {
              query2 = "delete from planning_grid where case_id=" + caseId;
              insertStmnt.executeUpdate(query2);

              for (z = 0; z < planning.length; ++z) {
                if (planninggrid[z][1] != null || planninggrid[z][2] != null) {
                  query2 = "insert into planning_grid values('" + caseId + "','" + planninggrid[z][0] + "','"
                      + planninggrid[z][1] + "','" + planninggrid[z][2] + "','" + planninggrid[z][3] + "','"
                      + planninggrid[z][4] + "')";
                  insertStmnt.executeUpdate(query2);
                }
              }
            } catch (Exception var104) {
            }

            query2 = "delete from payment_grid where case_id=" + caseId;
            insertStmnt.executeUpdate(query2);

            for (z = 0; z < profiles.length; ++z) {
              if (paymentTable[z][1] != null || paymentTable[z][2] != null) {
                query2 = "insert into payment_grid values('" + caseId + "','" + paymentTable[z][0] + "','"
                    + paymentTable[z][1] + "','" + paymentTable[z][2] + "',sysdate())";
                insertStmnt.executeUpdate(query2);
              }
            }

            query2 = "delete from reviewnumbergrid where case_id=" + caseId;
            insertStmnt.executeUpdate(query2);

            for (z = 0; z < review_grid.length; ++z) {
              if (reviewtable[z][1] != null || reviewtable[z][2] != null || reviewtable[z][3] != null) {
                query2 = "insert into reviewnumbergrid values('" + caseId + "','" + reviewtable[z][0] + "','"
                    + reviewtable[z][1] + "','" + reviewtable[z][2] + "','" + reviewtable[z][3] + "',sysdate())";
                insertStmnt.executeUpdate(query2);
              }
            }

            query2 = "delete from no_of_aligers_table where case_id=" + caseId;
            insertStmnt.executeUpdate(query2);

            for (z = 0; z < aligners.length; ++z) {
              if (alignerstable[z][1] != null || alignerstable[z][2] != null || alignerstable[z][3] != null) {
                query2 = "insert into no_of_aligers_table values('" + alignerstable[z][0] + "','" + alignerstable[z][1]
                    + "','" + alignerstable[z][2] + "','" + alignerstable[z][3] + "','" + caseId + "',sysdate(),'"
                    + selectvaluematrix[z][0] + "','" + selectvaluematrix[z][1] + "','" + selectvaluematrix[z][2]
                    + "','" + selectvaluematrix[z][3] + "','" + attarray[z] + "')";
                insertStmnt.executeUpdate(query2);
              }
            }
          } catch (Exception var105) {
            var105.printStackTrace();
          }

          out.print(caseid);
          out.close();
        }

        response.setContentType("text/html");
        request.setAttribute("username", userid);
        out.close();
      }
    } catch (Exception var106) {
      LOGGER.info("Error At AddComment=" + var106.getMessage());
    }

  }
}
