
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.PlanningVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import java.security.Timestamp;
import java.util.Date;

@WebServlet({ "/AddPlanning" })
public class AddPlanning extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(AddPlanning.class);
  private static final long serialVersionUID = 1L;

  public AddPlanning() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String n = request.getParameter("caseId");
    String crm = request.getParameter("crm");
    String patient_Name = request.getParameter("patient_Name");
    String cdoc = request.getParameter("cdoc");
    String planning_id = request.getParameter("planning_id");
    HttpSession session = request.getSession();
    List<PlanningVO> planningVO = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement ps0 = null;
    ResultSet rs = null;
    ResultSet rs0 = null;
    String crm_priority = "";
    String corporate_account = "";

    try {
      con = LoginDAO.getConnectionDetails();
      ps0 = con.prepareStatement(" select * from cc_crm where Case_Id=?");
      ps0.setString(1, n);

      for (rs0 = ps0.executeQuery(); rs0.next(); corporate_account = rs0.getString("corporate_account")) {
        crm_priority = rs0.getString("priority");
      }

      ps = con.prepareStatement(" select * from planning where case_id=?");
      ps.setString(1, n);
      rs = ps.executeQuery();

      while (rs.next()) {
        PlanningVO pvo = new PlanningVO();
        pvo.setPlanning_id(rs.getInt("planning_id"));
        pvo.setCase_id(rs.getString("case_id"));
        pvo.setDoctor_name(rs.getString("doctor_name"));
        pvo.setPatient_name(rs.getString("patient_name"));
        pvo.setCrm(rs.getString("crm"));
        pvo.setDate(rs.getString("date"));
        pvo.setPlanned_no(rs.getString("planned_no"));
        pvo.setLower_aligner_from(rs.getString("lower_aligner_from"));
        pvo.setLower_aligner_to(rs.getString("lower_aligner_to"));
        pvo.setUpper_aligner_from(rs.getString("upper_aligner_from"));
        pvo.setUpper_aligner_to(rs.getString("upper_aligner_to"));
        pvo.setPlanning_type(rs.getString("planning_type"));
        pvo.setCase_booking_form(rs.getString("case_booking_form"));
        pvo.setSales_approval_docs(rs.getString("sales_approval_docs"));
        pvo.setDoc_approval_form(rs.getString("doc_approval_form"));
        pvo.setStagesheet(rs.getString("stagesheet"));
        pvo.setPlan_comment(rs.getString("plan_comment"));
        pvo.setU_form(rs.getInt("u_form"));
        pvo.setU_to(rs.getInt("u_to"));
        pvo.setL_from(rs.getInt("l_from"));
        pvo.setL_to(rs.getInt("l_to"));
        pvo.setDispatch_eta(rs.getDate("dispatch_eta"));   // For date type
        pvo.setCreated_at(rs.getTimestamp("created_at"));  // For timestamp type
        pvo.setCreated_by(rs.getString("created_by"));
        planningVO.add(pvo);
      }

      session.setAttribute("plnlist", planningVO);
      session.setAttribute("plnpriority", crm_priority);
    } catch (SQLException var935) {
      var935.printStackTrace();
    } catch (ClassNotFoundException var936) {
      var936.printStackTrace();
    } finally {
      if (ps != null) {
        try {
          ps.close();
        } catch (Exception var933) {
        } finally {
          ps = null;
        }
      }

      if (ps0 != null) {
        try {
          ps0.close();
        } catch (Exception var931) {
        } finally {
          ps0 = null;
        }
      }

      if (rs != null) {
        try {
          rs.close();
        } catch (Exception var929) {
        } finally {
          rs = null;
        }
      }

      if (rs0 != null) {
        try {
          rs0.close();
        } catch (Exception var927) {
        } finally {
          rs0 = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var925) {
        } finally {
          con = null;
        }
      }

    }

    out.print("Hello==== " + n + " | crm=" + crm + " || patient_Name=" + patient_Name + " || cdoc=" + cdoc);
    response.sendRedirect("planning.jsp?caseId=" + n + "&crm=" + crm + "&cdoc=" + cdoc + "&patient_Name=" + patient_Name
        + "&corporate_account=" + corporate_account );
  }
}
