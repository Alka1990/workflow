
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
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

@WebServlet({ "/Newcase1" })
public class Newcase1 extends HttpServlet {
	static final Logger LOGGER = LogManager.getLogger(Newcase1.class);
	private static final long serialVersionUID = 1L;

	public Newcase1() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
		String n = (String) session.getAttribute("userid");
		String crm_Name = (String) session.getAttribute("crm_Name");
		System.out.println("crm_Name = " + crm_Name);
		request.setAttribute("username", n);
		request.setAttribute("loginusername", n);
		List<com.vo.Newcase1> list = new ArrayList();
		List<com.vo.Newcase1> WFClist = new ArrayList();
		List<com.vo.Newcase1> CRMLIST = new ArrayList();
		List<com.vo.Newcase1> INIlist = new ArrayList();
		List<com.vo.Newcase1> PRElist = new ArrayList();
		List<com.vo.Newcase1> CADBSlist = new ArrayList();
		List<com.vo.Newcase1> plnlist = new ArrayList();
		List<com.vo.Newcase1> REVlist = new ArrayList();
		List<com.vo.Newcase1> QAlist = new ArrayList();
		List<com.vo.Newcase1> Stagelist = new ArrayList();
		List<com.vo.Newcase1> STGlist = new ArrayList();
		List<com.vo.Newcase1> MPTlist = new ArrayList();
		List<com.vo.Newcase1> TDPlist = new ArrayList();
		List<com.vo.Newcase1> LABlist = new ArrayList();
		List<com.vo.Newcase1> FQClist = new ArrayList();
		List<com.vo.Newcase1> DPHlist = new ArrayList();
		List<com.vo.Newcase1> StageQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> MPTQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> TDPQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> LABQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> FQCQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> DPHQueryForStarterList = new ArrayList();
		List<com.vo.Newcase1> issueList = new ArrayList();
		List<com.vo.Newcase1> sheetList = new ArrayList();
		List<com.vo.Newcase1> rptWFC = new ArrayList();
		List<com.vo.Newcase1> rptWFCCOR = new ArrayList();
		List<com.vo.Newcase1> rptPLN = new ArrayList();
		List<com.vo.Newcase1> rptLAB = new ArrayList();
		List<com.vo.Newcase1> rpt3DPLAB = new ArrayList();
		List<com.vo.Newcase1> rpt3DP = new ArrayList();
		List<com.vo.Newcase1> rpt3DP1 = new ArrayList();
		List<com.vo.Newcase1> rptFQC = new ArrayList();
		List<com.vo.Newcase1> rptPCK = new ArrayList();
		List<com.vo.Newcase1> rptCMN = new ArrayList();
		List<com.vo.Newcase1> VOList = new ArrayList();
		
//	    List<Newcase1> impressionData = new ArrayList<>();
	    
		 // starting Point //
		 	List<com.vo.Newcase1> impressionINIQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionLABQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionUplQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionPlnQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionAcceptQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionRejectQueryList = new ArrayList();
		 	List<com.vo.Newcase1> ImpressionHoldQueryList = new ArrayList();
		 	System.out.println("alka impression list == " + ImpressionUplQueryList);
		
		Connection con = null;
		ResultSet rs = null;
		ResultSet rss = null;
		ResultSet rss1 = null;
		ResultSet rss63 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		ResultSet rs5 = null;
		ResultSet rs6 = null;
		ResultSet rs7 = null;
		ResultSet rs8 = null;
		ResultSet rs9 = null;
		ResultSet rs10 = null;
		ResultSet rs11 = null;
		ResultSet rs12 = null;
		ResultSet rs13 = null;
		ResultSet rs14 = null;
		ResultSet rs15 = null;
		ResultSet rs16 = null;
		ResultSet rs17 = null;
		ResultSet rs18 = null;
		ResultSet rs19 = null;
		ResultSet rs21 = null;
		ResultSet rs22 = null;
		ResultSet rs24 = null;
		ResultSet rs25 = null;
		ResultSet rs26 = null;
		ResultSet rs27 = null;
		ResultSet rs28 = null;
		ResultSet rs29 = null;
		ResultSet rs30 = null;
		ResultSet rs31 = null;
		ResultSet rs33 = null;
		ResultSet resultSetVO = null;
		
		 // Add result set //
	 	ResultSet resultSetImpressionINIQuery = null;
	 	ResultSet resultSetImpressionLABQuery = null;
	 	ResultSet resultSetImpressionUplQuery = null;
	 	ResultSet resultSetImpressionPlnQuery = null;
	 	ResultSet resultSetImpressionAcceptQuery = null;
	 	ResultSet resultSetImpressionRejectQuery = null;
	 	ResultSet resultSetImpressionHoldQuery = null;
		

		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps11 = null;
		PreparedStatement ps63 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		PreparedStatement ps5 = null;
		PreparedStatement ps6 = null;
		PreparedStatement ps7 = null;
		PreparedStatement ps8 = null;
		PreparedStatement ps9 = null;
		PreparedStatement ps10 = null;
		PreparedStatement ps12 = null;
		PreparedStatement ps13 = null;
		PreparedStatement ps14 = null;
		PreparedStatement pssm = null;
		PreparedStatement ps15 = null;
		PreparedStatement ps16 = null;
		PreparedStatement ps17 = null;
		PreparedStatement ps18 = null;
		PreparedStatement ps20 = null;
		PreparedStatement ps21 = null;
		PreparedStatement pstmt30 = null;
		PreparedStatement pstmt31 = null;
		PreparedStatement pstmt32 = null;
		PreparedStatement pstmt33 = null;
		PreparedStatement pstmtVO = null;
		
		 //Add Prepared Statement // 
	  	PreparedStatement pstmtImpressionINIQuery = null;
	  	PreparedStatement pstmtImpressionLABQuery = null;
	  	PreparedStatement PstmtImpressionUplQuery = null;
	  	PreparedStatement PstmtImpressionPlnQuery = null;
	  	PreparedStatement PstmtImpressionAcceptQuery = null;
	  	PreparedStatement PstmtImpressionRejectQuery = null;
	  	PreparedStatement PstmtImpressionHoldQuery = null;

