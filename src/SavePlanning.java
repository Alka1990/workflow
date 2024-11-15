
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.PlanningVO;
import com.workflow.connection.LoginDAO;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@MultipartConfig
@WebServlet({ "/SavePlanning" })
public class SavePlanning extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(Case_Stage.class);
  private boolean isMultipart;
  private String filePath;
  private int maxFileSize = 5632000; // Max file size
  private int maxMemSize = 1126400;  // Max memory size
  private File file;
  private static final SimpleDateFormat sdf1 = new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss");
  private static final String SQL_INSERT = "INSERT INTO Planning (case_id,doctor_name,crm ,patient_name,base_segment,planned,ipr_sheet ,treat_report,upload_digiplan,plan_review,decesion,date,remark) VALUES (?,?,?,?,?,?,?,?,?,?,?,now(),?)";
  private static final String SQL_INSERT_IMAGES = "INSERT INTO UploadedImages (case_id, planning_id, image_1, image_2, image_3, upload_date) VALUES (?, ?, ?, ?, ?, now())";

  
 
  public SavePlanning() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  System.out.println(request.toString());  
	  PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    Connection con = null;
    Statement st3 = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement preparedStatement1 = null;
    ResultSet rs = null;
    String crm_name = "";
    String case_id = "";
    
    String patient_name = "";
    String doctor_name = "";
    String upper_aligner_from = "";
    String upper_aligner_to = "";
    String lower_aligner_from = "";
    String lower_aligner_to = "";
    String pn = "";
    String dr = "";
    String PNo = "";
    String UserId = (String) session.getAttribute("userid");
    String CaseId = request.getParameter("caseId");
    System.out.println("callQAProcedure111================ " + CaseId );
    String DoctorName = request.getParameter("DoctorName");
    String crm = request.getParameter("crm");
    String PatientName = request.getParameter("PatientName");
    String planningType = request.getParameter("planningType");
    String basingsegcheck = request.getParameter("basingsegcheck");
    String planned = request.getParameter("planned");
    String iprSheet = request.getParameter("iprSheet");
    String treatmentreport = request.getParameter("treatmentreport");
    String uploaddgiplan = request.getParameter("uploaddgiplan");
    String planningreview = request.getParameter("planningreview");
    String remarks = request.getParameter("remarks");
    String stage = request.getParameter("stage");
    String Planned_No = request.getParameter("Planned_No");
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    String cid = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
    String pid = request.getParameter("planning_id") == null ? "" : request.getParameter("planning_id");
    PNo = request.getParameter("Planned_No1") == null ? "" : request.getParameter("Planned_No1");
    pn = request.getParameter("patient_name") == null ? "" : request.getParameter("patient_name");
    dr = request.getParameter("doctor_name") == null ? "" : request.getParameter("doctor_name");
    upper_aligner_from = request.getParameter("upper_aligner_from") == null ? ""
        : request.getParameter("upper_aligner_from");
    upper_aligner_to = request.getParameter("upper_aligner_to") == null ? "" : request.getParameter("upper_aligner_to");
    lower_aligner_from = request.getParameter("lower_aligner_from") == null ? ""
        : request.getParameter("lower_aligner_from");
    lower_aligner_to = request.getParameter("lower_aligner_to") == null ? "" : request.getParameter("lower_aligner_to");
    String priority = request.getParameter("priority") == null ? "" : request.getParameter("priority");
    
    String caseBookingForm = request.getParameter("case_booking_form");
    String salesApprovalDocs = request.getParameter("sales_approval_docs");
    String docApprovalForm = request.getParameter("doc_approval_form");
    String stagesheet = request.getParameter("stagesheet");
    String planComment = request.getParameter("plan_comment");
    String uForm = request.getParameter("u_form");
    String uTo = request.getParameter("u_to");
    String lFrom = request.getParameter("l_from");
    String lTo = request.getParameter("l_to");
    String dispatchEta = request.getParameter("dispatch_eta");
    
    
    try {
      con = LoginDAO.getConnectionDetails();
      int row;
      String sql1;
     

      if (query.equals("approveplan")) {
    
        pstmt = con.prepareStatement(" update cc_crm set planning_id=? where Case_Id=? ");
        pstmt.setString(1, pid);
        pstmt.setString(2, cid);
      

        row = pstmt.executeUpdate();
        if (row > 0) {
        	
        
          sql1 = "AddPlanning?caseId=" + cid + "&crm=" + crm + "&cdoc=" + dr + "&patient_Name=" + pn;
          out.println("<script type=\"text/javascript\">");
         // out.println("alert('Plan Approved Successfully');");
          out.println("location='" + sql1 + "';");
          out.println("</script>");
        }
    	

      }
      if (query.equals("QAPlan")) {
    	    
          pstmt = con.prepareStatement(" update cc_crm set planning_id=? where Case_Id=? ");
          pstmt.setString(1, pid);
          pstmt.setString(2, cid);
        

          row = pstmt.executeUpdate();
          if (row > 0) {
          	
        		callQAProcedure(request, response);
          	  System.out.println("callQAProcedure22222================ " );
          	 
          	 uploadImages(request, response);

          	  System.out.println("uploadImages================ " );
            sql1 = "AddPlanning?caseId=" + cid + "&crm=" + crm + "&cdoc=" + dr + "&patient_Name=" + pn;
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Plan Approved Successfully');");
            out.println("location='" + sql1 + "';");
            out.println("</script>");
          }


        }
      
      
      if (query.equals("getapprovedpln")) {
        String sqpln = " select planning_id  from cc_crm where case_id='" + CaseId + "' ";
        pstmt1 = con.prepareStatement(sqpln);
        rs = pstmt1.executeQuery();

        while (true) {
          while (rs.next()) {
            sql1 = rs.getString("planning_id");

            if (sql1 != null && !sql1.equals("")) {
              out.println("true");

            } else {
              out.println("false");
            }
          }

          return;
        }
      } else if (query.equals("planningnew")) {

        pstmt = con.prepareStatement(
            "insert into planning(case_id,planned_no,planning_type,upper_aligner_from,upper_aligner_to,lower_aligner_from,lower_aligner_to,date,patient_name,doctor_name,crm) VALUES (?,?,?,?,?,?,?,now(),?,?,?)");
        pstmt.setString(1, cid);
        pstmt.setString(2, PNo);
        pstmt.setString(3, planningType);
        pstmt.setString(4, upper_aligner_from);
        pstmt.setString(5, upper_aligner_to);
        pstmt.setString(6, lower_aligner_from);
        pstmt.setString(7, lower_aligner_to);
        pstmt.setString(8, pn);
        pstmt.setString(9, dr);
        pstmt.setString(10, crm);
        row = pstmt.executeUpdate();
        if (row > 0) {
          sql1 = " select case_id,crm_name,Patient_Name,Doctor_Name from  cc_crm where case_id='" + cid + "' ";
          pstmt1 = con.prepareStatement(sql1);

          for (rs = pstmt1.executeQuery(); rs.next(); doctor_name = rs.getString("Doctor_Name")) {
            case_id = rs.getString("case_id");
            crm_name = rs.getString("crm_name");
            patient_name = rs.getString("patient_name");
          }

    	  
          String id = "AddPlanning?caseId=" + case_id + "&crm=" + crm_name + "&patient_Name=" + patient_name + "&cdoc="
              + doctor_name;
          out.println("<script type=\"text/javascript\">");
          out.println("alert('SUCCESSFULLY SAVED!');");
          out.println("location='" + id + "';");
          out.println("</script>");
        }
      } else {
        preparedStatement = con.prepareStatement(
            "INSERT INTO Planning (case_id,doctor_name,crm ,patient_name,base_segment,planned,ipr_sheet ,treat_report,upload_digiplan,plan_review,decesion,date,remark) VALUES (?,?,?,?,?,?,?,?,?,?,?,now(),?)");
        preparedStatement.setString(1, CaseId);
        preparedStatement.setString(2, DoctorName);
        preparedStatement.setString(3, crm);
        preparedStatement.setString(4, PatientName);
        preparedStatement.setString(5, basingsegcheck);
        preparedStatement.setString(6, planned);
        preparedStatement.setString(7, iprSheet);
        preparedStatement.setString(8, treatmentreport);
        preparedStatement.setString(9, uploaddgiplan);
        preparedStatement.setString(10, planningreview);
        preparedStatement.setString(11, stage);
        preparedStatement.setString(12, remarks);
 
        row = preparedStatement.executeUpdate();
        sql1 = "";
        if (row > 0) {
          if (stage.equals("PLN")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', pln_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("PRECOR") && !remarks.equals("")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', precor_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("PLNCOR") && !remarks.equals("")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', plncor_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("UPLCOR") && !remarks.equals("")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', uplcor_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("Not Converted") && !remarks.equals("")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', ntcnt_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("Cancel") && !remarks.equals("")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', cnl_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("REV")) {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage
                + "', rev_at=now()  where Case_Id='" + CaseId + "' ";
          } else if (stage.equals("QA")) {
        	  
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage + "', qa_at=now(), priority='"
                + priority + "'  where Case_Id='" + CaseId + "' ";
           
          } else {
            sql1 = " update cc_crm set remark='" + remarks + "',case_stage='" + stage + "' where Case_Id='" + CaseId
                + "' ";
          }

          preparedStatement1 = con.prepareStatement(sql1);
          int i = preparedStatement1.executeUpdate();
          if (i > 0) {
            con = LoginDAO.getConnectionDetails();
            st3 = con.createStatement();
            String query3 = "INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
                + stage + "','" + remarks + "' ,now(),'" + stage + "','" + UserId + "','" + CaseId + "')";
            int j = st3.executeUpdate(query3);
            if (j > 0) {
            	

            	
              out.println("<script type=\"text/javascript\">");
              out.println("alert('SUCCESSFULLY SAVED!');");
              out.println("location='Newcase1';");
              out.println("</script>");
              con.close();
            }
          }
        }
      }
    } catch (Exception var12041) {
    	System.out.println("hi111");
      LOGGER.info("Error At SavePlanning =" + var12041.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException var12038) {
    	  System.out.println("hi112");
        LOGGER.info("@Exception=" + var12038);
      } catch (SQLException var12039) {
    	  System.out.println("hi113");
        LOGGER.info("@Exception=" + var12039);
      } finally {
        if (rs != null) {
          try {
            rs.close();
          } catch (Exception var12036) {
          } finally {
            rs = null;
          }
        }

        if (st3 != null) {
          try {
            st3.close();
          } catch (Exception var12034) {
          } finally {
            st3 = null;
          }
        }

        if (pstmt != null) {
          try {
            pstmt.close();
          } catch (Exception var12032) {
          } finally {
            pstmt = null;
          }
        }

        if (pstmt1 != null) {
          try {
            pstmt1.close();
          } catch (Exception var12030) {
          } finally {
            pstmt1 = null;
          }
        }

        if (preparedStatement != null) {
          try {
            preparedStatement.close();
          } catch (Exception var12028) {
          } finally {
            preparedStatement = null;
          }
        }

        if (preparedStatement1 != null) {
          try {
            preparedStatement1.close();
          } catch (Exception var12026) {
          } finally {
            preparedStatement1 = null;
          }
        }

        if (con != null) {
          try {
            con.close();
          } catch (Exception var12024) {
          } finally {
            con = null;
          }}}}}

  public void callQAProcedure(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
	    PrintWriter out = response.getWriter();
	    System.out.println("callQAProcedure");
	    HttpSession session = request.getSession(false);
	    Connection con = null;
	    PreparedStatement pstmt = null;		    
	    ResultSet rs = null;

	    // Get parameters from request
	    String cid = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
	    long caseId = Long.parseLong(cid); 
	    String pid = request.getParameter("planning_id") == null ? "" : request.getParameter("planning_id");
	    int PlanningId = Integer.parseInt(pid);

	    // Check if images are uploaded
	    Part caseBookingFormPart = request.getPart("case_booking_form");
	    Part salesApprovalDocsPart = request.getPart("sales_approval_docs");
	    Part docApprovalFormPart = request.getPart("doc_approval_form");

	    // Determine if image fields have content
	    String case_booking_form = (caseBookingFormPart != null && caseBookingFormPart.getSize() > 0) ? "yes" : "no";
	    String sales_approval_docs = (salesApprovalDocsPart != null && salesApprovalDocsPart.getSize() > 0) ? "yes" : "no";
	    String doc_approval_form = (docApprovalFormPart != null && docApprovalFormPart.getSize() > 0) ? "yes" : "no";

	    // Get other parameters
	    String stagesheet = request.getParameter("stagesheet");
	    String plan_comment = request.getParameter("plan_comment");
	    int u_form_1 = Integer.parseInt(request.getParameter("u_form_6"));
	    int u_to = Integer.parseInt(request.getParameter("u_to"));
	    int l_from = Integer.parseInt(request.getParameter("l_from"));
	    int l_to = Integer.parseInt(request.getParameter("l_to"));
	    String dispatch_eta = request.getParameter("dispatch_eta");
	    String created_at = request.getParameter("created_at");
	    String created_by = (String) session.getAttribute("created_by");

	    try {
	        con = LoginDAO.getConnectionDetails();
	        
	        // Insert into the qa table
	        String sql = "INSERT INTO qa (case_id, planning_id, case_booking_form, sales_approval_docs, doc_approval_form, "
	                   + "stagesheet, plan_comment, u_form, u_to, l_from, l_to, dispatch_eta, created_at, created_by) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        pstmt = con.prepareStatement(sql);

	        // Set parameters for the qa table
	        pstmt.setLong(1, caseId);
	        pstmt.setInt(2, PlanningId);
	        pstmt.setString(3, case_booking_form);
	        pstmt.setString(4, sales_approval_docs);
	        pstmt.setString(5, doc_approval_form);
	        pstmt.setString(6, stagesheet);
	        pstmt.setString(7, plan_comment);
	        pstmt.setInt(8, u_form_1);
	        pstmt.setInt(9, u_to);
	        pstmt.setInt(10, l_from);
	        pstmt.setInt(11, l_to);
	        pstmt.setDate(12, java.sql.Date.valueOf(dispatch_eta));
	        pstmt.setTimestamp(13, new java.sql.Timestamp(System.currentTimeMillis()));
	        pstmt.setString(14, created_by);

	        System.out.println("Executing QA table insertion query...");
	        int row1 = pstmt.executeUpdate();

	        if (row1 > 0) {
	            // Update planning table based on the new QA entry
	            String updateSQL = "UPDATE planning p  JOIN qa q ON p.planning_id = q.planning_id SET "
	            		+ "p.case_booking_form = q.case_booking_form, p.sales_approval_docs = q.sales_approval_docs, "
	            		+ "p.doc_approval_form = q.doc_approval_form, p.stagesheet = q.stagesheet, "
	            		+ "p.plan_comment = q.plan_comment, p.u_form = q.u_form, p.u_to = q.u_to, "
	            		+ "p.l_from = q.l_from, p.l_to = q.l_to, p.dispatch_eta = q.dispatch_eta, "
	            		+ "p.created_at = q.created_at, p.created_by = q.created_by WHERE q.case_id = ?";

	            pstmt = con.prepareStatement(updateSQL);
	            pstmt.setLong(1, caseId);
	            System.out.println("Executing planning table update query...");
	            int row2 = pstmt.executeUpdate();

	            if (row2 > 0) {
	                // Fetch from the planning table
	                String selectSQL = "SELECT * FROM planning WHERE planning_id = ?";
	                pstmt = con.prepareStatement(selectSQL);
	                pstmt.setInt(1, PlanningId);
	                rs = pstmt.executeQuery();

	                PlanningVO planningVO = new PlanningVO();

	                if (rs.next()) {
	                    // Map ResultSet to PlanningVO
	                    planningVO.setCase_booking_form(rs.getString("case_booking_form"));
	                    planningVO.setSales_approval_docs(rs.getString("sales_approval_docs"));
	                    planningVO.setDoc_approval_form(rs.getString("doc_approval_form"));
	                    planningVO.setStagesheet(rs.getString("stagesheet"));
	                    planningVO.setPlan_comment(rs.getString("plan_comment"));
	                    planningVO.setU_form(rs.getInt("u_form"));
	                    planningVO.setU_to(rs.getInt("u_to"));
	                    planningVO.setL_from(rs.getInt("l_from"));
	                    planningVO.setL_to(rs.getInt("l_to"));
	                    planningVO.setDispatch_eta(rs.getDate("dispatch_eta"));
	                    planningVO.setCreated_at(rs.getTimestamp("created_at"));
	                    planningVO.setCreated_by(rs.getString("created_by"));

	                    // Log the retrieved values
	                    System.out.println("PlanningVO: " + planningVO.toString());
	                }

	                // Update the cc_crm table using retrieved values
	                String crmUpdateSQL = "UPDATE cc_crm SET case_booking_form = ?, sales_approval_docs = ?, "
	                		+ "doc_approval_form = ?, stagesheet = ?, plan_comment = ?, u_form = ?, u_to = ?, "
	                		+ "l_from = ?, l_to = ?, dispatch_eta = ?, created_at = ?, created_by = ? "
	                		+ "WHERE Case_Id = ?";

	                pstmt = con.prepareStatement(crmUpdateSQL);

	                // Set parameters for cc_crm table update
	                pstmt.setString(1, planningVO.getCase_booking_form());
	                pstmt.setString(2, planningVO.getSales_approval_docs());
	                pstmt.setString(3, planningVO.getDoc_approval_form());
	                pstmt.setString(4, planningVO.getStagesheet());
	                pstmt.setString(5, planningVO.getPlan_comment());
	                pstmt.setInt(6, planningVO.getU_form());
	                pstmt.setInt(7, planningVO.getU_to());
	                pstmt.setInt(8, planningVO.getL_from());
	                pstmt.setInt(9, planningVO.getL_to());
	                pstmt.setDate(10, new java.sql.Date(planningVO.getDispatch_eta().getTime()));
	                pstmt.setTimestamp(11, planningVO.getCreated_at());
	                pstmt.setString(12, planningVO.getCreated_by());
	                pstmt.setLong(13, caseId);

	                System.out.println("Executing cc_crm table update query...");
	                int crmRow = pstmt.executeUpdate();

	                if (crmRow > 0) {
	                    out.println("<script type=\"text/javascript\">");
	                    //out.println("alert('QA Updated Successfully');");             
	                    out.println("</script>");
	                } else {
	                	 out.println("alert('Failed to update cc_crm table.');"); 
	                    response.getWriter().println("Failed to update cc_crm table.");
	                }
	            } else {
	                response.getWriter().println("An error occurred while updating the planning table.");
	            }
	        } else {
	            response.getWriter().println("An error occurred while inserting the record into QA.");
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    } finally {
	        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
	    }
	}
  
  public void uploadImages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    PrintWriter out = response.getWriter();
	    
	    String doctor_name = request.getParameter("doctor_name") == null ? "" : request.getParameter("doctor_name");
	    String patient_name = request.getParameter("patient_name") == null ? "" : request.getParameter("patient_name");
	    String clinic_name = request.getParameter("clinic_name") == null ? "" : request.getParameter("clinic_name");
	    String cid = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
	    
	    long caseId = Long.parseLong(cid);
	    String timeStamp = new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss").format(new java.util.Date());
	   // String baseUploadPath = "/Users/alkasingh/Desktop/Workflow";
	    String baseUploadPath ="D:/Software/Apache Software Foundation/Tomcat 9.0_Tomcaat/webapps/Workflow/WEB-INF/classes";
	    String caseUploadPath = baseUploadPath + File.separator + caseId + '_' + timeStamp;

	    File caseUploadDir = new File(caseUploadPath);
	    if (!caseUploadDir.exists()) {
	        caseUploadDir.mkdirs();
	    }


	    String caseBookingFileName = "";
	    String salesApprovalFileName = "";
	    String docApprovalFileName = "";
	    // Retrieve the parts from the request
	    try {
	        Part caseBookingFormPart = request.getPart("case_booking_form");
	        Part salesApprovalDocsPart = request.getPart("sales_approval_docs");
	        Part docApprovalFormPart = request.getPart("doc_approval_form");

	        // Extract filenames and write files
	        if (caseBookingFormPart != null && caseBookingFormPart.getSize() > 0) {
	            caseBookingFileName = extractFileName(caseBookingFormPart);
	            caseBookingFormPart.write(caseUploadPath + File.separator + caseBookingFileName);
	        }

	        if (salesApprovalDocsPart != null && salesApprovalDocsPart.getSize() > 0) {
	            salesApprovalFileName = extractFileName(salesApprovalDocsPart);
	            salesApprovalDocsPart.write(caseUploadPath + File.separator + salesApprovalFileName);
	        }

	        if (docApprovalFormPart != null && docApprovalFormPart.getSize() > 0) {
	            docApprovalFileName = extractFileName(docApprovalFormPart);
	            docApprovalFormPart.write(caseUploadPath + File.separator + docApprovalFileName);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<script>alert('Error while uploading files.'); ");
	        return;
	    }

	    try {
	        con = LoginDAO.getConnectionDetails();
	        
	        String checkSql = "SELECT COUNT(*) FROM uploadsimages WHERE case_id = ?";
	        pstmt = con.prepareStatement(checkSql);
	        pstmt.setLong(1, caseId);
	        rs = pstmt.executeQuery();
	        
	        int count = 0;
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	        String updateSql;
	        if (count > 0) {
	        	  updateSql = "UPDATE uploadsimages SET upper_img = NULL, lower_img = NULL, front_img = NULL, left_img = NULL, right_img = NULL, simple_img = NULL, simle_img = NULL, side_img = NULL, status = NULL, pdf_doc = NULL, ppf_doc = NULL, tpr_doc = NULL, file_path = ?, date = NOW(), case_booking_form = ?, sales_approval_docs = ?, doc_approval_form = ? WHERE case_id = ?";
	              pstmt = con.prepareStatement(updateSql);
	              pstmt.setString(1, caseUploadPath); // file path
	              pstmt.setString(2, caseBookingFileName); // case booking form file
	              pstmt.setString(3, salesApprovalFileName); // sales approval docs file
	              pstmt.setString(4, docApprovalFileName); // doc approval form file
	              pstmt.setLong(5, caseId);
	         } else {
	        	    updateSql = "INSERT INTO uploadsimages (case_id, doctor_name, patient_name, clinic_name, options, upper_img, lower_img, front_img, left_img, right_img, simple_img, simle_img, side_img, status, file_path, date, pdf_doc, ppf_doc, tpr_doc, case_booking_form, sales_approval_docs, doc_approval_form) VALUES (?, ?, ?, ?, 'NEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ?, NOW(), NULL, NULL, NULL, ?, ?, ?)";
	                pstmt = con.prepareStatement(updateSql);
	                pstmt.setLong(1, caseId);
	                pstmt.setString(2, doctor_name);
	                pstmt.setString(3, patient_name);
	                pstmt.setString(4, clinic_name);
	                pstmt.setString(5, caseUploadPath); // file path
	                pstmt.setString(6, caseBookingFileName); // case booking form file
	                pstmt.setString(7, salesApprovalFileName); // sales approval docs file
	                pstmt.setString(8, docApprovalFileName);
	         

	        }

	        // Execute the update/insert statement
	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            //out.println("<script>alert('Files uploaded successfully.'); </script>");
	        } else {
	            out.println("<script>alert('Error occurred while saving the information.'); </script>");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<script>alert('Database error occurred.');");
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	// Method to extract the filename from a Part object
	private String extractFileName(Part part) {
	    String contentDisposition = part.getHeader("content-disposition");
	    for (String token : contentDisposition.split(";")) {
	        if (token.trim().startsWith("filename")) {
	            return token.substring(token.indexOf('=') + 2, token.length() - 1);
	        }
	    }
	    return null;
	}


}


