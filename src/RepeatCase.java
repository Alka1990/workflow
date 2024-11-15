
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/RepeatCase" })
public class RepeatCase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RepeatCase() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement pstmtSELECT = null;
		ResultSet rs = null;
		String Doctor_Name = "";
		String Patient_Name = "";
		String crm_name = "";
		String query = request.getParameter("query") == null ? "" : request.getParameter("query");
		String correction = request.getParameter("correction") == null ? "" : request.getParameter("correction");
		if (request.getParameter("correctioncor") == null) {
			String var10000 = "";
		} else {
			request.getParameter("correctioncor");
		}
		System.out.println("case id = " + request.getParameter("caseId"));

		String caseId = request.getParameter("caseId") == null ? "" : request.getParameter("caseId").trim();
		String patientName = request.getParameter("patientName") == null ? ""
				: request.getParameter("patientName").trim();
		System.out.println("doctors name = " + request.getParameter("doctorName"));
		String doctorName = request.getParameter("doctorName") == null ? "" : request.getParameter("doctorName").trim();
		String remarks = request.getParameter("remarks") == null ? "" : request.getParameter("remarks").trim();
		String case_stage = request.getParameter("case_stage") == null ? "" : request.getParameter("case_stage").trim();
		System.out.println("case_stage name = " + request.getParameter("case_stage"));

		String userId = request.getParameter("userid") == null ? "" : request.getParameter("userid");
		System.out.println("userid name = " + request.getParameter("userid"));

		String pre_ua_sheet = request.getParameter("pre_ua_sheet") == null ? ""
				: request.getParameter("pre_ua_sheet").trim();
		String pre_u_thichness = request.getParameter("pre_u_thichness") == null ? ""
				: request.getParameter("pre_u_thichness").trim();
		String pre_la_sheet = request.getParameter("pre_la_sheet") == null ? ""
				: request.getParameter("pre_la_sheet").trim();
		String pre_l_thichness = request.getParameter("pre_l_thichness") == null ? ""
				: request.getParameter("pre_l_thichness").trim();
		String new_ua_sheet = request.getParameter("new_ua_sheet") == null ? ""
				: request.getParameter("new_ua_sheet").trim();
		String new_u_thichness = request.getParameter("new_u_thichness") == null ? ""
				: request.getParameter("new_u_thichness").trim();
		String new_la_sheet = request.getParameter("new_la_sheet") == null ? ""
				: request.getParameter("new_la_sheet").trim();
		String new_l_thichness = request.getParameter("new_l_thichness") == null ? ""
				: request.getParameter("new_l_thichness").trim();
		String issue = request.getParameter("issue") == null ? "" : request.getParameter("issue").trim();
		String photos = request.getParameter("photos") == null ? "" : request.getParameter("photos");
		String malocclusion = request.getParameter("malocclusion") == null ? ""
				: request.getParameter("malocclusion").trim();
		String upper_aligner = request.getParameter("upper_aligner") == null ? ""
				: request.getParameter("upper_aligner").trim();
		String lower_aligner = request.getParameter("lower_aligner") == null ? ""
				: request.getParameter("lower_aligner").trim();
		int no_of_rpt = Integer
				.parseInt(request.getParameter("no_of_rpt") == null ? "0" : request.getParameter("no_of_rpt"));
		System.out.println("remarks:: " + remarks);
		String SQL = "";
		String dbcase_id = "";
		String dbdoctorName = "";
		String dbpatientName = "";
		String dbissue = "";
		String pdbhotos = "";
		String dbupper_aligner = "";
		String dblower_aligner = "";
		String dbpre_ua_sheet = "";
		String dbpre_u_thichness = "";
		String dbpre_la_sheet = "";
		String dbpre_l_thichness = "";
		String dbnew_ua_sheet = "";
		String dbnew_u_thichness = "";
		String dbnew_la_sheet = "";
		String dbnew_l_thichness = "";
		String dbmalocclusion = "";
		String dbuserId = "";
		String dbwfcremarks = "";
		String dbplnremarks = "";
		String dbmodified_at = "";
		String dbcreated_at = "";
		if (case_stage.equals("RPTWFCCOR")) {
			query = "RPTWFCCOR";
		}

		if (case_stage.equals("RPTPLN")) {
			query = "RPTPLN";
		}

		try {
			con = LoginDAO.getConnectionDetails();
			if (query.equals("checkcaseid")) {
				pstmtSELECT = con.prepareStatement(" SELECT * FROM repeat_case WHERE case_id='" + caseId + "' ");
				rs = pstmtSELECT.executeQuery();
				if (rs.next()) {
					dbcase_id = rs.getString("case_id");
					query = "RPTWFC";
				} else {
					query = "insertRPT";
				}
			}

			if (query.equals("getdata")) {
				pstmt = con.prepareStatement(" select * from cc_crm where case_id=?");
				pstmt.setString(1, caseId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Patient_Name = rs.getString("Patient_Name");
					Doctor_Name = rs.getString("Doctor_Name");
					crm_name = rs.getString("crm_name");
					out.println(String.valueOf(Patient_Name) + "," + Doctor_Name + "," + crm_name);
				} else {
					out.println("This case Id not Present!");
				}
			}

			int row;
			if (query.equals("insertRPT")) {
				preparedStatement = con.prepareStatement(
						"INSERT INTO repeat_case (case_id,doctor_name,patient_name,issue,wfc_remarks,user_id,photos,upper_aligner,lower_aligner,created_at) VALUES (?,?,?,?,?,?,?,?,?,now()) ");
				preparedStatement.setString(1, caseId);
				preparedStatement.setString(2, doctorName);
				preparedStatement.setString(3, patientName);
				preparedStatement.setString(4, issue);
				preparedStatement.setString(5, remarks);
				preparedStatement.setString(6, userId);
				preparedStatement.setString(7, photos);
				preparedStatement.setString(8, upper_aligner);
				preparedStatement.setString(9, lower_aligner);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					if (case_stage.equals("RPTWFC")) {
						SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',wfc_rpt_at=now() where Case_Id='"
								+ caseId + "' ";
					}

					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("Record has been successfully saved");
				}
			} else if (query.equals("RPTWFC")) {
				preparedStatement = con.prepareStatement(
						" UPDATE repeat_case set doctor_name=?,patient_name=?,issue=?,wfc_remarks=?,user_id=?,photos=?,upper_aligner=?,lower_aligner=? where  case_id='"
								+ caseId + "' ");
				preparedStatement.setString(1, doctorName);
				preparedStatement.setString(2, patientName);
				preparedStatement.setString(3, issue);
				preparedStatement.setString(4, remarks);
				preparedStatement.setString(5, userId);
				preparedStatement.setString(6, photos);
				preparedStatement.setString(7, upper_aligner);
				preparedStatement.setString(8, lower_aligner);
				row = preparedStatement.executeUpdate();
				if (row > 0 && case_stage.equals("RPTWFC")) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',wfc_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("Record has been successfully updated");
				}
			} else if (query.equals("RPTPLN")) {
				preparedStatement = con.prepareStatement(
						" UPDATE repeat_case set pre_ua_sheet=?,pre_u_thichness=?,pre_la_sheet=?,pre_l_thichness=?,new_ua_sheet=?,new_u_thichness=?,new_la_sheet=?,new_l_thichness=?,pln_remarks=?,user_id=?,malocclusion=? WHERE case_id='"
								+ caseId + "' ");
				preparedStatement.setString(1, pre_ua_sheet);
				preparedStatement.setString(2, pre_u_thichness);
				preparedStatement.setString(3, pre_la_sheet);
				preparedStatement.setString(4, pre_l_thichness);
				preparedStatement.setString(5, new_ua_sheet);
				preparedStatement.setString(6, new_u_thichness);
				preparedStatement.setString(7, new_la_sheet);
				preparedStatement.setString(8, new_l_thichness);
				preparedStatement.setString(9, remarks);
				preparedStatement.setString(10, userId);
				preparedStatement.setString(11, malocclusion);
				row = preparedStatement.executeUpdate();
				if (row > 0 && case_stage.equals("RPTPLN")) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',pln_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			} else if (query.equals("RPTWFCCOR") && correction.equals("yes") && case_stage.equals("RPTWFCCOR")) {
				System.out.println("in...." + query + "  " + case_stage + "  " + correction);
				preparedStatement = con.prepareStatement(
						" UPDATE repeat_case set pre_ua_sheet=?,pre_u_thichness=?,pre_la_sheet=?,pre_l_thichness=?,new_ua_sheet=?,new_u_thichness=?,new_la_sheet=?,new_l_thichness=?,pln_remarks=?,user_id=?,malocclusion=? WHERE case_id='"
								+ caseId + "' ");
				System.out.println("preparedStatement::  " + preparedStatement.toString());
				preparedStatement.setString(1, pre_ua_sheet);
				preparedStatement.setString(2, pre_u_thichness);
				preparedStatement.setString(3, pre_la_sheet);
				preparedStatement.setString(4, pre_l_thichness);
				preparedStatement.setString(5, new_ua_sheet);
				preparedStatement.setString(6, new_u_thichness);
				preparedStatement.setString(7, new_la_sheet);
				preparedStatement.setString(8, new_l_thichness);
				preparedStatement.setString(9, remarks);
				preparedStatement.setString(10, userId);
				preparedStatement.setString(11, malocclusion);
				System.out.println("preparedStatemensdfasfdt::  " + preparedStatement.toString());
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',wfccor_rpt_at=now() where Case_Id='"
							+ caseId + "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			} else if (query.equals("3dp")&& correction.equals("yes") && case_stage.equals("RPTTDP")) {
				System.out.println("3dp");
				preparedStatement = con
						.prepareStatement(" UPDATE repeat_case set user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',tdp_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					System.out.println("3dp");
				}
				System.out.println("3dp");
				pstmt1 = con.prepareStatement(SQL);
				pstmt1.executeUpdate();
				pstmt2 = con.prepareStatement(
						"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
								+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
								+ caseId + "')");
				pstmt2.executeUpdate();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record has been successfully updated');");
				out.println("location='Newcase1';");
				out.println("</script>");
			} else if (query.equals("RPTLAB")) {
				System.out.println("LAB");
				preparedStatement = con
						.prepareStatement(" UPDATE repeat_case set user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',lab_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					System.out.println("LAB");
				}
				System.out.println("LAB");
				pstmt1 = con.prepareStatement(SQL);
				pstmt1.executeUpdate();
				pstmt2 = con.prepareStatement(
						"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
								+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
								+ caseId + "')");
				pstmt2.executeUpdate();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record has been successfully updated');");
				out.println("location='Newcase1';");
				out.println("</script>");
			} else if (query.equals("RPTFQC")) {
				preparedStatement = con
						.prepareStatement(" UPDATE repeat_case set user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',qc_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			} else if (query.equals("RPTPCK")) {
				preparedStatement = con
						.prepareStatement(" UPDATE repeat_case set user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',pck_rpt_at=now() where Case_Id='" + caseId
							+ "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			} else if (query.equals("RPTDPH")) {
				preparedStatement = con
						.prepareStatement(" UPDATE repeat_case set user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					++no_of_rpt;
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',dispatch_rpt_at=now(),no_of_rpt='"
							+ no_of_rpt + "' where Case_Id='" + caseId + "' ";
					pstmt1 = con.prepareStatement(SQL);
					int row1 = pstmt1.executeUpdate();
					if (row1 > 0) {
						pstmtSELECT = con
								.prepareStatement(" SELECT * FROM repeat_case WHERE case_id='" + caseId + "' ");
						rs = pstmtSELECT.executeQuery();
						if (rs.next()) {
							dbdoctorName = rs.getString("doctor_name");
							dbpatientName = rs.getString("patient_name");
							dbissue = rs.getString("issue");
							pdbhotos = rs.getString("photos");
							dbupper_aligner = rs.getString("upper_aligner");
							dblower_aligner = rs.getString("lower_aligner");
							dbpre_ua_sheet = rs.getString("pre_ua_sheet");
							dbpre_u_thichness = rs.getString("pre_u_thichness");
							dbpre_la_sheet = rs.getString("pre_la_sheet");
							dbpre_l_thichness = rs.getString("pre_l_thichness");
							dbnew_ua_sheet = rs.getString("new_ua_sheet");
							dbnew_u_thichness = rs.getString("new_u_thichness");
							dbnew_la_sheet = rs.getString("new_la_sheet");
							dbnew_l_thichness = rs.getString("new_l_thichness");
							dbmalocclusion = rs.getString("malocclusion");
							dbwfcremarks = rs.getString("wfc_remarks");
							dbplnremarks = rs.getString("pln_remarks");
							dbcreated_at = rs.getString("created_at");
						}

						preparedStatement = con.prepareStatement(
								"INSERT INTO case_master_history (case_id,doctor_name,patient_name,issue,photos,upper_aligner,lower_aligner,pre_ua_sheet,pre_u_thichness,pre_la_sheet,pre_l_thichness,new_ua_sheet,new_u_thichness,new_la_sheet,new_l_thichness,malocclusion,rpt_wfc_remarks,rpt_pln_remarks,created_at,modified_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now()) ");
						preparedStatement.setString(1, caseId);
						preparedStatement.setString(2, dbdoctorName);
						preparedStatement.setString(3, dbpatientName);
						preparedStatement.setString(4, dbissue);
						preparedStatement.setString(5, pdbhotos);
						preparedStatement.setString(6, dbupper_aligner);
						preparedStatement.setString(7, dblower_aligner);
						preparedStatement.setString(8, dbpre_ua_sheet);
						preparedStatement.setString(9, dbpre_u_thichness);
						preparedStatement.setString(10, dbpre_la_sheet);
						preparedStatement.setString(11, dbpre_l_thichness);
						preparedStatement.setString(12, dbnew_ua_sheet);
						preparedStatement.setString(13, dbnew_u_thichness);
						preparedStatement.setString(14, dbnew_la_sheet);
						preparedStatement.setString(15, dbnew_l_thichness);
						preparedStatement.setString(16, dbmalocclusion);
						preparedStatement.setString(17, dbwfcremarks);
						preparedStatement.setString(18, dbplnremarks);
						preparedStatement.setString(19, dbcreated_at);
						preparedStatement.executeUpdate();
						pstmt2 = con.prepareStatement(
								"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
										+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId
										+ "','" + caseId + "')");
						pstmt2.executeUpdate();
						
						DispatchedScan.sendWhatsAppMessage(caseId, crm_name, doctorName, dbpatientName, dbcreated_at);
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record has been successfully updated');");
						out.println("location='Newcase1';");
						out.println("</script>");
					}
				}
			} else if (query.equals("RPTWFCCOR")) {
				preparedStatement = con.prepareStatement(
						" UPDATE repeat_case set user_id=?,wfc_remarks=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, userId);
				preparedStatement.setString(2, remarks);
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',wfccor_rpt_at=now() where Case_Id='"
							+ caseId + "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			} else if (query.equals("RPTTDP") && correction.equals("yes") && case_stage.equals("RPTTDP")) {
				preparedStatement = con.prepareStatement(
						" UPDATE repeat_case set remarks=?,user_id=? WHERE case_id='" + caseId + "' ");
				preparedStatement.setString(1, remarks);
				preparedStatement.setString(2, userId.toLowerCase());
				row = preparedStatement.executeUpdate();
				if (row > 0) {
					SQL = " update cc_crm set  Rpt_stage='" + case_stage + "',tdp_rpt_at=now(),no_of_rpt='" + no_of_rpt
							+ "' where Case_Id='" + caseId + "' ";
					pstmt1 = con.prepareStatement(SQL);
					pstmt1.executeUpdate();
					pstmt2 = con.prepareStatement(
							"INSERT INTO decision_history(decision, Remarks, date_time, stage, UserId, caseid) values('"
									+ case_stage + "','" + remarks + "' ,now(),'" + case_stage + "','" + userId + "','"
									+ caseId + "')");
					pstmt2.executeUpdate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record has been Successfully updated');");
					out.println("location='Newcase1';");
					out.println("</script>");
				}
			}
		} catch (Exception var61) {
			var61.printStackTrace();
		}

	}
}
