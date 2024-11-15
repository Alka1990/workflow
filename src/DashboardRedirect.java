
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.Newcase1;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

@WebServlet({ "/DashboardRedirect" })
public class DashboardRedirect extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(DashboardRedirect.class);
  private static final long serialVersionUID = 1L;

  public DashboardRedirect() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    new ArrayList();
    Connection connection01 = null;
    ResultSet resultset01 = null;
    Connection connection02 = null;
    Connection connection03 = null;
    ResultSet resultset02 = null;
    ResultSet resultset03 = null;
    boolean finalPRE = false;
    boolean finalwfc = false;
    boolean finalpln = false;
    boolean finalupl = false;
    boolean finaldp = false;
    boolean finallab = false;
    boolean finalpck = false;
    int wfccount = 0;
    int wfcorcount = 0;
    int pckcount = 0;
    int pckcorcount = 0;
    int precount = 0;
    int precorcount = 0;
    int plncount = 0;
    int plncorcount = 0;
    int uplcount = 0;
    int uplcorcount = 0;
    int dpcount = 0;
    int dpcorcount = 0;
    int labcount = 0;
    int labcorcount = 0;
    int dpcorcountsk = 0;
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
      connection02 = LoginDAO.getConnectionDetails();
      connection03 = LoginDAO.getConnectionDetails();
      String Query = "\r\nSELECT starter_case_stage,COUNT(*) AS stage_count FROM cc_crm where starter_case_stage is not NULL GROUP BY starter_case_stage ORDER BY starter_case_stage";
      System.out.println("Query  :  " + Query);
      String Query2 = "\r\n SELECT case_stage,COUNT(*) AS stage_count FROM cc_crm where case_stage is not NULL   GROUP BY case_stage ORDER BY case_stage";
      String Query3 = "select * from cc_crm where  holdflag ='Y'";
      LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap();
      PreparedStatement prestmt01 = connection01.prepareStatement(Query2);
      resultset01 = prestmt01.executeQuery();

      while (resultset01.next()) {
        if (resultset01.getString("case_stage").equals("INICOR")) {
          linkedHashMap.put("CASE INITIATED", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("INI")) {
          wfccount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("WFCCOR")) {
          wfcorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalwfc1 = wfccount + wfcorcount;
        linkedHashMap.put("WORK FLOW CHECK", String.valueOf(finalwfc1));
        if (resultset01.getString("case_stage").equals("PRE")) {
          precount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("WFC")) {
          precorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalPRE1 = precount + precorcount;
        linkedHashMap.put("PREREQUISITE CHECK", String.valueOf(finalPRE1));
        if (resultset01.getString("case_stage").equals("PRE")) {
          linkedHashMap.put("CAD BAISING SEGMENTATION", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("PLNCOR")) {
          plncount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("CADBS")) {
          plncorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalpln1 = plncorcount + plncount;
        linkedHashMap.put("PLANNING", String.valueOf(finalpln1));
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
          linkedHashMap.put("QUALITY ASSURANCE", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("QA")) {
          linkedHashMap.put("STAGGING", resultset01.getString("stage_count"));
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
          linkedHashMap.put("FQC", resultset01.getString("stage_count"));
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
      PreparedStatement prestmt02 = connection02.prepareStatement(Query);
      resultset02 = prestmt02.executeQuery();

      ArrayList list4;
      PreparedStatement prestmnt3;
      while (resultset02.next()) {
        if (resultset02.getString("starter_case_stage").equals("INISTRKIT")) {
          linkedHashMap2.put("MTPSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("MTPSTRKIT")) {
          dpcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("3DPSTRKITCOR")) {
          dpcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        int finaldpsk1 = dpcorcountsk + dpcountsk;
        linkedHashMap2.put("3DPSTRKIT", String.valueOf(finaldpsk1));
        if (resultset02.getString("starter_case_stage").equals("3DPSTRKIT")) {
          lbcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("LABSTRKITCOR")) {
          lbcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        int finallbsk1 = lbcorcountsk + lbcountsk;
        linkedHashMap2.put("LABSTRKIT", String.valueOf(finallbsk1));
        if (resultset02.getString("starter_case_stage").equals("LABSTRKIT")) {
          linkedHashMap2.put("FQCSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("FQCSTRKIT")) {
          pckcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("PCKSTRKITCOR")) {
          pckcorcountsk = Integer.parseInt(resultset02.getString("stage_count"));
        }

        int finalpcksk1 = pckcorcountsk + pckcountsk;
        linkedHashMap2.put("PCKSTRKIT", String.valueOf(finalpcksk1));
        if (resultset02.getString("starter_case_stage").equals("PCKSTRKIT")) {
          linkedHashMap2.put("DISPATCHSTRKIT", resultset02.getString("stage_count"));
        }

        list4 = new ArrayList();
        prestmnt3 = connection03.prepareStatement(Query3);
        resultset03 = prestmnt3.executeQuery();

        while (resultset03.next()) {
          Newcase1 nc = new Newcase1();
          nc.setCaseid(resultset03.getString("case_id"));
          nc.setRdoctorname(resultset03.getString("registered_doctor"));
          nc.setCdoctorname(resultset03.getString("Doctor_Name"));
          nc.setCase_stage(resultset03.getString("case_stage"));
          nc.setCrm(resultset03.getString("crm_name"));
          list4.add(nc);
        }

        request.setAttribute("holdflag", list4);
        request.setAttribute("Case_stage", linkedHashMap);
        request.setAttribute("Starterkit", linkedHashMap2);
      }

      list4 = new ArrayList();
      prestmnt3 = connection03.prepareStatement(
          "select case_id,Doctor_Name,Patient_Name,registered_doctor,crm_name  from cc_crm where case_stage='QA' and qa_at IS NOT NULL and concat(FLOOR(HOUR(TIMEDIFF(qa_at,now())) /24)) >8; ");
      ResultSet rs = prestmnt3.executeQuery();

      while (rs.next()) {
        Newcase1 nc = new Newcase1();
        nc.setCaseid(rs.getString("case_id"));
        nc.setRdoctorname(rs.getString("registered_doctor"));
        nc.setCdoctorname(rs.getString("Doctor_Name"));
        nc.setPatient_Name(rs.getString("Patient_Name"));
        nc.setCrm(rs.getString("crm_name"));
        list4.add(nc);
      }

      request.setAttribute("pendingsgnoff", list4);
      List<Newcase1> list2 = new ArrayList();
      PreparedStatement pstmt2 = connection03.prepareStatement(
          "select case_id,Doctor_Name,Patient_Name,registered_doctor,crm_name from cc_crm where case_stage='REJ' ");
      ResultSet rs2 = pstmt2.executeQuery();

      while (rs2.next()) {
        Newcase1 nc = new Newcase1();
        nc.setCaseid(rs2.getString("case_id"));
        nc.setRdoctorname(rs2.getString("registered_doctor"));
        nc.setCdoctorname(rs2.getString("Doctor_Name"));
        nc.setPatient_Name(rs2.getString("Patient_Name"));
        nc.setCrm(rs2.getString("crm_name"));
        list2.add(nc);
      }

      request.setAttribute("rejectedlist", list2);
      List<Newcase1> list3 = new ArrayList();
      PreparedStatement pstmt3 = connection03.prepareStatement(
          "  SELECT  *  FROM cc_crm where case_stage in ('WFC') and concat(FLOOR(HOUR(TIMEDIFF(wfc_at,now())) / 24))>2 and  holdflag <>'Y' ORDER BY priority DESC ");
      ResultSet rs3 = pstmt3.executeQuery();

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
      String Query04 = " SELECT scan,COUNT(*) AS count FROM cc_crm where date_format(ini_at, '%m/%d/%Y' )=date_format(CURDATE(), '%m/%d/%Y') and scan is not NULL GROUP BY scan ORDER BY scan ";
      LinkedHashMap<String, String> linkedHashMap04 = new LinkedHashMap();
      PreparedStatement prestmt04 = connection01.prepareStatement(Query04);
      ResultSet resultset04 = prestmt04.executeQuery();

      while (resultset04.next()) {
        PreparedStatement pstmt1 = connection02.prepareStatement(
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
      RequestDispatcher rd = request.getRequestDispatcher("tempdashboard.jsp");
      rd.forward(request, response);
    } catch (Exception var72) {
      LOGGER.info("Error At CaseStage=" + var72.getMessage());
    } finally {
      try {
        connection01.close();
      } catch (SQLException var71) {
        LOGGER.info("  After connection0 Error Message is : " + var71.getMessage());
      }

    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
