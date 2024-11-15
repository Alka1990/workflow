
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/AddCaseDetails" })
public class AddCaseDetails extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(AddCaseDetails.class);
  private static final long serialVersionUID = 1L;
  private String Null;

  public AddCaseDetails() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")) {
      response.sendRedirect("login.jsp?msg=You are not logged in..!");
    }

    PrintWriter out = response.getWriter();
    Connection con1 = null;
    Connection con01 = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement apstmt = null;
    Statement stmt1 = null;
    ResultSet rs = null;
    long case_id = 0L;
    boolean rowaffected = false;
    String others = null;
    String scan_impression = request.getParameter("Impression") == null ? "" : request.getParameter("Impression");
    String reg_doctor = request.getParameter("RDoctor") == null ? "" : request.getParameter("RDoctor").trim();
    String crm = request.getParameter("crm") == null ? "" : request.getParameter("crm").trim();
    String tre_octor = request.getParameter("CDoctor") == null ? "" : request.getParameter("CDoctor").trim();
    String treating_dr_email = request.getParameter("treating_dr_email") == null ? ""
        : request.getParameter("treating_dr_email").trim();
    String patient_name = request.getParameter("PATIENT") == null ? "" : request.getParameter("PATIENT").trim();
    String patient_email = request.getParameter("patient_email") == null ? ""
        : request.getParameter("patient_email").trim();
    String tor = request.getParameter("TRequest") == null ? "" : request.getParameter("TRequest");
    String photograph = request.getParameter("Photograph") == null ? "" : request.getParameter("Photograph");
    
    String SKit = request.getParameter("SKit") == null ? "" : request.getParameter("SKit");
    String st_upper = request.getParameter("st_upper") != null ? "yes" : "no";
    String st_lower = request.getParameter("st_lower") != null ? "yes" : "no";
    String st_other = request.getParameter("st_other");
    
    String[] additionalOptions = request.getParameterValues("additionalOption");
	 st_upper = "false";
	 st_lower = "false";
	 st_other = "false";

       
       
       if (additionalOptions != null) {
           for (String option : additionalOptions) {
               switch (option) {
                   case "Upper":
                   	st_upper = "true";
	            		System.out.println("hi Upper");

                       break;
                   case "Lower":
                   	st_lower = "true";
	            		System.out.println("hi Lower");

                       break;
                   case "Both":
                   	st_upper = "true";
                   	st_lower = "true";
                       st_other = "true";
                       break;
               }
           }
       }
    
    String simulation_shown = request.getParameter("Shown") == null ? "" : request.getParameter("Shown");
    String ppf = request.getParameter("PPF") == null ? "" : request.getParameter("PPF");
    String address1 = request.getParameter("address1") == null ? "" : request.getParameter("address1").trim();
    String address2 = request.getParameter("address2") == null ? "" : request.getParameter("address2").trim();
    String address3 = request.getParameter("address3") == null ? "" : request.getParameter("address3").trim();
    String address4 = request.getParameter("address4") == null ? "" : request.getParameter("address4").trim();
    String address5 = request.getParameter("address5") == null ? "" : request.getParameter("address5").trim();
    String pincode1 = request.getParameter("pincode1") == null ? "" : request.getParameter("pincode1").trim();
    String pincode2 = request.getParameter("pincode2") == null ? "" : request.getParameter("pincode2").trim();
    String pincode3 = request.getParameter("pincode3") == null ? "" : request.getParameter("pincode3").trim();
    String pincode4 = request.getParameter("pincode4") == null ? "" : request.getParameter("pincode4").trim();
    String pincode5 = request.getParameter("pincode5") == null ? "" : request.getParameter("pincode5").trim();
    String phone1 = request.getParameter("phone1") == null ? "" : request.getParameter("phone1").trim();
    String phone2 = request.getParameter("phone2") == null ? "" : request.getParameter("phone2").trim();
    String phone3 = request.getParameter("phone3") == null ? "" : request.getParameter("phone3").trim();
    String phone4 = request.getParameter("phone4") == null ? "" : request.getParameter("phone4").trim();
    String phone5 = request.getParameter("phone5") == null ? "" : request.getParameter("phone5").trim();
    String city1 = request.getParameter("city1") == null ? "" : request.getParameter("city1").trim();
    String city2 = request.getParameter("city2") == null ? "" : request.getParameter("city2").trim();
    String city3 = request.getParameter("city3") == null ? "" : request.getParameter("city3").trim();
    String city4 = request.getParameter("city4") == null ? "" : request.getParameter("city4").trim();
    String city5 = request.getParameter("city5") == null ? "" : request.getParameter("city5").trim();
    String location1 = request.getParameter("location1") == null ? "" : request.getParameter("location1").trim();
    String location2 = request.getParameter("location2") == null ? "" : request.getParameter("location2").trim();
    String location3 = request.getParameter("location3") == null ? "" : request.getParameter("location3").trim();
    String location4 = request.getParameter("location4") == null ? "" : request.getParameter("location4").trim();
    String location5 = request.getParameter("location5") == null ? "" : request.getParameter("location5").trim();
    String starterkit1 = request.getParameter("starterkit1") == null ? "" : request.getParameter("starterkit1").trim();
    String starterkit2 = request.getParameter("starterkit2") == null ? "" : request.getParameter("starterkit2").trim();
    String starterkit3 = request.getParameter("starterkit3") == null ? "" : request.getParameter("starterkit3").trim();
    String starterkit4 = request.getParameter("starterkit4") == null ? "" : request.getParameter("starterkit4").trim();
    String starterkit5 = request.getParameter("starterkit5") == null ? "" : request.getParameter("starterkit5").trim();
    String batch1 = request.getParameter("batch1") == null ? "" : request.getParameter("batch1");
    String batch2 = request.getParameter("batch2") == null ? "" : request.getParameter("batch2");
    String batch3 = request.getParameter("batch3") == null ? "" : request.getParameter("batch3");
    String batch4 = request.getParameter("batch4") == null ? "" : request.getParameter("batch4");
    String batch5 = request.getParameter("batch5") == null ? "" : request.getParameter("batch5");
    String remarks = request.getParameter("remark") == null ? "" : request.getParameter("remark").trim();
    String user_id = (String) request.getSession().getAttribute("userid");
    String Existing = request.getParameter("Existing");
    case_id = Long.parseLong(request.getParameter("case_id"));
    String specialRemarks = request.getParameter("special_remarks");
    String t_account = request.getParameter("TAccount") == null ? "" : request.getParameter("TAccount");
    String corporate_account = request.getParameter("CAccount") == null ? "" : request.getParameter("CAccount");
    String kol = request.getParameter("KOL") == null ? "" : request.getParameter("KOL");
    String c_pkg = request.getParameter("Cpkg") == null ? "" : request.getParameter("Cpkg").trim();
    String dispatch_crpt = request.getParameter("Dispatchcr") == null ? "" : request.getParameter("Dispatchcr").trim();
    String dispatch_address = request.getParameter("DispatchAdr") == null ? ""
        : request.getParameter("DispatchAdr").trim();
    String bill_address = request.getParameter("BillAdr") == null ? "" : request.getParameter("BillAdr").trim();
    if (request.getParameter("delivery_note_no") == null) {
      String var10000 = "";
    } else {
      request.getParameter("delivery_note_no").trim();
    }

    String bgst_no = request.getParameter("bgst_no") == null ? "" : request.getParameter("bgst_no").trim();
    String category = request.getParameter("category") == null ? "" : request.getParameter("category").trim();
    String upper_aligner = request.getParameter("upper_aligner") == null ? ""
        : request.getParameter("upper_aligner").trim();
    String lower_aligner = request.getParameter("lower_aligner") == null ? ""
        : request.getParameter("lower_aligner").trim();
    others = request.getParameter("others") == null ? "" : request.getParameter("others").trim();
    int priority = Integer.parseInt(request.getParameter("Priority") == null ? "0" : request.getParameter("Priority"));
    String delivery_note_no = request.getParameter("dno") == null ? "" : request.getParameter("dno").trim();
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

    String value;
    while (list.hasMoreElements()) {
      String paramName = (String) list.nextElement();
      String[] paramValues;
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

    new ArrayList();
    long cid = 0L;

    try {
      Connection con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con01 = LoginDAO.getConnectionDetails();
      Statement stmt = con01.createStatement();
      stmt1 = con01.createStatement();

      for (rs = stmt.executeQuery("SELECT Case_Id FROM cc_crm"); rs.next(); cid = rs.getLong("Case_Id")) {
      }

      if (cid == case_id) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Case id : " + case_id + " already exists!');");
        out.println("location='Newcase1';");
        out.println("</script>");
      } else if (Existing.equals("New")) {
        String query = "INSERT INTO cc_crm (case_id,scan,clinic_Name,address1,address2,address3,address4,address5,pincode1,"
        		+ "pincode2,pincode3,pincode4,pincode5,phone1,phone2,phone3,phone4,phone5,city,city2,city3,city4,city5,"
        		+ "location,location2,location3,location4,location5,default_starterkit,default_address,registered_doctor,"
        		+ "Doctor_Name,crm_name,type_request,p_graph,starter_kit,s_shown,ppf_fill,user_id,others,Patient_Name, "
        		+ "t_account,corporate_account,kol,c_pkg,dispatch_crpt,dispatch_address,bill_address,delivery_note_no,bgst_no,"
        		+ " bclinic,badd,category,upper_aligner,lower_aligner,priority,case_type,case_stage,starter_satus,CREATED_DATE,"
        		+ "ini_at,plan_date,plan_time,patient_email,treating_dr_email,special_remarks,st_upper,st_lower,st_other)"
        		+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'INI','N',now(),now(),curdate(),curtime(),?,?,?,?,?,?)";
        pstmt1 = con1.prepareStatement(query);
        System.out.println("pstmt1 :: " + pstmt1.toString());
        pstmt1.setLong(1, case_id);
        pstmt1.setString(2, scan_impression);
        pstmt1.setString(3, (String) list2.get(1));
        pstmt1.setString(4, address1);
        pstmt1.setString(5, address2);
        pstmt1.setString(6, address3);
        pstmt1.setString(7, address4);
        pstmt1.setString(8, address5);
        pstmt1.setString(9, pincode1);
        pstmt1.setString(10, pincode2);
        pstmt1.setString(11, pincode3);
        pstmt1.setString(12, pincode4);
        pstmt1.setString(13, pincode5);
        pstmt1.setString(14, phone1);
        pstmt1.setString(15, phone2);
        pstmt1.setString(16, phone3);
        pstmt1.setString(17, phone4);
        pstmt1.setString(18, phone5);
        pstmt1.setString(19, city1);
        pstmt1.setString(20, city2);
        pstmt1.setString(21, city3);
        pstmt1.setString(22, city4);
        pstmt1.setString(23, city5);
        pstmt1.setString(24, location1);
        pstmt1.setString(25, location2);
        pstmt1.setString(26, location3);
        pstmt1.setString(27, location4);
        pstmt1.setString(28, location5);
        pstmt1.setString(29, starterkit_default);
        pstmt1.setString(30, default_address);
        pstmt1.setString(31, reg_doctor);
        pstmt1.setString(32, tre_octor);
        pstmt1.setString(33, crm);
        pstmt1.setString(34, tor);
        pstmt1.setString(35, photograph);
        pstmt1.setString(36, SKit);
        pstmt1.setString(37, simulation_shown);
        pstmt1.setString(38, ppf);
        pstmt1.setString(39, user_id);
        pstmt1.setString(40, others);
        pstmt1.setString(41, patient_name);
        pstmt1.setString(42, t_account);
        pstmt1.setString(43, corporate_account);
        pstmt1.setString(44, kol);
        pstmt1.setString(45, c_pkg);
        pstmt1.setString(46, dispatch_crpt);
        pstmt1.setString(47, dispatch_address);
        pstmt1.setString(48, bill_address);
        pstmt1.setString(49, delivery_note_no);
        pstmt1.setString(50, bgst_no);
        pstmt1.setString(51, (String) list2.get(2));
        pstmt1.setString(52, (String) list2.get(3));
        pstmt1.setString(53, category);
        pstmt1.setString(54, upper_aligner);
        pstmt1.setString(55, lower_aligner);
        pstmt1.setInt(56, priority);
        pstmt1.setString(57, Existing);
        pstmt1.setString(58, patient_email);
        pstmt1.setString(59, treating_dr_email);
        pstmt1.setString(60, specialRemarks);
        pstmt1.setString(61, st_upper);
        pstmt1.setString(62, st_lower);
        pstmt1.setString(63, st_other);
        System.out.println("pstmt11 :: " + pstmt1.toString());
        int rowaffected1 = pstmt1.executeUpdate();
        if (rowaffected1 > 0) {
          stmt1.executeUpdate(
              "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid,st_upper,st_lower,st_other)values('INI','" + remarks
                  + "',now(),'INI','" + user_id + "','" + case_id + "','"+st_upper+"','"+st_lower+"','"+st_other+"')");
          ArrayList<String> alist = new ArrayList();
          alist.add(address1);
          alist.add(address2);
          alist.add(address3);
          alist.add(address4);
          alist.add(address5);
          Iterator var96 = alist.iterator();

          String item;
          while (var96.hasNext()) {
            item = (String) var96.next();
            if (!item.equals("")) {
              apstmt = con.prepareStatement(
                  " insert into address_logs(case_id,address,remarks,decision,user_id,created_on) values(?,?,?,?,?,now()) ");
              apstmt.setLong(1, case_id);
              apstmt.setString(2, item);
              apstmt.setString(3, remarks);
              apstmt.setString(4, "INI");
              apstmt.setString(5, user_id);
              apstmt.executeUpdate();
            }
          }

          out.println("<script type=\"text/javascript\">");
          out.println("alert('Case Initiated successfully');");
          item = "http//97.74.91.187:8080/QRCodeGenerator/qrCode1?casedid=" + case_id;
          out.println("var api='" + item + "'");
          out.println(
              "window.open(api,'_blank', resizable='yes', scrollbars='yes', titlebar='yes', width='800', height='900', top='10', left='10');");
          out.println("location='Newcase1';");
          out.println("</script>");
        } else {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Error Occured!');");
          out.println("location='Newcase1';");
          out.println("</script>");
        }
      }
    } catch (Exception var622) {
      System.out.println("Error At AddCaseDetails: " + var622.getMessage());
      out.println("<script type=\"text/javascript\">");
      out.println("alert('Case id : " + case_id + " already exists!');");
      //out.println("alert('Case id : " + case_id + " already exists!');");

      out.println("location='Newcase1';");
      out.println("</script>");
    } finally {
      treating_dr_email = "";
      patient_email = "";
      batch5 = "";
      batch4 = "";
      batch3 = "";
      batch2 = "";
      batch1 = "";
      starterkit5 = "";
      starterkit4 = "";
      starterkit3 = "";
      starterkit2 = "";
      starterkit1 = "";
      location5 = "";
      location4 = "";
      location3 = "";
      location2 = "";
      location1 = "";
      city5 = "";
      city4 = "";
      city3 = "";
      city2 = "";
      city1 = "";
      phone5 = "";
      phone4 = "";
      phone3 = "";
      phone2 = "";
      phone1 = "";
      pincode5 = "";
      pincode4 = "";
      pincode3 = "";
      pincode2 = "";
      pincode1 = "";
      address5 = "";
      address4 = "";
      address3 = "";
      address2 = "";
      address1 = "";
      lower_aligner = "";
      upper_aligner = "";
      category = "";
      bgst_no = "";
      delivery_note_no = "";
      bill_address = "";
      dispatch_address = "";
      dispatch_crpt = "";
      c_pkg = "";
      kol = "";
      corporate_account = "";
      t_account = "";
      if (rs != null) {
        try {
          rs.close();
        } catch (Exception var620) {
        } finally {
          rs = null;
        }
      }

      if (stmt1 != null) {
        try {
          stmt1.close();
        } catch (Exception var618) {
        } finally {
          stmt1 = null;
        }
      }

      if (pstmt1 != null) {
        try {
          pstmt1.close();
        } catch (Exception var616) {
        } finally {
          pstmt1 = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var614) {
        } finally {
          con1 = null;
        }
      }

      if (con01 != null) {
        try {
          con01.close();
        } catch (Exception var612) {
        } finally {
          con01 = null;
        }
      }

      out.flush();
      System.gc();
    }

  }
}
