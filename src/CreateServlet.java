
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.ProfileVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CreateServlet extends HttpServlet {
	static final Logger LOGGER = LogManager.getLogger(CreateServlet.class);

	public CreateServlet() {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CallableStatement callable = null;

		try {
			String userid;
			String caseIdasString;
			String stageform;
			String stageform1;
			ProfileVO profile2VO;
			String stage;
			if (request.getParameter("createSubmit") != null) {
				try {
					con = LoginDAO.getConnectionDetails();
					userid = request.getParameter("username");
					caseIdasString = request.getParameter("field1");
					stageform1 = request.getParameter("field2");
					stageform1 = request.getParameter("category");
					profile2VO = LoginDAO.ProfileMapping(userid, stageform1, "Intro", 0L);
					Statement insertStmnt = con.createStatement();
					stage = "Insert into CASE_MSTR( USER_ID,initiated_by,initiated_Date,DECISION, STATUS, STAGE, NEXT_STAGE, FIELD1, FIELD2, created_date) values( '"
							+ userid + "','" + userid + "', sysdate(),'" + profile2VO.getDecisionCode() + "', '"
							+ profile2VO.getStatusCode() + "', '" + profile2VO.getStageCode() + "', '"
							+ profile2VO.getNextStage() + "', '" + caseIdasString + "', '" + stageform1
							+ "',  sysdate())";
					insertStmnt.executeUpdate(stage);
					response.setContentType("text/html");
					out.print("Values submitted!");
					request.setAttribute("username", userid);
					RequestDispatcher rd = request.getRequestDispatcher("Profile1.jsp");
					rd.include(request, response);
				} catch (SQLException var56) {
					LOGGER.info("Error At AddComment=" + var56.getMessage());
				} catch (ClassNotFoundException var57) {
					LOGGER.info("Error At AddComment=" + var57.getMessage());
				}
			}

			String decsCode;
			String decs_code;
			String updateRoutingFlag;
			String instquery;
			String updquery;
			Long caseid;
			String nextstage;
			if (request.getParameter("viewSubmit") != null) {
				try {
					con = LoginDAO.getConnectionDetails();
					userid = request.getParameter("username");
					caseIdasString = request.getParameter("case");
					caseid = Long.parseLong(caseIdasString);
					stageform1 = request.getParameter("category2");
					profile2VO = LoginDAO.ProfileMapping(userid, stageform1, "View", caseid);
					profile2VO.getStatusCode();
					profile2VO.getStageCode();
					profile2VO.getNextStage();
					profile2VO.getDecisionCode();
					ps = con.prepareStatement("select * from CASE_MSTR where USER_ID=? and CASE_ID=?");
					ps.setString(1, userid);
					ps.setLong(2, caseid);
					rs = ps.executeQuery();
					List<String> list = new ArrayList();

					while (true) {
						if (!rs.next()) {
							System.out.println("Found data in CASE_MSTR table!");
							out.close();
							break;
						}

						stage = rs.getString("CASE_ID");
						nextstage = rs.getString("DECISION");
						decsCode = rs.getString("STATUS");
						decs_code = rs.getString("STAGE");
						updateRoutingFlag = rs.getString("NEXT_STAGE");
						instquery = rs.getString("CREATED_DATE");
						list.add(stage);
						list.add(nextstage);
						list.add(decsCode);
						list.add(decs_code);
						list.add(updateRoutingFlag);
						list.add(instquery);

						for (Iterator var21 = list.iterator(); var21.hasNext(); updquery = (String) var21.next()) {
						}

						HttpSession session = request.getSession();
						session.setAttribute("List", list);
						response.sendRedirect("view2.jsp");
					}
				} catch (SQLException var60) {
					LOGGER.info("Error At AddComment=" + var60.getMessage());
				} catch (ClassNotFoundException var61) {
					LOGGER.info("Error At AddComment=" + var61.getMessage());
				}
			}

			String decision;
			if (request.getParameter("pendingSubmit") != null) {
				System.out.println("here");

				try {
					con = LoginDAO.getConnectionDetails();
					userid = request.getParameter("username");
					caseIdasString = request.getParameter("caseId");
					stageform1 = request.getParameter("NEXT_STAGE");
					System.out.println("stageform " + stageform1);
					Long caseid1 = Long.parseLong(caseIdasString);
					decision = request.getParameter("category2");
					System.out.println("userid " + userid);
					System.out.println("decision " + decision);
					System.out.println("stageform " + stageform1);
					System.out.println("caseid " + caseid1);
					String status = "";
					stage = "";
					nextstage = "";
					decsCode = "";
					decs_code = "";
					updateRoutingFlag = "";
					instquery = "";
					updquery = LoginDAO.updatecaseRouting(caseIdasString, stageform1);
					System.out.println("RoutingFlag " + updquery);
					String[] routing = updquery.split("~");
					updateRoutingFlag = routing[0];
					instquery = routing[1];
					if (instquery.equals("Y")) {
						response.setContentType("text/html");
						out.print("Not Allowed to Submit As Case is Distributed");
						request.setAttribute("username", userid);
						RequestDispatcher rd = request.getRequestDispatcher("Profile1.jsp");
						rd.include(request, response);
						out.close();
					} else {
						Statement insertStmnt = con.createStatement();
						String updquery1 = "";
						if (updateRoutingFlag.equals("Y")) {
							String decquery = "select DECS_CODE from DECISION_MASTER where DISPLAY_NAME='<DECISION>'";
							decquery = decquery.replace("<DECISION>", decision);
							System.out.println("decquery : " + decquery);
							ps = con.prepareStatement(decquery);
							rs = ps.executeQuery();
							if (rs.next()) {
								decs_code = rs.getString("DECS_CODE");
							}

							updquery1 = "select USER_ID, CASE_ID, decision, status, stage, next_stage,  created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10,initiated_Date from CASE_MSTR where CASE_ID = "
									+ caseid1;
							ps = con.prepareStatement(updquery1);
							System.out.println("updquery " + updquery1);
							rs = ps.executeQuery();
							System.out.println("rs.getFetchSize() " + rs.getFetchSize());

							while (rs.next()) {
								System.out.println("in While");
								updquery1 = "INSERT INTO CASE_MSTR_HISTORY (USER_ID, CASE_ID, decision, status, stage, next_stage, created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9,field10,initiated_Date) values('"
										+ userid + "','" + rs.getString("CASE_ID") + "','" + decs_code + "','" + status
										+ "','" + stageform1 + "','" + stageform1 + "',sysdate(),'"
										+ rs.getString("field1") + "','" + rs.getString("field1") + "','"
										+ rs.getString("field2") + "','" + rs.getString("field3") + "','"
										+ rs.getString("field4") + "','" + rs.getString("field5") + "','"
										+ rs.getString("field6") + "','" + rs.getString("field7") + "','"
										+ rs.getString("field8") + "','" + rs.getString("field9") + "',sysdate())";
								System.out.println("updquery while " + updquery1);
								insertStmnt.executeUpdate(updquery1);
							}
						} else {
							ProfileVO profileVO = LoginDAO.ProfileMapping(userid, decision, stageform1, caseid1);
							status = profileVO.getStatusCode();
							stage = profileVO.getStageCode();
							nextstage = profileVO.getNextStage();
							decsCode = profileVO.getDecisionCode();
							System.out.println(status);
							System.out.println(stage);
							System.out.println(nextstage);
							System.out.println(decsCode);
							System.out.println("userID::pendingSubmit-> " + userid);
							System.out.println("CaseID::pendingSubmit-> " + caseid1);
							System.out.println("Decision::pendingSubmit-> " + decision);
							System.out.println("updateRoutingFlag " + updateRoutingFlag);
							String instquery1 = "INSERT INTO CASE_MSTR_HISTORY (USER_ID, CASE_ID, decision, status, stage, next_stage, created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9,field10,initiated_Date) \r\nselect USER_ID, CASE_ID, decision, status, stage, next_stage,  created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10,sysdate() from CASE_MSTR where CASE_ID = "
									+ caseid1;
							System.out.println(instquery1);
							insertStmnt.executeUpdate(instquery1);
							updquery1 = "update CASE_MSTR set USER_ID='" + userid + "' , decision='" + decsCode
									+ "' , status='" + status + "' , stage='" + stage + "' , next_stage='" + nextstage
									+ "' , created_date=sysdate() WHERE CASE_ID = " + caseid1;
							System.out.println(updquery1);
							insertStmnt.executeUpdate(updquery1);
						}

						response.setContentType("text/html");
						System.out.println("Records inserted into CASE_MSTR table!");
						request.setAttribute("username", userid);
						RequestDispatcher rd = request.getRequestDispatcher("Profile1.jsp");
						rd.include(request, response);
						out.close();
					}
				} catch (SQLException var58) {
					var58.printStackTrace();
				} catch (ClassNotFoundException var59) {
					var59.printStackTrace();
				}
			}

			if (request.getParameter("ApendingSubmit") != null) {
				System.out.println("here");

				try {
					con = LoginDAO.getConnectionDetails();
					callable = null;
					userid = request.getParameter("username");
					caseIdasString = request.getParameter("caseId");
					caseid = Long.parseLong(caseIdasString);
					stageform1 = request.getParameter("NEXT_STAGE");
					System.out.println("stageform " + stageform1);
					decision = request.getParameter("category2");
					ProfileVO profile3VO = LoginDAO.ProfileMapping(userid, decision, stageform1, caseid);
					stage = profile3VO.getStatusCode();
					nextstage = profile3VO.getStageCode();
					decsCode = profile3VO.getNextStage();
					decs_code = profile3VO.getDecisionCode();
					System.out.println(stage);
					System.out.println(nextstage);
					System.out.println(decsCode);
					System.out.println(decs_code);
					System.out.println("userID::pendingSubmit-> " + userid);
					System.out.println("CaseID::pendingSubmit-> " + caseid);
					System.out.println("Decision::pendingSubmit-> " + decision);
					Statement insertStmnt = con.createStatement();
					instquery = "INSERT INTO CASE_MSTR_HISTORY (USER_ID, CASE_ID, decision, status, stage, next_stage, created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9,field10,initiated_Date) \r\nselect USER_ID, CASE_ID, decision, status, stage, next_stage, created_date, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10,sysdate() from CASE_MSTR where CASE_ID = "
							+ caseid;
					System.out.println(instquery);
					insertStmnt.executeUpdate(instquery);
					updquery = "update CASE_MSTR set USER_ID='" + userid + "' , CASE_ID='" + caseid + "' , decision='"
							+ decs_code + "' , status='" + stage + "' , stage='" + nextstage + "' , next_stage='"
							+ decsCode + "' , created_date=sysdate() WHERE CASE_ID = " + caseid;
					System.out.println(updquery);
					insertStmnt.executeUpdate(updquery);
					response.setContentType("text/html");
					System.out.println("Records inserted into CASE_MSTR table!");
					request.setAttribute("username", userid);
					RequestDispatcher rd = request.getRequestDispatcher("Profile1.jsp");
					rd.include(request, response);
					out.close();
				} catch (SQLException var54) {
					var54.printStackTrace();
				} catch (ClassNotFoundException var55) {
					var55.printStackTrace();
				}
			}
		} catch (Exception var62) {
			System.out.println(var62.getMessage());
			var62.printStackTrace();
		} finally {
			if (callable != null) {
				try {
					((CallableStatement) callable).close();
					callable = null;
				} catch (SQLException var53) {
					var53.printStackTrace();
				}
			}

			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException var52) {
					var52.printStackTrace();
				}
			}

			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (SQLException var51) {
					var51.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (SQLException var50) {
					var50.printStackTrace();
				}
			}

		}

	}

	private static Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new Date(today.getTime());
	}
}
