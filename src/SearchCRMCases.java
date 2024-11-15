import com.vo.SearchVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SearchCRMCases")
public class SearchCRMCases extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  PrintWriter out = response.getWriter();
	      HttpSession session = request.getSession();
		  System.out.println("SearchCRMCases post");
		    try {
		     
		      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals(""))
		        response.sendRedirect("login.jsp?msg=You are not logged in..!"); 
		      
		      Connection connection = LoginDAO.getConnectionDetails();
		      PreparedStatement stmt = null;
		      ResultSet rs = null;
		      List<SearchVO> searchResult = new ArrayList<>();
		      String caseId = request.getParameter("caseId");
		      String doctorName = request.getParameter("doctorName");
		      String treating_dr_email = request.getParameter("treating_dr_email");
		      String patientName = request.getParameter("patientName");
		      String patient_email = request.getParameter("patient_email");
		      String startDate = request.getParameter("startDate");
		      String endDate = request.getParameter("endDate");
		      String days = request.getParameter("days");
		      String searchType = request.getParameter("searchType");
		      if (searchType.equals("Advanced")) {
				  System.out.println("SearchCRMCases Advanced");

		        if (caseId == "")
		          caseId = "(!#)"; 
		        if (doctorName == "")
		          doctorName = "(!#)"; 
		        if (patientName == "")
		          patientName = "(!#)"; 
		        if (patient_email == "")
		        	patient_email = "(!#)"; 
		        if (treating_dr_email == "")
		        	treating_dr_email = "(!#)"; 
		          String query = " select * from cc_crm where crm_name='"+session.getAttribute("crm_Name")+"' and  Case_Id like '%" + caseId + "%' or Patient_Name like '%" + 
		          patientName + "%' or doctor_Name like '%" + doctorName + "%' or patient_email like '%"+patient_email+"%' or treating_dr_email like '%"+treating_dr_email+"%'  order by CREATED_DATE desc";
		        stmt = connection.prepareStatement(query);
		        rs = stmt.executeQuery();
		        while (rs.next()) {
		          String phone = rs.getString("phone");
		          SearchVO searchVO = new SearchVO();
		          searchVO.setCase_Id(rs.getString("Case_Id"));
		          searchVO.setPatient_Name(rs.getString("Patient_Name"));
		          searchVO.setDoctor_Name(rs.getString("doctor_Name"));
		          searchVO.setRegistered_doctor(rs.getString("registered_doctor"));
		          searchVO.setTreating_dr_email(rs.getString("treating_dr_email"));
		          searchVO.setPatient_email(rs.getString("patient_email"));
		          searchVO.setPhone(phone);
		          searchVO.setPhone1(rs.getString("phone1"));
		          searchVO.setPhone2(rs.getString("phone2"));
		          searchVO.setPhone3(rs.getString("phone3"));
		          searchVO.setPhone4(rs.getString("phone4"));
		          searchVO.setPhone5(rs.getString("phone5"));
		          searchVO.setDefault_address(rs.getString("default_address"));
		          searchVO.setDefault_starterkit(rs.getString("default_starterkit"));
		          searchVO.setCrm_name(rs.getString("Crm_name"));
		          searchVO.setClinic_Name(rs.getString("Clinic_Name"));
		          searchVO.setBatch_stage(rs.getString("case_stage"));
		          searchVO.setStarterkit_stage(rs.getString("starter_case_stage"));
		          searchResult.add(searchVO);
		        } 
		        if (caseId == "(!#)")
		          caseId = null; 
		        if (doctorName == "(!#)")
		          doctorName = null; 
		        if (patientName == "(!#)")
		          patientName = null; 
		        
		        if (patient_email == "(!#)")
		        	patient_email = null; 
		   
		        if (treating_dr_email == "(!#)")
		        	treating_dr_email = null; 
		        
		        session.setAttribute("searchResult", searchResult);
		        session.setAttribute("searchCaseId", caseId);
		        session.setAttribute("searchDoctorName", doctorName);
		        session.setAttribute("searchPatientName", patientName);
		        session.setAttribute("searchpatient_email", patient_email);
		        session.setAttribute("searchtreating_dr_email", treating_dr_email);
		        connection.close();
		        out.println("success");
		      } 
		      if (searchType.equals("Moderate")) {
				  System.out.println("SearchCRMCases Moderate");

		        String[] date1 = startDate.split("-");
		        String[] date2 = endDate.split("-");
		        String to = String.valueOf(date1[2]) + "-" + date1[1] + "-" + date1[0];
		        String from = String.valueOf(date2[2]) + "-" + date2[1] + "-" + date2[0];
		        String query = " select * from cc_crm where crm_name='"+session.getAttribute("crm_Name")+"' and  CREATED_DATE between '" + to + "' and '" + from + 
		          "' order by CREATED_DATE desc";
		        stmt = connection.prepareStatement(query);
		        rs = stmt.executeQuery();
		        while (rs.next()) {
		          String phone = "";
		          String type_request = rs.getString("type_request");
		          String starter_kit = rs.getString("starter_kit");
		          String default_starterkit = rs.getString("starter_kit");
		          String default_batch = rs.getString("default_address");
		          SearchVO searchVO = new SearchVO();
		          searchVO.setCase_Id(rs.getString("Case_Id"));
		          searchVO.setPatient_Name(rs.getString("Patient_Name"));
		          searchVO.setPatient_email(rs.getString("patient_email"));
		          searchVO.setDoctor_Name(rs.getString("doctor_Name"));
		          searchVO.setTreating_dr_email(rs.getString("treating_dr_email"));
		          searchVO.setRegistered_doctor(rs.getString("registered_doctor"));
		          searchVO.setPhone(phone);
		          searchVO.setCrm_name(rs.getString("Crm_name"));
		          searchVO.setClinic_Name(rs.getString("Clinic_Name"));
		          searchVO.setBatch_stage(rs.getString("case_stage"));
		          searchVO.setStarterkit_stage(rs.getString("starter_case_stage"));
		          searchResult.add(searchVO);
		        } 
		        session.setAttribute("searchResult", searchResult);
		        session.setAttribute("searchStartDate", startDate);
		        session.setAttribute("searchEndDate", endDate);
		        connection.close();
		        out.println("success");
		      } 
		      if (searchType.equals("Simple")) {
				  System.out.println("SearchCRMCases Simple");

		        String query = " select * from cc_crm  where crm_name='"+session.getAttribute("crm_Name")+"' order by CREATED_DATE desc limit " + days;
		        stmt = connection.prepareStatement(query);
		        rs = stmt.executeQuery();
		        while (rs.next()) {
		          String phone = "";
		          String type_request = rs.getString("type_request");
		          String starter_kit = rs.getString("starter_kit");
		          String default_starterkit = rs.getString("starter_kit");
		          String default_batch = rs.getString("default_address");
		          SearchVO searchVO = new SearchVO();
		          searchVO.setCase_Id(rs.getString("Case_Id"));
		          searchVO.setPatient_Name(rs.getString("Patient_Name"));
		          searchVO.setPatient_email(rs.getString("patient_email"));
		          searchVO.setDoctor_Name(rs.getString("doctor_Name"));
		          searchVO.setTreating_dr_email(rs.getString("treating_dr_email"));
		          searchVO.setRegistered_doctor(rs.getString("registered_doctor"));
		          searchVO.setPhone(phone);
		          searchVO.setCrm_name(rs.getString("Crm_name"));
		          searchVO.setClinic_Name(rs.getString("Clinic_Name"));
		          searchVO.setBatch_stage(rs.getString("case_stage"));
		          searchVO.setStarterkit_stage(rs.getString("starter_case_stage"));
		          searchResult.add(searchVO);
		        } 
		        session.setAttribute("searchResult", searchResult);
		        session.setAttribute("searchDays", days);
		        connection.close();
		        out.println("success");
		      } 
		    } catch (Exception exception) {
		      System.out.println("Exception = " + exception);
		    } 
		  }
}