		try {
			con = LoginDAO.getConnectionDetails();
			String queryINI = "SELECT * FROM cc_crm where case_stage='INICOR'and holdflag <>'Y' ORDER BY priority DESC";
			String query = " SELECT * FROM cc_crm where case_stage in ('INI','WFC','PRECOR','WFCCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String querywfc = " SELECT * FROM cc_crm where case_stage='INI' and holdflag <>'Y' ORDER BY priority DESC";
			String preForQuery = "SELECT * FROM cc_crm where case_stage='PRE' and holdflag <>'Y' ORDER BY priority DESC";
			String cadForQuery = "SELECT * FROM cc_crm where case_stage in ('CADBS','PLNCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String planQuery = "SELECT * FROM cc_crm where case_stage in ('PLN','UPLCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String REVQuery = "SELECT * FROM cc_crm where case_stage='UPL' and holdflag <>'Y' ORDER BY priority DESC";
			String QAQuery = "SELECT * FROM cc_crm where case_stage='REV' and holdflag <>'Y' ORDER BY priority DESC";
			String StageQuery = "SELECT * FROM cc_crm where case_stage='QA' and holdflag <>'Y' ORDER BY priority DESC";
			String STGQuery = "SELECT * FROM cc_crm where case_stage='STG' and holdflag <>'Y' ORDER BY stg_at DESC";
			String MPTQuery = "SELECT * FROM cc_crm where case_stage in ('MPT','3DPCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String TDPQuery = "SELECT * FROM cc_crm where case_stage in ('3DP','LABCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String LABQuery = "SELECT * FROM cc_crm where case_stage='LAB' and holdflag <>'Y' ORDER BY priority DESC";
			String FQCQuery = "SELECT * FROM cc_crm where case_stage in ('FQC','PCKCOR') and holdflag <>'Y' ORDER BY priority DESC";
			String DPHQuery = "SELECT * FROM cc_crm where case_stage='PCK' and holdflag <>'Y' ORDER BY priority DESC";
			String StageQueryForStarter = " SELECT * FROM cc_crm where starter_case_stage='INISTRKIT' and starter_kit='Yes' and holdflag <>'Y'  and starter_satus<>'Y' and case_stage is not NULL ORDER BY inistrkit_at  DESC ";
			String MPTQueryForStarter = " SELECT * FROM cc_crm where starter_case_stage in ('MTPSTRKIT','3DPSTRKITCOR') and starter_kit='Yes' and starter_satus<>'Y' and holdflag <>'Y' ORDER BY priority DESC";
			String TDPQueryForStarter = "SELECT * FROM cc_crm where  starter_case_stage in ('3DPSTRKIT','LABSTRKITCOR') and starter_kit='Yes' and starter_satus<>'Y' and holdflag <>'Y' ORDER BY priority DESC";
			String LABQueryForStarter = "SELECT * FROM cc_crm where starter_case_stage='LABSTRKIT' and starter_kit='Yes' and starter_satus<>'Y' and holdflag <>'Y' ORDER BY priority DESC";
			String FQCQueryForStarter = "SELECT * FROM cc_crm where starter_case_stage in ('FQCSTRKIT','PCKSTRKITCOR') and starter_kit='Yes' and starter_satus<>'Y'  and holdflag <>'Y' ORDER BY priority DESC";
			ps = con.prepareStatement(
					" SELECT * FROM cc_crm where case_stage in ('INI','WFCCOR') and starter_kit='Yes' and starter_satus<>'Y' and holdflag <>'Y' ORDER BY priority DESC ");
			String DPHQueryForStarter = "SELECT * FROM cc_crm where starter_case_stage='PCKSTRKIT' and starter_kit='Yes' and starter_satus<>'Y' and holdflag <>'Y' ORDER BY priority DESC";
			String issueSQL = "SELECT id,name FROM issue ORDER BY name";
			String sheetSQL = "SELECT id,name  FROM sheet ORDER BY NAME";
			String RPTWFCSQL = " SELECT c.registered_doctor, c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,\tc.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,\tr.wfc_remarks,r.upper_aligner,r.lower_aligner,\tr.photos,r.malocclusion,r.wfc_remarks,r.pln_remarks,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTWFC' ORDER BY wfc_rpt_at DESC ";
			String RPTPLNSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,\tc.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,\tr.wfc_remarks,r.remarks,r.upper_aligner,r.lower_aligner,\tr.photos,r.malocclusion,r.wfc_remarks,r.pln_remarks,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTPLN' ORDER BY pln_rpt_at DESC ";
			String RPT3DPSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.pln_remarks,c.no_of_rpt,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTTDPCOR' ORDER BY tdp_rptcor_at DESC";
			String RPTTDP = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.pln_remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTTDP' ORDER BY tdp_rpt_at DESC";
			String RPTLABSQL = " SELECT distinct r.case_id,c.Rpt_stage,c.wfc_rpt_at,c.crm_name,c.pln_rpt_at,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.pln_remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTLAB' ORDER BY lab_rpt_at DESC";
			String RPTLAB3DPSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.pln_remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and  c.Rpt_stage='RPTTDP' ORDER BY tdp_rptcor_at DESC";
			String RPTFQCSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt,r.wfc_remarks,r.pln_remarks FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTFQC' ORDER BY qc_rpt_at DESC";
			String RPTPCKSQL = " SELECT c.registered_doctor,c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt,r.wfc_remarks,r.pln_remarks FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTPCK' ORDER BY pck_rpt_at DESC";
			String RPTWFCCORSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt,r.wfc_remarks,r.pln_remarks FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id and c.Rpt_stage='RPTWFCCOR'  ORDER BY wfccor_rpt_at DESC";
			String RPTCMNSQL = " SELECT c.Rpt_stage,c.wfc_rpt_at,c.pln_rpt_at,c.crm_name,c.lab_rpt_at,c.qc_rpt_at,c.pck_rpt_at,c.dispatch_rpt_at,c.no_of_rpt,r.case_id,r.Doctor_Name,r.issue,r.pre_ua_sheet,r.pre_u_thichness,r.pre_la_sheet,r.pre_l_thichness,r.new_ua_sheet,r.new_u_thichness,r.new_la_sheet,r.new_l_thichness,r.doctor_name,r.patient_name,r.wfc_remarks,r.remarks,r.pln_remarks,r.upper_aligner,r.lower_aligner,r.photos,r.malocclusion,c.no_of_rpt FROM repeat_case as r ,cc_crm as c where c.case_id=r.case_id ORDER BY rpt_id DESC";
			String VOQuery = "Select * from cc_crm where crm_name = '"+ crm_Name + "'" ;
			String ImpressionINIQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_INI'";
			String ImpressionLABQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_LAB'";
			String ImpressionUplQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_Upl'";
			String ImpressionPlnQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_Pln'";
			String ImpressionAcceptQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_Accept'";
			String ImpressionRejectQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_Reject'";
			String ImpressionHoldQuery = "SELECT * FROM wisealign_workflow.impression where decision = 'Impression_Edit'";

			ps = con.prepareStatement(queryINI);
			rs = ps.executeQuery();

			com.vo.Newcase1 nc;
			while (rs.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs.getString("case_id"));
				nc.setClinicname(rs.getString("clinic_name"));
				nc.setRdoctorname(rs.getString("registered_doctor"));
				nc.setCdoctorname(rs.getString("Doctor_Name"));
				nc.setCase_stage(rs.getString("case_stage"));
				nc.setCrm(rs.getString("crm_name"));
				nc.setPatient_Name(rs.getString("patient_Name"));
				nc.setRemark(rs.getString("remark"));
				nc.setType_request(rs.getString("type_request"));
				nc.setUser_id(rs.getString("user_id"));
				nc.setStage_at(rs.getString("inicor_at"));
				nc.setPriority(rs.getString("priority"));
				list.add(nc);
			}

			ps21 = con.prepareStatement(querywfc);
			rs29 = ps21.executeQuery();

			while (rs29.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs29.getString("case_id"));
				nc.setClinicname(rs29.getString("clinic_name"));
				nc.setRdoctorname(rs29.getString("registered_doctor"));
				nc.setCdoctorname(rs29.getString("Doctor_Name"));
				nc.setCase_stage(rs29.getString("case_stage"));
				nc.setCrm(rs29.getString("crm_name"));
				nc.setPatient_Name(rs29.getString("patient_Name"));
				nc.setRemark(rs29.getString("remark"));
				nc.setType_request(rs29.getString("type_request"));
				nc.setUser_id(rs29.getString("user_id"));
				nc.setStage_at(rs29.getString("ini_at"));
				nc.setPriority(rs29.getString("priority"));
				WFClist.add(nc);
			}

			ps1 = con.prepareStatement(query);

			for (rss1 = ps1.executeQuery(); rss1.next(); CRMLIST.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rss1.getString("case_id"));
				nc.setClinicname(rss1.getString("clinic_name"));
				nc.setRdoctorname(rss1.getString("registered_doctor"));
				nc.setCdoctorname(rss1.getString("Doctor_Name"));
				nc.setCase_stage(rss1.getString("case_stage"));
				nc.setCrm(rss1.getString("crm_name"));
				nc.setPatient_Name(rss1.getString("patient_Name"));
				nc.setRemark(rss1.getString("remark"));
				nc.setTotal_amount(rss1.getDouble("total_amount"));
				nc.setPayment_processing(rss1.getString("payment_processing"));
				nc.setPayment_mode(rss1.getString("payment_mode"));
				nc.setType_request(rss1.getString("type_request"));
				nc.setUser_id(rss1.getString("user_id"));
				nc.setPriority(rss1.getString("priority"));
				if (rss1.getString("ini_at") != null) {
					nc.setStage_at(rss1.getString("ini_at"));
				}

				if (rss1.getString("wfc_at") != null) {
					nc.setStage_at(rss1.getString("wfc_at"));
				}

				if (rss1.getString("precor_at") != null) {
					nc.setStage_at(rss1.getString("precor_at"));
				}

				if (rss1.getString("wfccor_at") != null) {
					nc.setStage_at(rss1.getString("wfccor_at"));
				}
			}

