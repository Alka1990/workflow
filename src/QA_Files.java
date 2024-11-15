

import java.io.IOException;
import java.io.PrintWriter;
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

import com.workflow.connection.LoginDAO;

/**
 * Servlet implementation class QA_Files
 */
@WebServlet("/QA_Files")
public class QA_Files extends HttpServlet {

       
	 private static final long serialVersionUID = 1L;
	  static final Logger LOGGER = LogManager.getLogger(Case_Stage.class);
	  private static final String SQL_INSERT = "INSERT INTO Planning (case_id,doctor_name,crm ,patient_name,base_segment,planned,ipr_sheet ,treat_report,upload_digiplan,plan_review,decesion,date,remark) VALUES (?,?,?,?,?,?,?,?,?,?,?,now(),?)";

    public QA_Files() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 PrintWriter out = response.getWriter();
		    HttpSession session = request.getSession(false);
		    Connection con = null;
		    Statement st3 = null;
		    PreparedStatement preparedStatement = null;
		    PreparedStatement pstmt = null;
		    PreparedStatement pstmt1 = null;
		    PreparedStatement preparedStatement1 = null;
		    ResultSet rs = null;
		doGet(request, response);
		String case_booking_form = request.getParameter("case_booking_form");
	    String sales_approval_docs = request.getParameter("sales_approval_docs");
	    String doc_approval_form = request.getParameter("doc_approval_form");
	    String stagesheet = request.getParameter("stagesheet");
	    String plan_comment = request.getParameter("plan_comment");
	    String u_form = request.getParameter("u_form");
	    String u_to = request.getParameter("u_to");
	    String l_from = request.getParameter("l_from");
	    String l_to = request.getParameter("l_to");
	    String dispatch_eta = request.getParameter("dispatch_eta");
	    String created_by = request.getParameter("created_by");
	    String cid = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
	    String pid = request.getParameter("planning_id") == null ? "" : request.getParameter("planning_id");
	    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
	    String DoctorName = request.getParameter("DoctorName");
	    String crm = request.getParameter("crm");
	    String PatientName = request.getParameter("PatientName");	    
	    String dr = "";
	    dr = request.getParameter("doctor_name") == null ? "" : request.getParameter("doctor_name");
	    String pn = "";
	    try {
	        con = LoginDAO.getConnectionDetails();
	        int row;
	        String sql1;
	        if (query.equals("approveplan")) {
	      	  //call QA procedure
	      	  pstmt1 = con.prepareStatement("INSERT INTO qa (case_id, planning_id, case_booking_form, sales_approval_docs, doc_approval_form, stagesheet, plan_comment, u_form, u_to, l_from, l_to, dispatch_eta, created_at, created_by) "
	                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)");
	      	  pstmt.setLong(1, Long.parseLong(cid));         // Assuming `cid` is a string, converting to long for case_id
	            pstmt.setInt(2, Integer.parseInt(pid));        // Assuming `pid` is a string, converting to int for planning_id
	            pstmt.setString(3, ("case_booking_form"));
	            pstmt.setString(4, ("sales_approval_docs"));
	            pstmt.setString(5, ("doc_approval_form"));
	            pstmt.setString(6, ("stagesheet"));
	            pstmt.setString(7,("plan_comment"));
	            pstmt.setInt(8, Integer.parseInt(request.getParameter("u_form")));
	            pstmt.setInt(9, Integer.parseInt(request.getParameter("u_to")));
	            pstmt.setInt(10, Integer.parseInt(request.getParameter("l_from")));
	            pstmt.setInt(11, Integer.parseInt(request.getParameter("l_to")));
	            pstmt.setDate(12, java.sql.Date.valueOf(request.getParameter("dispatch_eta")));  // Assuming date is in 'YYYY-MM-DD' format
	            pstmt.setInt(13, Integer.parseInt(request.getParameter("created_by")));
	       
	          row = pstmt.executeUpdate();
	          if (row > 0) {
	            sql1 = "AddPlanning?caseId=" + cid + "&crm=" + crm + "&cdoc=" + dr + "&patient_Name=" + pn;
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('Plan Approved Successfully');");
	            out.println("location='" + sql1 + "';");
	            out.println("</script>");
	          }
	        }
	    }catch(Exception e) {
	    	
	    }
	}}
