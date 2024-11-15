
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.PlanningVO;
import com.vo.StagingVo;
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

@WebServlet({ "/SelectStaging" })
public class SelectStaging extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public SelectStaging() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String n = request.getParameter("caseId");
    String crm = request.getParameter("crm");
    String patient_Name = request.getParameter("patient_Name");
    String cdoc = request.getParameter("cdoc");
    HttpSession session = request.getSession();
    List<StagingVo> stagingVo = new ArrayList();
    List<PlanningVO> planningVO = new ArrayList();
    String crm_priority = "";
    Connection con = null;
    Connection con5 = null;
    PreparedStatement ps = null;
    PreparedStatement ps0 = null;
    PreparedStatement plnps = null;
    ResultSet plnrs = null;
    ResultSet rs0 = null;
    ResultSet rs = null;

    try {
      con = LoginDAO.getConnectionDetails();
      con5 = LoginDAO.getConnectionDetails();
      ps0 = con.prepareStatement(" select * from cc_crm where Case_Id=?");
      ps0.setString(1, n);

      for (rs0 = ps0.executeQuery(); rs0.next(); crm_priority = rs0.getString("priority")) {
      }

      ps = con.prepareStatement(" select * from stagging where caseid=?");
      ps.setString(1, n);
      rs = ps.executeQuery();

      while (rs.next()) {
        StagingVo stvo = new StagingVo();
        stvo.setPlanning_id(rs.getString("planning_id"));
        stvo.setPlanning_type(rs.getString("planning_type"));
        stvo.setD_name(rs.getString("d_name"));
        stvo.setPatient_name(rs.getString("patient_name"));
        stvo.setCrm(rs.getString("crm"));
        stvo.setUpper_aligner_from(rs.getString("upper_aligner_from"));
        stvo.setUpper_aligner_to(rs.getString("upper_aligner_to"));
        stvo.setLower_aligner_from(rs.getString("lower_aligner_from"));
        stvo.setLower_aligner_to(rs.getString("lower_aligner_to"));
        stvo.setThick_upper(rs.getString("thick_upper"));
        stvo.setThick_lower(rs.getString("thick_lower"));
        stvo.setMargin_upper(rs.getString("margin_upper"));
        stvo.setMargin_lower(rs.getString("margin_lower"));
        stvo.setMolor_upper(rs.getString("molor_upper"));
        stvo.setMolor_lower(rs.getString("molor_lower"));
        stvo.setSheet_type(rs.getString("sheet_type"));
//        stvo.setCase_booking_form(rs.getString("case_booking_form"));
//        stvo.setSales_approval_docs(rs.getString("sales_approval_docs"));
//        stvo.setDoc_approval_form(rs.getString("doc_approval_form"));
//        stvo.setStagesheet(rs.getString("stagesheet"));
//        stvo.setPlan_comment(rs.getString("plan_comment"));
//        stvo.setU_form(rs.getInt("u_form"));
//        stvo.setU_to(rs.getInt("u_to"));
//        stvo.setL_from(rs.getInt("l_from"));
//        stvo.setL_to(rs.getInt("l_to"));
//        stvo.setDispatch_eta(rs.getDate("dispatch_eta"));   // For date type
//        stvo.setCreated_at(rs.getTimestamp("created_at"));  // For timestamp type
//        stvo.setCreated_by(rs.getString("created_by"));
        stagingVo.add(stvo);
      }

      plnps = con5.prepareStatement(
          " select p.planned_no,p.planning_type,p.upper_aligner_from,p.upper_aligner_to,p.lower_aligner_from,"
          + "p.lower_aligner_to,p.case_booking_form ,p.sales_approval_docs ,p.doc_approval_form ,p.stagesheet,"
          + " p.plan_comment,p.u_form ,p.u_to, p.l_from,p.l_to, p.dispatch_eta ,p.created_at,p.created_by "
          + " from planning as p ,cc_crm as c where p.case_id='"
              + n + "'" + " and p.planning_id=c.planning_id");
      plnrs = plnps.executeQuery();

      while (plnrs.next()) {
        System.out.println("inside while :: " + plnrs.getString("planned_no"));
        PlanningVO plnVO = new PlanningVO();
        plnVO.setPlanned_no(plnrs.getString("planned_no"));
        plnVO.setPlanning_type(plnrs.getString("planning_type"));
        plnVO.setUpper_aligner_from(plnrs.getString("upper_aligner_from"));
        plnVO.setUpper_aligner_to(plnrs.getString("upper_aligner_to"));
        plnVO.setLower_aligner_from(plnrs.getString("lower_aligner_from"));
        plnVO.setLower_aligner_to(plnrs.getString("lower_aligner_to"));
        plnVO.setCase_booking_form(plnrs.getString("case_booking_form"));
        plnVO.setSales_approval_docs(plnrs.getString("sales_approval_docs"));
        plnVO.setDoc_approval_form(plnrs.getString("doc_approval_form"));
        plnVO.setStagesheet(plnrs.getString("stagesheet"));
        plnVO.setPlan_comment(plnrs.getString("plan_comment"));
        plnVO.setU_form(plnrs.getInt("u_form"));
        plnVO.setU_to(plnrs.getInt("u_to"));
        plnVO.setL_from(plnrs.getInt("l_from"));
        plnVO.setL_to(plnrs.getInt("l_to"));
        plnVO.setDispatch_eta(plnrs.getDate("dispatch_eta"));   // For date type
        plnVO.setCreated_at(plnrs.getTimestamp("created_at"));  // For timestamp type
        plnVO.setCreated_by(plnrs.getString("created_by"));
        planningVO.add(plnVO);
      }

      session.setAttribute("previousotpln", planningVO);
      session.setAttribute("previousstagging", stagingVo);
      session.setAttribute("cccrmpriority", crm_priority);
    } catch (Exception var1290) {
      System.out.println("Message  : " + var1290.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (Exception var1288) {
        } finally {
          rs = null;
        }
      }

      if (rs0 != null) {
        try {
          rs0.close();
        } catch (Exception var1286) {
        } finally {
          rs0 = null;
        }
      }

      if (plnrs != null) {
        try {
          plnrs.close();
        } catch (Exception var1284) {
        } finally {
          plnrs = null;
        }
      }

      if (ps != null) {
        try {
          ps.close();
        } catch (Exception var1282) {
        } finally {
          ps = null;
        }
      }

      if (ps0 != null) {
        try {
          ps0.close();
        } catch (Exception var1280) {
        } finally {
          ps0 = null;
        }
      }

      if (plnps != null) {
        try {
          plnps.close();
        } catch (Exception var1278) {
        } finally {
          plnps = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var1276) {
        } finally {
          con = null;
        }
      }

      if (con5 != null) {
        try {
          con5.close();
        } catch (Exception var1274) {
        } finally {
          con5 = null;
        }
      }

    }

    response.sendRedirect(
        "newplanning.jsp?caseId=" + n + "&crm=" + crm + "&cdoc=" + cdoc + "&patient_Name=" + patient_Name);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