			ps11 = con.prepareStatement(queryINI);
			rss = ps11.executeQuery();

			while (rss.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rss.getString("case_id"));
				nc.setClinicname(rss.getString("clinic_name"));
				nc.setRdoctorname(rss.getString("registered_doctor"));
				nc.setCdoctorname(rss.getString("Doctor_Name"));
				nc.setCase_stage(rss.getString("case_stage"));
				nc.setCrm(rss.getString("crm_name"));
				nc.setPatient_Name(rss.getString("patient_Name"));
				nc.setRemark(rss.getString("remark"));
				nc.setType_request(rss.getString("type_request"));
				nc.setType_request(rss.getString("CREATED_DATE"));
				nc.setType_request(rss.getString("inicor_at"));
				nc.setUser_id(rss.getString("user_id"));
				nc.setStage_at(rss.getString("inicor_at"));
				nc.setPriority(rss.getString("priority"));
				INIlist.add(nc);
			}

			ps63 = con.prepareStatement(preForQuery);
			rss63 = ps63.executeQuery();

			while (rss63.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rss63.getString("case_id"));
				nc.setClinicname(rss63.getString("clinic_name"));
				nc.setRdoctorname(rss63.getString("registered_doctor"));
				nc.setCdoctorname(rss63.getString("Doctor_Name"));
				nc.setCase_stage(rss63.getString("case_stage"));
				nc.setCrm(rss63.getString("crm_name"));
				nc.setPatient_Name(rss63.getString("patient_Name"));
				nc.setRemark(rss63.getString("remark"));
				nc.setType_request(rss63.getString("type_request"));
				nc.setUser_id(rss63.getString("user_id"));
				nc.setStage_at(rss63.getString("pre_at"));
				nc.setPriority(rss63.getString("priority"));
				PRElist.add(nc);
			}

			ps3 = con.prepareStatement(cadForQuery);

			for (rs3 = ps3.executeQuery(); rs3.next(); CADBSlist.add(nc)) {
				LOGGER.info("Message cadForQuery : " + ps3.toString());
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs3.getString("case_id"));
				nc.setClinicname(rs3.getString("clinic_name"));
				nc.setRdoctorname(rs3.getString("registered_doctor"));
				nc.setCdoctorname(rs3.getString("Doctor_Name"));
				nc.setCase_stage(rs3.getString("case_stage"));
				nc.setCrm(rs3.getString("crm_name"));
				nc.setPatient_Name(rs3.getString("patient_Name"));
				nc.setRemark(rs3.getString("remark"));
				nc.setType_request(rs3.getString("type_request"));
				nc.setUser_id(rs3.getString("user_id"));
				nc.setPriority(rs3.getString("priority"));
				if (rs3.getString("plncor_at") != null) {
					nc.setStage_at(rs3.getString("plncor_at"));
				}

				if (rs3.getString("cadbs_at") != null) {
					nc.setStage_at(rs3.getString("cadbs_at"));
				}
			}

			ps4 = con.prepareStatement(planQuery);

			for (rs4 = ps4.executeQuery(); rs4.next(); plnlist.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs4.getString("case_id"));
				nc.setClinicname(rs4.getString("clinic_name"));
				nc.setRdoctorname(rs4.getString("registered_doctor"));
				nc.setCdoctorname(rs4.getString("Doctor_Name"));
				nc.setCase_stage(rs4.getString("case_stage"));
				nc.setCrm(rs4.getString("crm_name"));
				nc.setPatient_Name(rs4.getString("patient_Name"));
				nc.setRemark(rs4.getString("remark"));
				nc.setType_request(rs4.getString("type_request"));
				nc.setUser_id(rs4.getString("user_id"));
				nc.setPriority(rs4.getString("priority"));
				if (rs4.getString("pln_at") != null) {
					nc.setStage_at(rs4.getString("pln_at"));
				}

				if (rs4.getString("uplcor_at") != null) {
					nc.setStage_at(rs4.getString("uplcor_at"));
				}
			}

			ps5 = con.prepareStatement(REVQuery);
			rs5 = ps5.executeQuery();

			while (rs5.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs5.getString("case_id"));
				nc.setClinicname(rs5.getString("clinic_name"));
				nc.setRdoctorname(rs5.getString("registered_doctor"));
				nc.setCdoctorname(rs5.getString("Doctor_Name"));
				nc.setCase_stage(rs5.getString("case_stage"));
				nc.setCrm(rs5.getString("crm_name"));
				nc.setPatient_Name(rs5.getString("patient_Name"));
				nc.setRemark(rs5.getString("remark"));
				nc.setType_request(rs5.getString("type_request"));
				nc.setUser_id(rs5.getString("user_id"));
				nc.setStage_at(rs5.getString("upl_at"));
				nc.setPriority(rs5.getString("priority"));
				REVlist.add(nc);
			}

			ps6 = con.prepareStatement(QAQuery);
			rs6 = ps6.executeQuery();

			while (rs6.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs6.getString("case_id"));
				nc.setClinicname(rs6.getString("clinic_name"));
				nc.setRdoctorname(rs6.getString("registered_doctor"));
				nc.setCdoctorname(rs6.getString("Doctor_Name"));
				nc.setCase_stage(rs6.getString("case_stage"));
				nc.setCrm(rs6.getString("crm_name"));
				nc.setPatient_Name(rs6.getString("patient_Name"));
				nc.setRemark(rs6.getString("remark"));
				nc.setType_request(rs6.getString("type_request"));
				nc.setUser_id(rs6.getString("user_id"));
				nc.setStage_at(rs6.getString("rev_at"));
				nc.setPlanning_id(rs6.getString("planning_id"));
				nc.setPriority(rs6.getString("priority"));
				QAlist.add(nc);
			}

			ps7 = con.prepareStatement(StageQuery);
			rs7 = ps7.executeQuery();

			while (rs7.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs7.getString("case_id"));
				nc.setClinicname(rs7.getString("clinic_name"));
				nc.setRdoctorname(rs7.getString("registered_doctor"));
				nc.setCdoctorname(rs7.getString("Doctor_Name"));
				nc.setCase_stage(rs7.getString("case_stage"));
				nc.setCrm(rs7.getString("crm_name"));
				nc.setPatient_Name(rs7.getString("patient_Name"));
				nc.setRemark(rs7.getString("remark"));
				nc.setType_request(rs7.getString("type_request"));
				nc.setUser_id(rs7.getString("user_id"));
				nc.setStage_at(rs7.getString("qa_at"));
				nc.setPriority(rs7.getString("priority"));
				Stagelist.add(nc);
			}

			ps8 = con.prepareStatement(STGQuery);
			rs8 = ps8.executeQuery();

			while (rs8.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs8.getString("case_id"));
				nc.setClinicname(rs8.getString("clinic_name"));
				nc.setRdoctorname(rs8.getString("registered_doctor"));
				nc.setCdoctorname(rs8.getString("Doctor_Name"));
				nc.setCase_stage(rs8.getString("case_stage"));
				nc.setCrm(rs8.getString("crm_name"));
				nc.setPatient_Name(rs8.getString("patient_Name"));
				nc.setRemark(rs8.getString("remark"));
				nc.setType_request(rs8.getString("type_request"));
				nc.setCaseDate(rs8.getString("stg_at"));
				nc.setUser_id(rs8.getString("user_id"));
				nc.setStage_at(rs8.getString("stg_at"));
				nc.setPriority(rs8.getString("priority"));
				STGlist.add(nc);
			}

			ps9 = con.prepareStatement(MPTQuery);

			for (rs9 = ps9.executeQuery(); rs9.next(); MPTlist.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs9.getString("case_id"));
				nc.setClinicname(rs9.getString("clinic_name"));
				nc.setRdoctorname(rs9.getString("registered_doctor"));
				nc.setCdoctorname(rs9.getString("Doctor_Name"));
				nc.setCase_stage(rs9.getString("case_stage"));
				nc.setCrm(rs9.getString("crm_name"));
				nc.setPatient_Name(rs9.getString("patient_Name"));
				nc.setRemark(rs9.getString("remark"));
				nc.setType_request(rs9.getString("type_request"));
				nc.setUser_id(rs9.getString("user_id"));
				nc.setPriority(rs9.getString("priority"));
				if (rs9.getString("mpt_at") != null) {
					nc.setStage_at(rs9.getString("mpt_at"));
				}

				if (rs9.getString("3dpcor_at") != null) {
					nc.setStage_at(rs9.getString("3dpcor_at"));
				}
			}

			ps10 = con.prepareStatement(TDPQuery);

			for (rs10 = ps10.executeQuery(); rs10.next(); TDPlist.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs10.getString("case_id"));
				nc.setClinicname(rs10.getString("clinic_name"));
				nc.setRdoctorname(rs10.getString("registered_doctor"));
				nc.setCdoctorname(rs10.getString("Doctor_Name"));
				nc.setCase_stage(rs10.getString("case_stage"));
				nc.setCrm(rs10.getString("crm_name"));
				nc.setPatient_Name(rs10.getString("patient_Name"));
				nc.setType_request(rs10.getString("type_request"));
				nc.setRemark(rs10.getString("remark"));
				nc.setUser_id(rs10.getString("user_id"));
				nc.setPriority(rs10.getString("priority"));
				if (rs10.getString("3dp_at") != null) {
					nc.setStage_at(rs10.getString("3dp_at"));
				}

				if (rs10.getString("labcor_at") != null) {
					nc.setStage_at(rs10.getString("labcor_at"));
				}
			}

			ps12 = con.prepareStatement(LABQuery);
			rs11 = ps12.executeQuery();

			while (rs11.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs11.getString("case_id"));
				nc.setClinicname(rs11.getString("clinic_name"));
				nc.setRdoctorname(rs11.getString("registered_doctor"));
				nc.setCdoctorname(rs11.getString("Doctor_Name"));
				nc.setCase_stage(rs11.getString("case_stage"));
				nc.setCrm(rs11.getString("crm_name"));
				nc.setPatient_Name(rs11.getString("patient_Name"));
				nc.setRemark(rs11.getString("remark"));
				nc.setType_request(rs11.getString("type_request"));
				nc.setUser_id(rs11.getString("user_id"));
				nc.setStage_at(rs11.getString("lab_at"));
				nc.setPriority(rs11.getString("priority"));
				LABlist.add(nc);
			}

			System.out.println("ps12===> " + ps12);
			ps13 = con.prepareStatement(FQCQuery);

			for (rs12 = ps13.executeQuery(); rs12.next(); FQClist.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs12.getString("case_id"));
				nc.setClinicname(rs12.getString("clinic_name"));
				nc.setRdoctorname(rs12.getString("registered_doctor"));
				nc.setCdoctorname(rs12.getString("Doctor_Name"));
				nc.setCase_stage(rs12.getString("case_stage"));
				nc.setCrm(rs12.getString("crm_name"));
				nc.setPatient_Name(rs12.getString("patient_Name"));
				nc.setRemark(rs12.getString("remark"));
				nc.setType_request(rs12.getString("type_request"));
				nc.setUser_id(rs12.getString("user_id"));
				nc.setPriority(rs12.getString("priority"));
				if (rs12.getString("fqc_at") != null) {
					nc.setStage_at(rs12.getString("fqc_at"));
				}

				if (rs12.getString("pckcor_at") != null) {
					nc.setStage_at(rs12.getString("pckcor_at"));
				}
			}

			ps14 = con.prepareStatement(DPHQuery);
			rs13 = ps14.executeQuery();

			while (rs13.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs13.getString("case_id"));
				nc.setClinicname(rs13.getString("clinic_name"));
				nc.setRdoctorname(rs13.getString("registered_doctor"));
				nc.setCdoctorname(rs13.getString("Doctor_Name"));
				nc.setCase_stage(rs13.getString("case_stage"));
				nc.setCrm(rs13.getString("crm_name"));
				nc.setPatient_Name(rs13.getString("patient_Name"));
				nc.setRemark(rs13.getString("remark"));
				nc.setType_request(rs13.getString("type_request"));
				nc.setUser_id(rs13.getString("user_id"));
				nc.setStage_at(rs13.getString("pck_at"));
				nc.setPriority(rs13.getString("priority"));
				System.out.println("Rdoctorname" + rs13.getString("registered_doctor"));
				DPHlist.add(nc);
			}

			pssm = con.prepareStatement(StageQueryForStarter);
			rs14 = pssm.executeQuery();

			while (rs14.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs14.getString("case_id"));
				nc.setClinicname(rs14.getString("clinic_name"));
				nc.setRdoctorname(rs14.getString("registered_doctor"));
				nc.setCdoctorname(rs14.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs14.getString("starter_case_stage"));
				nc.setCrm(rs14.getString("crm_name"));
				nc.setPatient_Name(rs14.getString("patient_Name"));
				nc.setRemark(rs14.getString("remark"));
				nc.setCaseDate(rs14.getString("inistrkit_at"));
				nc.setUser_id(rs14.getString("user_id"));
				nc.setStage_at(rs14.getString("inistrkit_at"));
				nc.setPriority(rs14.getString("priority"));
				StageQueryForStarterList.add(nc);
			}

			ps15 = con.prepareStatement(MPTQueryForStarter);

			for (rs15 = ps15.executeQuery(); rs15.next(); MPTQueryForStarterList.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs15.getString("case_id"));
				nc.setClinicname(rs15.getString("clinic_name"));
				nc.setRdoctorname(rs15.getString("registered_doctor"));
				nc.setCdoctorname(rs15.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs15.getString("starter_case_stage"));
				nc.setCrm(rs15.getString("crm_name"));
				nc.setPatient_Name(rs15.getString("patient_Name"));
				nc.setRemark(rs15.getString("remark"));
				nc.setUser_id(rs15.getString("user_id"));
				nc.setPriority(rs15.getString("priority"));
				if (rs15.getString("mtpstrkit_at") != null) {
					nc.setStage_at(rs15.getString("mtpstrkit_at"));
				}

				if (rs15.getString("3dpstrkitcor_at") != null) {
					nc.setStage_at(rs15.getString("3dpstrkitcor_at"));
				}
			}

			ps16 = con.prepareStatement(TDPQueryForStarter);

			for (rs16 = ps16.executeQuery(); rs16.next(); TDPQueryForStarterList.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs16.getString("case_id"));
				nc.setClinicname(rs16.getString("clinic_name"));
				nc.setRdoctorname(rs16.getString("registered_doctor"));
				nc.setCdoctorname(rs16.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs16.getString("starter_case_stage"));
				nc.setCrm(rs16.getString("crm_name"));
				nc.setPatient_Name(rs16.getString("patient_Name"));
				nc.setRemark(rs16.getString("remark"));
				nc.setUser_id(rs16.getString("user_id"));
				nc.setPriority(rs16.getString("priority"));
				if (rs16.getString("labstrkitcor_at") != null) {
					nc.setStage_at(rs16.getString("labstrkitcor_at"));
				}

				if (rs16.getString("3dpstrkit_at") != null) {
					nc.setStage_at(rs16.getString("3dpstrkit_at"));
				}
			}

			ps17 = con.prepareStatement(LABQueryForStarter);
			rs17 = ps17.executeQuery();

			while (rs17.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs17.getString("case_id"));
				nc.setClinicname(rs17.getString("clinic_name"));
				nc.setRdoctorname(rs17.getString("registered_doctor"));
				nc.setCdoctorname(rs17.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs17.getString("starter_case_stage"));
				nc.setCrm(rs17.getString("crm_name"));
				nc.setPatient_Name(rs17.getString("patient_Name"));
				nc.setRemark(rs17.getString("remark"));
				nc.setUser_id(rs17.getString("user_id"));
				nc.setStage_at(rs17.getString("labstrkit_at"));
				nc.setPriority(rs17.getString("priority"));
				LABQueryForStarterList.add(nc);
			}

			ps18 = con.prepareStatement(FQCQueryForStarter);

			for (rs18 = ps18.executeQuery(); rs18.next(); FQCQueryForStarterList.add(nc)) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs18.getString("case_id"));
				nc.setClinicname(rs18.getString("clinic_name"));
				nc.setRdoctorname(rs18.getString("registered_doctor"));
				nc.setCdoctorname(rs18.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs18.getString("starter_case_stage"));
				nc.setCrm(rs18.getString("crm_name"));
				nc.setPatient_Name(rs18.getString("patient_Name"));
				nc.setRemark(rs18.getString("remark"));
				nc.setUser_id(rs18.getString("user_id"));
				nc.setPriority(rs18.getString("priority"));
				if (rs18.getString("fqcstrkit_at") != null) {
					nc.setStage_at(rs18.getString("fqcstrkit_at"));
				}

				if (rs18.getString("pckstrkitcor_at") != null) {
					nc.setStage_at(rs18.getString("pckstrkitcor_at"));
				}
			}

			ps20 = con.prepareStatement(DPHQueryForStarter);
			rs19 = ps20.executeQuery();

			while (rs19.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(rs19.getString("case_id"));
				nc.setClinicname(rs19.getString("clinic_name"));
				nc.setRdoctorname(rs19.getString("registered_doctor"));
				nc.setCdoctorname(rs19.getString("Doctor_Name"));
				nc.setStarter_case_stage(rs19.getString("starter_case_stage"));
				nc.setCrm(rs19.getString("crm_name"));
				nc.setPatient_Name(rs19.getString("patient_Name"));
				nc.setRemark(rs19.getString("remark"));
				nc.setUser_id(rs19.getString("user_id"));
				nc.setStage_at(rs19.getString("pckstrkit_at"));
				nc.setPriority(rs19.getString("priority"));
				DPHQueryForStarterList.add(nc);
			}

			PreparedStatement pstmtIssue = con.prepareStatement(issueSQL);
			rs21 = pstmtIssue.executeQuery();

			while (rs21.next()) {
				com.vo.Newcase1 issue = new com.vo.Newcase1();
				issue.setIssueid(rs21.getString("id"));
				issue.setIssuename(rs21.getString("name"));
				issueList.add(issue);
			}

			PreparedStatement pstmtsheet = con.prepareStatement(sheetSQL);
			rs22 = pstmtsheet.executeQuery();

			while (rs22.next()) {
				com.vo.Newcase1 sheet = new com.vo.Newcase1();
				sheet.setSheetId(rs22.getString("id"));
				sheet.setSheetname(rs22.getString("name"));
				sheetList.add(sheet);
			}

			PreparedStatement pstmt24 = con.prepareStatement(RPTWFCSQL);
			rs24 = pstmt24.executeQuery();

			while (rs24.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs24.getString("r.case_id"));
