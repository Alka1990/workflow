
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/CreateCCSave" })
public class CreateCCSave extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(CreateCCSave.class);
  private static final long serialVersionUID = 1L;
  private String Null;

  public CreateCCSave() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    Connection con1 = null;
    Connection con0 = null;
    boolean Priority = false;
    long incase = 0L;
    String user_id = (String) request.getSession().getAttribute("userid");
    String Existing = request.getParameter("Existing");
    incase = Long.parseLong(request.getParameter("incase"));
    String Impression = request.getParameter("Impression") == null ? "" : request.getParameter("Impression");
    String RDoctor = request.getParameter("RDoctor") == null ? "" : request.getParameter("RDoctor");
    String crm = request.getParameter("crm") == null ? "" : request.getParameter("crm");
    String CDoctor = request.getParameter("CDoctor") == null ? "" : request.getParameter("CDoctor");
    String Photograph = request.getParameter("Photograph") == null ? "" : request.getParameter("Photograph");
    String SKit = request.getParameter("SKit") == null ? "" : request.getParameter("SKit");
    String TRequest = request.getParameter("TRequest") == null ? "" : request.getParameter("TRequest");
    String Shown = request.getParameter("Shown") == null ? "" : request.getParameter("Shown");
    String TAccount = request.getParameter("TAccount") == null ? "" : request.getParameter("TAccount");
    String PPF = request.getParameter("PPF") == null ? "" : request.getParameter("PPF");
    String CAccount = request.getParameter("CAccount") == null ? "" : request.getParameter("CAccount");
    String KOL = request.getParameter("KOL") == null ? "" : request.getParameter("KOL");
    String Cpkg = request.getParameter("Cpkg") == null ? "" : request.getParameter("Cpkg");
    String Pname = request.getParameter("Pname") == null ? "" : request.getParameter("Pname");
    String Dispatchcr = request.getParameter("Dispatchcr") == null ? "" : request.getParameter("Dispatchcr");
    String DispatchAdr = request.getParameter("DispatchAdr") == null ? "" : request.getParameter("DispatchAdr");
    String BillAdr = request.getParameter("BillAdr") == null ? "" : request.getParameter("BillAdr");
    String PATIENT = request.getParameter("PATIENT") == null ? "" : request.getParameter("PATIENT");
    String delivery_note_no = request.getParameter("dno") == null ? "" : request.getParameter("dno");
    String bgst_no = request.getParameter("bgst_no") == null ? "" : request.getParameter("bgst_no");
    String category = request.getParameter("category") == null ? "" : request.getParameter("category");
    String upper_aligner = request.getParameter("upper_aligner") == null ? "" : request.getParameter("upper_aligner");
    String lower_aligner = request.getParameter("lower_aligner") == null ? "" : request.getParameter("lower_aligner");
    String others = request.getParameter("others") == null ? "" : request.getParameter("others");
    int Priority1 = Integer.parseInt(request.getParameter("Priority") == null ? "5" : request.getParameter("Priority"));
    String existing_flag = request.getParameter("existing_flag");
    String case_stage = "INI";
    String address1 = request.getParameter("address1") == null ? "" : request.getParameter("address1");
    String address2 = request.getParameter("address2") == null ? "" : request.getParameter("address2");
    String address3 = request.getParameter("address3") == null ? "" : request.getParameter("address3");
    String address4 = request.getParameter("address4") == null ? "" : request.getParameter("address4");
    String address5 = request.getParameter("address5") == null ? "" : request.getParameter("address5");
    String pincode1 = request.getParameter("pincode1") == null ? "" : request.getParameter("pincode1");
    String pincode2 = request.getParameter("pincode2") == null ? "" : request.getParameter("pincode2");
    String pincode3 = request.getParameter("pincode3") == null ? "" : request.getParameter("pincode3");
    String pincode4 = request.getParameter("pincode4") == null ? "" : request.getParameter("pincode4");
    String pincode5 = request.getParameter("pincode5") == null ? "" : request.getParameter("pincode5");
    String phone1 = request.getParameter("phone1") == null ? "" : request.getParameter("phone1");
    String phone2 = request.getParameter("phone2") == null ? "" : request.getParameter("phone2");
    String phone3 = request.getParameter("phone3") == null ? "" : request.getParameter("phone3");
    String phone4 = request.getParameter("phone4") == null ? "" : request.getParameter("phone4");
    String phone5 = request.getParameter("phone5") == null ? "" : request.getParameter("phone5");
    String city1 = request.getParameter("city1") == null ? "" : request.getParameter("city1");
    String city2 = request.getParameter("city2") == null ? "" : request.getParameter("city2");
    String city3 = request.getParameter("city3") == null ? "" : request.getParameter("city3");
    String city4 = request.getParameter("city4") == null ? "" : request.getParameter("city4");
    String city5 = request.getParameter("city5") == null ? "" : request.getParameter("city5");
    String location1 = request.getParameter("location1") == null ? "" : request.getParameter("location1");
    String location2 = request.getParameter("location2") == null ? "" : request.getParameter("location2");
    String location3 = request.getParameter("location3") == null ? "" : request.getParameter("location3");
    String location4 = request.getParameter("location4") == null ? "" : request.getParameter("location4");
    String location5 = request.getParameter("location5") == null ? "" : request.getParameter("location5");
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
    String starterkit_default = "";
    String default_address = "";
    if (batch1.equals("1")) {
      default_address = "1";
    }

    if (batch2.equals("2")) {
      default_address = "2";
    }

    if (batch3.equals("3")) {
      default_address = "3";
    }

    if (batch4.equals("4")) {
      default_address = "4";
    }

    if (batch5.equals("5")) {
      default_address = "5";
    }

    if (starterkit1.equals("1")) {
      starterkit_default = "1";
    }

    if (starterkit2.equals("2")) {
      starterkit_default = "2";
    }

    if (starterkit3.equals("3")) {
      starterkit_default = "3";
    }

    if (starterkit4.equals("4")) {
      starterkit_default = "4";
    }

    if (starterkit5.equals("5")) {
      starterkit_default = "5";
    }

    String address = "";
    String phoneNumber = "";
    String clinicName = "";
    String buyersAddress = "";
    String buyersClinicName = "";
    Enumeration<String> list = request.getParameterNames();

    String[] paramValues;
    String value;
    while (list.hasMoreElements()) {
      String paramName = (String) list.nextElement();
      if (paramName.contains("pno")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          phoneNumber = String.valueOf(phoneNumber) + value + "#";
        }
      } else if (paramName.contains("cni")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          clinicName = String.valueOf(clinicName) + value + "#";
        }
      } else if (paramName.contains("bcn")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersClinicName = String.valueOf(buyersClinicName) + value + "#";
        }
      } else if (paramName.contains("badd")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersAddress = String.valueOf(buyersAddress) + value + "#";
        }
      }
    }

    ArrayList<String> list2 = new ArrayList();
    list2.add(phoneNumber);
    list2.add(clinicName);
    list2.add(buyersClinicName);
    list2.add(buyersAddress);

    for (int i = 0; i < list2.size(); ++i) {
      if (((String) list2.get(i)).length() > 0) {
        value = ((String) list2.get(i)).substring(0, ((String) list2.get(i)).length() - 1);
        list2.set(i, value);
      }
    }

    paramValues = null;
    value = null;
    Statement st2 = null;
    new ArrayList();
    long cid = 0L;

    try {
      con0 = LoginDAO.getConnectionDetails();
      st2 = con0.createStatement();
      String sql1 = "SELECT Case_Id FROM cc_crm";

      for (ResultSet rs1 = st2.executeQuery(sql1); rs1.next(); cid = rs1.getLong("Case_Id")) {
      }

      if (cid == incase) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('CASE ID : " + incase + " ALREADY EXISTS!');");
        out.println("location='Case_Stage';");
        out.println("</script>");
      } else {
        String query;
        int j;
        Connection con3;
        Statement st3;
        HttpSession session;
        String n;
        String query3;
        if (existing_flag != this.Null && !existing_flag.equals("")) {
          try {
            con1 = LoginDAO.getConnectionDetails();
            Statement st1 = con1.createStatement();
            query = "update  cc_crm set(case_id='" + incase + "',case_type ='" + Existing + "' , Patient_Name='"
                + PATIENT + "' , scan='" + Impression + "',registered_doctor='" + RDoctor + "',Doctor_Name='" + CDoctor
                + "' " + "crm_name='" + crm + "' ,clinic_name='" + (String) list2.get(1) + "' ,p_graph='" + Photograph
                + "' ," + "starter_kit='" + SKit + "' ,s_shown='" + Shown + "' , type_request='" + TRequest
                + "',ppf_fill='" + PPF + "',kol='" + KOL + "',c_pkg='" + Cpkg + "',pkg_name='" + Pname + "' ,"
                + "  dispatch_crpt='" + Dispatchcr + "', dispatch_address='" + DispatchAdr + "',bill_address='"
                + BillAdr + "',case_stage='" + case_stage + "',priority='" + Priority1 + "',delivery_note_no ='"
                + delivery_note_no + "'," + " bclinic='" + (String) list2.get(2) + "',badd='" + (String) list2.get(3)
                + "',bgst_no='" + bgst_no + "',category='" + category + "',upper_aligner='" + upper_aligner
                + "',lower_aligner='" + lower_aligner + "',others='" + others + "',user_id='" + user_id
                + "',CREATED_DATE=now(),plan_date=curdate(),plan_time=curtime(),address1='" + address1 + "',address2='"
                + address2 + "',address3='" + address3 + "'," + "address4='" + address4 + "',address5='" + address5
                + "',location='" + location1 + "',location2='" + location2 + "',location3='" + location3
                + "',location4='" + location4 + "',location5='" + location5 + "',city='" + city1 + "',city2='" + city2
                + "',city3='" + city3 + "'," + "city4='" + city4 + "',city5='" + city5 + "',pincode1='" + pincode1
                + "',pincode2='" + pincode2 + "',pincode3='" + pincode3 + "',pincode4='" + pincode4 + "',pincode5='"
                + pincode5 + "',phone1='" + phone1 + "',phone2='" + phone2 + "',phone3='" + phone3 + "',phone4='"
                + phone4 + "',phone5='" + phone5 + "',default_starterkit='" + starterkit_default + "',"
                + "default_address='" + default_address + "' where existing_flag='" + existing_flag + "'";
            j = st1.executeUpdate(query);
            if (j > 0) {
              con3 = LoginDAO.getConnectionDetails();
              st3 = con3.createStatement();
              session = request.getSession(false);
              n = (String) session.getAttribute("userid");
              query3 = "INSERT INTO decision_history values('" + case_stage + "','' ,now(),'" + case_stage + "','" + n
                  + "','" + incase + "')";
              st3.executeUpdate(query3);
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='Case_Stage';");
              out.println("</script>");
              con1.close();
            }
          } catch (Exception var99) {
            LOGGER.info("Error At CreateCCSave=" + var99.getMessage());
          }
        } else {
          try {
            con = LoginDAO.getConnectionDetails();
            Statement st = con.createStatement();
            query = "INSERT INTO cc_crm (case_type, case_id , scan, location,location2,location3,location4,location5,city,city2,city3,city4,city5,registered_doctor, Doctor_Name,crm_name ,clinic_name ,p_graph ,starter_kit ,type_request ,s_shown ,ppf_fill ,t_account ,corporate_account , kol ,c_pkg ,pkg_name , dispatch_crpt,dispatch_address,bill_address,case_stage,priority,Patient_Name,delivery_note_no,bclinic,badd,bgst_no,category,upper_aligner,lower_aligner,others,address1,address2,address3,address4,address5,user_id,starter_satus,CREATED_DATE,ini_at,plan_date,plan_time,default_address,pincode1,pincode2,pincode3,pincode4,pincode5,phone1,phone2,phone3,phone4,phone5,default_starterkit) VALUES('"
                + Existing + "','" + incase + "','" + Impression + "','" + location1 + "','" + location2 + "','"
                + location3 + "','" + location4 + "'," + "'" + location5 + "','" + city1 + "','" + city2 + "','" + city3
                + "','" + city4 + "','" + city5 + "'," + "'" + RDoctor + "','" + CDoctor + "','" + crm + "'," + "'"
                + (String) list2.get(1) + "','" + Photograph + "','" + SKit + "','" + TRequest + "'," + "'" + Shown
                + "','" + PPF + "','" + TAccount + "'," + "'" + CAccount + "','" + KOL + "','" + Cpkg + "','" + Pname
                + "','" + Dispatchcr + "','" + DispatchAdr + "','" + BillAdr + "'," + "'" + case_stage + "','"
                + Priority1 + "','" + PATIENT + "','" + delivery_note_no + "','" + (String) list2.get(2) + "'," + "'"
                + (String) list2.get(3) + "','" + bgst_no + "','" + category + "','" + upper_aligner + "','"
                + lower_aligner + "'," + "'" + others + "','" + address1 + "','" + address2 + "','" + address3 + "','"
                + address4 + "','" + address5 + "'," + "'" + user_id + "','N',now(),now(),curdate(),curtime(),'"
                + default_address + "','" + pincode1 + "'," + "'" + pincode2 + "','" + pincode3 + "'," + "'" + pincode4
                + "'," + "'" + pincode5 + "','" + phone1 + "'," + "'" + phone2 + "','" + phone3 + "','" + phone4 + "','"
                + phone5 + "','" + starterkit_default + "') ";
            j = st.executeUpdate(query);
            if (j > 0) {
              con3 = LoginDAO.getConnectionDetails();
              st3 = con3.createStatement();
              session = request.getSession(false);
              n = (String) session.getAttribute("userid");
              query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid)values('"
                  + case_stage + "','" + others + "' ,now(),'" + case_stage + "','" + n + "','" + incase + "')";
              st3.executeUpdate(query3);
              out.println("<script type=\"text/javascript\">");
              String apiDownload = "http://http://97.74.91.187/:8080/QRCodeGenerator/qrCode1?casedid=" + incase;
              out.println("var api='" + apiDownload + "'");
              out.println(
                  "window.open(api,'_blank', resizable='yes', scrollbars='yes', titlebar='yes', width='800', height='900', top='10', left='10');");
              out.println("location='Case_Stage';");
              out.println("</script>");
            } else {
              out.println("alert('Case Failed to store!');");
              out.println("location='Case_Stage';");
            }

            con.close();
          } catch (Exception var100) {
            var100.printStackTrace();
          }
        }
      }
    } catch (Exception var101) {
    }

    try {
      LoginDAO.getConnectionDetails().close();
    } catch (SQLException | ClassNotFoundException var98) {
      LOGGER.info("Error At CreateCCSave=" + var98.getMessage());
    }

  }
}
