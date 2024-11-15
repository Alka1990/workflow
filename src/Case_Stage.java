
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.Newcase1;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Case_Stage" })
public class Case_Stage extends HttpServlet {
	static final Logger LOGGER = LogManager.getLogger(Case_Stage.class);
	private static final long serialVersionUID = 1L;

	public Case_Stage() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String n = (String) session.getAttribute("userid");
		String nprofile = (String) session.getAttribute("profile");
		request.setAttribute("username", n);
		request.setAttribute("loginusername", n);
		new ArrayList();
		Connection connection01 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet resultset01 = null;
		ResultSet resultset02 = null;
		ResultSet resultset03 = null;
		ResultSet resultset04 = null;
		ResultSet rs07 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement prestmt01 = null;
		PreparedStatement prestmt02 = null;
		PreparedStatement prestmt04 = null;
		PreparedStatement ps07 = null;
		PreparedStatement prestmnt3 = null;
		int finalini = 0;
		boolean finalPRE = false;
		boolean finalwfc = false;
		boolean finalcadbs = false;
		boolean finalpln = false;
		boolean finalupl = false;
		boolean finaldp = false;
		boolean finallab = false;
		boolean finalpck = false;
		int wfccount = 0;
		int wfcorcount = 0;
		int cadbscount = 0;
		int pckcount = 0;
		int pckcorcount = 0;
		boolean precount = false;
		boolean precorcount = false;
		int plncount = 0;
		int plncorcount = 0;
		int uplcount = 0;
		int uplcorcount = 0;
		int dpcount = 0;
		int dpcorcount = 0;
		int labcount = 0;
		int labcorcount = 0;
		int dpcorcountsk = 0;
		int inicountsk = 0;
		int dpcountsk = 0;
		boolean finaldpsk = false;
		int lbcorcountsk = 0;
		int lbcountsk = 0;
		boolean finallbsk = false;
		int pckcorcountsk = 0;
		int pckcountsk = 0;
		boolean finalpcksk = false;