//				rpt.setCdoctorname(rs24.getString("r.Doctor_Name"));
				rpt.setRdoctorname(rs24.getString("c.registered_doctor"));
				rpt.setCdoctorname(rs24.getString("r.Doctor_Name"));
				System.out.println("rdoc = " + rs24.getString("r.Doctor_Name"));
				System.out.println("registered_doctor = " + rs24.getString("c.registered_doctor"));
//				rpt.setRdoctorname(rs24.getString("c.registered_doctor"));
				
				rpt.setPatient_Name(rs24.getString("r.patient_name"));
				rpt.setCrm(rs24.getString("c.crm_name"));
				rpt.setIssueid(rs24.getString("r.issue"));
				rpt.setLower_aligner(rs24.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs24.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs24.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs24.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs24.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs24.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs24.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs24.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs24.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs24.getString("r.new_l_thichness"));
				rpt.setPhotos(rs24.getString("r.photos"));
				rpt.setMalocclusion(rs24.getString("r.malocclusion"));
//				rpt.setWfc_remarks(rs24.getString("r.wfc_remarks"));
				rpt.setWfc_remarks(encodeURL(rs24.getString("r.wfc_remarks")));

				System.out.println("rdoctor = " + rpt.getRdoctorname());
				rpt.setRemark(rs24.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs24.getString("c.no_of_rpt"));
				rptWFC.add(rpt);
				System.out.println("rpt = " + pstmt24);
			}

			PreparedStatement pstmt25 = con.prepareStatement(RPTPLNSQL);
			rs25 = pstmt25.executeQuery();

			while (rs25.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs25.getString("r.case_id"));
				rpt.setCdoctorname(rs25.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs25.getString("r.patient_name"));
				rpt.setCrm(rs25.getString("c.crm_name"));
				rpt.setIssueid(rs25.getString("r.issue"));
				rpt.setLower_aligner(rs25.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs25.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs25.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs25.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs25.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs25.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs25.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs25.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs25.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs25.getString("r.new_l_thichness"));
				rpt.setPhotos(rs25.getString("r.photos"));
				rpt.setMalocclusion(rs25.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs25.getString("r.wfc_remarks"));
				rpt.setRemark(rs25.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs25.getString("c.no_of_rpt"));
				rptPLN.add(rpt);
			}

			PreparedStatement pstmt26 = con.prepareStatement(RPTLABSQL);
			rs26 = pstmt26.executeQuery();

			while (rs26.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs26.getString("r.case_id"));
				rpt.setCdoctorname(rs26.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs26.getString("r.patient_name"));
				rpt.setCrm(rs26.getString("c.crm_name"));
				rpt.setIssueid(rs26.getString("r.issue"));
				rpt.setLower_aligner(rs26.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs26.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs26.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs26.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs26.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs26.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs26.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs26.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs26.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs26.getString("r.new_l_thichness"));
				rpt.setPhotos(rs26.getString("r.photos"));
				rpt.setMalocclusion(rs26.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs26.getString("r.wfc_remarks"));
				rpt.setRemark(rs26.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs26.getString("c.no_of_rpt"));
				rptLAB.add(rpt);
			}

			pstmt32 = con.prepareStatement(RPTLAB3DPSQL);
			ResultSet rs32 = pstmt32.executeQuery();

			while (rs32.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs32.getString("r.case_id"));
				rpt.setCdoctorname(rs32.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs32.getString("r.patient_name"));
				rpt.setCrm(rs32.getString("c.crm_name"));
				rpt.setIssueid(rs32.getString("r.issue"));
				rpt.setLower_aligner(rs32.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs32.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs32.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs32.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs32.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs32.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs32.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs32.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs32.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs32.getString("r.new_l_thichness"));
				rpt.setPhotos(rs32.getString("r.photos"));
				rpt.setMalocclusion(rs32.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs32.getString("r.wfc_remarks"));
				rpt.setRemark(rs32.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs32.getString("c.no_of_rpt"));
				rpt3DPLAB.add(rpt);
			}

			PreparedStatement pstmt27 = con.prepareStatement(RPTFQCSQL);
			rs27 = pstmt27.executeQuery();

			while (rs27.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs27.getString("r.case_id"));
				rpt.setCdoctorname(rs27.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs27.getString("r.patient_name"));
				rpt.setCrm(rs27.getString("c.crm_name"));
				rpt.setIssueid(rs27.getString("r.issue"));
				rpt.setLower_aligner(rs27.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs27.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs27.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs27.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs27.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs27.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs27.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs27.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs27.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs27.getString("r.new_l_thichness"));
				rpt.setPhotos(rs27.getString("r.photos"));
				rpt.setMalocclusion(rs27.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs27.getString("r.wfc_remarks"));
				rpt.setRemark(rs27.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs27.getString("c.no_of_rpt"));
				rptFQC.add(rpt);
			}

			PreparedStatement pstmt28 = con.prepareStatement(RPTPCKSQL);
			rs28 = pstmt28.executeQuery();

			while (rs28.next()) {
				com.vo.Newcase1 rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs28.getString("r.case_id"));
