//
//import com.workflow.connection.LoginDAO; 
//import java.io.IOException; 
//import java.io.PrintWriter;
//import java.sql.Connection; 
//import java.sql.PreparedStatement; 
//import java.sql.ResultSet;
//import java.sql.SQLException; 
//import java.sql.Statement; 
//import java.util.ArrayList;
//import java.util.Enumeration; 
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet; 
//import javax.servlet.http.HttpServletRequest; 
//import javax.servlet.http.HttpServletResponse; 
//import javax.servlet.http.HttpSession;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//
//  @WebServlet({"/EditCaseDetails"}) public class EditCaseDetailsBAK extends
// HttpServlet { static final Logger LOGGER =
// LogManager.getLogger(EditCaseDetailsBAK.class);
// 
// private static final long serialVersionUID = 1L;
// 
// protected void doGet(HttpServletRequest request, HttpServletResponse
//  response) throws ServletException, IOException {
// response.getWriter().append("Served at: ").append(request.getContextPath());
// }
//  
//  protected void doPost(HttpServletRequest request, HttpServletResponse
//  response) throws ServletException, IOException { 
//	  HttpSession session = request.getSession(false); 
//	  if (session.getAttribute("userid") == null || session.getAttribute("userid").equals(""))response.sendRedirect("login.jsp?msg=You are not logged in..!");
// 
//  PrintWriter out = response.getWriter(); 
//  Connection con20 = null,
//		     con19 = con20, 
//		     con18 = con19, 
//		     con17 = con18, 
//		     con16 = con17, 
//		     con15 = con16,
//		     con14 = con15, 
//		     con13 = con14, 
//		     con12 = con13, 
//		     con11 = con12, 
//		     con10 = con11, 
//		     con9 =  con10, 
//		     con8 = con9, 
//		     con7 = con8, 
//		     con6 = con7, 
//		     con5 = con6, 
//		     con4 = con5, 
//		     con3 = con4, 
//		     con2 = con3, 
//		     con1 = con2, 
//		     con = con1; 
//  Connection con020 = null,
//  con019 = con020, 
//  con018 = con019, 
//  con017 = con018, 
//  con016 = con017, 
//  con015 = con016, 
//  con014 = con015, 
//  con013 = con014, 
//  con012 = con013, 
//  con011 = con012,
//  con010 = con011,
//  con09 = con010,
//  con08 = con09, 
//  con07 = con08, 
//  con06 = con07,
//  con05 = con06, 
//  con04 = con05,
//  con03 = con04, 
//  con02 = con03, 
//  con01 = con02;
//  PreparedStatement pstmt20 = null, 
//		  pstmt19 = pstmt20, 
//		  pstmt18 = pstmt19,
//          pstmt17 = pstmt18, 
//          pstmt16 = pstmt17, 
//          pstmt15 = pstmt16,
//          pstmt14 = pstmt15,
//  pstmt13 = pstmt14, pstmt12 = pstmt13, pstmt11 = pstmt12, pstmt10 = pstmt11,
//  pstmt9 = pstmt10, pstmt8 = pstmt9, pstmt7 = pstmt8, pstmt6 = pstmt7, pstmt5 =
//  pstmt6, pstmt4 = pstmt5, pstmt3 = pstmt4, pstmt2 = pstmt3, pstmt1 = pstmt2,
//  pstmt = pstmt1; Statement stmt012 = null, stmt011 = stmt012, stmt20 =
//  stmt011, stmt19 = stmt20, stmt18 = stmt19, stmt17 = stmt18, stmt16 = stmt17,
//  stmt15 = stmt16, stmt14 = stmt15, stmt13 = stmt14, stmt12 = stmt13, stmt11 =
//  stmt12, stmt10 = stmt11, stmt9 = stmt10, stmt8 = stmt9, stmt7 = stmt8, stmt6
//  = stmt7, stmt5 = stmt6, stmt4 = stmt5, stmt3 = stmt4, stmt2 = stmt3, stmt1 =
//  stmt2; ResultSet rs16 = null, rs15 = rs16, rs14 = rs15, rs13 = rs14, rs12 =
//  rs13, rs11 = rs12, rs10 = rs11, rs9 = rs10, rs8 = rs9, rs7 = rs8, rs6 = rs7,
//  rs5 = rs6, rs4 = rs5, rs3 = rs4, rs2 = rs3, rs1 = rs2, rs = rs1; String
//  batch5 = "", batch4 = batch5, batch3 = batch4, batch2 = batch3, batch1 =
//  batch2, starterkit5 = batch1, starterkit4 = starterkit5, starterkit3 =
//  starterkit4, starterkit2 = starterkit3, starterkit1 = starterkit2, location5
//  = starterkit1, location4 = location5, location3 = location4, location2 =
//  location3, location1 = location2, city5 = location1, city4 = city5, city3 =
//  city4, city2 = city3, city1 = city2, phone5 = city1, phone4 = phone5, phone3
//  = phone4, phone2 = phone3, phone1 = phone2, pincode5 = phone1, pincode4 =
//  pincode5, pincode3 = pincode4, pincode2 = pincode3, pincode1 = pincode2,
//  address5 = pincode1, address4 = address5, address3 = address4, address2 =
//  address3, address1 = address2; String userName = address1, Case_Id =
//  userName, total = Case_Id, payment_mode = total, payment_processing =
//  payment_mode, remark = payment_processing, Patient_Name = remark, others =
//  Patient_Name, lower_aligner = others, upper_aligner = lower_aligner, category
//  = upper_aligner, bgst_no = category, delivery_note_no = bgst_no, case_stage =
//  delivery_note_no, c_doctor = case_stage, bill_address = c_doctor,
//  dispatch_address = bill_address, dispatch_crpt = dispatch_address, pkg_name =
//  dispatch_crpt, c_pkg = pkg_name, kol = c_pkg, corporate_account = kol,
//  t_account = corporate_account, ppf_fill = t_account, s_shown = ppf_fill,
//  type_request = s_shown, starter_kit = type_request, p_graph = starter_kit,
//  crm = p_graph, r_Doctor = crm, city = r_Doctor, location = city, scan =
//  location,patient_email,treating_dr_email; String default_address = ""; String
//  starterkit_default = default_address = "", dbpriority = starterkit_default,
//  query = dbpriority; int priority = 0, rowaffected = priority; double
//  total_amount = 0.0D; List<String> userRight =
//  LoginDAO.getRight((String)session.getAttribute("userid")); for (int i = 0; i
//  < userRight.size(); i++) total = (request.getParameter("total_amount") ==
//  null) ? "0.0" : request.getParameter("total_amount").trim(); if
//  (!total.isEmpty()) total_amount = Double.parseDouble(total); Case_Id =
//  (request.getParameter("case_id") == null) ? "" :
//  request.getParameter("case_id").trim(); userName =
//  (String)session.getAttribute("userid"); scan = (request.getParameter("scan")
//  == null) ? "" : request.getParameter("scan"); r_Doctor =
//  (request.getParameter("r_Doctor") == null) ? "" :
//  request.getParameter("r_Doctor").trim(); crm = (request.getParameter("crm")
//  == null) ? "" : request.getParameter("crm"); p_graph =
//  (request.getParameter("Photograph") == null) ? "" :
//  request.getParameter("Photograph"); starter_kit =
//  (request.getParameter("SKit") == null) ? "" : request.getParameter("SKit");
//  type_request = (request.getParameter("TRequest") == null) ? "" :
//  request.getParameter("TRequest"); s_shown = (request.getParameter("Shown") ==
//  null) ? "" : request.getParameter("Shown"); ppf_fill =
//  (request.getParameter("PPF") == null) ? "" : request.getParameter("PPF");
//  t_account = (request.getParameter("t_account") == null) ? "" :
//  request.getParameter("t_account"); corporate_account =
//  (request.getParameter("corporate_account") == null) ? "" :
//  request.getParameter("corporate_account"); kol = (request.getParameter("kol")
//  == null) ? "" : request.getParameter("kol"); c_pkg =
//  (request.getParameter("c_pkg") == null) ? "" :
//  request.getParameter("c_pkg").trim(); pkg_name =
//  (request.getParameter("pkg_name") == null) ? "" :
//  request.getParameter("pkg_name").trim(); dispatch_crpt =
//  (request.getParameter("dispatch_crpt") == null) ? "" :
//  request.getParameter("dispatch_crpt").trim(); dispatch_address =
//  (request.getParameter("dispatch_address") == null) ? "" :
//  request.getParameter("dispatch_address").trim(); bill_address =
//  (request.getParameter("bill_address") == null) ? "" :
//  request.getParameter("bill_address").trim(); c_doctor =
//  (request.getParameter("c_doctor") == null) ? "" :
//  request.getParameter("c_doctor").trim(); delivery_note_no =
//  (request.getParameter("delivery_note_no") == null) ? "" :
//  request.getParameter("delivery_note_no").trim(); bgst_no =
//  (request.getParameter("bgst_no") == null) ? "" :
//  request.getParameter("bgst_no").trim(); category =
//  (request.getParameter("category") == null) ? "" :
//  request.getParameter("category").trim(); upper_aligner =
//  (request.getParameter("upper_aligner") == null) ? "" :
//  request.getParameter("upper_aligner").trim(); lower_aligner =
//  (request.getParameter("lower_aligner") == null) ? "" :
//  request.getParameter("lower_aligner").trim(); others =
//  (request.getParameter("others") == null) ? "" :
//  request.getParameter("others").trim(); Patient_Name =
//  (request.getParameter("Patient_Name") == null) ? "" :
//  request.getParameter("Patient_Name").trim(); case_stage =
//  (request.getParameter("stage") == null) ? "" : request.getParameter("stage");
//  remark = (request.getParameter("remark") == null) ? "" :
//  request.getParameter("remark").trim(); address1 =
//  (request.getParameter("address1") == null) ? "" :
//  request.getParameter("address1").trim(); address2 =
//  (request.getParameter("address2") == null) ? "" :
//  request.getParameter("address2").trim(); address3 =
//  (request.getParameter("address3") == null) ? "" :
//  request.getParameter("address3").trim(); address4 =
//  (request.getParameter("address4") == null) ? "" :
//  request.getParameter("address4").trim(); address5 =
//  (request.getParameter("address5") == null) ? "" :
//  request.getParameter("address5").trim(); pincode1 =
//  (request.getParameter("pincode1") == null) ? "" :
//  request.getParameter("pincode1").trim(); pincode2 =
//  (request.getParameter("pincode2") == null) ? "" :
//  request.getParameter("pincode2").trim(); pincode3 =
//  (request.getParameter("pincode3") == null) ? "" :
//  request.getParameter("pincode3").trim(); pincode4 =
//  (request.getParameter("pincode4") == null) ? "" :
//  request.getParameter("pincode4").trim(); pincode5 =
//  (request.getParameter("pincode5") == null) ? "" :
//  request.getParameter("pincode5").trim(); phone1 =
//  (request.getParameter("phone1") == null) ? "" :
//  request.getParameter("phone1").trim(); phone2 =
//  (request.getParameter("phone2") == null) ? "" :
//  request.getParameter("phone2").trim(); phone3 =
//  (request.getParameter("phone3") == null) ? "" :
//  request.getParameter("phone3").trim(); phone4 =
//  (request.getParameter("phone4") == null) ? "" :
//  request.getParameter("phone4").trim(); phone5 =
//  (request.getParameter("phone5") == null) ? "" :
//  request.getParameter("phone5").trim(); city1 = (request.getParameter("city1")
//  == null) ? "" : request.getParameter("city1").trim(); city2 =
//  (request.getParameter("city2") == null) ? "" :
//  request.getParameter("city2").trim(); city3 = (request.getParameter("city3")
//  == null) ? "" : request.getParameter("city3").trim(); city4 =
//  (request.getParameter("city4") == null) ? "" :
//  request.getParameter("city4").trim(); city5 = (request.getParameter("city5")
//  == null) ? "" : request.getParameter("city5").trim(); location1 =
//  (request.getParameter("location1") == null) ? "" :
//  request.getParameter("location1").trim(); location2 =
//  (request.getParameter("location2") == null) ? "" :
//  request.getParameter("location2").trim(); location3 =
//  (request.getParameter("location3") == null) ? "" :
//  request.getParameter("location3").trim(); location4 =
//  (request.getParameter("location4") == null) ? "" :
//  request.getParameter("location4").trim(); location5 =
//  (request.getParameter("location5") == null) ? "" :
//  request.getParameter("location5").trim(); starterkit1 =
//  (request.getParameter("starterkit1") == null) ? "" :
//  request.getParameter("starterkit1"); starterkit2 =
//  (request.getParameter("starterkit2") == null) ? "" :
//  request.getParameter("starterkit2"); starterkit3 =
//  (request.getParameter("starterkit3") == null) ? "" :
//  request.getParameter("starterkit3"); starterkit4 =
//  (request.getParameter("starterkit4") == null) ? "" :
//  request.getParameter("starterkit4"); starterkit5 =
//  (request.getParameter("starterkit5") == null) ? "" :
//  request.getParameter("starterkit5"); batch1 = (request.getParameter("batch1")
//  == null) ? "" : request.getParameter("batch1"); batch2 =
//  (request.getParameter("batch2") == null) ? "" :
//  request.getParameter("batch2"); batch3 = (request.getParameter("batch3") ==
//  null) ? "" : request.getParameter("batch3"); batch4 =
//  (request.getParameter("batch4") == null) ? "" :
//  request.getParameter("batch4"); batch5 = (request.getParameter("batch5") ==
//  null) ? "" : request.getParameter("batch5");
//  
//  treating_dr_email = (request.getParameter("treating_dr_email") == null) ? "" : request.getParameter("treating_dr_email").trim();
//  //https://https://32watts.atlassian.net/browse/ESPLWS-2
//  patient_email =
//  (request.getParameter("patient_email") == null) ? "" :
//  request.getParameter("patient_email").trim();
//  //https:32watts.atlassian.net/browse/ESPLWS-3
//  
//  if (batch1.equals("1")) default_address = batch1; if (batch2.equals("2"))
//  default_address = batch2; if (batch3.equals("3")) default_address = batch3;
//  if (batch4.equals("4")) default_address = batch4; if (batch5.equals("5"))
//  default_address = batch5; if (starterkit1.equals("1")) starterkit_default =
//  starterkit1; if (starterkit2.equals("2")) starterkit_default = starterkit2;
//  if (starterkit3.equals("3")) starterkit_default = starterkit3; if
//  (starterkit4.equals("4")) starterkit_default = starterkit4; if
//  (starterkit5.equals("5")) starterkit_default = starterkit5; if
//  (case_stage.equals("")) case_stage = "INI"; if
//  (request.getParameter("total_amount") == null) total_amount = 0.0D;
//  payment_processing = (request.getParameter("payment_processing") == null) ?
//  "" : request.getParameter("payment_processing"); payment_mode =
//  (request.getParameter("payment_mode") == null) ? "" :
//  request.getParameter("payment_mode"); String phoneNumber = ""; String
//  clinicName = ""; String buyersAddress = ""; String buyersClinicName = "";
//  Enumeration<String> list = request.getParameterNames(); while
//  (list.hasMoreElements()) { String paramName = list.nextElement(); if
//  (paramName.contains("pno")) { String[] paramValues =
//  request.getParameterValues(paramName); String value = paramValues[0]; if
//  (value != null && value != "") phoneNumber =
//  String.valueOf(String.valueOf(phoneNumber)) + value + "#"; continue; } if
//  (paramName.contains("cni")) { String[] paramValues =
//  request.getParameterValues(paramName); String value = paramValues[0]; if
//  (value != null && value != "") clinicName =
//  String.valueOf(String.valueOf(clinicName)) + value + "#"; continue; } if
//  (paramName.contains("bcn")) { String[] paramValues =
//  request.getParameterValues(paramName); String value = paramValues[0]; if
//  (value != null && value != "") buyersClinicName =
//  String.valueOf(String.valueOf(buyersClinicName)) + value + "#"; continue; }
//  if (paramName.contains("badd")) { String[] paramValues =
//  request.getParameterValues(paramName); String value = paramValues[0]; if
//  (value != null && value != "") buyersAddress =
//  String.valueOf(String.valueOf(buyersAddress)) + value + "#"; } }
//  ArrayList<String> list2 = new ArrayList<>(); list2.add(phoneNumber);
//  list2.add(clinicName); list2.add(buyersClinicName); list2.add(buyersAddress);
//  for (int j = 0; j < list2.size(); j++) { if (((String)list2.get(j)).length()
//  > 0) { String str = ((String)list2.get(j)).substring(0,
//  ((String)list2.get(j)).length() - 1); list2.set(j, str); } } try { con =
//  LoginDAO.getConnectionDetails(); con1 = LoginDAO.getConnectionDetails(); con2
//  = LoginDAO.getConnectionDetails(); con3 = LoginDAO.getConnectionDetails();
//  con4 = LoginDAO.getConnectionDetails(); con5 =
//  LoginDAO.getConnectionDetails(); con6 = LoginDAO.getConnectionDetails(); con7
//  = LoginDAO.getConnectionDetails(); con8 = LoginDAO.getConnectionDetails();
//  con9 = LoginDAO.getConnectionDetails(); con10 =
//  LoginDAO.getConnectionDetails(); con11 = LoginDAO.getConnectionDetails();
//  con12 = LoginDAO.getConnectionDetails(); con13 =
//  LoginDAO.getConnectionDetails(); con14 = LoginDAO.getConnectionDetails();
//  con15 = LoginDAO.getConnectionDetails(); con16 =
//  LoginDAO.getConnectionDetails(); con17 = LoginDAO.getConnectionDetails();
//  con18 = LoginDAO.getConnectionDetails(); con19 =
//  LoginDAO.getConnectionDetails(); con20 = LoginDAO.getConnectionDetails();
//  con01 = LoginDAO.getConnectionDetails(); con02 =
//  LoginDAO.getConnectionDetails(); con03 = LoginDAO.getConnectionDetails();
//  con04 = LoginDAO.getConnectionDetails(); con05 =
//  LoginDAO.getConnectionDetails(); con06 = LoginDAO.getConnectionDetails();
//  con07 = LoginDAO.getConnectionDetails(); con08 =
//  LoginDAO.getConnectionDetails(); con09 = LoginDAO.getConnectionDetails();
//  con010 = LoginDAO.getConnectionDetails(); con011 =
//  LoginDAO.getConnectionDetails(); con012 = LoginDAO.getConnectionDetails();
//  con013 = LoginDAO.getConnectionDetails(); con014 =
//  LoginDAO.getConnectionDetails(); con015 = LoginDAO.getConnectionDetails();
//  con016 = LoginDAO.getConnectionDetails(); con017 =
//  LoginDAO.getConnectionDetails(); con018 = LoginDAO.getConnectionDetails();
//  con019 = LoginDAO.getConnectionDetails(); con020 =
//  LoginDAO.getConnectionDetails(); stmt1 = con01.createStatement(); stmt2 =
//  con02.createStatement(); stmt3 = con03.createStatement(); stmt4 =
//  con04.createStatement(); stmt5 = con05.createStatement(); stmt6 =
//  con06.createStatement(); stmt7 = con07.createStatement(); stmt8 =
//  con08.createStatement(); stmt9 = con09.createStatement(); stmt10 =
//  con010.createStatement(); stmt11 = con011.createStatement(); stmt12 =
//  con012.createStatement(); stmt13 = con013.createStatement(); stmt14 =
//  con014.createStatement(); stmt15 = con015.createStatement(); stmt16 =
//  con016.createStatement(); stmt17 = con017.createStatement(); stmt18 =
//  con018.createStatement(); stmt19 = con019.createStatement(); stmt20 =
//  con020.createStatement(); stmt011 = con011.createStatement(); stmt012 =
//  con012.createStatement(); String dbcorporate_account = ""; pstmt = con.
//  prepareStatement("select priority,corporate_account from cc_crm where case_id='"
//  + Case_Id + "' "); rs = pstmt.executeQuery(); if (rs.next()) { dbpriority =
//  rs.getString("priority"); dbcorporate_account =
//  rs.getString("corporate_account"); } if (userRight.contains("CADBS")) {
//  priority = Integer.parseInt(dbpriority); corporate_account =
//  dbcorporate_account; } else { priority =
//  Integer.parseInt((request.getParameter("priority") == null) ? "0" :
//  request.getParameter("priority")); } if (case_stage.equals("Y")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,plan_date=curdate(),plan_time=curtime(),patient_email=?,treating_dr_email=? where case_id='"
//  + Case_Id + "' "; pstmt1 = con1.prepareStatement(query); pstmt1.setString(1,
//  scan); pstmt1.setString(2, r_Doctor); pstmt1.setString(3, crm);
//  pstmt1.setString(4, list2.get(1)); pstmt1.setString(5, p_graph);
//  pstmt1.setString(6, starter_kit); pstmt1.setString(7, type_request);
//  pstmt1.setString(8, s_shown); pstmt1.setString(9, ppf_fill);
//  pstmt1.setString(10, t_account); pstmt1.setString(11, corporate_account);
//  pstmt1.setString(12, kol); pstmt1.setString(13, c_pkg); pstmt1.setString(14,
//  pkg_name); pstmt1.setString(15, dispatch_crpt); pstmt1.setString(16,
//  dispatch_address); pstmt1.setString(17, bill_address); pstmt1.setString(18,
//  c_doctor); pstmt1.setString(19, delivery_note_no); pstmt1.setString(20,
//  list2.get(2)); pstmt1.setString(21, list2.get(3)); pstmt1.setString(22,
//  bgst_no); pstmt1.setString(23, category); pstmt1.setString(24,
//  upper_aligner); pstmt1.setString(25, lower_aligner); pstmt1.setString(26,
//  others); pstmt1.setString(27, Patient_Name); pstmt1.setInt(28, priority);
//  pstmt1.setString(29, remark); pstmt1.setString(30, userName);
//  pstmt1.setDouble(31, total_amount); pstmt1.setString(32, payment_processing);
//  pstmt1.setString(33, payment_mode); pstmt1.setString(34, address1);
//  pstmt1.setString(35, address2); pstmt1.setString(36, address3);
//  pstmt1.setString(37, address4); pstmt1.setString(38, address5);
//  pstmt1.setString(39, location1); pstmt1.setString(40, location2);
//  pstmt1.setString(41, location3); pstmt1.setString(42, location4);
//  pstmt1.setString(43, location5); pstmt1.setString(44, city1);
//  pstmt1.setString(45, city2); pstmt1.setString(46, city3);
//  pstmt1.setString(47, city4); pstmt1.setString(48, city5);
//  pstmt1.setString(49, pincode1); pstmt1.setString(50, pincode2);
//  pstmt1.setString(51, pincode3); pstmt1.setString(52, pincode4);
//  pstmt1.setString(53, pincode5); pstmt1.setString(54, default_address);
//  pstmt1.setString(55, starterkit_default); pstmt1.setString(56, phone1);
//  pstmt1.setString(57, phone2); pstmt1.setString(58, phone3);
//  pstmt1.setString(59, phone4); pstmt1.setString(60, phone5);
//  pstmt1.setString(61, patient_email); pstmt1.setString(62, treating_dr_email);
//  rowaffected = pstmt1.executeUpdate();
//  System.out.println("pstmt1: "+pstmt1.toString()); if (rowaffected > 0) {
//  stmt1.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); LoginDAO.AddressLogs(address1, address2, address3,
//  address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (case_stage.equals("STG")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,case_stage=?,stg_at=now(),phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,patient_email=?,treating_dr_email=? where case_id='"
//  + Case_Id + "' "; pstmt2 = con2.prepareStatement(query); pstmt2.setString(1,
//  scan); pstmt2.setString(2, r_Doctor); pstmt2.setString(3, crm);
//  pstmt2.setString(4, list2.get(1)); pstmt2.setString(5, p_graph);
//  pstmt2.setString(6, starter_kit); pstmt2.setString(7, type_request);
//  pstmt2.setString(8, s_shown); pstmt2.setString(9, ppf_fill);
//  pstmt2.setString(10, t_account); pstmt2.setString(11, corporate_account);
//  pstmt2.setString(12, kol); pstmt2.setString(13, c_pkg); pstmt2.setString(14,
//  pkg_name); pstmt2.setString(15, dispatch_crpt); pstmt2.setString(16,
//  dispatch_address); pstmt2.setString(17, bill_address); pstmt2.setString(18,
//  c_doctor); pstmt2.setString(19, delivery_note_no); pstmt2.setString(20,
//  list2.get(2)); pstmt2.setString(21, list2.get(3)); pstmt2.setString(22,
//  bgst_no); pstmt2.setString(23, category); pstmt2.setString(24,
//  upper_aligner); pstmt2.setString(25, lower_aligner); pstmt2.setString(26,
//  others); pstmt2.setString(27, Patient_Name); pstmt2.setInt(28, priority);
//  pstmt2.setString(29, remark); pstmt2.setString(30, userName);
//  pstmt2.setDouble(31, total_amount); pstmt2.setString(32, payment_processing);
//  pstmt2.setString(33, payment_mode); pstmt2.setString(34, address1);
//  pstmt2.setString(35, address2); pstmt2.setString(36, address3);
//  pstmt2.setString(37, address4); pstmt2.setString(38, address5);
//  pstmt2.setString(39, location1); pstmt2.setString(40, location2);
//  pstmt2.setString(41, location3); pstmt2.setString(42, location4);
//  pstmt2.setString(43, location5); pstmt2.setString(44, city1);
//  pstmt2.setString(45, city2); pstmt2.setString(46, city3);
//  pstmt2.setString(47, city4); pstmt2.setString(48, city5);
//  pstmt2.setString(49, pincode1); pstmt2.setString(50, pincode2);
//  pstmt2.setString(51, pincode3); pstmt2.setString(52, pincode4);
//  pstmt2.setString(53, pincode5); pstmt2.setString(54, default_address);
//  pstmt2.setString(55, starterkit_default); pstmt2.setString(56, case_stage);
//  pstmt2.setString(57, phone1); pstmt2.setString(58, phone2);
//  pstmt2.setString(59, phone3); pstmt2.setString(60, phone4);
//  pstmt2.setString(61, phone5); pstmt2.setString(62, patient_email);
//  pstmt2.setString(63, treating_dr_email); rowaffected =
//  pstmt2.executeUpdate(); System.out.println("pstmt2: "+pstmt2.toString()); if
//  (rowaffected > 0) { stmt2.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); 
//  LoginDAO.AddressLogs(address1, address2, address3,address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">"); 
//  out.println("alert('" +Case_Id + " successfully sent to Hollow Tag Batch');");
//  out.println("location='Newcase1';"); 
//  out.println("</script>");
//  } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); }
//  } else if (case_stage.equals("STG") && starter_kit.equals("Yes") && type_request.equals("Rescan")) {
//  String strstatus = LoginDAO.strkitStatus(Long.valueOf( Case_Id));
//  System.out.println("Edit case details srtstatus: " + strstatus);
//  }else if(strstatus.equals("DPHSTRKIT") || strstatus==null) {
//	  query =" update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,"+
//  "t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?,"
//  +
//  " bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,"
//  +
//  "payment_processing=?,payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,"
//  +
//  "location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,"
//  +
//  "default_starterkit=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',"
//  + "patient_email=?,treating_dr_email=? where case_id='" +Case_Id + "' ";
//  }else { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,"
//  +
//  "t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?,"
//  +
//  " bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,"
//  +
//  "payment_processing=?,payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,"
//  +
//  "location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,"
//  + "default_starterkit=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?," +
//  "patient_email=?,treating_dr_email=? where case_id='" + Case_Id + "' ";
//  
//  }
//  
//  
//  pstmt14 = con14.prepareStatement(query); pstmt14.setString(1, scan);
//  pstmt14.setString(2, r_Doctor); pstmt14.setString(3, crm);
//  pstmt14.setString(4, list2.get(1)); pstmt14.setString(5, p_graph);
//  pstmt14.setString(6, starter_kit); pstmt14.setString(7, type_request);
//  pstmt14.setString(8, s_shown); pstmt14.setString(9, ppf_fill);
//  pstmt14.setString(10, t_account); pstmt14.setString(11, corporate_account);
//  pstmt14.setString(12, kol); pstmt14.setString(13, c_pkg);
//  pstmt14.setString(14, pkg_name); pstmt14.setString(15, dispatch_crpt);
//  pstmt14.setString(16, dispatch_address); pstmt14.setString(17, bill_address);
//  pstmt14.setString(18, c_doctor); pstmt14.setString(19, delivery_note_no);
//  pstmt14.setString(20, list2.get(2)); pstmt14.setString(21, list2.get(3));
//  pstmt14.setString(22, bgst_no); pstmt14.setString(23, category);
//  pstmt14.setString(24, upper_aligner); pstmt14.setString(25, lower_aligner);
//  pstmt14.setString(26, others); pstmt14.setString(27, Patient_Name);
//  pstmt14.setInt(28, priority); pstmt14.setString(29, remark);
//  pstmt14.setString(30, userName); pstmt14.setDouble(31, total_amount);
//  pstmt14.setString(32, payment_processing); pstmt14.setString(33,
//  payment_mode); pstmt14.setString(34, address1); pstmt14.setString(35,
//  address2); pstmt14.setString(36, address3); pstmt14.setString(37, address4);
//  pstmt14.setString(38, address5); pstmt14.setString(39, location1);
//  pstmt14.setString(40, location2); pstmt14.setString(41, location3);
//  pstmt14.setString(42, location4); pstmt14.setString(43, location5);
//  pstmt14.setString(44, city1); pstmt14.setString(45, city2);
//  pstmt14.setString(46, city3); pstmt14.setString(47, city4);
//  pstmt14.setString(48, city5); pstmt14.setString(49, pincode1);
//  pstmt14.setString(50, pincode2); pstmt14.setString(51, pincode3);
//  pstmt14.setString(52, pincode4); pstmt14.setString(53, pincode5);
//  pstmt14.setString(54, default_address); pstmt14.setString(55,
//  starterkit_default); pstmt14.setString(56, phone1); pstmt14.setString(57,
//  phone2); pstmt14.setString(58, phone3); pstmt14.setString(59, phone4);
//  pstmt14.setString(60, phone5); pstmt14.setString(61, patient_email);
//  pstmt14.setString(62, treating_dr_email); rowaffected =
//  pstmt14.executeUpdate(); System.out.println("pstmt14: "+pstmt14.toString());
//  if (rowaffected > 0) { stmt14.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName); //focus
//  
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Case successfully sent to Hollow Tag');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (case_stage.equals("INISTRKIT")) {
//  query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',patient_email=?,treating_dr_email=? where case_id='"
//  +
// 
//  Case_Id + "' "; //focus pstmt15 = con15.prepareStatement(query);
//  pstmt15.setString(1, scan); pstmt15.setString(2, r_Doctor);
//  pstmt15.setString(3, crm); pstmt15.setString(4, list2.get(1));
//  pstmt15.setString(5, p_graph); pstmt15.setString(6, starter_kit);
//  pstmt15.setString(7, type_request); pstmt15.setString(8, s_shown);
//  pstmt15.setString(9, ppf_fill); pstmt15.setString(10, t_account);
//  pstmt15.setString(11, corporate_account); pstmt15.setString(12, kol);
//  pstmt15.setString(13, c_pkg); pstmt15.setString(14, pkg_name);
//  pstmt15.setString(15, dispatch_crpt); pstmt15.setString(16,
//  dispatch_address); pstmt15.setString(17, bill_address); pstmt15.setString(18,
//  c_doctor); pstmt15.setString(19, delivery_note_no); pstmt15.setString(20,
//  list2.get(2)); pstmt15.setString(21, list2.get(3)); pstmt15.setString(22,
//  bgst_no); pstmt15.setString(23, category); pstmt15.setString(24,
//  upper_aligner); pstmt15.setString(25, lower_aligner); pstmt15.setString(26,
//  others); pstmt15.setString(27, Patient_Name); pstmt15.setInt(28, priority);
//  pstmt15.setString(29, remark); pstmt15.setString(30, userName);
//  pstmt15.setDouble(31, total_amount); pstmt15.setString(32,
//  payment_processing); pstmt15.setString(33, payment_mode);
//  pstmt15.setString(34, address1); pstmt15.setString(35, address2);
//  pstmt15.setString(36, address3); pstmt15.setString(37, address4);
//  pstmt15.setString(38, address5); pstmt15.setString(39, location1);
//  pstmt15.setString(40, location2); pstmt15.setString(41, location3);
//  pstmt15.setString(42, location4); pstmt15.setString(43, location5);
//  pstmt15.setString(44, city1); pstmt15.setString(45, city2);
//  pstmt15.setString(46, city3); pstmt15.setString(47, city4);
//  pstmt15.setString(48, city5); pstmt15.setString(49, pincode1);
//  pstmt15.setString(50, pincode2); pstmt15.setString(51, pincode3);
//  pstmt15.setString(52, pincode4); pstmt15.setString(53, pincode5);
//  pstmt15.setString(54, default_address); pstmt15.setString(55,
//  starterkit_default); pstmt15.setString(56, phone1); pstmt15.setString(57,
//  phone2); pstmt15.setString(58, phone3); pstmt15.setString(59, phone4);
//  pstmt15.setString(60, phone5); pstmt15.setString(61, patient_email);
//  pstmt15.setString(62, treating_dr_email); rowaffected =
//  pstmt15.executeUpdate(); System.out.println("pstmt15: "+pstmt15.toString());
//  if (rowaffected > 0) { stmt15.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">"); out.println("alert('" +
//  Case_Id + " successfully sent to Hollow Tag Starter kit');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Error Occured while sending to Hollow Tag!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } } else if
//  (case_stage.equals("STG")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?, phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,case_stage=?,stg_at=now(),holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +
//  
//  Case_Id + "' "; pstmt16 = con15.prepareStatement(query); pstmt16.setString(1,
//  scan); pstmt16.setString(2, r_Doctor); pstmt16.setString(3, crm);
//  pstmt16.setString(4, list2.get(1)); pstmt16.setString(5, p_graph);
//  pstmt16.setString(6, starter_kit); pstmt16.setString(7, type_request);
//  pstmt16.setString(8, s_shown); pstmt16.setString(9, ppf_fill);
//  pstmt16.setString(10, t_account); pstmt16.setString(11, corporate_account);
//  pstmt16.setString(12, kol); pstmt16.setString(13, c_pkg);
//  pstmt16.setString(14, pkg_name); pstmt16.setString(15, dispatch_crpt);
//  pstmt16.setString(16, dispatch_address); pstmt16.setString(17, bill_address);
//  pstmt16.setString(18, c_doctor); pstmt16.setString(19, delivery_note_no);
//  pstmt16.setString(20, list2.get(2)); pstmt16.setString(21, list2.get(3));
//  pstmt16.setString(22, bgst_no); pstmt16.setString(23, category);
//  pstmt16.setString(24, upper_aligner); pstmt16.setString(25, lower_aligner);
//  pstmt16.setString(26, others); pstmt16.setString(27, Patient_Name);
//  pstmt16.setInt(28, priority); pstmt16.setString(29, remark);
//  pstmt16.setString(30, userName); pstmt16.setDouble(31, total_amount);
//  pstmt16.setString(32, payment_processing); pstmt16.setString(33,
//  payment_mode); pstmt16.setString(34, address1); pstmt16.setString(35,
//  address2); pstmt16.setString(36, address3); pstmt16.setString(37, address4);
//  pstmt16.setString(38, address5); pstmt16.setString(39, location1);
//  pstmt16.setString(40, location2); pstmt16.setString(41, location3);
//  pstmt16.setString(42, location4); pstmt16.setString(43, location5);
//  pstmt16.setString(44, city1); pstmt16.setString(45, city2);
//  pstmt16.setString(46, city3); pstmt16.setString(47, city4);
//  pstmt16.setString(48, city5); pstmt16.setString(49, pincode1);
//  pstmt16.setString(50, pincode2); pstmt16.setString(51, pincode3);
//  pstmt16.setString(52, pincode4); pstmt16.setString(53, pincode5);
//  pstmt16.setString(54, default_address); pstmt16.setString(55,
//  starterkit_default); pstmt16.setString(56, phone1); pstmt16.setString(57,
//  phone2); pstmt16.setString(58, phone3); pstmt16.setString(59, phone4);
//  pstmt16.setString(60, phone5); pstmt16.setString(61, case_stage);
//  pstmt16.setString(62, patient_email); pstmt16.setString(63,
//  treating_dr_email); rowaffected = pstmt16.executeUpdate();
//  System.out.println("pstmt16: "+pstmt16.toString()); if (rowaffected > 0) {
//  stmt16.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); LoginDAO.AddressLogs(address1, address2, address3,
//  address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">"); out.println("alert('" +
//  Case_Id + " successfully sent to Hollow Tag Batch');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Error Occured while sending to Hollow Tag!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } } else if
//  (starter_kit.equalsIgnoreCase("No") &&
//  type_request.equalsIgnoreCase("Rescan") &&
//  case_stage.equalsIgnoreCase("WFC")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,"
//  +
//  "city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,phone4=?,"
//  +
//  "phone5=?,case_stage=?,cadbs_at=now(),patient_email=?,treating_dr_email=? where case_id='"
//  +
//  
//  Case_Id + "' "; pstmt10 = con10.prepareStatement(query); pstmt10.setString(1,
//  scan); pstmt10.setString(2, r_Doctor); pstmt10.setString(3, crm);
//  pstmt10.setString(4, list2.get(1)); pstmt10.setString(5, p_graph);
//  pstmt10.setString(6, starter_kit); pstmt10.setString(7, type_request);
//  pstmt10.setString(8, s_shown); pstmt10.setString(9, ppf_fill);
//  pstmt10.setString(10, t_account); pstmt10.setString(11, corporate_account);
//  pstmt10.setString(12, kol); pstmt10.setString(13, c_pkg);
//  pstmt10.setString(14, pkg_name); pstmt10.setString(15, dispatch_crpt);
//  pstmt10.setString(16, dispatch_address); pstmt10.setString(17, bill_address);
//  pstmt10.setString(18, c_doctor); pstmt10.setString(19, delivery_note_no);
//  pstmt10.setString(20, list2.get(2)); pstmt10.setString(21, list2.get(3));
//  pstmt10.setString(22, bgst_no); pstmt10.setString(23, category);
//  pstmt10.setString(24, upper_aligner); pstmt10.setString(25, lower_aligner);
//  pstmt10.setString(26, others); pstmt10.setString(27, Patient_Name);
//  pstmt10.setInt(28, priority); pstmt10.setString(29, remark);
//  pstmt10.setString(30, userName); pstmt10.setDouble(31, total_amount);
//  pstmt10.setString(32, payment_processing); pstmt10.setString(33,
//  payment_mode); pstmt10.setString(34, address1); pstmt10.setString(35,
//  address2); pstmt10.setString(36, address3); pstmt10.setString(37, address4);
//  pstmt10.setString(38, address5); pstmt10.setString(39, location1);
//  pstmt10.setString(40, location2); pstmt10.setString(41, location3);
//  pstmt10.setString(42, location4); pstmt10.setString(43, location5);
//  pstmt10.setString(44, city1); pstmt10.setString(45, city2);
//  pstmt10.setString(46, city3); pstmt10.setString(47, city4);
//  pstmt10.setString(48, city5); pstmt10.setString(49, pincode1);
//  pstmt10.setString(50, pincode2); pstmt10.setString(51, pincode3);
//  pstmt10.setString(52, pincode4); pstmt10.setString(53, pincode5);
//  pstmt10.setString(54, default_address); pstmt10.setString(55,
//  starterkit_default); pstmt10.setString(56, phone1); pstmt10.setString(57,
//  phone2); pstmt10.setString(58, phone3); pstmt10.setString(59, phone4);
//  pstmt10.setString(60, phone5); pstmt10.setString(61, case_stage);
//  pstmt10.setString(62, patient_email); pstmt10.setString(63,
//  treating_dr_email); rowaffected = pstmt10.executeUpdate();
//  System.out.println("pstmt10: "+pstmt10.toString()); if (rowaffected > 0) {
//  stmt10.
//  executeUpdate("INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); LoginDAO.AddressLogs(address1, address2, address3,
//  address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">"); out.
//  println("alert('Case successfully sent to Computer-Aided Design Baising Segmentation');"
//  ); out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (p_graph.equals("Yes") &&
//  starter_kit.equals("Yes") && s_shown.equals("Yes") && ppf_fill.equals("Yes")
//  && case_stage.equals("WFC") && type_request.equals("New Case")) { String
//  strstatus = LoginDAO.strkitStatus(Long.valueOf( Case_Id));
//  
//  if (strstatus!=null) {
//  
//  if(strstatus.equals("DPHSTRKIT")) {
//  
//  query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',holdflag='N',case_stage=?,wfc_at=now()"
//  + ",patient_email=?,treating_dr_email=? where case_id='" + Case_Id + "' ";
//  }else { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_satus='N',holdflag='N',case_stage=?,wfc_at=now()"
//  + ",patient_email=?,treating_dr_email=? where case_id='" +Case_Id + "' "; }
//  }else { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',holdflag='N',case_stage=?,wfc_at=now()"
//  + ",patient_email=?,treating_dr_email=? where case_id='" +Case_Id + "' "; }
//  //focus pstmt11 = con11.prepareStatement(query); pstmt11.setString(1, scan);
//  pstmt11.setString(2, r_Doctor); pstmt11.setString(3, crm);
//  pstmt11.setString(4, list2.get(1)); pstmt11.setString(5, p_graph);
//  pstmt11.setString(6, starter_kit); pstmt11.setString(7, type_request);
//  pstmt11.setString(8, s_shown); pstmt11.setString(9, ppf_fill);
//  pstmt11.setString(10, t_account); pstmt11.setString(11, corporate_account);
//  pstmt11.setString(12, kol); pstmt11.setString(13, c_pkg);
//  pstmt11.setString(14, pkg_name); pstmt11.setString(15, dispatch_crpt);
//  pstmt11.setString(16, dispatch_address); pstmt11.setString(17, bill_address);
//  pstmt11.setString(18, c_doctor); pstmt11.setString(19, delivery_note_no);
//  pstmt11.setString(20, list2.get(2)); pstmt11.setString(21, list2.get(3));
//  pstmt11.setString(22, bgst_no); pstmt11.setString(23, category);
//  pstmt11.setString(24, upper_aligner); pstmt11.setString(25, lower_aligner);
//  pstmt11.setString(26, others); pstmt11.setString(27, Patient_Name);
//  pstmt11.setInt(28, priority); pstmt11.setString(29, remark);
//  pstmt11.setString(30, userName); pstmt11.setDouble(31, total_amount);
//  pstmt11.setString(32, payment_processing); pstmt11.setString(33,
//  payment_mode); pstmt11.setString(34, address1); pstmt11.setString(35,
//  address2); pstmt11.setString(36, address3); pstmt11.setString(37, address4);
//  pstmt11.setString(38, address5); pstmt11.setString(39, location1);
//  pstmt11.setString(40, location2); pstmt11.setString(41, location3);
//  pstmt11.setString(42, location4); pstmt11.setString(43, location5);
//  pstmt11.setString(44, city1); pstmt11.setString(45, city2);
//  pstmt11.setString(46, city3); pstmt11.setString(47, city4);
//  pstmt11.setString(48, city5); pstmt11.setString(49, pincode1);
//  pstmt11.setString(50, pincode2); pstmt11.setString(51, pincode3);
//  pstmt11.setString(52, pincode4); pstmt11.setString(53, pincode5);
//  pstmt11.setString(54, default_address); pstmt11.setString(55,
//  starterkit_default); pstmt11.setString(56, phone1); pstmt11.setString(57,
//  phone2); pstmt11.setString(58, phone3); pstmt11.setString(59, phone4);
//  pstmt11.setString(60, phone5); pstmt11.setString(61, case_stage);
//  pstmt11.setString(62, patient_email); pstmt11.setString(63,
//  treating_dr_email); System.out.println("pstmt11: "+pstmt11.toString());
//  rowaffected = pstmt11.executeUpdate(); if (rowaffected > 0) { stmt11.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); stmt011.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Case successfully sent to CADBS and Hollow Tag');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (p_graph.equals("Yes") &&
//  starter_kit.equals("Yes") && s_shown.equals("Yes") && ppf_fill.equals("Yes")
//  && case_stage.equals("WFC") && type_request.equalsIgnoreCase("Rescan")) { //
//  query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//   +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//   +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//   +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//   +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',holdflag='N'case_stage=?,wfc_at=now()"
//  + ",patient_email=?,treating_dr_email=? where case_id='" + Case_Id + "' ";
//  
//  
// //focus pstmt12 = con12.prepareStatement(query); pstmt12.setString(1, scan);
//  pstmt12.setString(2, r_Doctor); pstmt12.setString(3, crm);
//  pstmt12.setString(4, list2.get(1)); pstmt12.setString(5, p_graph);
//  pstmt12.setString(6, starter_kit); pstmt12.setString(7, type_request);
//  pstmt12.setString(8, s_shown); pstmt12.setString(9, ppf_fill);
//  pstmt12.setString(10, t_account); pstmt12.setString(11, corporate_account);
//  pstmt12.setString(12, kol); pstmt12.setString(13, c_pkg);
//  pstmt12.setString(14, pkg_name); pstmt12.setString(15, dispatch_crpt);
//  pstmt12.setString(16, dispatch_address); pstmt12.setString(17, bill_address);
//  pstmt12.setString(18, c_doctor); pstmt12.setString(19, delivery_note_no);
//  pstmt12.setString(20, list2.get(2)); pstmt12.setString(21, list2.get(3));
//  pstmt12.setString(22, bgst_no); pstmt12.setString(23, category);
//  pstmt12.setString(24, upper_aligner); pstmt12.setString(25, lower_aligner);
//  pstmt12.setString(26, others); pstmt12.setString(27, Patient_Name);
//  pstmt12.setInt(28, priority); pstmt12.setString(29, remark);
//  pstmt12.setString(30, userName); pstmt12.setDouble(31, total_amount);
//  pstmt12.setString(32, payment_processing); pstmt12.setString(33,
//  payment_mode); pstmt12.setString(34, address1); pstmt12.setString(35,
//  address2); pstmt12.setString(36, address3); pstmt12.setString(37, address4);
//  pstmt12.setString(38, address5); pstmt12.setString(39, location1);
//  pstmt12.setString(40, location2); pstmt12.setString(41, location3);
//  pstmt12.setString(42, location4); pstmt12.setString(43, location5);
//  pstmt12.setString(44, city1); pstmt12.setString(45, city2);
//  pstmt12.setString(46, city3); pstmt12.setString(47, city4);
//  pstmt12.setString(48, city5); pstmt12.setString(49, pincode1);
//  pstmt12.setString(50, pincode2); pstmt12.setString(51, pincode3);
//  pstmt12.setString(52, pincode4); pstmt12.setString(53, pincode5);
//  pstmt12.setString(54, default_address); pstmt12.setString(55,
//  starterkit_default); pstmt12.setString(56, phone1); pstmt12.setString(57,
//  phone2); pstmt12.setString(58, phone3); pstmt12.setString(59, phone4);
//  pstmt12.setString(60, phone5); pstmt12.setString(61, case_stage);
//  pstmt12.setString(62, patient_email); pstmt12.setString(63,
//  treating_dr_email); rowaffected = pstmt12.executeUpdate();
//  System.out.println("pstmt12: "+pstmt12.toString());
//  
//  if (rowaffected > 0) { stmt12.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); stmt012.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Case Rescan successfully sent to CADBS and Hollow Tag');"
//  ); out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (case_stage.equals("CADBS") ||
//  case_stage.equals("PRECOR")) { if (case_stage.equals("CADBS") &&
//  starter_kit.equals("Yes")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?"
//  +
//  ",city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,phone4=?,"
//  +
//  "phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),cadbs_at=now(),starter_satus='N',holdflag='N'"
//  + ",patient_email=?,treating_dr_email=? where case_id='" +
//  
//  Case_Id + "' "; //focus pstmt3 = con3.prepareStatement(query);
//  pstmt3.setString(1, scan); pstmt3.setString(2, r_Doctor); pstmt3.setString(3,
//  crm); pstmt3.setString(4, list2.get(1)); pstmt3.setString(5, p_graph);
//  pstmt3.setString(6, starter_kit); pstmt3.setString(7, type_request);
//  pstmt3.setString(8, s_shown); pstmt3.setString(9, ppf_fill);
//  pstmt3.setString(10, t_account); pstmt3.setString(11, corporate_account);
//  pstmt3.setString(12, kol); pstmt3.setString(13, c_pkg); pstmt3.setString(14,
//  pkg_name); pstmt3.setString(15, dispatch_crpt); pstmt3.setString(16,
//  dispatch_address); pstmt3.setString(17, bill_address); pstmt3.setString(18,
//  c_doctor); pstmt3.setString(19, delivery_note_no); pstmt3.setString(20,
//  list2.get(2)); pstmt3.setString(21, list2.get(3)); pstmt3.setString(22,
//  bgst_no); pstmt3.setString(23, category); pstmt3.setString(24,
//  upper_aligner); pstmt3.setString(25, lower_aligner); pstmt3.setString(26,
//  others); pstmt3.setString(27, Patient_Name); pstmt3.setInt(28, priority);
//  pstmt3.setString(29, remark); pstmt3.setString(30, userName);
//  pstmt3.setDouble(31, total_amount); pstmt3.setString(32, payment_processing);
//  pstmt3.setString(33, payment_mode); pstmt3.setString(34, address1);
//  pstmt3.setString(35, address2); pstmt3.setString(36, address3);
//  pstmt3.setString(37, address4); pstmt3.setString(38, address5);
//  pstmt3.setString(39, location1); pstmt3.setString(40, location2);
//  pstmt3.setString(41, location3); pstmt3.setString(42, location4);
//  pstmt3.setString(43, location5); pstmt3.setString(44, city1);
//  pstmt3.setString(45, city2); pstmt3.setString(46, city3);
//  pstmt3.setString(47, city4); pstmt3.setString(48, city5);
//  pstmt3.setString(49, pincode1); pstmt3.setString(50, pincode2);
//  pstmt3.setString(51, pincode3); pstmt3.setString(52, pincode4);
//  pstmt3.setString(53, pincode5); pstmt3.setString(54, default_address);
//  pstmt3.setString(55, starterkit_default); pstmt3.setString(56, phone1);
//  pstmt3.setString(57, phone2); pstmt3.setString(58, phone3);
//  pstmt3.setString(59, phone4); pstmt3.setString(60, phone5);
//  pstmt3.setString(61, patient_email); pstmt3.setString(62, treating_dr_email);
//  rowaffected = pstmt3.executeUpdate();
//  System.out.println("pstmt3: "+pstmt3.toString());
//  
//  if (rowaffected > 0) { stmt2.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Case successfully send to Hollow Tag');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('Error Occured while Rescan sending to Hollow Tag');");
//  out.println("location='Newcase1';"); out.println("</script>"); } } if
//  (case_stage.equals("PRECOR")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,precor_at=now(),case_stage=?,patient_email=?,treating_dr_email=? where case_id='"
//  + Case_Id + "' "; pstmt4 = con4.prepareStatement(query); pstmt4.setString(1,
//  scan); pstmt4.setString(2, r_Doctor); pstmt4.setString(3, crm);
//  pstmt4.setString(4, list2.get(1)); pstmt4.setString(5, p_graph);
//  pstmt4.setString(6, starter_kit); pstmt4.setString(7, type_request);
//  pstmt4.setString(8, s_shown); pstmt4.setString(9, ppf_fill);
//  pstmt4.setString(10, t_account); pstmt4.setString(11, corporate_account);
//  pstmt4.setString(12, kol); pstmt4.setString(13, c_pkg); pstmt4.setString(14,
//  pkg_name); pstmt4.setString(15, dispatch_crpt); pstmt4.setString(16,
//  dispatch_address); pstmt4.setString(17, bill_address); pstmt4.setString(18,
//  c_doctor); pstmt4.setString(19, delivery_note_no); pstmt4.setString(20,
//  list2.get(2)); pstmt4.setString(21, list2.get(3)); pstmt4.setString(22,
//  bgst_no); pstmt4.setString(23, category); pstmt4.setString(24,
//  upper_aligner); pstmt4.setString(25, lower_aligner); pstmt4.setString(26,
//  others); pstmt4.setString(27, Patient_Name); pstmt4.setInt(28, priority);
//  pstmt4.setString(29, remark); pstmt4.setString(30, userName);
//  pstmt4.setDouble(31, total_amount); pstmt4.setString(32, payment_processing);
//  pstmt4.setString(33, payment_mode); pstmt4.setString(34, address1);
//  pstmt4.setString(35, address2); pstmt4.setString(36, address3);
//  pstmt4.setString(37, address4); pstmt4.setString(38, address5);
//  pstmt4.setString(39, location1); pstmt4.setString(40, location2);
//  pstmt4.setString(41, location3); pstmt4.setString(42, location4);
//  pstmt4.setString(43, location5); pstmt4.setString(44, city1);
//  pstmt4.setString(45, city2); pstmt4.setString(46, city3);
//  pstmt4.setString(47, city4); pstmt4.setString(48, city5);
//  pstmt4.setString(49, pincode1); pstmt4.setString(50, pincode2);
//  pstmt4.setString(51, pincode3); pstmt4.setString(52, pincode4);
//  pstmt4.setString(53, pincode5); pstmt4.setString(54, default_address);
//  pstmt4.setString(55, starterkit_default); pstmt4.setString(56, phone1);
//  pstmt4.setString(57, phone2); pstmt4.setString(58, phone3);
//  pstmt4.setString(59, phone4); pstmt4.setString(60, phone5);
//  pstmt4.setString(61, case_stage); pstmt4.setString(62, patient_email);
//  pstmt4.setString(63, treating_dr_email); rowaffected =
//  pstmt4.executeUpdate(); System.out.println("pstmt4: "+pstmt4.toString()); if
//  (rowaffected > 0) { stmt4.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid)values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); LoginDAO.AddressLogs(address1, address2, address3,
//  address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (case_stage.equals("CADBS")) { if
//  (type_request.equals("Next Batch Required")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,case_stage='CADBS',cadbs_at=now(),case_stage=?,holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +
//  
//  Case_Id + "' "; pstmt5 = con5.prepareStatement(query); pstmt5.setString(1,
//  scan); pstmt5.setString(2, r_Doctor); pstmt5.setString(3, crm);
//  pstmt5.setString(4, list2.get(1)); pstmt5.setString(5, p_graph);
//  pstmt5.setString(6, starter_kit); pstmt5.setString(7, type_request);
//  pstmt5.setString(8, s_shown); pstmt5.setString(9, ppf_fill);
//  pstmt5.setString(10, t_account); pstmt5.setString(11, corporate_account);
//  pstmt5.setString(12, kol); pstmt5.setString(13, c_pkg); pstmt5.setString(14,
//  pkg_name); pstmt5.setString(15, dispatch_crpt); pstmt5.setString(16,
//  dispatch_address); pstmt5.setString(17, bill_address); pstmt5.setString(18,
//  c_doctor); pstmt5.setString(19, delivery_note_no); pstmt5.setString(20,
//  list2.get(2)); pstmt5.setString(21, list2.get(3)); pstmt5.setString(22,
//  bgst_no); pstmt5.setString(23, category); pstmt5.setString(24,
//  upper_aligner); pstmt5.setString(25, lower_aligner); pstmt5.setString(26,
//  others); pstmt5.setString(27, Patient_Name); pstmt5.setInt(28, priority);
//  pstmt5.setString(29, remark); pstmt5.setString(30, userName);
//  pstmt5.setDouble(31, total_amount); pstmt5.setString(32, payment_processing);
//  pstmt5.setString(33, payment_mode); pstmt5.setString(34, address1);
//  pstmt5.setString(35, address2); pstmt5.setString(36, address3);
//  pstmt5.setString(37, address4); pstmt5.setString(38, address5);
//  pstmt5.setString(39, location1); pstmt5.setString(40, location2);
//  pstmt5.setString(41, location3); pstmt5.setString(42, location4);
//  pstmt5.setString(43, location5); pstmt5.setString(44, city1);
//  pstmt5.setString(45, city2); pstmt5.setString(46, city3);
//  pstmt5.setString(47, city4); pstmt5.setString(48, city5);
//  pstmt5.setString(49, pincode1); pstmt5.setString(50, pincode2);
//  pstmt5.setString(51, pincode3); pstmt5.setString(52, pincode4);
//  pstmt5.setString(53, pincode5); pstmt5.setString(54, default_address);
//  pstmt5.setString(55, starterkit_default); pstmt5.setString(56, phone1);
//  pstmt5.setString(57, phone2); pstmt5.setString(58, phone3);
//  pstmt5.setString(59, phone4); pstmt5.setString(60, phone5);
//  pstmt5.setString(61, case_stage); pstmt5.setString(62, patient_email);
//  pstmt5.setString(63, treating_dr_email); rowaffected =
//  pstmt5.executeUpdate(); System.out.println("pstmt5: "+pstmt5.toString()); if
//  (rowaffected > 0) { stmt5.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
//  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (ppf_fill.equals("Yes") &&
//  p_graph.equals("Yes") && scan.equals("Scan")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,case_stage='CADBS',cadbs_at=now(),case_stage=?,holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +
//  
//  Case_Id + "' "; pstmt6 = con6.prepareStatement(query); pstmt6.setString(1,
//  scan); pstmt6.setString(2, r_Doctor); pstmt6.setString(3, crm);
//  pstmt6.setString(4, list2.get(1)); pstmt6.setString(5, p_graph);
//  pstmt6.setString(6, starter_kit); pstmt6.setString(7, type_request);
//  pstmt6.setString(8, s_shown); pstmt6.setString(9, ppf_fill);
//  pstmt6.setString(10, t_account); pstmt6.setString(11, corporate_account);
//  pstmt6.setString(12, kol); pstmt6.setString(13, c_pkg); pstmt6.setString(14,
//  pkg_name); pstmt6.setString(15, dispatch_crpt); pstmt6.setString(16,
//  dispatch_address); pstmt6.setString(17, bill_address); pstmt6.setString(18,
//  c_doctor); pstmt6.setString(19, delivery_note_no); pstmt6.setString(20,
//  list2.get(2)); pstmt6.setString(21, list2.get(3)); pstmt6.setString(22,
//  bgst_no); pstmt6.setString(23, category); pstmt6.setString(24,
//  upper_aligner); pstmt6.setString(25, lower_aligner); pstmt6.setString(26,
//  others); pstmt6.setString(27, Patient_Name); pstmt6.setInt(28, priority);
//  pstmt6.setString(29, remark); pstmt6.setString(30, userName);
//  pstmt6.setDouble(31, total_amount); pstmt6.setString(32, payment_processing);
//  pstmt6.setString(33, payment_mode); pstmt6.setString(34, address1);
//  pstmt6.setString(35, address2); pstmt6.setString(36, address3);
//  pstmt6.setString(37, address4); pstmt6.setString(38, address5);
//  pstmt6.setString(39, location1); pstmt6.setString(40, location2);
//  pstmt6.setString(41, location3); pstmt6.setString(42, location4);
//  pstmt6.setString(43, location5); pstmt6.setString(44, city1);
//  pstmt6.setString(45, city2); pstmt6.setString(46, city3);
//  pstmt6.setString(47, city4); pstmt6.setString(48, city5);
//  pstmt6.setString(49, pincode1); pstmt6.setString(50, pincode2);
//  pstmt6.setString(51, pincode3); pstmt6.setString(52, pincode4);
//  pstmt6.setString(53, pincode5); pstmt6.setString(54, default_address);
//  pstmt6.setString(55, starterkit_default); pstmt6.setString(56, phone1);
//  pstmt6.setString(57, phone2); pstmt6.setString(58, phone3);
//  pstmt6.setString(59, phone4); pstmt6.setString(60, phone5);
//  pstmt6.setString(61, case_stage); pstmt6.setString(62, patient_email);
//  pstmt6.setString(63, treating_dr_email); rowaffected =
//  pstmt6.executeUpdate(); System.out.println("pstmt6: "+pstmt6.toString()); if
//  (rowaffected > 0) { stmt6.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
//  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (ppf_fill.equals("Yes") ||
//  p_graph.equals("Yes") || (!scan.equals("Scan") && starter_kit.equals("Yes"))
//  || starter_kit.equals("No")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,case_stage='CADBS',cadbs_at=now(),case_stage=?,holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  + Case_Id + "' "; pstmt7 = con7.prepareStatement(query); pstmt7.setString(1,
//  scan); pstmt7.setString(2, r_Doctor); pstmt7.setString(3, crm);
//  pstmt7.setString(4, list2.get(1)); pstmt7.setString(5, p_graph);
//  pstmt7.setString(6, starter_kit); pstmt7.setString(7, type_request);
//  pstmt7.setString(8, s_shown); pstmt7.setString(9, ppf_fill);
//  pstmt7.setString(10, t_account); pstmt7.setString(11, corporate_account);
//  pstmt7.setString(12, kol); pstmt7.setString(13, c_pkg); pstmt7.setString(14,
//  pkg_name); pstmt7.setString(15, dispatch_crpt); pstmt7.setString(16,
//  dispatch_address); pstmt7.setString(17, bill_address); pstmt7.setString(18,
//  c_doctor); pstmt7.setString(19, delivery_note_no); pstmt7.setString(20,
//  list2.get(2)); pstmt7.setString(21, list2.get(3)); pstmt7.setString(22,
//  bgst_no); pstmt7.setString(23, category); pstmt7.setString(24,
//  upper_aligner); pstmt7.setString(25, lower_aligner); pstmt7.setString(26,
//  others); pstmt7.setString(27, Patient_Name); pstmt7.setInt(28, priority);
//  pstmt7.setString(29, remark); pstmt7.setString(30, userName);
//  pstmt7.setDouble(31, total_amount); pstmt7.setString(32, payment_processing);
//  pstmt7.setString(33, payment_mode); pstmt7.setString(34, address1);
//  pstmt7.setString(35, address2); pstmt7.setString(36, address3);
//  pstmt7.setString(37, address4); pstmt7.setString(38, address5);
//  pstmt7.setString(39, location1); pstmt7.setString(40, location2);
//  pstmt7.setString(41, location3); pstmt7.setString(42, location4);
//  pstmt7.setString(43, location5); pstmt7.setString(44, city1);
//  pstmt7.setString(45, city2); pstmt7.setString(46, city3);
//  pstmt7.setString(47, city4); pstmt7.setString(48, city5);
//  pstmt7.setString(49, pincode1); pstmt7.setString(50, pincode2);
//  pstmt7.setString(51, pincode3); pstmt7.setString(52, pincode4);
//  pstmt7.setString(53, pincode5); pstmt7.setString(54, default_address);
//  pstmt7.setString(55, starterkit_default); pstmt7.setString(56, phone1);
//  pstmt7.setString(57, phone2); pstmt7.setString(58, phone3);
//  pstmt7.setString(59, phone4); pstmt7.setString(60, phone5);
//  pstmt7.setString(61, case_stage); pstmt7.setString(62, patient_email);
//  pstmt7.setString(63, treating_dr_email); rowaffected =
//  pstmt7.executeUpdate(); System.out.println("pstmt7: "+pstmt7.toString()); if
//  (rowaffected > 0) { stmt7.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('CADBS','"
//  + remark + "' ,now(),'CADBS','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } else if (p_graph.equals("Yes") &&
//  starter_kit.equals("Yes") && s_shown.equals("Yes") &&
//  case_stage.equals("STG") && type_request.equals("New Case")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,"
//  +
//  "corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,delivery_note_no=?, bclinic=?,badd=?,"
//  +
//  "bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,user_id=?,total_amount=?,payment_processing=?,"
//  +
//  "payment_mode=?,address1=?,address2=?,address3=?,address4=?,address5=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,"
//  +
//  "city3=?,city4=?,city5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,default_address=?,default_starterkit=?,phone1=?,phone2=?,phone3=?,"
//  +
//  "phone4=?,phone5=?,starter_case_stage='INISTRKIT',inistrkit_at=now(),starter_satus='N',case_stage=?,holdflag='N' "
//  + ",patient_email=?,treating_dr_email=? where case_id='" +Case_Id + "' ";
//  //focus pstmt8 = con8.prepareStatement(query); pstmt8.setString(1, scan);
//  pstmt8.setString(2, r_Doctor); pstmt8.setString(3, crm); pstmt8.setString(4,
//  list2.get(1)); pstmt8.setString(5, p_graph); pstmt8.setString(6,
//  starter_kit); pstmt8.setString(7, type_request); pstmt8.setString(8,
//  s_shown); pstmt8.setString(9, ppf_fill); pstmt8.setString(10, t_account);
//  pstmt8.setString(11, corporate_account); pstmt8.setString(12, kol);
//  pstmt8.setString(13, c_pkg); pstmt8.setString(14, pkg_name);
//  pstmt8.setString(15, dispatch_crpt); pstmt8.setString(16, dispatch_address);
//  pstmt8.setString(17, bill_address); pstmt8.setString(18, c_doctor);
//  pstmt8.setString(19, delivery_note_no); pstmt8.setString(20, list2.get(2));
//  pstmt8.setString(21, list2.get(3)); pstmt8.setString(22, bgst_no);
//  pstmt8.setString(23, category); pstmt8.setString(24, upper_aligner);
//  pstmt8.setString(25, lower_aligner); pstmt8.setString(26, others);
//  pstmt8.setString(27, Patient_Name); pstmt8.setInt(28, priority);
//  pstmt8.setString(29, remark); pstmt8.setString(30, userName);
//  pstmt8.setDouble(31, total_amount); pstmt8.setString(32, payment_processing);
//  pstmt8.setString(33, payment_mode); pstmt8.setString(34, address1);
//  pstmt8.setString(35, address2); pstmt8.setString(36, address3);
//  pstmt8.setString(37, address4); pstmt8.setString(38, address5);
//  pstmt8.setString(39, location1); pstmt8.setString(40, location2);
//  pstmt8.setString(41, location3); pstmt8.setString(42, location4);
//  pstmt8.setString(43, location5); pstmt8.setString(44, city1);
//  pstmt8.setString(45, city2); pstmt8.setString(46, city3);
//  pstmt8.setString(47, city4); pstmt8.setString(48, city5);
//  pstmt8.setString(49, pincode1); pstmt8.setString(50, pincode2);
//  pstmt8.setString(51, pincode3); pstmt8.setString(52, pincode4);
//  pstmt8.setString(53, pincode5); pstmt8.setString(54, default_address);
//  pstmt8.setString(55, starterkit_default); pstmt8.setString(56, phone1);
//  pstmt8.setString(57, phone2); pstmt8.setString(58, phone3);
//  pstmt8.setString(59, phone4); pstmt8.setString(60, phone5);
//  pstmt8.setString(61, case_stage); pstmt8.setString(62, patient_email);
//  pstmt8.setString(63, treating_dr_email); rowaffected =
//  pstmt8.executeUpdate(); System.out.println("pstmt8: "+pstmt8.toString()); if
//  (rowaffected > 0) { stmt8.
//  executeUpdate("INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('INISTRKIT','"
//  + remark + "' ,now(),'INISTRKIT','" + userName + "','" + Case_Id + "')");
//  LoginDAO.AddressLogs(address1, address2, address3, address4, address5,
//  Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } } } else if (case_stage.equals("INI")) { query
//  =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,inicor_at=now(),plan_date=curdate(),plan_time=curtime(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +
//  
//  Case_Id + "' "; } else if (case_stage.equals("INICOR")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,inicor_at=now(),plan_date=curdate(),plan_time=curtime(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? ,holdflag='N',patient_email=?,treating_dr_email=?  where case_id='"
//  +
//  
//  Case_Id + "' "; } else if (case_stage.equals("WFC")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,wfc_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? ,holdflag='N',patient_email=?,treating_dr_email=?  where case_id='"
//  +
//  
//  Case_Id + "'"; } else if (case_stage.equals("WFCCOR")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,wfccor_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=?  where case_id='"
//  +
//  
//  Case_Id + "' "; } else if (case_stage.equals("STG")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,stg_at=now() ,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=? ,holdflag='N',patient_email=?,treating_dr_email=?  where case_id='"
//  + Case_Id + "'"; } else if (case_stage.equals("QA")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?,Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,qa_at=now() ,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=?  where case_id='"
//  + Case_Id +"' "; } else if (case_stage.equals("MPT")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage =?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?,  Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,mpt_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +Case_Id + "' "; } else if (case_stage.equals("3DP")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage=?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,3dp_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +Case_Id + "' "; } else if (case_stage.equals("REJ")) { query =
//  " update cc_crm set scan=?,registered_doctor=?,crm_name=?,clinic_name=?,p_graph=?,starter_kit=?,type_request=?,s_shown=?,ppf_fill=?,t_account=?,corporate_account=?,kol=?,c_pkg=?,pkg_name=?,dispatch_crpt=?,dispatch_address=?, bill_address=?,Doctor_Name=?,case_stage=?,delivery_note_no=?, bclinic=?,badd=?,bgst_no=?, category=?,upper_aligner=?,lower_aligner=?,others=?, Patient_Name=?,priority=?,remark=?,draft ='N',user_id=?,total_amount=?,payment_processing=?,payment_mode=?,3dp_at=now(),location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,address1=?,address2=?,address3=?,address4=?,address5=?,pincode1=?,pincode2=?,pincode3=?,pincode4=?,pincode5=?,phone1=?,phone2=?,phone3=?,phone4=?,phone5=?,default_starterkit=?,default_address=?, holdflag='N',patient_email=?,treating_dr_email=? where case_id='"
//  +Case_Id + "' "; } if (case_stage.equals("PRE")) { pstmt13 = con.
//  prepareStatement("update cc_crm set scan=?,location=?,location2=?,location3=?,location4=?,location5=?,city=?,city2=?,city3=?,city4=?,city5=?,egistered_doctor=?,clinic_name=?,Doctor_Name=?,case_stage =?,phone=?, Patient_Name=?,remark=?,draft ='N',user_id=?,pre_at=now() where case_id='"
//  + Case_Id + "' "); pstmt13.setString(1, scan); pstmt13.setString(2,
//  location1); pstmt13.setString(2, location2); pstmt13.setString(2, location3);
//  pstmt13.setString(2, location4); pstmt13.setString(2, location5);
//  pstmt13.setString(3, city1); pstmt13.setString(3, city2);
//  pstmt13.setString(3, city3); pstmt13.setString(3, city4);
//  pstmt13.setString(3, city5); pstmt13.setString(4, r_Doctor);
//  pstmt13.setString(5, list2.get(2)); pstmt13.setString(7, c_doctor);
//  pstmt13.setString(8, case_stage); pstmt13.setString(9, list2.get(1));
//  pstmt13.setString(10, Patient_Name); pstmt13.setString(11, remark);
//  pstmt13.setString(12, userName); } else { pstmt13 =
//  con.prepareStatement(query); pstmt13.setString(1, scan); pstmt13.setString(2,
//  r_Doctor); pstmt13.setString(3, crm); pstmt13.setString(4, list2.get(1));
//  pstmt13.setString(5, p_graph); pstmt13.setString(6, starter_kit);
//  pstmt13.setString(7, type_request); pstmt13.setString(8, s_shown);
//  pstmt13.setString(9, ppf_fill); pstmt13.setString(10, t_account);
//  pstmt13.setString(11, corporate_account); pstmt13.setString(12, kol);
//  pstmt13.setString(13, c_pkg); pstmt13.setString(14, pkg_name);
//  pstmt13.setString(15, dispatch_crpt); pstmt13.setString(16,
//  dispatch_address); pstmt13.setString(17, bill_address); pstmt13.setString(18,
//  c_doctor); pstmt13.setString(19, case_stage); pstmt13.setString(20,
//  delivery_note_no); pstmt13.setString(21, list2.get(2)); pstmt13.setString(22,
//  list2.get(3)); pstmt13.setString(23, bgst_no); pstmt13.setString(24,
//  category); pstmt13.setString(25, upper_aligner); pstmt13.setString(26,
//  lower_aligner); pstmt13.setString(27, others); pstmt13.setString(28,
//  Patient_Name); pstmt13.setInt(29, priority); pstmt13.setString(30, remark);
//  pstmt13.setString(31, userName); pstmt13.setDouble(32, total_amount);
//  pstmt13.setString(33, payment_processing); pstmt13.setString(34,
//  payment_mode); pstmt13.setString(35, location1); pstmt13.setString(36,
//  location2); pstmt13.setString(37, location3); pstmt13.setString(38,
//  location4); pstmt13.setString(39, location5); pstmt13.setString(40, city1);
//  pstmt13.setString(41, city2); pstmt13.setString(42, city3);
//  pstmt13.setString(43, city4); pstmt13.setString(44, city5);
//  pstmt13.setString(45, address1); pstmt13.setString(46, address2);
//  pstmt13.setString(47, address3); pstmt13.setString(48, address4);
//  pstmt13.setString(49, address5); pstmt13.setString(50, pincode1);
//  pstmt13.setString(51, pincode2); pstmt13.setString(52, pincode3);
//  pstmt13.setString(53, pincode4); pstmt13.setString(54, pincode5);
//  pstmt13.setString(55, phone1); pstmt13.setString(56, phone2);
//  pstmt13.setString(57, phone3); pstmt13.setString(58, phone4);
//  pstmt13.setString(59, phone5); pstmt13.setString(60, starterkit_default);
//  pstmt13.setString(61, default_address); pstmt13.setString(62, patient_email);
//  pstmt13.setString(63, treating_dr_email); rowaffected =
//  pstmt13.executeUpdate(); System.out.println("pstmt13: "+pstmt13.toString());
//  if (rowaffected > 0) { stmt9.
//  executeUpdate("INSERT INTO decision_history(decision,Remarks,date_time,stage,UserId,caseid) values('"
//  + case_stage + "','" + remark + "' ,now(),'" + case_stage + "','" + userName
//  + "','" + Case_Id + "')"); LoginDAO.AddressLogs(address1, address2, address3,
//  address4, address5, Case_Id, remark, case_stage, userName);
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('SUCCESSFULLY SAVED!');");
//  out.println("location='Newcase1';"); out.println("</script>"); } else {
//  out.println("<script type=\"text/javascript\">");
//  out.println("alert('NOT SAVED!');"); out.println("location='Newcase1';");
//  out.println("</script>"); } } } catch (SQLException e) { e.getMessage();
//  LOGGER.info("Catch exception : " + e.getMessage()); } catch
//  (ClassNotFoundException e) { LOGGER.info("Catch exception : " +
//  e.getMessage()); } finally { scan = location = city = r_Doctor = crm =
//  p_graph = starter_kit = type_request = s_shown = ppf_fill = t_account =
//  corporate_account = kol = c_pkg = pkg_name = dispatch_crpt = dispatch_address
//  = bill_address = c_doctor = case_stage = delivery_note_no = bgst_no =
//  category = upper_aligner = lower_aligner = others = Patient_Name = remark =
//  payment_processing = payment_mode = total = Case_Id = userName = address1 =
//  address2 = address3 = address4 = address5 = pincode1 = pincode2 = pincode3 =
//  pincode4 = pincode5 = phone1 = phone2 = phone3 = phone4 = phone5 = city1 =
//  city2 = city3 = city4 = city5 = location1 = location2 = location3 = location4
//  = location5 = starterkit1 = starterkit2 = starterkit3 = starterkit4 =
//  starterkit5 = batch1 = batch2 = batch3 = batch4 = batch5 = ""; query =
//  dbpriority = starterkit_default = default_address = patient_email =
//  treating_dr_email = null; if (rs != null) try { rs.close(); } catch
//  (Exception exception) {
//  
//  } finally { rs = null; } if (stmt1 != null) try { stmt1.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt1 = null; } if (stmt2 != null) try { stmt2.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt2 = null; } if (stmt3 != null) try { stmt3.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt3 = null; } if (stmt4 != null) try { stmt4.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt4 = null; } if (stmt5 != null) try { stmt5.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt5 = null; } if (stmt6 != null) try { stmt6.close(); } catch
//  (Exception exception) {
// 
// } finally { stmt6 = null; } if (stmt7 != null) try { stmt7.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt7 = null; } if (stmt8 != null) try { stmt8.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt8 = null; } if (stmt9 != null) try { stmt9.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt9 = null; } if (stmt10 != null) try { stmt10.close(); } catch
//  (Exception exception) {
//  
//  } finally { stmt10 = null; } if (stmt11 != null) try { stmt11.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt11 = null; } if (stmt12 != null) try { stmt12.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt12 = null; } if (stmt13 != null) try { stmt13.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt13 = null; } if (stmt14 != null) try { stmt14.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt14 = null; } if (stmt15 != null) try { stmt15.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt15 = null; } if (stmt16 != null) try { stmt16.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt16 = null; } if (stmt17 != null) try { stmt17.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt17 = null; } if (stmt18 != null) try { stmt18.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt18 = null; } if (stmt19 != null) try { stmt19.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt19 = null; } if (stmt20 != null) try { stmt20.close(); }
//  catch (Exception exception) {
//  
//  } finally { stmt20 = null; } if (pstmt1 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt2 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt3 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt4 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt5 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt6 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt7 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt8 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt9 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt10 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt11 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt12 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt13 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt14 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt15 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt16 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt17 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt18 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt19 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (pstmt20 != null) try { pstmt.close(); } catch
//  (Exception exception) {
//  
//  } finally { pstmt = null; } if (con != null) try { con.close(); } catch
//  (Exception exception) {
//  
//  } finally { con = null; } if (con1 != null) try { con1.close(); } catch
//  (Exception exception) {
//  
//  } finally { con1 = null; } if (con2 != null) try { con2.close(); } catch
//  (Exception exception) {
//  
//  } finally { con2 = null; } if (con3 != null) try { con3.close(); } catch
//  (Exception exception) {
//  
//  } finally { con3 = null; } if (con4 != null) try { con4.close(); } catch
//  (Exception exception) {
//  
//  } finally { con4 = null; } if (con5 != null) try { con5.close(); } catch
//  (Exception exception) {
//  
//  } finally { con5 = null; } if (con6 != null) try { con6.close(); } catch
//  (Exception exception) {
//  
//  } finally { con6 = null; } if (con7 != null) try { con7.close(); } catch
//  (Exception exception) {
//  
//  } finally { con7 = null; } if (con8 != null) try { con8.close(); } catch
//  (Exception exception) {
//  
//  } finally { con8 = null; } if (con9 != null) try { con9.close(); } catch
//  (Exception exception) {
//  
// } finally { con9 = null; } if (con10 != null) try { con10.close(); } catch
//  (Exception exception) {
//  
//  } finally { con10 = null; } if (con11 != null) try { con11.close(); } catch
//  (Exception exception) {
//  
//  } finally { con11 = null; } if (con12 != null) try { con12.close(); } catch
//  (Exception exception) {
//  
//  } finally { con12 = null; } if (con13 != null) try { con13.close(); } catch
//  (Exception exception) {
//  
//  } finally { con13 = null; } if (con14 != null) try { con14.close(); } catch
//  (Exception exception) {
//  
//  } finally { con14 = null; } if (con15 != null) try { con15.close(); } catch
//  (Exception exception) {
//  
//  } finally { con15 = null; } if (con16 != null) try { con16.close(); } catch
//  (Exception exception) {
//  
//  } finally { con16 = null; } if (con17 != null) try { con17.close(); } catch
//  (Exception exception) {
//  
//  } finally { con17 = null; } if (con18 != null) try { con18.close(); } catch
//  (Exception exception) {
//  
//  } finally { con18 = null; } if (con19 != null) try { con19.close(); } catch
//  (Exception exception) {
//  
//  } finally { con19 = null; } if (con20 != null) try { con20.close(); } catch
//  (Exception exception) {
//  
//  } finally { con20 = null; } if (con01 != null) try { con01.close(); } catch
//  (Exception exception) {
//  
//  } finally { con01 = null; } if (con02 != null) try { con02.close(); } catch
//  (Exception exception) {
//  
//  } finally { con02 = null; } if (con03 != null) try { con03.close(); } catch
//  (Exception exception) {
//  
//  } finally { con03 = null; } if (con04 != null) try { con04.close(); } catch
//  (Exception exception) {
//  
//  } finally { con04 = null; } if (con05 != null) try { con05.close(); } catch
//  (Exception exception) {
//  
//  } finally { con05 = null; } if (con06 != null) try { con06.close(); } catch
//  (Exception exception) {
//  
//  } finally { con06 = null; } if (con07 != null) try { con07.close(); } catch
//  (Exception exception) {
//  
//  } finally { con07 = null; } if (con08 != null) try { con08.close(); } catch
//  (Exception exception) {
//  
//  } finally { con08 = null; } if (con09 != null) try { con09.close(); } catch
//  (Exception exception) {
//  
//  } finally { con09 = null; } if (con010 != null) try { con010.close(); } catch
//  (Exception exception) {
//  
//  } finally { con010 = null; } if (con011 != null) try { con011.close(); }
//  catch (Exception exception) {
//  
//  } finally { con011 = null; } if (con012 != null) try { con012.close(); }
//  catch (Exception exception) {
//  
//  } finally { con012 = null; } if (con013 != null) try { con013.close(); }
//  catch (Exception exception) {
//  
//  } finally { con013 = null; } if (con014 != null) try { con014.close(); }
//  catch (Exception exception) {
//  
//  } finally { con014 = null; } if (con015 != null) try { con015.close(); }
//  catch (Exception exception) {
//  
//  } finally { con015 = null; } if (con016 != null) try { con016.close(); }
//  catch (Exception exception) {
//  
//  } finally { con016 = null; } if (con017 != null) try { con017.close(); }
//  catch (Exception exception) {
//  
//  } finally { con017 = null; } if (con018 != null) try { con018.close(); }
//  catch (Exception exception) {
//  
//  } finally { con018 = null; } if (con019 != null) try { con019.close(); }
//  catch (Exception exception) {
//  
//  } finally { con019 = null; } if (con020 != null) try { con020.close(); }
//  catch (Exception exception) {
//  
//  } finally { con020 = null; } out.flush(); System.gc(); } } }
// 