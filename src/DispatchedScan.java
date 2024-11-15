// Source code is decompiled from a .class file using FernFlower decompiler.
import com.whatsapp.TelegramApiCaller1;
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

@WebServlet({ "/DispatchedScan" })
public class DispatchedScan extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(DispatchedScan.class);
  
  public DispatchedScan() {
	    String date;
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
    String Sr_no = request.getParameter("Sr_no");
    String item = request.getParameter("item");
    String dispatch = request.getParameter("dispatch");
    String dispatch_no = request.getParameter("dispatch_no");
    String tracking_id = request.getParameter("tracking_id");
    String delivery_nn = request.getParameter("delivery_nn");
    String Type_of_dispatch = request.getParameter("Type_of_dispatch");
    String decesion = request.getParameter("decesion");
    String remark = request.getParameter("remark");
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    String no_of_aligners = request.getParameter("noofaligner");
    String mode_of_dispatch = request.getParameter("modeofdispatch");
    String upper_aligner_from = request.getParameter("upper_aligner_from");
    String upper_aligner_to = request.getParameter("upper_aligner_to");
    String lower_aligner_from = request.getParameter("lower_aligner_from");
    String lower_aligner_to = request.getParameter("lower_aligner_to");
    String upper_att = request.getParameter("upper_att");
    String lower_att = request.getParameter("lower_att");
    String default_address = request.getParameter("default_address") == null ? ""
        : request.getParameter("default_address");
    String address = "";
    String phone = "";
    String location = "";
    String city = "";
    String pincode = "";
    String starterkit1 = request.getParameter("starterkit1") == null ? "" : request.getParameter("starterkit1");
    String starterkit2 = request.getParameter("starterkit2") == null ? "" : request.getParameter("starterkit2");
    String starterkit3 = request.getParameter("starterkit3") == null ? "" : request.getParameter("starterkit3");
    String starterkit4 = request.getParameter("starterkit4") == null ? "" : request.getParameter("starterkit4");
    String starterkit5 = request.getParameter("starterkit5") == null ? "" : request.getParameter("starterkit5");
    String batch1 = request.getParameter("batch1") == null ? "" : request.getParameter("batch1");
    String batch2 = request.getParameter("batch2") == null ? "" : request.getParameter("batch2");
    String batch3 = request.getParameter("batch3") == null ? "" : request.getParameter("batch3");
    String batch4 = request.getParameter("batch4") == null ? "" : request.getParameter("batch4");
    String batch5 = request.getParameter("batch5") == null ? "" : request.getParameter("batch5");
    
    if (starterkit1.equals("1") || batch1.equals("1")) {
      address = request.getParameter("address1") == null ? "" : request.getParameter("address1");
      phone = request.getParameter("phone1") == null ? "" : request.getParameter("phone1");
      location = request.getParameter("location1") == null ? "" : request.getParameter("location1");
      city = request.getParameter("city1") == null ? "" : request.getParameter("city1");
      pincode = request.getParameter("pincode1") == null ? "" : request.getParameter("pincode1");
      default_address = batch1;
    }

    if (starterkit2.equals("2") || batch2.equals("2")) {
      address = request.getParameter("address2") == null ? "" : request.getParameter("address2");
      phone = request.getParameter("phone2") == null ? "" : request.getParameter("phone2");
      location = request.getParameter("location2") == null ? "" : request.getParameter("location2");
      city = request.getParameter("city2") == null ? "" : request.getParameter("city2");
      pincode = request.getParameter("pincode2") == null ? "" : request.getParameter("pincode2");
      default_address = batch2;
    }

    if (starterkit3.equals("3") || batch3.equals("3")) {
      address = request.getParameter("address3") == null ? "" : request.getParameter("address3");
      phone = request.getParameter("phone3") == null ? "" : request.getParameter("phone3");
      location = request.getParameter("location3") == null ? "" : request.getParameter("location3");
      city = request.getParameter("city3") == null ? "" : request.getParameter("city3");
      pincode = request.getParameter("pincode13") == null ? "" : request.getParameter("pincode3");
      default_address = batch3;
    }

    if (starterkit4.equals("4") || batch4.equals("4")) {
      address = request.getParameter("address4") == null ? "" : request.getParameter("address4");
      phone = request.getParameter("phone4") == null ? "" : request.getParameter("phone4");
      location = request.getParameter("location4") == null ? "" : request.getParameter("location4");
      city = request.getParameter("city4") == null ? "" : request.getParameter("city4");
      pincode = request.getParameter("pincode4") == null ? "" : request.getParameter("pincode4");
      default_address = batch4;
    }

    if (starterkit5.equals("5") || batch5.equals("5")) {
      address = request.getParameter("address5") == null ? "" : request.getParameter("address5");
      phone = request.getParameter("phone5") == null ? "" : request.getParameter("phone5");
      location = request.getParameter("location5") == null ? "" : request.getParameter("location5");
      city = request.getParameter("city5") == null ? "" : request.getParameter("city5");
      pincode = request.getParameter("pincode5") == null ? "" : request.getParameter("pincode5");
      default_address = batch5;
    }

    String confirm_status = request.getParameter("confirm_status");
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;
    Connection con3 = null;
    Connection con4 = null;
    Connection con5 = null;
    String sql1 = "";
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    PreparedStatement preparedStatement1 = null;
    Statement st2 = null;
    Statement st3 = null;

    try {
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      con3 = LoginDAO.getConnectionDetails();
      con4 = LoginDAO.getConnectionDetails();
      con5 = LoginDAO.getConnectionDetails();
      st3 = con3.createStatement();
      st2 = con5.createStatement();
      int i;
      int j;
      if (query.equals("strdispatch")) {
        pstmt1 = con4.prepareStatement(
            "INSERT INTO dispatched_scan (case_id,doctor_name,patient_name,crm,tracking_id,delivery_nn,mode_of_dispatch,decesion,remark,address,default_starterkit,confirm_status,date,phone,location,city,pincode) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)");
        pstmt1.setString(1, case_id);
        pstmt1.setString(2, doctor_name);
        pstmt1.setString(3, patient_name);
        pstmt1.setString(4, crm);
        pstmt1.setString(5, tracking_id);
        pstmt1.setString(6, delivery_nn);
        pstmt1.setString(7, mode_of_dispatch);
        pstmt1.setString(8, decesion);
        pstmt1.setString(9, remark);
        pstmt1.setString(10, address);
        pstmt1.setString(11, default_address);
        pstmt1.setString(12, confirm_status);
        pstmt1.setString(13, phone);
        pstmt1.setString(14, location);
        pstmt1.setString(15, city);
        pstmt1.setString(16, pincode);
        System.out.println("pstmt1 :: " + pstmt1.toString());
        System.out.println("cdocDispatch1 = " + doctor_name);

        int row = pstmt1.executeUpdate();
        if (row > 0) {
          if (decesion.equals("DPHSTRKIT")) {
            sql1 = " update cc_crm set remark='" + remark + "',starter_case_stage='" + decesion
                + "',dispatchstrkit=now() where Case_Id='" + case_id + "' ";
          } else if (decesion.equals("PCKSTRKITCOR")) {
            sql1 = " update cc_crm set remark='" + remark + "',starter_case_stage='" + decesion
                + "',pckstrkitcor_at=now()  where Case_Id='" + case_id + "' ";
          }

          pstmt2 = con5.prepareStatement(sql1);
          i = pstmt2.executeUpdate();
          if (i > 0) {
            j = st2.executeUpdate(
                " INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('" + decesion
                    + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + case_id + "')");
            System.out.println("j== :: " + j);
            if (j > 0) {
            	 if(!decesion.equals("PCKSTRKITCOR")) {
                sendWhatsAppMessage(case_id, crm, doctor_name, patient_name, tracking_id);	
            	 }
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='Newcase1';");
              out.println("</script>");
            }
          }
        }
      } else {
        PreparedStatement pstmt;
        if (query.equals("dispatch")) {
          pstmt = con.prepareStatement(
              " INSERT INTO dispatched_scan (case_id,doctor_name,patient_name,crm,no_of_aligners,delivery_nn,tracking_id,mode_of_dispatch,date) VALUES (?,?,?,?,?,?,?,?,now())");
          pstmt.setString(1, case_id);
          pstmt.setString(2, doctor_name);
          pstmt.setString(3, patient_name);
          pstmt.setString(4, crm);
          pstmt.setString(5, no_of_aligners);
          pstmt.setString(6, delivery_nn);
          pstmt.setString(7, tracking_id);
          pstmt.setString(8, mode_of_dispatch);
          i = pstmt.executeUpdate();
          if (i > 0) {
        	  
              sendWhatsAppMessage(case_id, crm, doctor_name, patient_name, tracking_id);

            String id = "Multifrm?caseId=" + case_id + "&crm=" + crm + "&patient_Name=" + patient_name + "&cdoc="
                + doctor_name;

            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='" + id + "';");
            out.println("</script>");
          }
        } else {
          pstmt = con.prepareStatement(
              "INSERT INTO dispatched_scan (case_id,doctor_name,patient_name,crm,dispatch,dispatch_no,tracking_id,delivery_nn,mode_of_dispatch,decesion,remark,no_of_aligners,address,default_address,confirm_status,date,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,upper_att,lower_att,phone,location,city,pincode) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?)");
          pstmt.setString(1, case_id);
          pstmt.setString(2, doctor_name);
          pstmt.setString(3, patient_name);
          pstmt.setString(4, crm);
          pstmt.setString(5, dispatch);
          pstmt.setString(6, dispatch_no);
          pstmt.setString(7, tracking_id);
          pstmt.setString(8, delivery_nn);
          pstmt.setString(9, mode_of_dispatch);
          pstmt.setString(10, decesion);
          pstmt.setString(11, remark);
          pstmt.setString(12, no_of_aligners);
          pstmt.setString(13, address);
          pstmt.setString(14, default_address);
          pstmt.setString(15, confirm_status);
          pstmt.setString(16, upper_aligner_from);
          pstmt.setString(17, upper_aligner_to);
          pstmt.setString(18, lower_aligner_from);
          pstmt.setString(19, lower_aligner_to);
          pstmt.setString(20, upper_att);
          pstmt.setString(21, lower_att);
          pstmt.setString(22, phone);
          pstmt.setString(23, location);
          pstmt.setString(24, city);
          pstmt.setString(25, pincode);
          System.out.println("Batch :: " + pstmt.toString());
          i = pstmt.executeUpdate();
          if (i > 0) {
            if (decesion.equals("Starter Kit Dispatch")) {
              sql1 = " update cc_crm set remark='" + remark + "',starter_case_stage='" + decesion + "'where Case_Id='"
                  + case_id + "' ";
            } 
            else if (decesion.equals("PCKCOR")) {
              sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion
                  + "',pckcor_at=now()  where Case_Id='" + case_id + "' ";
            }
            else {
              sql1 = " update cc_crm set remark='" + remark + "',case_stage='" + decesion + "'  where Case_Id='"
                  + case_id + "' ";
            }

            preparedStatement1 = con1.prepareStatement(sql1);
            j = preparedStatement1.executeUpdate();
            if (j > 0) {
              String query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
                  + decesion + "','" + remark + "' ,now(),'" + decesion + "','" + UserId + "','" + case_id + "')";
              int j1 = st3.executeUpdate(query3);
              (new StringBuilder("localhost:8080/Registeration/Loginfetchedit?cid=")).append(case_id).toString();
              if (j1 > 0) {
            	  //send message 
            	  if(!decesion.equals("PCKCOR")) {
                  sendWhatsAppMessage(case_id, crm, doctor_name, patient_name, tracking_id);
            	  }
                  System.out.println("cdocDispatch = " + doctor_name);

                out.println("<script type=\"text/javascript\">");
                out.println("alert('SUCCESSFULLY SAVED!');");
                out.println("location='Case_Stage';");
                out.println("</script>");
              }
            }
          }
        }
      }
    } catch (Exception var2400) {
      LOGGER.info("Error At DispatchedScan=" + var2400.getMessage());
    } finally {
      if (pstmt1 != null) {
        try {
          pstmt1.close();
        } catch (Exception var2398) {
          System.out.println("pstmt1 str catch me :: " + var2398.getMessage());
        } finally {
          pstmt1 = null;
        }
      }

      if (pstmt2 != null) {
        try {
          pstmt2.close();
        } catch (Exception var2396) {
          System.out.println("pstmt2 str catch me :: " + var2396.getMessage());
        } finally {
          pstmt2 = null;
        }
      }

      if (preparedStatement1 != null) {
        try {
          preparedStatement1.close();
        } catch (Exception var2394) {
          System.out.println("preparedStatement1 catch me :: " + var2394.getMessage());
        } finally {
          preparedStatement1 = null;
        }
      }

      if (st2 != null) {
        try {
          st2.close();
        } catch (Exception var2392) {
          System.out.println("st2 catch me :: " + var2392.getMessage());
        } finally {
          st2 = null;
        }
      }

      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var2390) {
          System.out.println("st3 catch me :: " + var2390.getMessage());
        } finally {
          st3 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var2388) {
        } finally {
          con = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var2386) {
        } finally {
          con1 = null;
        }
      }

      if (con2 != null) {
        try {
          con2.close();
        } catch (Exception var2384) {
        } finally {
          con2 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var2382) {
        } finally {
          con3 = null;
        }
      }

      if (con4 != null) {
        try {
          con4.close();
        } catch (Exception var2380) {
        } finally {
          con4 = null;
        }
      }

      if (con5 != null) {
        try {
          con5.close();
        } catch (Exception var2378) {
        } finally {
          con5 = null;
        }
      }

    }

  }
  
  private static String getMobilenumberByCrmName(String name) throws SQLException {
      String mobileNumber = null;
      Connection crm_con = null;

      try {
         crm_con = LoginDAO.getConnectionDetails();
         String sql = "SELECT mobile_number FROM watts_digiplan.crm_list where crm_name = ?";
         PreparedStatement crmPreparedStatement = crm_con.prepareStatement(sql);
         crmPreparedStatement.setString(1, name);
         ResultSet crmResultSet = crmPreparedStatement.executeQuery();
         if (crmResultSet.next()) {
            mobileNumber = crmResultSet.getString("mobile_number");
         } else {
            mobileNumber = "9692800032";
         }
      } catch (Exception var9) {
         mobileNumber = "9692800032";
         System.out.println("error = " + var9);
      } finally {
         crm_con.close();
      }

      return mobileNumber;
   }