		try {
			connection01 = LoginDAO.getConnectionDetails();
			String Query = " SELECT starter_case_stage,COUNT(*) AS stage_count FROM cc_crm where  holdflag <>'Y' and starter_kit='Yes'  and starter_satus='Y'  GROUP BY starter_case_stage ORDER BY starter_case_stage  ";
			String Query2 = "\r\n SELECT case_stage,COUNT(*) AS stage_count FROM cc_crm where  holdflag <>'Y' and case_stage is not NULL   GROUP BY case_stage ORDER BY case_stage";
			String Query3 = "select * from cc_crm where  holdflag ='Y'";
			LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap();
			prestmt01 = connection01.prepareStatement(Query2);
			resultset01 = prestmt01.executeQuery();

			while (resultset01.next()) {

				if (resultset01.getString("case_stage").equals("INICOR")) {
					finalini = Integer.parseInt(resultset01.getString("stage_count"));
				}

				System.out.println("INICOR: " + finalini);
				linkedHashMap.put("INITIATION CORRECTION", String.valueOf(finalini));
				if (resultset01.getString("case_stage").equals("INI")) {
					wfccount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				System.out.println("wfccount " + wfccount);
				if (resultset01.getString("case_stage").equals("WFCCOR")) {
					wfcorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finalwfc1 = wfccount + wfcorcount;
				linkedHashMap.put("WORK FLOW CHECK", String.valueOf(finalwfc1));

				if (resultset01.getString("case_stage").equals("WFC")) {
					cadbscount = Integer.parseInt(resultset01.getString("stage_count"));
				}
				System.out.println("WORK FLOW CHECK1111: " + finalwfc1);

				linkedHashMap.put("CAD BAISING SEGMENTATION", String.valueOf(cadbscount));
				if (resultset01.getString("case_stage").equals("CADBS")) {
					plncorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				System.out.println("cadbs: " + plncorcount);
				if (resultset01.getString("case_stage").equals("PLNCOR")) {
					plncount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finalpln1 = plncorcount + plncount;
				linkedHashMap.put("PLANNING", String.valueOf(finalpln1));
				System.out.println("plncorcount: " + plncorcount);
				if (resultset01.getString("case_stage").equals("PLN")) {
					uplcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("UPLCOR")) {
					uplcorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finalupl1 = uplcorcount + uplcount;
				linkedHashMap.put("UPLOAD", String.valueOf(finalupl1));
				if (resultset01.getString("case_stage").equals("UPL")) {
					linkedHashMap.put("REVIEW", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("REV")) {
					linkedHashMap.put("PENDING FOR SIGN OFF", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("QA")) {
					linkedHashMap.put("STAGING", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("STG")) {
					linkedHashMap.put("HOLLOW TAGING", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("MPT")) {
					dpcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("3DPCOR")) {
					dpcorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finaldp1 = dpcorcount + dpcount;
				linkedHashMap.put("3D PRINTING", String.valueOf(finaldp1));
				if (resultset01.getString("case_stage").equals("3DP")) {
					labcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("LABCOR")) {
					labcorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finallab1 = labcorcount + labcount;
				linkedHashMap.put("LAB", String.valueOf(finallab1));
				if (resultset01.getString("case_stage").equals("LAB")) {
					linkedHashMap.put("FINISHING QUALITY CHECK", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("FQC")) {
					pckcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("PCKCOR")) {
					pckcorcount = Integer.parseInt(resultset01.getString("stage_count"));
				}

				int finalpck1 = pckcorcount + pckcount;
				linkedHashMap.put("PACKING", String.valueOf(finalpck1));
				if (resultset01.getString("case_stage").equals("PCK")) {
					linkedHashMap.put("DISPATCH", resultset01.getString("stage_count"));
				}

				if (resultset01.getString("case_stage").equals("PCK")) {
					linkedHashMap.put("DISPATCH", resultset01.getString("stage_count"));
				}
			}

			LinkedHashMap<String, String> linkedHashMap2 = new LinkedHashMap();
			prestmt02 = connection01.prepareStatement(Query);
			resultset02 = prestmt02.executeQuery();

			ArrayList list;
			Newcase1 nc;
			while (resultset02.next()) {
				if (resultset02.getString("starter_case_stage").equals("INISTRKIT")) {
					inicountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				linkedHashMap2.put("HOLLOW TAGING", String.valueOf(inicountsk));
				System.out.println("starkit ==========> " + inicountsk);
				if (resultset02.getString("starter_case_stage").equals("MTPSTRKIT")) {
					dpcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				if (resultset02.getString("starter_case_stage").equals("3DPSTRKITCOR")) {
					dpcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				int finaldpsk1 = dpcorcountsk + dpcountsk;
				linkedHashMap2.put("3D PRINTING STARTER KIT", String.valueOf(finaldpsk1));
				if (resultset02.getString("starter_case_stage").equals("3DPSTRKIT")) {
					lbcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				if (resultset02.getString("starter_case_stage").equals("LABSTRKITCOR")) {
					lbcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				int finallbsk1 = lbcorcountsk + lbcountsk;
				linkedHashMap2.put("LAB STARTER KIT", String.valueOf(finallbsk1));
				if (resultset02.getString("starter_case_stage").equals("LABSTRKIT")) {
					linkedHashMap2.put("FINISHING QUALITY CHECK STARTER KIT", resultset02.getString("stage_count"));
				}

				if (resultset02.getString("starter_case_stage").equals("FQCSTRKIT")) {
					pckcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				if (resultset02.getString("starter_case_stage").equals("PCKSTRKITCOR")) {
					pckcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
				}

				int finalpcksk1 = pckcorcountsk + pckcountsk;
				linkedHashMap2.put("PACKING STARTER KIT", String.valueOf(finalpcksk1));
				if (resultset02.getString("starter_case_stage").equals("PCKSTRKIT")) {
					linkedHashMap2.put("DISPATCH STARTER KIT", resultset02.getString("stage_count"));
				}

				list = new ArrayList();
				prestmnt3 = connection01.prepareStatement(Query3);
				resultset03 = prestmnt3.executeQuery();

				while (resultset03.next()) {
					nc = new Newcase1();
					nc.setCaseid(resultset03.getString("case_id"));
					nc.setRdoctorname(resultset03.getString("registered_doctor"));
					nc.setCdoctorname(resultset03.getString("Doctor_Name"));
					nc.setCase_stage(resultset03.getString("case_stage"));
					nc.setCrm(resultset03.getString("crm_name"));
					list.add(nc);
				}

				request.setAttribute("holdflag", list);
				request.setAttribute("Case_stage", linkedHashMap);
				request.setAttribute("Starterkit", linkedHashMap2);
			}

			list = new ArrayList();
			pstmt = connection01.prepareStatement(
					"select case_id,Doctor_Name,Patient_Name,registered_doctor,crm_name  from cc_crm where case_stage='QA' and qa_at IS NOT NULL and concat(FLOOR(HOUR(TIMEDIFF(qa_at,now())) /24)) >8 ");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				nc = new Newcase1();
				nc.setCaseid(rs.getString("case_id"));
				nc.setRdoctorname(rs.getString("registered_doctor"));
				nc.setCdoctorname(rs.getString("Doctor_Name"));
				nc.setPatient_Name(rs.getString("Patient_Name"));
				nc.setCrm(rs.getString("crm_name"));
				list.add(nc);
			}

			request.setAttribute("pendingsgnoff", list);
			List<Newcase1> list2 = new ArrayList();
			pstmt2 = connection01.prepareStatement(
					"select case_id,Doctor_Name,Patient_Name,registered_doctor,crm_name from cc_crm where case_stage='REJ' ");
			rs2 = pstmt2.executeQuery();

			while (rs2.next()) {
				Newcase1 nc1 = new Newcase1();
				nc1.setCaseid(rs2.getString("case_id"));
				nc1.setRdoctorname(rs2.getString("registered_doctor"));
				nc1.setCdoctorname(rs2.getString("Doctor_Name"));
				nc1.setPatient_Name(rs2.getString("Patient_Name"));
				nc1.setCrm(rs2.getString("crm_name"));
				list2.add(nc1);
			}

			request.setAttribute("rejectedlist", list2);
			List<Newcase1> list3 = new ArrayList();
			pstmt3 = connection01.prepareStatement(
					"  SELECT  *  FROM cc_crm where case_stage in ('WFC') and concat(FLOOR(HOUR(TIMEDIFF(wfc_at,now())) / 24))>2 and ppf_fill='No' and  holdflag <>'Y' ORDER BY priority DESC ");
			rs3 = pstmt3.executeQuery();

			while (rs3.next()) {
				Newcase1 ppflist = new Newcase1();
				ppflist.setCaseid(rs3.getString("case_id"));
				ppflist.setRdoctorname(rs3.getString("registered_doctor"));
				ppflist.setCdoctorname(rs3.getString("Doctor_Name"));
				ppflist.setPatient_Name(rs3.getString("Patient_Name"));
				ppflist.setCrm(rs3.getString("crm_name"));
				list3.add(ppflist);
			}

			request.setAttribute("ppfpending", list3);
			String Query04 = " SELECT scan,COUNT(*) AS count FROM wisealign_workflow.cc_crm where date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(), '%m/%d/%Y') and scan is not NULL GROUP BY scan ORDER BY scan ";
			LinkedHashMap<String, String> linkedHashMap04 = new LinkedHashMap();
			prestmt04 = connection01.prepareStatement(Query04);
			resultset04 = prestmt04.executeQuery();

			while (resultset04.next()) {
				PreparedStatement pstmt1 = connection01.prepareStatement(
						" SELECT count(*) as Today,date_format(ini_at, '%m/%d/%Y' ) as my_date FROM cc_crm where date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(), '%m/%d/%Y')");
				ResultSet rs1 = pstmt1.executeQuery();

				while (rs1.next()) {
					linkedHashMap04.put("New", rs1.getString("Today"));
				}

				if (resultset04.getString("scan").equals("Scan")) {
					wfccount = Integer.parseInt(resultset04.getString("count"));
					linkedHashMap04.put("Scan", resultset04.getString("count"));
				} else if (resultset04.getString("scan").equals("Impression")) {
					wfcorcount = Integer.parseInt(resultset04.getString("count"));
					linkedHashMap04.put("Impression", resultset04.getString("count"));
				}
			}

			request.setAttribute("scanimpression", linkedHashMap04);
			RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		} catch (Exception var4908) {
			System.out.println("Error At Case_Stage Exception..." + var4908.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception var4906) {
				} finally {
					rs = null;
				}
			}

			if (rs2 != null) {
				try {
					rs2.close();
				} catch (Exception var4904) {
				} finally {
					rs2 = null;
				}
			}

			if (rs3 != null) {
				try {
					rs3.close();
				} catch (Exception var4902) {
				} finally {
					rs3 = null;
				}
			}

			if (resultset01 != null) {
				try {
					resultset01.close();
				} catch (Exception var4900) {
				} finally {
					resultset01 = null;
				}
			}

			if (resultset02 != null) {
				try {
					resultset02.close();
				} catch (Exception var4898) {
				} finally {
					resultset02 = null;
				}
			}

			if (resultset03 != null) {
				try {
					resultset03.close();
				} catch (Exception var4896) {
				} finally {
					resultset03 = null;
				}
			}

			if (resultset04 != null) {
				try {
					resultset04.close();
				} catch (Exception var4894) {
				} finally {
					resultset04 = null;
				}
			}

			if (rs07 != null) {
				try {
					((ResultSet) rs07).close();
				} catch (Exception var4892) {
				} finally {
					rs07 = null;
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception var4890) {
				} finally {
					pstmt = null;
				}
			}

			if (prestmt01 != null) {
				try {
					prestmt01.close();
				} catch (Exception var4888) {
				} finally {
					prestmt01 = null;
				}
			}

			if (prestmt02 != null) {
				try {
					prestmt02.close();
				} catch (Exception var4886) {
				} finally {
					prestmt02 = null;
				}
			}

			if (prestmt04 != null) {
				try {
					prestmt04.close();
				} catch (Exception var4884) {
				} finally {
					prestmt04 = null;
				}
			}

			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (Exception var4882) {
				} finally {
					pstmt2 = null;
				}
			}

			if (pstmt3 != null) {
				try {
					pstmt3.close();
				} catch (Exception var4880) {
				} finally {
					pstmt3 = null;
				}
			}

			if (prestmnt3 != null) {
				try {
					prestmnt3.close();
				} catch (Exception var4878) {
				} finally {
					prestmnt3 = null;
				}
			}

			if (connection01 != null) {
				try {
					connection01.close();
				} catch (Exception var4876) {
				} finally {
					connection01 = null;
				}
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
