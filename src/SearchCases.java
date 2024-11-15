
// Source code is decompiled from a .class file using FernFlower decompiler.
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

@WebServlet({ "/SearchCases" })
public class SearchCases extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public SearchCases() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")) {
        response.sendRedirect("login.jsp?msg=You are not logged in..!");
      }

      Connection connection = LoginDAO.getConnectionDetails();
      PreparedStatement stmt = null;
      ResultSet rs = null;
      List<SearchVO> searchResult = new ArrayList();
      String caseId = request.getParameter("caseId");
      String doctorName = request.getParameter("doctorName");
      String treating_dr_email = request.getParameter("treating_dr_email");
      String patientName = request.getParameter("patientName");
      String patient_email = request.getParameter("patient_email");
      String startDate = request.getParameter("startDate");
      String endDate = request.getParameter("endDate");
      String days = request.getParameter("days");
      String searchType = request.getParameter("searchType");
      String query;
      String phone;
      if (searchType.equals("Advanced")) {
        if (caseId == "") {
          caseId = "(!#)";
        }

        if (doctorName == "") {
          doctorName = "(!#)";
        }

        if (patientName == "") {
          patientName = "(!#)";
        }

        if (patient_email == "") {
          patient_email = "(!#)";
        }

        if (treating_dr_email == "") {
          treating_dr_email = "(!#)";
        }

        query = " select * from cc_crm where Case_Id like '%" + caseId + "%' or Patient_Name like '%" + patientName
            + "%' or doctor_Name like '%" + doctorName + "%' or patient_email like '%" + patient_email
            + "%' or treating_dr_email like '%" + treating_dr_email + "%'  order by CREATED_DATE desc";
        stmt = connection.prepareStatement(query);
        rs = stmt.executeQuery();

        while (rs.next()) {
          phone = rs.getString("phone");
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

        if (caseId == "(!#)") {
          caseId = null;
        }

        if (doctorName == "(!#)") {
          doctorName = null;
        }

        if (patientName == "(!#)") {
          patientName = null;
        }

        if (patient_email == "(!#)") {
          patient_email = null;
        }

        if (treating_dr_email == "(!#)") {
          treating_dr_email = null;
        }

        session.setAttribute("searchResult", searchResult);
        session.setAttribute("searchCaseId", caseId);
        session.setAttribute("searchDoctorName", doctorName);
        session.setAttribute("searchPatientName", patientName);
        session.setAttribute("searchpatient_email", patient_email);
        session.setAttribute("searchtreating_dr_email", treating_dr_email);
        connection.close();
        out.println("success");
      }

      String starter_kit;
      String default_starterkit;
      String default_batch;
      String type_request;
      if (searchType.equals("Moderate")) {
        String[] date1 = startDate.split("-");
        String[] date2 = endDate.split("-");
        type_request = String.valueOf(date1[2]) + "-" + date1[1] + "-" + date1[0];
        starter_kit = String.valueOf(date2[2]) + "-" + date2[1] + "-" + date2[0];
        default_starterkit = " select * from cc_crm where CREATED_DATE between '" + type_request + "' and '"
            + starter_kit + "' order by CREATED_DATE desc";
        stmt = connection.prepareStatement(default_starterkit);
        rs = stmt.executeQuery();

        while (rs.next()) {
          default_batch = "";
          String type_request1 = rs.getString("type_request");
          String starter_kit1 = rs.getString("starter_kit");
          String default_starterkit1 = rs.getString("starter_kit");
          String default_batch1 = rs.getString("default_address");
          SearchVO searchVO = new SearchVO();
          searchVO.setCase_Id(rs.getString("Case_Id"));
          searchVO.setPatient_Name(rs.getString("Patient_Name"));
          searchVO.setPatient_email(rs.getString("patient_email"));
          searchVO.setDoctor_Name(rs.getString("doctor_Name"));
          searchVO.setTreating_dr_email(rs.getString("treating_dr_email"));
          searchVO.setRegistered_doctor(rs.getString("registered_doctor"));
          searchVO.setPhone(default_batch1);
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
        query = " select * from cc_crm order by CREATED_DATE desc limit " + days;
        stmt = connection.prepareStatement(query);
        rs = stmt.executeQuery();

        while (rs.next()) {
          phone = "";
          type_request = rs.getString("type_request");
          starter_kit = rs.getString("starter_kit");
          default_starterkit = rs.getString("starter_kit");
          default_batch = rs.getString("default_address");
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
    } catch (Exception var29) {
      System.out.println("Exception = " + var29);
    }

  }
}