//				rpt.setCdoctorname(rs28.getString("r.Doctor_Name"));
				rpt.setRdoctorname(rs28.getString("c.registered_doctor"));
				rpt.setCdoctorname(rs28.getString("r.Doctor_Name"));
				System.out.println("rdoc = " + rs28.getString("r.Doctor_Name"));
				System.out.println("registered_doctor = " + rs28.getString("c.registered_doctor"));
				rpt.setPatient_Name(rs28.getString("r.patient_name"));
				rpt.setCrm(rs28.getString("c.crm_name"));
				rpt.setIssueid(rs28.getString("r.issue"));
				rpt.setLower_aligner(rs28.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs28.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs28.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs28.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs28.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs28.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs28.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs28.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs28.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs28.getString("r.new_l_thichness"));
				rpt.setPhotos(rs28.getString("r.photos"));
				rpt.setMalocclusion(rs28.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs28.getString("r.wfc_remarks"));
				rpt.setRemark(rs28.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs28.getString("c.no_of_rpt"));
				rptPCK.add(rpt);
			}

			PreparedStatement pstmt29 = con.prepareStatement(RPTWFCCORSQL);
			rs29 = pstmt29.executeQuery();

			com.vo.Newcase1 rpt;
			while (rs29.next()) {
				rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs29.getString("r.case_id"));
				rpt.setCdoctorname(rs29.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs29.getString("r.patient_name"));
				rpt.setCrm(rs29.getString("c.crm_name"));
				rpt.setIssueid(rs29.getString("r.issue"));
				rpt.setLower_aligner(rs29.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs29.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs29.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs29.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs29.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs29.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs29.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs29.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs29.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs29.getString("r.new_l_thichness"));
				rpt.setPhotos(rs29.getString("r.photos"));
				rpt.setMalocclusion(rs29.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs29.getString("r.wfc_remarks"));
				rpt.setRemark(rs29.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs29.getString("c.no_of_rpt"));
				rptWFCCOR.add(rpt);
			}

			pstmt30 = con.prepareStatement(RPT3DPSQL);
			rs30 = pstmt30.executeQuery();

			while (rs30.next()) {
				rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs30.getString("r.case_id"));
				rpt.setCdoctorname(rs30.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs30.getString("r.patient_name"));
				rpt.setCrm(rs30.getString("c.crm_name"));
				rpt.setIssueid(rs30.getString("r.issue"));
				rpt.setLower_aligner(rs30.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs30.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs30.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs30.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs30.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs30.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs30.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs30.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs30.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs30.getString("r.new_l_thichness"));
				rpt.setPhotos(rs30.getString("r.photos"));
				rpt.setMalocclusion(rs30.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs30.getString("r.wfc_remarks"));
				rpt.setRemark(rs30.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs30.getString("c.no_of_rpt"));
				rpt3DP.add(rpt);
			}

			pstmt31 = con.prepareStatement(RPTTDP);
			rs31 = pstmt31.executeQuery();

			while (rs31.next()) {
				rpt = new com.vo.Newcase1();
				rpt.setCaseid(rs31.getString("r.case_id"));
				rpt.setCdoctorname(rs31.getString("r.Doctor_Name"));
				rpt.setPatient_Name(rs31.getString("r.patient_name"));
				rpt.setCrm(rs31.getString("c.crm_name"));
				rpt.setIssueid(rs31.getString("r.issue"));
				rpt.setLower_aligner(rs31.getString("r.lower_aligner"));
				rpt.setUpper_aligner(rs31.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs31.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs31.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs31.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs31.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs31.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs31.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs31.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs31.getString("r.new_l_thichness"));
				rpt.setPhotos(rs31.getString("r.photos"));
				rpt.setMalocclusion(rs31.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs31.getString("r.wfc_remarks"));
				rpt.setRemark(rs31.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs31.getString("c.no_of_rpt"));
				rpt3DP1.add(rpt);
			}

			pstmt33 = con.prepareStatement(RPTCMNSQL);
			rs33 = pstmt33.executeQuery();

			while (rs33.next()) {
				rpt = new com.vo.Newcase1();
				rpt.setIssueid(rs33.getString("r.issue"));
				rpt.setLower_aligner(rs33.getString("r.lower_aligner"));
				rpt.setCrm(rs33.getString("c.crm_name"));
				rpt.setLower_aligner(rs33.getString("c.crm_name"));
				rpt.setUpper_aligner(rs33.getString("r.upper_aligner"));
				rpt.setPre_ua_sheet(rs33.getString("r.pre_ua_sheet"));
				rpt.setPre_u_thichness(rs33.getString("r.pre_u_thichness"));
				rpt.setPre_la_sheet(rs33.getString("r.pre_la_sheet"));
				rpt.setPre_l_thichness(rs33.getString("r.pre_l_thichness"));
				rpt.setNew_ua_sheet(rs33.getString("r.new_ua_sheet"));
				rpt.setNew_u_thichness(rs33.getString("r.new_u_thichness"));
				rpt.setNew_la_sheet(rs33.getString("r.new_la_sheet"));
				rpt.setNew_l_thichness(rs33.getString("r.new_l_thichness"));
				rpt.setPhotos(rs33.getString("r.photos"));
				rpt.setMalocclusion(rs33.getString("r.malocclusion"));
				rpt.setWfc_remarks(rs33.getString("r.wfc_remarks"));
				rpt.setRemark(rs33.getString("r.pln_remarks"));
				rpt.setNo_of_rpt(rs33.getString("c.no_of_rpt"));
				rptCMN.add(rpt);
			}


			pstmtVO = con.prepareStatement(VOQuery);
			resultSetVO = pstmtVO.executeQuery();

			while (resultSetVO.next()) {
				nc = new com.vo.Newcase1();
				nc.setCaseid(resultSetVO.getString("case_id"));
				nc.setClinicname(resultSetVO.getString("clinic_name"));
				nc.setRdoctorname(resultSetVO.getString("registered_doctor"));
				nc.setCdoctorname(resultSetVO.getString("Doctor_Name"));
				nc.setStarter_case_stage(resultSetVO.getString("starter_case_stage"));
				nc.setCrm(resultSetVO.getString("crm_name"));
				nc.setPatient_Name(resultSetVO.getString("patient_Name"));
				nc.setRemark(resultSetVO.getString("remark"));
				nc.setUser_id(resultSetVO.getString("user_id"));
				nc.setStage_at(resultSetVO.getString("pckstrkit_at"));
				nc.setPriority(resultSetVO.getString("priority"));
				nc.setType_request(resultSetVO.getString("type_request"));
				nc.setCase_stage(resultSetVO.getString("case_stage"));

				VOList.add(nc);
			}
			
			
			
			
			
			pstmtImpressionINIQuery = con.prepareStatement(ImpressionINIQuery);
			resultSetImpressionINIQuery = pstmtImpressionINIQuery.executeQuery();
			System.out.println("resultSetImpressionINIQuery===> " + resultSetImpressionINIQuery.toString());
			while (resultSetImpressionINIQuery.next()) {
				com.vo.Newcase1 impression = new com.vo.Newcase1();

//				Newcase1  impression = new Newcase1();
//			private int impressionId;
//		    private String senderName;
//		    private String receiverName;
//		    private String trackingId;
//		    private String location;
//		    private Timestamp impressionReceivedDate;
//		    private String impressionUser;
//		    private Timestamp impressionAt;
//		    private String labUser;
//		    private Timestamp labAt;
//		    private String uplUser;
//		    private Timestamp uplAt;
//		    private String plnUser;
//		    private Timestamp plnAt;
//		    private String decision;
//		    private String remarks;
//		    private long caseId;
//		    private String patientName;
//		    private String doctorName;
//		    private String crmName;
//		    private String caseType;
//		    private String specialRemarks;

			impression.setImpressionId(resultSetImpressionINIQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionINIQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionINIQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionINIQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionINIQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionINIQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionINIQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionINIQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionINIQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionINIQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionINIQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionINIQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionINIQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionINIQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionINIQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionINIQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionINIQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionINIQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionINIQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionINIQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionINIQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionINIQuery.getString("Special_Remarks"));
			
			impressionINIQueryList.add(impression);
			
		}
		
			

			 System.out.println("pstmtImpressionINIQuery===> " + pstmtImpressionINIQuery.toString());
		
		pstmtImpressionLABQuery = con.prepareStatement(ImpressionLABQuery);
		resultSetImpressionLABQuery = pstmtImpressionLABQuery.executeQuery();
		System.out.print("divya");
		while (resultSetImpressionLABQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();
			

			impression.setImpressionId(resultSetImpressionLABQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionLABQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionLABQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionLABQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionLABQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionLABQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionLABQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionLABQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionLABQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionLABQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionLABQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionLABQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionLABQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionLABQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionLABQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionLABQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionLABQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionLABQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionLABQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionLABQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionLABQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionLABQuery.getString("Special_Remarks"));
			
			
			ImpressionLABQueryList.add(impression);
			
		}
		
		PstmtImpressionUplQuery = con.prepareStatement(ImpressionUplQuery);
		resultSetImpressionUplQuery = PstmtImpressionUplQuery.executeQuery();

		while (resultSetImpressionUplQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();

			impression.setImpressionId(resultSetImpressionUplQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionUplQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionUplQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionUplQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionUplQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionUplQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionUplQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionUplQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionUplQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionUplQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionUplQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionUplQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionUplQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionUplQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionUplQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionUplQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionUplQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionUplQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionUplQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionUplQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionUplQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionUplQuery.getString("Special_Remarks"));
			
			
			
			ImpressionUplQueryList.add(impression);
			
		}
		
		PstmtImpressionPlnQuery = con.prepareStatement(ImpressionPlnQuery);
		resultSetImpressionPlnQuery = PstmtImpressionPlnQuery.executeQuery();
		System.out.print("divya");
		while (resultSetImpressionPlnQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();

			impression.setImpressionId(resultSetImpressionPlnQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionPlnQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionPlnQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionPlnQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionPlnQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionPlnQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionPlnQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionPlnQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionPlnQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionPlnQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionPlnQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionPlnQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionPlnQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionPlnQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionPlnQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionPlnQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionPlnQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionPlnQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionPlnQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionPlnQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionPlnQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionPlnQuery.getString("Special_Remarks"));
			
			
			ImpressionPlnQueryList.add(impression);
			
		}
		
		PstmtImpressionAcceptQuery = con.prepareStatement(ImpressionAcceptQuery);
		resultSetImpressionAcceptQuery = PstmtImpressionAcceptQuery.executeQuery();
		System.out.print("divya");
		while (resultSetImpressionAcceptQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();

			impression.setImpressionId(resultSetImpressionAcceptQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionAcceptQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionAcceptQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionAcceptQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionAcceptQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionAcceptQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionAcceptQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionAcceptQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionAcceptQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionAcceptQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionAcceptQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionAcceptQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionAcceptQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionAcceptQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionAcceptQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionAcceptQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionAcceptQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionAcceptQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionAcceptQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionAcceptQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionAcceptQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionAcceptQuery.getString("Special_Remarks"));
			
			ImpressionAcceptQueryList.add(impression);
			
		}
		
		PstmtImpressionRejectQuery = con.prepareStatement(ImpressionRejectQuery);
		resultSetImpressionRejectQuery = PstmtImpressionRejectQuery.executeQuery();
		System.out.print("divya");
		while (resultSetImpressionRejectQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();

			impression.setImpressionId(resultSetImpressionRejectQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionRejectQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionRejectQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionRejectQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionRejectQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionRejectQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionRejectQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionRejectQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionRejectQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionRejectQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionRejectQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionRejectQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionRejectQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionRejectQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionRejectQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionRejectQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionRejectQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionRejectQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionRejectQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionRejectQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionRejectQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionRejectQuery.getString("Special_Remarks"));
			
			ImpressionRejectQueryList.add(impression);
			
		}
		
		PstmtImpressionHoldQuery = con.prepareStatement(ImpressionHoldQuery);
		resultSetImpressionHoldQuery = PstmtImpressionHoldQuery.executeQuery();
		System.out.print("divya");
		while (resultSetImpressionHoldQuery.next()) {
			com.vo.Newcase1 impression = new com.vo.Newcase1();

			impression.setImpressionId(resultSetImpressionHoldQuery.getLong("impression_id"));
			impression.setSenderName(resultSetImpressionHoldQuery.getString("sender_name"));
			impression.setReceiverName(resultSetImpressionHoldQuery.getString("receiver_name"));
			impression.setTrackingId(resultSetImpressionHoldQuery.getString("tracking_id"));
			impression.setLocation(resultSetImpressionHoldQuery.getString("location"));
//			impression.setImpressionReceivedDate(resultSetImpressionHoldQuery.getString("impression_received_date"));
			impression.setImpressionUser(resultSetImpressionHoldQuery.getString("impression_user"));
//			impression.setImpressionAt(resultSetImpressionHoldQuery.getString("impression_at"));
			impression.setLabUser(resultSetImpressionHoldQuery.getString("lab_user"));
//			impression.setLabAt(resultSetImpressionHoldQuery.getString("lab_at"));
			impression.setUplUser(resultSetImpressionHoldQuery.getString("upl_user"));
//			impression.setUplAt(resultSetImpressionHoldQuery.getString("upl_at"));
			impression.setPlnUser(resultSetImpressionHoldQuery.getString("pln_user"));
//			impression.setPlnAt(resultSetImpressionHoldQuery.getString("pln_at"));
			impression.setDecision(resultSetImpressionHoldQuery.getString("decision"));
			impression.setRemarks(resultSetImpressionHoldQuery.getString("remarks"));
			impression.setCaseId(resultSetImpressionHoldQuery.getLong("case_id"));
			impression.setPatientName(resultSetImpressionHoldQuery.getString("patient_name"));
			impression.setDoctorName(resultSetImpressionHoldQuery.getString("doctor_name"));
			impression.setCrmName(resultSetImpressionHoldQuery.getString("crm_name"));
			impression.setCaseType(resultSetImpressionHoldQuery.getString("caseType"));
			impression.setSpecialRemarks(resultSetImpressionHoldQuery.getString("Special_Remarks"));
			
			ImpressionHoldQueryList.add(impression);
			
		}
			
			request.setAttribute("issuelist", issueList);
			request.setAttribute("sheetList", sheetList);
			request.setAttribute("rptWFC", rptWFC);
			request.setAttribute("rptPLN", rptPLN);
			request.setAttribute("rptLAB", rptLAB);
			request.setAttribute("rpt3DPLAB", rpt3DPLAB);
			request.setAttribute("rpt3DP", rpt3DP);
			request.setAttribute("rpt3DP1", rpt3DP1);
			request.setAttribute("rptFQC", rptFQC);
			request.setAttribute("rptPCK", rptPCK);
			request.setAttribute("rptWFCCOR", rptWFCCOR);
			session.setAttribute("rptCMN", rptCMN);
			request.setAttribute("WFClist", WFClist);
			request.setAttribute("DPHlist", DPHlist);
			request.setAttribute("FQClist", FQClist);
			request.setAttribute("CADBSlist", CADBSlist);
			request.setAttribute("PRElist", PRElist);
			request.setAttribute("INIlist", INIlist);
			request.setAttribute("newcaselist", list);
			request.setAttribute("CRMLIST", CRMLIST);
			request.setAttribute("plnlist", plnlist);
			request.setAttribute("REVlist", REVlist);
			request.setAttribute("QAlist", QAlist);
			request.setAttribute("Stagelist", Stagelist);
			request.setAttribute("STGlist", STGlist);
			request.setAttribute("MPTlist", MPTlist);
			request.setAttribute("TDPlist", TDPlist);
			request.setAttribute("LABlist", LABlist);
			request.setAttribute("StageQueryForStarterList", StageQueryForStarterList);
			request.setAttribute("MPTQueryForStarterList", MPTQueryForStarterList);
			request.setAttribute("TDPQueryForStarterList", TDPQueryForStarterList);
			request.setAttribute("LABQueryForStarterList", LABQueryForStarterList);
			request.setAttribute("FQCQueryForStarterList", FQCQueryForStarterList);
			request.setAttribute("DPHQueryForStarterList", DPHQueryForStarterList);
			request.setAttribute("VOList", VOList);
			
   			System.out.print("divya");
   			request.setAttribute("impressionINIQueryList", impressionINIQueryList);
   			request.setAttribute("ImpressionLABQueryList", ImpressionLABQueryList);
   			request.setAttribute("ImpressionUplQueryList", ImpressionUplQueryList);
   			request.setAttribute("ImpressionPlnQueryList", ImpressionPlnQueryList);
   			request.setAttribute("ImpressionAcceptList", ImpressionAcceptQueryList);
   			request.setAttribute("ImpressionRejectQueryList", ImpressionRejectQueryList);
   			request.setAttribute("ImpressionHoldQueryList", ImpressionHoldQueryList);
   			

   			System.out.println("list12 = " + impressionINIQueryList.size());
   			System.out.println("list123 = " + ImpressionLABQueryList.size()); 

   			
   			
   			
			System.out.println("list = " + VOList);
			RequestDispatcher rd = request.getRequestDispatcher("newcase1.jsp");
			rd.forward(request, response);
		} catch (Exception var9166) {
			LOGGER.info("Error At Newcase1=" + var9166.getMessage());
			var9166.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception var9164) {
				} finally {
					ps = null;
				}
			}

			if (ps1 != null) {
				try {
					ps1.close();
				} catch (Exception var9162) {
				} finally {
					ps1 = null;
				}
			}

			if (ps11 != null) {
				try {
					ps11.close();
				} catch (Exception var9160) {
				} finally {
					ps11 = null;
				}
			}

			if (ps3 != null) {
				try {
					ps3.close();
				} catch (Exception var9158) {
				} finally {
					ps3 = null;
				}
			}

			if (ps4 != null) {
				try {
					ps4.close();
				} catch (Exception var9156) {
				} finally {
					ps4 = null;
				}
			}

			if (ps5 != null) {
				try {
					ps5.close();
				} catch (Exception var9154) {
				} finally {
					ps5 = null;
				}
			}

			if (ps6 != null) {
				try {
					ps6.close();
				} catch (Exception var9152) {
				} finally {
					ps6 = null;
				}
			}

			if (ps7 != null) {
				try {
					ps7.close();
				} catch (Exception var9150) {
				} finally {
					ps7 = null;
				}
			}

			if (ps8 != null) {
				try {
					ps8.close();
				} catch (Exception var9148) {
				} finally {
					ps8 = null;
				}
			}

			if (ps9 != null) {
				try {
					ps9.close();
				} catch (Exception var9146) {
				} finally {
					ps9 = null;
				}
			}

			if (ps10 != null) {
				try {
					ps10.close();
				} catch (Exception var9144) {
				} finally {
					ps10 = null;
				}
			}

			if (ps12 != null) {
				try {
					ps12.close();
				} catch (Exception var9142) {
				} finally {
					ps12 = null;
				}
			}

			if (ps13 != null) {
				try {
					ps13.close();
				} catch (Exception var9140) {
				} finally {
					ps13 = null;
				}
			}

			if (ps14 != null) {
				try {
					ps14.close();
				} catch (Exception var9138) {
				} finally {
					ps14 = null;
				}
			}

			if (pssm != null) {
				try {
					pssm.close();
				} catch (Exception var9136) {
				} finally {
					pssm = null;
				}
			}

			if (ps15 != null) {
				try {
					ps15.close();
				} catch (Exception var9134) {
				} finally {
					ps15 = null;
				}
			}

			if (ps16 != null) {
				try {
					ps16.close();
				} catch (Exception var9132) {
				} finally {
					ps16 = null;
				}
			}

			if (ps17 != null) {
				try {
					ps17.close();
				} catch (Exception var9130) {
				} finally {
					ps17 = null;
				}
			}

			if (ps18 != null) {
				try {
					ps18.close();
				} catch (Exception var9128) {
				} finally {
					ps18 = null;
				}
			}

			if (ps20 != null) {
				try {
					ps20.close();
				} catch (Exception var9126) {
				} finally {
					ps20 = null;
				}
			}

			if (ps63 != null) {
				try {
					ps63.close();
				} catch (Exception var9124) {
				} finally {
					ps63 = null;
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception var9122) {
				} finally {
					con = null;
				}
			}

		}

	}

	private void setSpecialRemarks(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setCaseType(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setCrmName(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setDoctorName(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setPatientName(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setCaseId(long long1) {
		// TODO Auto-generated method stub
		
	}

	private void setRemarks(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setDecision(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setPlnUser(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setUplUser(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setLabUser(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setImpressionUser(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setLocation(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setTrackingId(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setReceiverName(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setSenderName(String string) {
		// TODO Auto-generated method stub
		
	}

	private void setImpressionId(int int1) {
		// TODO Auto-generated method stub
		
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		this.doGet(request, response);
//		
//		 PrintWriter out = response.getWriter();
//	        HttpSession session = request.getSession();
//	        String user = (String) session.getAttribute("userid");
//
//	        if (user == null) {
//	            out.println("<script type=\"text/javascript\">");
//	            out.println("alert('You must be logged in to perform this action.');");
//	            out.println("location='login.jsp';");
//	            out.println("</script>");
//	            return;
//	        }
//
//	        String action = request.getParameter("action");
//	        int impressionId = Integer.parseInt(request.getParameter("impression_id"));
//
//	        Connection con = null;
//	        PreparedStatement pstmt = null;
//
//	        try {
//	            con = LoginDAO.getConnectionDetails();
//
//	            // Update impression table with decision
//	            String updateSql = "UPDATE impression SET decision = ? WHERE impression_id = ?";
//	            pstmt = con.prepareStatement(updateSql);
//	            pstmt.setString(1, action);
//	            pstmt.setInt(2, impressionId);
//	            int rowsUpdated = pstmt.executeUpdate();
//
//	            if (rowsUpdated > 0) {
//	                // Insert into impression history table
//	                String insertHistorySql = "INSERT INTO impression_history (impression_id, stage, decision, username, decision_at) " +
//	                                          "VALUES (?, ?, ?, ?, ?)";
//	                pstmt = con.prepareStatement(insertHistorySql);
//	                pstmt.setInt(1, impressionId);
//	                pstmt.setString(2, action);
//	                pstmt.setString(3, user);
//	                pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
//	                int rowsHistoryInserted = pstmt.executeUpdate();
//
//	                if (rowsHistoryInserted > 0) {
//	                    out.println("<script type=\"text/javascript\">");
//	                    out.println("alert('Decision updated successfully');");
//	                    out.println("location='newcase1.jsp';");
//	                    out.println("</script>");
//	                } else {
//	                    out.println("<script type=\"text/javascript\">");
//	                    out.println("alert('Failed to insert impression history');");
//	                    out.println("location='newcase1.jsp';");
//	                    out.println("</script>");
//	                }
//	            } else {
//	                out.println("<script type=\"text/javascript\">");
//	                out.println("alert('Failed to update decision');");
//	                out.println("location='newcase1.jsp';");
//	                out.println("</script>");
//	            }
//
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	            out.println("<script type=\"text/javascript\">");
//	            out.println("alert('An error occurred: " + e.getMessage() + "');");
//	            out.println("location='newcase1.jsp';");
//	            out.println("</script>");
//	        } finally {
//	            try {
//	                if (pstmt != null) pstmt.close();
//	                if (con != null) con.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
//		
//		
//	}
	
	public  static String encodeURL(String url) {
        try {
            // Use UTF-8 encoding for URL encoding
            String encodedUrl = URLEncoder.encode(url, StandardCharsets.UTF_8.toString());
            return encodedUrl;
        } catch (UnsupportedEncodingException e) {
            // Handle encoding exception if necessary
            e.printStackTrace();
            return null;
        }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request
        doGet(request, response); // Optionally forward POST request to doGet
    }
}
