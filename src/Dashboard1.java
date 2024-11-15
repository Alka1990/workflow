
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

@WebServlet({ "/Dashboard1" })
public class Dashboard1 extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Dashboard1.class);
  private static final long serialVersionUID = 1L;

  public Dashboard1() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(false);
    String n = (String) session.getAttribute("userid");
    String nprofile = (String) session.getAttribute("profile");
    request.setAttribute("username", n);
    request.setAttribute("loginusername", n);
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

    try {
      connection01 = LoginDAO.getConnectionDetails();
      connection02 = LoginDAO.getConnectionDetails();
      connection03 = LoginDAO.getConnectionDetails();
      String Query = "\r\nSELECT starter_case_stage,COUNT(*) AS stage_count FROM cc_crm where starter_case_stage is not NULL   GROUP BY starter_case_stage ORDER BY starter_case_stage";
      System.out.println("Query  :  " + Query);
      String Query2 = "\r\n SELECT case_stage,COUNT(*) AS stage_count FROM cc_crm where case_stage is not NULL   GROUP BY case_stage ORDER BY case_stage";
      System.out.println("Query2  :  " + Query2);
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

        if (resultset01.getString("case_stage").equals("PRECOR")) {
          precorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }
System.out.println("finalwfc1" + finalwfc1);

        int finalPRE1 = precount + precorcount;
        linkedHashMap.put("PREREQUISITE CHECK", String.valueOf(finalPRE1));
        if (resultset01.getString("case_stage").equals("CADBS")) {
          linkedHashMap.put("CAD BAISING SEGMENTATION", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("PLN")) {
          plncount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("PLNCOR")) {
          plncorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalpln1 = plncorcount + plncount;
        linkedHashMap.put("PLANNING", String.valueOf(finalpln1));
        if (resultset01.getString("case_stage").equals("UPL")) {
          uplcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("UPLCOR")) {
          uplcorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalupl1 = uplcorcount + uplcount;
        linkedHashMap.put("UPLOAD", String.valueOf(finalupl1));
        if (resultset01.getString("case_stage").equals("REV")) {
          linkedHashMap.put("REVIEW", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("QA")) {
          linkedHashMap.put("QUALITY ASSURANCE", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("STG")) {
          linkedHashMap.put("STAGGING", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("MPT")) {
          linkedHashMap.put("HOLLOW TAGING", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("3DP")) {
          dpcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("3DPCOR")) {
          dpcorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finaldp1 = dpcorcount + dpcount;
        linkedHashMap.put("3D PRINTING", String.valueOf(finaldp1));
        if (resultset01.getString("case_stage").equals("LAB")) {
          labcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("LABCOR")) {
          labcorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finallab1 = labcorcount + labcount;
        linkedHashMap.put("LAB", String.valueOf(finallab1));
        if (resultset01.getString("case_stage").equals("FQC")) {
          linkedHashMap.put("FQC", resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("PCK")) {
          pckcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        if (resultset01.getString("case_stage").equals("PCKCOR")) {
          pckcorcount = Integer.parseInt(resultset01.getString("stage_count"));
        }

        int finalpck1 = pckcorcount + pckcount;
        linkedHashMap.put("PACKING", String.valueOf(finalpck1));
        if (resultset01.getString("case_stage").equals("DPH")) {
          linkedHashMap.put("DISPATCH", resultset01.getString("stage_count"));
        }
      }

      LinkedHashMap<String, String> linkedHashMap2 = new LinkedHashMap();
      PreparedStatement prestmt02 = connection02.prepareStatement(Query);
      resultset02 = prestmt02.executeQuery();

      while (resultset02.next()) {
        if (resultset02.getString("starter_case_stage").equals("MTPSTRKIT")) {
          linkedHashMap2.put(" MTPSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("3DPSTRKIT")) {
          linkedHashMap2.put("3DPSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("FQCSTRKIT")) {
          linkedHashMap2.put("FQCSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("LABSTRKIT")) {
          linkedHashMap2.put("LABSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("PCKSTRKIT")) {
          linkedHashMap2.put("PCKSTRKIT", resultset02.getString("stage_count"));
        }

        if (resultset02.getString("starter_case_stage").equals("WFCSTRKIT")) {
          linkedHashMap2.put("WFCSTRKIT", resultset02.getString("stage_count"));
        }

        List<Newcase1> list1 = new ArrayList();
        PreparedStatement prestmnt3 = connection03.prepareStatement(Query3);
        resultset03 = prestmnt3.executeQuery();

        while (resultset03.next()) {
          Newcase1 nc = new Newcase1();
          nc.setCaseid(resultset03.getString("case_id"));
          nc.setRdoctorname(resultset03.getString("registered_doctor"));
          nc.setCdoctorname(resultset03.getString("Doctor_Name"));
          nc.setCase_stage(resultset03.getString("case_stage"));
          nc.setCrm(resultset03.getString("crm_name"));
          list1.add(nc);
        }

        request.setAttribute("holdflag", list1);
        request.setAttribute("Case_stage", linkedHashMap);
        request.setAttribute("Starterkit", linkedHashMap2);
      }

      RequestDispatcher rd = request.getRequestDispatcher("Dashboard1.jsp");
      rd.forward(request, response);
    } catch (Exception var53) {
      LOGGER.info("Error At CaseStage=" + var53.getMessage());
    } finally {
      try {
        connection01.close();
      } catch (SQLException var52) {
        LOGGER.info("  After connection0 Error Message is : " + var52.getMessage());
      }

    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