//  public static void sendWhatsAppMessage(String caseId, String crm, String doctorName, String patientName, String trackingId) {
//      try {
//          String dispatchBatch = "dispatch"; // Verify if this template name is correct
//          String crmNumber = getMobilenumberByCrmName(crm);
//          
//          if(doctorName == null || doctorName.isEmpty()) {
//              doctorName = "Dr.";
//          }
//          System.out.println(doctorName);
//          if (crmNumber != null && !crmNumber.isEmpty()) { // Check if CRM number is valid
//              TelegramApiCaller1 telegramApiCaller = new TelegramApiCaller1();
//              String messageText = "Dear%20Team%F0%9F%98%84%2C%0A%0AGreetings%20from%20Rejove32%20Aligners!"
//              		+ "%F0%9F%98%8A%0A%0ACASE%20ID%3A%20" + caseId +"%0APatient%20Name%3A%20"+ patientName +"%0ADr."
//              		+ "%20Name%3A%20" + doctorName +"%0ATracking%20Id%3A%20"+ trackingId +"%0A%0AThe%20Aligner%20of%20the%20above-mentioned%"
//              		+ "20patient%20has%20been%20dispatched%2C%20kindly%20track%20status.%0A%0AThank%20you%20for%"
//              		+ "20your%20cooperation.%F0%9F%98%8A%0A%0ABest%20Regards%2C%0ARejove32%20Aligners" ;
//              telegramApiCaller.callApi(messageText);
//              System.out.println("Message sent successfully for case ID: " + caseId);
//          } else {
//              System.out.println("Error: CRM number is invalid or empty.");
//          }
//      } catch (Exception e) { // Catch all exceptions for better error handling
//          System.out.println("Error occurred while sending WhatsApp message: " + e.getMessage());
//          e.printStackTrace();
//      }
//  }
  public static void sendWhatsAppMessage(String caseId, String crm, String doctorName, String patientName, String trackingId) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
          // Fetch the Doctor_Name from cc_crm based on case_id
          con = LoginDAO.getConnectionDetails();
          String fetchDoctorQuery = "SELECT Doctor_Name FROM cc_crm WHERE case_id = ?";
          pstmt = con.prepareStatement(fetchDoctorQuery);
          pstmt.setString(1, caseId);
          rs = pstmt.executeQuery();

          if (rs.next()) {
              doctorName = rs.getString("Doctor_Name");
          } else {
              LOGGER.warn("No Doctor_Name found for case_id: " + caseId);
          }

          String crmNumber = getMobilenumberByCrmName(crm);

          if (doctorName == null || doctorName.isEmpty()) {
              doctorName = "Dr.";
          }
          System.out.println("hi doc kya haal chal "+doctorName);

          if (crmNumber != null && !crmNumber.isEmpty()) {
              TelegramApiCaller1 telegramApiCaller = new TelegramApiCaller1();
              String messageText = "Dear%20Team%F0%9F%98%84%2C%0A%0AGreetings%20from%20Rejove32%20Aligners!"
                      + "%F0%9F%98%8A%0A%0ACASE%20ID%3A%20" + caseId + "%0APatient%20Name%3A%20" + patientName + "%0ADr."
                      + "%20Name%3A%20" + doctorName + "%0ATracking%20Id%3A%20" + trackingId + "%0A%0AThe%20Aligner%20of%20the%20above-mentioned%"
                      + "20patient%20has%20been%20dispatched%2C%20kindly%20track%20status.%0A%0AThank%20you%20for%"
                      + "20your%20cooperation.%F0%9F%98%8A%0A%0ABest%20Regards%2C%0ARejove32%20Aligners";
              telegramApiCaller.callApi(messageText);
              System.out.println("Message sent successfully for case ID: " + caseId);
          } else {
              System.out.println("Error: CRM number is invalid or empty.");
          }
      } catch (Exception e) {
          System.out.println("Error occurred while sending WhatsApp message: " + e.getMessage());
          e.printStackTrace();
      } finally {
          try {
              if (rs != null) rs.close();
              if (pstmt != null) pstmt.close();
              if (con != null) con.close();
          } catch (SQLException e) {
              System.out.println("Failed to close resources: " + e.getMessage());
          }
      }
      }
  }

