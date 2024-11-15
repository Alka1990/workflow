
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/EditCCSave" })
public class EditCCSave extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(EditCCSave.class);
  private static final long serialVersionUID = 1L;

  public EditCCSave() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("Working");
    PrintWriter out = response.getWriter();
    PreparedStatement pstmt = null;
    String scan = "";
    String location = "";
    String city = "";
    String r_Doctor = "";
    String crm = null;
    String p_graph = null;
    String starter_kit = null;
    String type_request = null;
    String s_shown = null;
    String ppf_fill = null;
    String t_account = null;
    String corporate_account = null;
    String kol = null;
    String c_pkg = null;
    String pkg_name = null;
    String dispatch_crpt = null;
    String dispatch_address = null;
    String bill_address = null;
    String c_doctor = "";
    String case_stage = "";
    String delivery_note_no = "";
    String bgst_no = "";
    String category = "";
    String upper_aligner = "";
    String lower_aligner = "";
    String others = "";
    String Patient_Name = "";
    String remark = null;
    HttpSession session = request.getSession();
    List<String> userRight = LoginDAO.getRight((String) session.getAttribute("userid"));

    for (int i = 0; i < userRight.size(); ++i) {
      System.out.println("Element " + i + " stored at Index : " + userRight);
    }

    String payment_processing = "";
    String payment_mode = "";
    double total_amount = 0.0;
    Statement st01 = null;
    Statement st33 = null;
    Statement st3 = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    PreparedStatement pstmt02 = null;
    PreparedStatement pstmt03 = null;
    PreparedStatement pstmt04 = null;
    PreparedStatement pstmt05 = null;
    PreparedStatement pstmt06 = null;
    PreparedStatement pstmt01 = null;
    Connection con33 = null;
    Connection con3 = null;
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;
    Connection con01 = null;
    Connection con5 = null;
    String total = request.getParameter("total_amount") == null ? "0.0"
        : request.getParameter("total_amount").trim();
    if (!total.isEmpty()) {
      total_amount = Double.parseDouble(total);
    }

    String Case_Id = request.getParameter("case_id") == null ? "" : request.getParameter("case_id").trim();
    String userName = (String) session.getAttribute("userid");
    scan = request.getParameter("scan") == null ? "" : request.getParameter("scan");
    r_Doctor = request.getParameter("r_Doctor") == null ? "" : request.getParameter("r_Doctor").trim();
    crm = request.getParameter("crm") == null ? "" : request.getParameter("crm");
    p_graph = request.getParameter("Photograph") == null ? "" : request.getParameter("Photograph");
    starter_kit = request.getParameter("SKit") == null ? "" : request.getParameter("SKit");
    type_request = request.getParameter("TRequest") == null ? "" : request.getParameter("TRequest");
    s_shown = request.getParameter("Shown") == null ? "" : request.getParameter("Shown");
    ppf_fill = request.getParameter("PPF") == null ? "" : request.getParameter("PPF");
    t_account = request.getParameter("t_account") == null ? "" : request.getParameter("t_account");
    corporate_account = request.getParameter("corporate_account") == null ? ""
        : request.getParameter("corporate_account");
    kol = request.getParameter("kol") == null ? "" : request.getParameter("kol");
    c_pkg = request.getParameter("c_pkg") == null ? "" : request.getParameter("c_pkg").trim();
    pkg_name = request.getParameter("pkg_name") == null ? "" : request.getParameter("pkg_name").trim();
    dispatch_crpt = request.getParameter("dispatch_crpt") == null ? ""
        : request.getParameter("dispatch_crpt").trim();
    dispatch_address = request.getParameter("dispatch_address") == null ? ""
        : request.getParameter("dispatch_address").trim();
    bill_address = request.getParameter("bill_address") == null ? "" : request.getParameter("bill_address").trim();
    c_doctor = request.getParameter("c_doctor") == null ? "" : request.getParameter("c_doctor").trim();
    delivery_note_no = request.getParameter("delivery_note_no") == null ? ""
        : request.getParameter("delivery_note_no").trim();
    bgst_no = request.getParameter("bgst_no") == null ? "" : request.getParameter("bgst_no").trim();
    category = request.getParameter("category") == null ? "" : request.getParameter("category").trim();
    upper_aligner = request.getParameter("upper_aligner") == null ? ""
        : request.getParameter("upper_aligner").trim();
    lower_aligner = request.getParameter("lower_aligner") == null ? ""
        : request.getParameter("lower_aligner").trim();
    others = request.getParameter("others") == null ? "" : request.getParameter("others").trim();
    Patient_Name = request.getParameter("Patient_Name") == null ? "" : request.getParameter("Patient_Name").trim();
    case_stage = request.getParameter("stage") == null ? "" : request.getParameter("stage");
    remark = request.getParameter("remark") == null ? "" : request.getParameter("remark").trim();
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
    System.out.println("phone1: " + phone1 + " phone2: " + phone2 + " phone3: " + phone3 + " phone4: " + phone4
        + " phone5: " + phone5);
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
    System.out.println("s1 : " + starterkit1 + " s2 : " + starterkit2 + " s3 : " + starterkit3 + " s4 : "
        + starterkit4 + " s5 : " + starterkit5);
    System.out.println(
        "b1 : " + batch1 + " b2 : " + batch2 + " b3 : " + batch3 + " b4 : " + batch4 + " b5 : " + batch5);
    String starterkit_default = "";
    String default_address = "";
    int priority = 0;
    Connection c1 = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String dbpriority = "";

    String phoneNumber;
    try {
      phoneNumber = "select priority from cc_crm where case_id='" + Case_Id + "' ";
      System.out.println("cadbsquery : " + phoneNumber);
      c1 = LoginDAO.getConnectionDetails();
      ps = c1.prepareStatement(phoneNumber);
      System.out.println("CADBS : " + ps);
      rs = ps.executeQuery();
      if (rs.next()) {
        dbpriority = rs.getString("priority");
        System.out.println("dbpriority : " + dbpriority);
        System.out.println("cadbs priority: " + priority);
      }
    } catch (SQLException var5664) {
      var5664.getMessage();
    } catch (ClassNotFoundException var5665) {
      var5665.printStackTrace();
    }

    if (userRight.contains("CADBS")) {
      priority = Integer.parseInt(dbpriority);
      System.out.println("right =CADBS priority :: " + priority);
    } else {
      System.out.println("2right :: " + userRight);
      priority = Integer
          .parseInt(request.getParameter("priority") == null ? "0" : request.getParameter("priority"));
      System.out.println("!cadbs priority: " + priority);
    }

    if (batch1.equals("1")) {
      default_address = batch1;
    }

    if (batch2.equals("2")) {
      default_address = batch2;
    }

    if (batch3.equals("3")) {
      default_address = batch3;
    }

    if (batch4.equals("4")) {
      default_address = batch4;
    }

    if (batch5.equals("5")) {
      default_address = batch5;
    }

    if (starterkit1.equals("1")) {
      starterkit_default = starterkit1;
    }

    if (starterkit2.equals("2")) {
      starterkit_default = starterkit2;
    }

    if (starterkit3.equals("3")) {
      starterkit_default = starterkit3;
    }

    if (starterkit4.equals("4")) {
      starterkit_default = starterkit4;
    }

    if (starterkit5.equals("5")) {
      starterkit_default = starterkit5;
    }

    if (case_stage.equals("")) {
      case_stage = "INI";
    }

    if (request.getParameter("total_amount") == null) {
      total_amount = 0.0;
    }

    payment_processing = request.getParameter("payment_processing") == null ? ""
        : request.getParameter("payment_processing");
    payment_mode = request.getParameter("payment_mode") == null ? "" : request.getParameter("payment_mode");
    phoneNumber = "";
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
          phoneNumber = String.valueOf(String.valueOf(phoneNumber)) + value + "#";
        }
      } else if (paramName.contains("cni")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          clinicName = String.valueOf(String.valueOf(clinicName)) + value + "#";
        }
      } else if (paramName.contains("bcn")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersClinicName = String.valueOf(String.valueOf(buyersClinicName)) + value + "#";
        }
      } else if (paramName.contains("badd")) {
        paramValues = request.getParameterValues(paramName);
        value = paramValues[0];
        if (value != null && value != "") {
          buyersAddress = String.valueOf(String.valueOf(buyersAddress)) + value + "#";
        }
      }
    }

    ArrayList<String> list2 = new ArrayList();
    list2.add(phoneNumber);
    list2.add(clinicName);
    list2.add(buyersClinicName);
    list2.add(buyersAddress);

    for (int j = 0; j < list2.size(); ++j) {
      if (((String) list2.get(j)).length() > 0) {
        value = ((String) list2.get(j)).substring(0, ((String) list2.get(j)).length() - 1);
        list2.set(j, value);
      }
    }

    try {
      paramValues = null;
      value = null;
      String query2 = null;
      con = LoginDAO.getConnectionDetails();
      con1 = LoginDAO.getConnectionDetails();
      con2 = LoginDAO.getConnectionDetails();
      String query;
      int rowaffected1;
      Connection con32;
      Statement st32;
      String query32;
      if (case_stage.equals("Y")) {
        query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,draft=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,plan_date=curdate(),plan_time=curtime() where case_id='"
            + Case_Id + "' ";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, scan);
        pstmt.setString(2, r_Doctor);
        pstmt.setString(3, crm);
        pstmt.setString(4, (String) list2.get(1));
        pstmt.setString(5, p_graph);
        pstmt.setString(6, starter_kit);
        pstmt.setString(7, type_request);
        pstmt.setString(8, s_shown);
        pstmt.setString(9, ppf_fill);
        pstmt.setString(10, t_account);
        pstmt.setString(11, corporate_account);
        pstmt.setString(12, kol);
        pstmt.setString(13, c_pkg);
        pstmt.setString(14, pkg_name);
        pstmt.setString(15, dispatch_crpt);
        pstmt.setString(16, dispatch_address);
        pstmt.setString(17, bill_address);
        pstmt.setString(18, c_doctor);
        pstmt.setString(19, delivery_note_no);
        pstmt.setString(20, (String) list2.get(2));
        pstmt.setString(21, (String) list2.get(3));
        pstmt.setString(22, bgst_no);
        pstmt.setString(23, category);
        pstmt.setString(24, upper_aligner);
        pstmt.setString(25, lower_aligner);
        pstmt.setString(26, others);
        pstmt.setString(27, Patient_Name);
        pstmt.setInt(28, priority);
        pstmt.setString(29, remark);
        pstmt.setString(30, userName);
        pstmt.setDouble(31, total_amount);
        pstmt.setString(32, payment_processing);
        pstmt.setString(33, payment_mode);
        pstmt.setString(34, address1);
        pstmt.setString(35, address2);
        pstmt.setString(36, address3);
        pstmt.setString(37, address4);
        pstmt.setString(38, address5);
        pstmt.setString(39, location1);
        pstmt.setString(40, location2);
        pstmt.setString(41, location3);
        pstmt.setString(42, location4);
        pstmt.setString(43, location5);
        pstmt.setString(44, city1);
        pstmt.setString(45, city2);
        pstmt.setString(46, city3);
        pstmt.setString(47, city4);
        pstmt.setString(48, city5);
        pstmt.setString(49, pincode1);
        pstmt.setString(50, pincode2);
        pstmt.setString(51, pincode3);
        pstmt.setString(52, pincode4);
        pstmt.setString(53, pincode5);
        pstmt.setString(54, default_address);
        pstmt.setString(55, starterkit_default);
        pstmt.setString(56, case_stage);
        pstmt.setString(57, phone1);
        pstmt.setString(58, phone2);
        pstmt.setString(59, phone3);
        pstmt.setString(60, phone4);
        pstmt.setString(61, phone5);
        System.out.println("change stage  y :: " + pstmt.toString());
        rowaffected1 = pstmt.executeUpdate();
        if (rowaffected1 > 0) {
          System.out.println("y >0");
          con32 = LoginDAO.getConnectionDetails();
          st32 = con32.createStatement();
          query32 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
              + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName + "','"
              + Case_Id + "')";
          st32.executeUpdate(query32);
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='Newcase1';");
          out.println("</script>");
        } else {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('NOT SAVED!');");
          out.println("location='Newcase1';");
          out.println("</script>");
        }

        con.close();
      }

      String query3;
      if (case_stage.equals("STG") && starter_kit.equals("Yes") && type_request.equals("New Case")) {
        query = " update cc_crm set starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',type_request='"
            + type_request + "',p_graph='" + p_graph + "',user_id='" + userName + "',crm_name='" + crm
            + "',Doctor_Name='" + c_doctor + "',Patient_Name='" + Patient_Name + "',registered_doctor='"
            + r_Doctor + "',t_account='" + t_account + "',corporate_account='" + corporate_account
            + "',kol='" + kol + "',c_pkg='" + c_pkg + "',dispatch_crpt='" + dispatch_crpt + "',priority='"
            + priority + "',type_request='" + type_request + "',p_graph='" + p_graph + "',starter_kit='"
            + starter_kit + "',s_shown='" + s_shown + "',ppf_fill='" + ppf_fill + "',location='" + location1
            + "',location2='" + location2 + "',location3='" + location3 + "',location4='" + location4 + "',"
            + "location5='" + location5 + "',city='" + city1 + "',city2='" + city2 + "',city3='" + city3
            + "',city4='" + city4 + "'," + "city5='" + city5 + "'," + "address1='" + address1
            + "',address2='" + address2 + "',address3='" + address3 + "',address4='" + address4
            + "',address5='" + address5 + "'," + "pincode1='" + pincode1 + "',pincode2='" + pincode2
            + "',pincode3='" + pincode3 + "',pincode4='" + pincode4 + "',pincode5='" + pincode5 + "',"
            + "phone1='" + phone1 + "',phone2='" + phone2 + "',phone3='" + phone3 + "',phone4='" + phone4
            + "',phone5='" + phone5 + "'," + "default_starterkit='" + starterkit_default
            + "',default_address='" + default_address + "',remark='" + remark + "' where case_id='"
            + Case_Id + "' ";
        pstmt01 = con.prepareStatement(query);
        System.out.println("pstmt01 :: " + pstmt01.toString());
        rowaffected1 = pstmt01.executeUpdate();
        if (rowaffected1 > 0) {
          con01 = LoginDAO.getConnectionDetails();
          st01 = con01.createStatement();
          query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('INISTRKIT','"
              + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')";
          st01.executeUpdate(query3);
        }

        out.println("<script type=\"text/javascript\">");
        out.println("alert('SUCCESSFULLY SAVED!');");
        out.println("location='Newcase1';");
        out.println("</script>");
      } else if (!case_stage.equals("CADBS") && !case_stage.equals("PRECOR")) {
        if (p_graph.equals("Yes") && starter_kit.equals("Yes") && s_shown.equals("Yes")
            && case_stage.equals("STG") && type_request.equals("New Case")) {
          query = " update cc_crm set address1=?,address2=?,address3=?,address4=?,address5=?,default_address=?,crm_name=?,Doctor_Name=?,Patient_Name=?,registered_doctor=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,dispatch_crpt=?,priority=?,type_request=?,p_graph=?,starter_kit=?,s_shown=?,ppf_fill=?,delivery_note_no=?,bclinic=?,badd=?,bgst_no=?,category=?,upper_aligner=?,lower_aligner=?,others=?,user_id=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),remark=?,default_starterkit=? where case_id=? ";
          pstmt2 = con.prepareStatement(query);
          pstmt2.setString(1, address1);
          pstmt2.setString(2, address2);
          pstmt2.setString(3, address3);
          pstmt2.setString(4, address4);
          pstmt2.setString(5, address5);
          pstmt2.setString(6, default_address);
          pstmt2.setString(7, crm);
          pstmt2.setString(8, c_doctor);
          pstmt2.setString(9, Patient_Name);
          pstmt2.setString(10, r_Doctor);
          pstmt2.setString(11, t_account);
          pstmt2.setString(12, corporate_account);
          pstmt2.setString(13, kol);
          pstmt2.setString(14, c_pkg);
          pstmt2.setString(15, dispatch_crpt);
          pstmt2.setInt(16, priority);
          pstmt2.setString(17, type_request);
          pstmt2.setString(18, p_graph);
          pstmt2.setString(19, starter_kit);
          pstmt2.setString(20, s_shown);
          pstmt2.setString(21, ppf_fill);
          pstmt2.setString(22, location);
          pstmt2.setString(23, delivery_note_no);
          pstmt2.setString(24, (String) list2.get(2));
          pstmt2.setString(25, (String) list2.get(3));
          pstmt2.setString(26, bgst_no);
          pstmt2.setString(27, category);
          pstmt2.setString(28, upper_aligner);
          pstmt2.setString(29, lower_aligner);
          pstmt2.setString(30, others);
          pstmt2.setString(31, userName);
          pstmt2.setString(32, Case_Id);
          pstmt2.setString(33, remark);
          pstmt2.setString(34, starterkit_default);
          rowaffected1 = pstmt2.executeUpdate();
          if (rowaffected1 > 0) {
            con33 = LoginDAO.getConnectionDetails();
            st33 = con33.createStatement();
            query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
                + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')";
            st33.executeUpdate(query3);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          }
        } else {
          if (case_stage.equals("INI")) {
            System.out.println("INI");
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,inicor_at=now(),plan_date=curdate(),plan_time=curtime(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else if (case_stage.equals("INICOR")) {
            System.out.println("INICOR");
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,inicor_at=now(),plan_date=curdate(),plan_time=curtime(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else if (case_stage.equals("WFC")) {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,wfc_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "'";
          } else if (case_stage.equals("WFCCOR")) {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,wfccor_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else if (case_stage.equals("STG")) {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,stg_at=now() ,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "'";
          } else if (case_stage.equals("QA")) {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?,Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,qa_at=now() ,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else if (case_stage.equals("MTP")) {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?,  Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,mpt_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else if (case_stage.equals("3DP")) {
            System.out.println("3DP");
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,3dp_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
          } else {
            query = " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=? ,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? where case_id='"
                + Case_Id + "' ";
            System.out.println("query else123 ... " + query);
          }

          if (case_stage.equals("PRE")) {
            pstmt1 = con.prepareStatement(
                "update cc_crm set scan=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,egistered_doctor=?,clinic_name=?,Doctor_Name=?,case_stage =?,phone=?, Patient_Name=?,remark=?,draft ='N',user_id=?,pre_at=now() where case_id='"
                    + Case_Id + "' ");
            pstmt1.setString(1, scan);
            pstmt1.setString(2, location1);
            pstmt1.setString(2, location2);
            pstmt1.setString(2, location3);
            pstmt1.setString(2, location4);
            pstmt1.setString(2, location5);
            pstmt1.setString(3, city1);
            pstmt1.setString(3, city2);
            pstmt1.setString(3, city3);
            pstmt1.setString(3, city4);
            pstmt1.setString(3, city5);
            pstmt1.setString(4, r_Doctor);
            pstmt1.setString(5, (String) list2.get(2));
            pstmt1.setString(7, c_doctor);
            pstmt1.setString(8, case_stage);
            pstmt1.setString(9, (String) list2.get(1));
            pstmt1.setString(10, Patient_Name);
            pstmt1.setString(11, remark);
            pstmt1.setString(12, userName);
          } else {
            pstmt1 = con.prepareStatement(query);
            pstmt1.setString(1, scan);
            pstmt1.setString(2, r_Doctor);
            pstmt1.setString(3, crm);
            pstmt1.setString(4, (String) list2.get(1));
            pstmt1.setString(5, p_graph);
            pstmt1.setString(6, starter_kit);
            pstmt1.setString(7, type_request);
            pstmt1.setString(8, s_shown);
            pstmt1.setString(9, ppf_fill);
            pstmt1.setString(10, t_account);
            pstmt1.setString(11, corporate_account);
            pstmt1.setString(12, kol);
            pstmt1.setString(13, c_pkg);
            pstmt1.setString(14, pkg_name);
            pstmt1.setString(15, dispatch_crpt);
            pstmt1.setString(16, dispatch_address);
            pstmt1.setString(17, bill_address);
            pstmt1.setString(18, c_doctor);
            pstmt1.setString(19, case_stage);
            pstmt1.setString(20, delivery_note_no);
            pstmt1.setString(21, (String) list2.get(2));
            pstmt1.setString(22, (String) list2.get(3));
            pstmt1.setString(23, bgst_no);
            pstmt1.setString(24, category);
            pstmt1.setString(25, upper_aligner);
            pstmt1.setString(26, lower_aligner);
            pstmt1.setString(27, others);
            pstmt1.setString(28, Patient_Name);
            pstmt1.setInt(29, priority);
            pstmt1.setString(30, remark);
            pstmt1.setString(31, userName);
            pstmt1.setDouble(32, total_amount);
            pstmt1.setString(33, payment_processing);
            pstmt1.setString(34, payment_mode);
            pstmt1.setString(35, location1);
            pstmt1.setString(36, location2);
            pstmt1.setString(37, location3);
            pstmt1.setString(38, location4);
            pstmt1.setString(39, location5);
            pstmt1.setString(40, city1);
            pstmt1.setString(41, city2);
            pstmt1.setString(42, city3);
            pstmt1.setString(43, city4);
            pstmt1.setString(44, city5);
            pstmt1.setString(45, address1);
            pstmt1.setString(46, address2);
            pstmt1.setString(47, address3);
            pstmt1.setString(48, address4);
            pstmt1.setString(49, address5);
            pstmt1.setString(50, pincode1);
            pstmt1.setString(51, pincode2);
            pstmt1.setString(52, pincode3);
            pstmt1.setString(53, pincode4);
            pstmt1.setString(54, pincode5);
            pstmt1.setString(55, phone1);
            pstmt1.setString(56, phone2);
            pstmt1.setString(57, phone3);
            pstmt1.setString(58, phone4);
            pstmt1.setString(59, phone5);
            pstmt1.setString(60, starterkit_default);
            pstmt1.setString(61, default_address);
            System.out.println("pstmt1 all::  " + pstmt1);
          }

          rowaffected1 = pstmt1.executeUpdate();
          if (rowaffected1 > 0) {
            con3 = LoginDAO.getConnectionDetails();
            st3 = con3.createStatement();
            query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
                + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName + "','"
                + Case_Id + "')";
            st3.executeUpdate(query3);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('NOT SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          }
        }
      } else {
        if (case_stage.equals("CADBS") && starter_kit.equals("Yes")) {
          query = " update cc_crm set case_stage='" + case_stage
              + "',starter_case_stage='INISTRKIT',inistrkit_at=now(),cadbs_at=now(),user_id='" + userName
              + "',crm_name='" + crm + "'," + "Doctor_Name='" + c_doctor + "',Patient_Name='"
              + Patient_Name + "',registered_doctor='" + r_Doctor + "',t_account='" + t_account
              + "',corporate_account='" + corporate_account + "',kol='" + kol + "',c_pkg='" + c_pkg
              + "',dispatch_crpt='" + dispatch_crpt + "',priority='" + priority + "',type_request='"
              + type_request + "',p_graph='" + p_graph + "',starter_kit='" + starter_kit + "',s_shown='"
              + s_shown + "',ppf_fill='" + ppf_fill + "',location='" + location1 + "',location2='"
              + location2 + "'," + "location3='" + location3 + "',location4='" + location4 + "'"
              + ",location5='" + location5 + "',city='" + city1 + "',city2='" + city2 + "',city3='"
              + city3 + "',city4='" + city4 + "',city5='" + city5 + "',address1='" + address1
              + "',address2='" + address2 + "',address3='" + address3 + "',address4='" + address4
              + "',address5='" + address5 + "'," + "pincode1='" + pincode1 + "',pincode2='" + pincode2
              + "',pincode3='" + pincode3 + "',pincode4='" + pincode4 + "',pincode5='" + pincode5 + "',"
              + "phone1='" + phone1 + "',phone2='" + phone2 + "',phone3='" + phone3 + "',phone4='"
              + phone4 + "',phone5='" + phone5 + "',remark='" + remark + "',default_starterkit='"
              + starterkit_default + "',default_address='" + default_address + "' where case_id='"
              + Case_Id + "' ";
          pstmt02 = con.prepareStatement(query);
          System.out.println("pstmt02 :: " + pstmt02.toString());
          rowaffected1 = pstmt02.executeUpdate();
          if (rowaffected1 > 0) {
            con3 = LoginDAO.getConnectionDetails();
            st3 = con3.createStatement();
            query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
                + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')";
            st3.executeUpdate(query3);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          }
        }

        if (case_stage.equals("PRECOR")) {
          query = " update cc_crm set case_stage='" + case_stage + "',user_id='" + userName
              + "',precor_at=now(),address1='" + address1 + "',address2='" + address2 + "',address3='"
              + address3 + "',address4='" + address4 + "',address5='" + address5 + "',default_address='"
              + default_address + "',crm_name='" + crm + "',Doctor_Name='" + c_doctor + "',Patient_Name='"
              + Patient_Name + "',registered_doctor='" + r_Doctor + "',t_account='" + t_account
              + "',corporate_account='" + corporate_account + "',kol='" + kol + "',c_pkg='" + c_pkg
              + "',dispatch_crpt='" + dispatch_crpt + "',priority='" + priority + "',type_request='"
              + type_request + "',p_graph='" + p_graph + "',starter_kit='" + starter_kit + "',s_shown='"
              + s_shown + "',ppf_fill='" + ppf_fill + "',location='" + location1 + "',location2='"
              + location2 + "'," + "location3='" + location3 + "',location4='" + location4 + "',"
              + "location5='" + location5 + "',city='" + city1 + "',city2='" + city2 + "',city3='" + city3
              + "',city4='" + city4 + "'," + "city5='" + city5 + "',address1='" + address1
              + "',address2='" + address2 + "',address3='" + address3 + "',address4='" + address4
              + "',address5='" + address5 + "'," + "pincode1='" + pincode1 + "',pincode2='" + pincode2
              + "',pincode3='" + pincode3 + "',pincode4='" + pincode4 + "',pincode5='" + pincode5 + "',"
              + "phone1='" + phone1 + "',phone2='" + phone2 + "',phone3='" + phone3 + "',phone4='"
              + phone4 + "',phone5='" + phone5 + "'," + "default_starterkit='" + starterkit_default
              + "',default_address='" + default_address + "',remark='" + remark + "' where case_id='"
              + Case_Id + "' ";
          pstmt03 = con.prepareStatement(query);
          System.out.println("pstmt03 :: " + pstmt03.toString());
          rowaffected1 = pstmt03.executeUpdate();
          if (rowaffected1 > 0) {
            con3 = LoginDAO.getConnectionDetails();
            st3 = con3.createStatement();
            query3 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
                + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName + "','"
                + Case_Id + "')";
            System.out.println("query4 :: " + query3);
            st3.executeUpdate(query3);
            System.out.println("st3 precor :: " + st3.toString());
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          }
        } else if (case_stage.equals("CADBS")) {
          if (type_request.equals("Next Batch Required")) {
            query = " update cc_crm set case_stage='CADBS',cadbs_at=now(),p_graph='" + p_graph
                + "',user_id='" + userName + "',address1='" + address1 + "',address2='" + address2
                + "',address3='" + address3 + "',address4='" + address4 + "',address5='" + address5
                + "',default_address='" + default_address + "',crm_name='" + crm + "',Doctor_Name='"
                + c_doctor + "',Patient_Name='" + Patient_Name + "',registered_doctor='" + r_Doctor
                + "',t_account='" + t_account + "',corporate_account='" + corporate_account + "',kol='"
                + kol + "',c_pkg='" + c_pkg + "',dispatch_crpt='" + dispatch_crpt + "',priority='"
                + priority + "',type_request='" + type_request + "',p_graph='" + p_graph
                + "',starter_kit='" + starter_kit + "',s_shown='" + s_shown + "',ppf_fill='" + ppf_fill
                + "',location='" + location1 + "',location2='" + location2 + "'," + "location3='"
                + location3 + "',location4='" + location4 + "',location5='" + location5 + "',"
                + "city='" + city1 + "',city2='" + city2 + "',city3='" + city3 + "',city4='" + city4
                + "'," + "city5='" + city5 + "',address1='" + address1 + "',address2='" + address2
                + "',address3='" + address3 + "',address4='" + address4 + "',address5='" + address5
                + "'," + "pincode1='" + pincode1 + "',pincode2='" + pincode2 + "',pincode3='" + pincode3
                + "',pincode4='" + pincode4 + "',pincode5='" + pincode5 + "'," + "phone1='" + phone1
                + "',phone2='" + phone2 + "',phone3='" + phone3 + "',phone4='" + phone4 + "',phone5='"
                + phone5 + "'," + "default_starterkit='" + starterkit_default + "',default_address='"
                + default_address + "',remark='" + remark + "' where case_id='" + Case_Id + "' ";
            System.out.println("query cadbs new case  :: " + query);
            pstmt04 = con.prepareStatement(query);
            System.out.println("pstmt04 :: " + pstmt04.toString());
            rowaffected1 = pstmt04.executeUpdate();
            System.out.println("rowaffected1 " + rowaffected1);
            if (rowaffected1 > 0) {
              System.out.println("pstmt04 >0 :: " + pstmt04);
              con32 = LoginDAO.getConnectionDetails();
              st32 = con32.createStatement();
              query32 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
                  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')";
              System.out.println("query32 ::::  : " + query32);
              st32.executeUpdate(query32);
            }

            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          } else if (ppf_fill.equals("Yes") && p_graph.equals("Yes") && scan.equals("Scan")) {
            query = " update cc_crm set case_stage='CADBS',cadbs_at=now(),address1='" + address1
                + "',address2='" + address2 + "',address3='" + address3 + "',address4='" + address4
                + "',address5='" + address5 + "',default_address='" + default_address + "',crm_name='"
                + crm + "',Doctor_Name='" + c_doctor + "',Patient_Name='" + Patient_Name
                + "',registered_doctor='" + r_Doctor + "',t_account='" + t_account
                + "',corporate_account='" + corporate_account + "',kol='" + kol + "',c_pkg='" + c_pkg
                + "',dispatch_crpt='" + dispatch_crpt + "',priority='" + priority + "',type_request='"
                + type_request + "',p_graph='" + p_graph + "',starter_kit='" + starter_kit
                + "',s_shown='" + s_shown + "',ppf_fill='" + ppf_fill + "',location='" + location1
                + "',location2='" + location2 + "'," + "location3='" + location3 + "',location4='"
                + location4 + "',location5='" + location4 + "',city='" + city1 + "',city2='" + city2
                + "',city3='" + city3 + "',city4='" + city4 + "'," + "city5='" + city5 + "',address1='"
                + address1 + "',address2='" + address2 + "',address3='" + address3 + "',address4='"
                + address4 + "',address5='" + address5 + "'," + "pincode1='" + pincode1 + "',pincode2='"
                + pincode2 + "',pincode3='" + pincode3 + "',pincode4='" + pincode4 + "',pincode5='"
                + pincode5 + "'," + "phone1='" + phone1 + "',phone2='" + phone2 + "',phone3='" + phone3
                + "',phone4='" + phone4 + "',phone5='" + phone5 + "'," + "default_starterkit='"
                + starterkit_default + "',default_address='" + default_address + "',remark='" + remark
                + "' where case_id='" + Case_Id + "' ";
            System.out.println("queryqueryqueryqueryquery  :: " + query);
            pstmt05 = con.prepareStatement(query);
            System.out.println("pstmt05 sssssssss :: " + pstmt05.toString());
            rowaffected1 = pstmt05.executeUpdate();
            if (rowaffected1 > 0) {
              con32 = LoginDAO.getConnectionDetails();
              st32 = con32.createStatement();
              query32 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
                  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')";
              st32.executeUpdate(query32);
              System.out.println("st32 :: " + st32.toString());
            }

            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          } else if (!ppf_fill.equals("Yes") && !p_graph.equals("Yes")
              && (scan.equals("Scan") || !starter_kit.equals("Yes")) && !starter_kit.equals("No")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('NOT SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          } else {
            query = " update cc_crm set case_stage='CADBS',cadbs_at=now(),address1='" + address1
                + "',address2='" + address2 + "',address3='" + address3 + "',address4='" + address4
                + "',address5='" + address5 + "',default_address='" + default_address + "',crm_name='"
                + crm + "',Doctor_Name='" + c_doctor + "',Patient_Name='" + Patient_Name
                + "',registered_doctor='" + r_Doctor + "',t_account='" + t_account
                + "',corporate_account='" + corporate_account + "',kol='" + kol + "',c_pkg='" + c_pkg
                + "',dispatch_crpt='" + dispatch_crpt + "',priority='" + priority + "',type_request='"
                + type_request + "',p_graph='" + p_graph + "',starter_kit='" + starter_kit
                + "',s_shown='" + s_shown + "',ppf_fill='" + ppf_fill + "',location='" + location1
                + "',location2='" + location2 + "'," + "location3='" + location3 + "',location4='"
                + location4 + "'" + ",location5='" + location4 + "',city='" + city1 + "',city2='"
                + city2 + "',city3='" + city3 + "',city4='" + city4 + "'," + "city5='" + city5
                + "',address1='" + address1 + "',address2='" + address2 + "',address3='" + address3
                + "',address4='" + address4 + "',address5='" + address5 + "'," + "pincode1='" + pincode1
                + "',pincode2='" + pincode2 + "',pincode3='" + pincode3 + "',pincode4='" + pincode4
                + "',pincode5='" + pincode5 + "'," + "phone1='" + phone1 + "',phone2='" + phone2
                + "',phone3='" + phone3 + "',phone4='" + phone4 + "',phone5='" + phone5 + "',"
                + "default_starterkit='" + starterkit_default + "',remark='" + remark
                + "' where case_id='" + Case_Id + "' ";
            pstmt06 = con.prepareStatement(query);
            System.out.println("pstmt06 :: " + pstmt06.toString());
            rowaffected1 = pstmt06.executeUpdate();
            System.out.println("pstmt06 rowaffected1 :: " + rowaffected1);
            if (rowaffected1 > 0) {
              System.out.println("pstmt06 >0 :: " + pstmt06);
              con32 = LoginDAO.getConnectionDetails();
              st32 = con32.createStatement();
              query32 = "INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
                  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')";
              System.out.println("st32 :: " + query32);
              st32.executeUpdate(query32);
              System.out.println("st32 :: " + st32.toString());
            }

            out.println("<script type=\"text/javascript\">");
            out.println("alert('SUCCESSFULLY SAVED!');");
            out.println("location='Newcase1';");
            out.println("</script>");
          }
        }
      }
    } catch (Exception var5666) {
      LOGGER.info("Error At EditCCSave=" + var5666.getMessage());
    } finally {
      if (st3 != null) {
        try {
          st3.close();
        } catch (Exception var5662) {
          System.out.println("pstmt1 ssss " + var5662.getMessage());
        } finally {
          st3 = null;
        }
      }

      if (st33 != null) {
        try {
          st33.close();
        } catch (Exception var5660) {
          System.out.println("st33 ssss " + var5660.getMessage());
        } finally {
          st33 = null;
        }
      }

      if (pstmt != null) {
        try {
          pstmt.close();
        } catch (Exception var5658) {
          System.out.println("pstmt ssss " + var5658.getMessage());
        } finally {
          pstmt = null;
        }
      }

      if (pstmt1 != null) {
        try {
          pstmt1.close();
        } catch (Exception var5656) {
          System.out.println("pstmt1 ssss " + var5656.getMessage());
        } finally {
          pstmt1 = null;
        }
      }

      if (pstmt2 != null) {
        try {
          pstmt2.close();
        } catch (Exception var5654) {
          System.out.println("1 :: " + var5654.getMessage());
        } finally {
          pstmt2 = null;
        }
      }

      if (pstmt01 != null) {
        try {
          pstmt01.close();
        } catch (Exception var5652) {
          System.out.println("2 :: " + var5652.getMessage());
        } finally {
          pstmt01 = null;
        }
      }

      if (pstmt02 != null) {
        try {
          pstmt02.close();
        } catch (Exception var5650) {
          System.out.println("3 :: " + var5650.getMessage());
        } finally {
          pstmt02 = null;
        }
      }

      if (pstmt03 != null) {
        try {
          pstmt03.close();
        } catch (Exception var5648) {
          System.out.println("4 :: " + var5648.getMessage());
        } finally {
          pstmt03 = null;
        }
      }

      if (pstmt04 != null) {
        try {
          pstmt04.close();
        } catch (Exception var5646) {
          System.out.println("pstmt04 5  :: " + var5646.getMessage());
        } finally {
          pstmt04 = null;
        }
      }

      if (pstmt05 != null) {
        try {
          pstmt05.close();
        } catch (Exception var5644) {
          System.out.println("6 :: " + var5644.getMessage());
        } finally {
          pstmt05 = null;
        }
      }

      if (pstmt06 != null) {
        try {
          pstmt06.close();
        } catch (Exception var5642) {
          System.out.println("7 :: " + var5642.getMessage());
        } finally {
          pstmt06 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var5640) {
          System.out.println("8 :: " + var5640.getMessage());
        } finally {
          con = null;
        }
      }

      if (con1 != null) {
        try {
          con1.close();
        } catch (Exception var5638) {
          System.out.println("9 :: " + var5638.getMessage());
        } finally {
          con1 = null;
        }
      }

      if (con2 != null) {
        try {
          con2.close();
        } catch (Exception var5636) {
          System.out.println("10 :: " + var5636.getMessage());
        } finally {
          con2 = null;
        }
      }

      if (con3 != null) {
        try {
          con3.close();
        } catch (Exception var5634) {
          System.out.println("11 :: " + var5634.getMessage());
        } finally {
          con3 = null;
        }
      }

      if (con33 != null) {
        try {
          con33.close();
        } catch (Exception var5632) {
          System.out.println("12 :: " + var5632.getMessage());
        } finally {
          con33 = null;
        }
      }

      if (con01 != null) {
        try {
          con01.close();
        } catch (Exception var5630) {
          System.out.println("13 :: " + var5630.getMessage());
        } finally {
          con01 = null;
        }
      }

      default_address = null;
      starterkit_default = null;
      batch5 = null;
      batch4 = null;
      batch3 = null;
      batch2 = null;
      batch1 = null;
      starterkit5 = null;
      starterkit4 = null;
      starterkit3 = null;
      starterkit2 = null;
      starterkit1 = null;
      location5 = null;
      location4 = null;
      location3 = null;
      location2 = null;
      location1 = null;
      city5 = null;
      city4 = null;
      city3 = null;
      city2 = null;
      city1 = null;
      phone5 = null;
      phone4 = null;
      phone3 = null;
      phone2 = null;
      phone1 = null;
      pincode5 = null;
      pincode4 = null;
      pincode3 = null;
      pincode2 = null;
      pincode1 = null;
      address5 = null;
      address4 = null;
      address3 = null;
      address2 = null;
      address1 = null;
      payment_mode = null;
      payment_processing = null;
      remark = null;
      Patient_Name = null;
      others = null;
      lower_aligner = null;
      upper_aligner = null;
      category = null;
      bgst_no = null;
      delivery_note_no = null;
      case_stage = null;
      c_doctor = null;
      bill_address = null;
      dispatch_address = null;
      dispatch_crpt = null;
      pkg_name = null;
      c_pkg = null;
      kol = null;
      corporate_account = null;
      t_account = null;
      ppf_fill = null;
      s_shown = null;
      type_request = null;
      starter_kit = null;
      p_graph = null;
      crm = null;
      r_Doctor = null;
      city = null;
      scan = null;
      out.flush();
      System.gc();
    }

  }
}
