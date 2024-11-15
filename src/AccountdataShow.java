// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.AccountVo;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/AccountdataShow" })
public class AccountdataShow extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public AccountdataShow() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    ResultSet rs0 = null;
    PrintWriter out = response.getWriter();
    String crm = "";
    String case_id = "";
    String doctor_name = "";
    String patient_name = "";
    String payment_mode = "";
    String payment = "";
    String remain_amount = "";
    String paid_amount = "";
    String user = "";
    case_id = request.getParameter("account_number");
    String account = request.getParameter("id");
    String sql = "";
    String pn = "";
    String dr = "";
    String crm1 = "";
    Double total = 0.0;
    boolean ramt = false;
    int finalramt = 0;
    String query = request.getParameter("query") == null ? "" : request.getParameter("query");
    String cid = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
    System.out.println("account show data cid: " + cid);
    if (case_id == null) {
      case_id = account;
    }

    try {
      Connection con = LoginDAO.getConnectionDetails();
      HttpSession session = request.getSession();
      ResultSet rs;
      PreparedStatement stmt;
      ResultSet rst;
      String oldAmount;
      if (query.equals("fetchdata")) {
        pstmt1 = con.prepareStatement(" select * from cc_crm where case_id=?");
        pstmt1.setString(1, cid);
        rs = pstmt1.executeQuery();
        if (rs.next()) {
          pn = rs.getString("Doctor_Name");
          dr = rs.getString("Patient_Name");
          crm1 = rs.getString("crm_name");
          total = rs.getDouble("total_amount");
        } else {
          out.println("Case_ID_Not_Present");
        }

        PreparedStatement stmt2 = con.prepareStatement(" SELECT sum(Billing_amount) from account where case_id=?");
        stmt2.setString(1, cid);
        ResultSet rst2 = stmt2.executeQuery();
        String billingAmount = "";
        if (rst2.next()) {
          billingAmount = rst2.getString("sum(Billing_amount)");
        }

        if (billingAmount == null) {
          billingAmount = "0";
        }

        stmt = con.prepareStatement(" select * from account where case_id=? order by date desc");
        stmt.setString(1, cid);
        rst = stmt.executeQuery();
        oldAmount = "";
        if (rst.next()) {
          oldAmount = rst.getString("payment");
        }

        out.println(String.valueOf(pn) + "," + dr + "," + crm1 + "," + total + "," + oldAmount + "," + billingAmount);
      } else {
        rs = null;
        Statement st1 = con.createStatement();
        List<AccountVo> list = new ArrayList();
        List<AccountVo> list1 = new ArrayList();
        Map<String, String> map = new HashMap();
        stmt = con.prepareStatement(" SELECT sum(Billing_amount) from account where case_id=?");
        stmt.setString(1, case_id);
        rst = stmt.executeQuery();
        oldAmount = null;
        if (rst.next()) {
          oldAmount = rst.getString("sum(Billing_amount)");
        }

        sql = " select * from account where case_id='" + case_id + "'";
        System.out.println("sql" + sql);
        rs0 = st1.executeQuery(sql);
        if (!rs0.isBeforeFirst()) {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Case Id " + case_id + " Not Exist!');");
          out.println("location='SearchAccountNumber';");
          out.println("</script>");
        }

        while (rs0.next()) {
          AccountVo accountvo = new AccountVo();
          accountvo.setAccount_id(rs0.getString("account_id"));
          accountvo.setDate(rs0.getString("date"));
          accountvo.setPaidAmount(rs0.getString("paid_amount"));
          accountvo.setRemainAmount(rs0.getString("remain_amount"));
          accountvo.setSubmitted_amount(rs0.getString("submitted_amount"));
          accountvo.setTotal(rs0.getString("payment"));
          accountvo.setModepayment(rs0.getString("payment_mode"));
          accountvo.setRevoke_amount(rs0.getString("revoke_amount"));
          accountvo.setRemarks(rs0.getString("remarks"));
          accountvo.setInvoice_no(rs0.getString("invoice_no"));
          accountvo.setInvoice_date(rs0.getString("invoice_date"));
          accountvo.setUser(rs0.getString("user"));
          accountvo.setBilingAmount(rs0.getString("billing_amount"));
          list.add(accountvo);
          map.put("case_id", rs0.getString("case_id"));
          map.put("crm", rs0.getString("crm"));
          map.put("doctor_name", rs0.getString("doctor_name"));
          map.put("patient_name", rs0.getString("patient_name"));
          map.put("payment", rs0.getString("payment"));
          map.put("remain_amount", rs0.getString("remain_amount"));
          map.put("submitted_amount", rs0.getString("submitted_amount"));
          map.put("paid_amount", rs0.getString("paid_amount"));
          map.put("user", rs0.getString("user"));
          map.put("invoice_no", rs0.getString("invoice_no"));
          map.put("invoice_date", rs0.getString("invoice_date"));
          map.put("bilingAmount", oldAmount);
          session.setAttribute("AccountVoList", list);
          session.setAttribute("crm", map.get("crm"));
          session.setAttribute("finalramt", Integer.valueOf(finalramt));
          session.setAttribute("case_id", map.get("case_id"));
          session.setAttribute("doctor_name", map.get("doctor_name"));
          session.setAttribute("patient_name", map.get("patient_name"));
          session.setAttribute("payment", map.get("payment"));
          session.setAttribute("remain_amount", map.get("remain_amount"));
          session.setAttribute("submitted_amount", map.get("submitted_amount"));
          session.setAttribute("invoice_no", map.get("invoice_no"));
          session.setAttribute("invoice_date", map.get("invoice_date"));
          session.setAttribute("aa", map.get("paid_amount"));
          session.setAttribute("billingAmount", map.get("bilingAmount"));
        }

        PreparedStatement stmt1 = con.prepareStatement(" select * from cc_crm where case_id='" + case_id + "' ");
        ResultSet rst1 = stmt1.executeQuery();
        String dname = "";
        String pname = "";

        String crmname;
        for (crmname = ""; rst1.next(); crmname = rst1.getString("crm_name")) {
          dname = rst1.getString("Doctor_Name");
          pname = rst1.getString("Patient_Name");
        }

        session.setAttribute("pname", pname);
        session.setAttribute("dname", dname);
        session.setAttribute("crmname", crmname);
        PreparedStatement ps = null;
        ResultSet rs1 = null;
        ps = con.prepareStatement(" select * from account_change where case_id='" + case_id + "' ");
        rs1 = ps.executeQuery();

        while (rs1.next()) {
          AccountVo ac = new AccountVo();
          ac.setCaseid(rs1.getString("case_id"));
          ac.setPrevious_amount(rs1.getString("previous_amount"));
          ac.setNew_amount(rs1.getString("new_amount"));
          ac.setRemarks(rs1.getString("reason"));
          ac.setDate(rs1.getString("date"));
          ac.setUser(rs1.getString("user"));
          list1.add(ac);
        }

        session.setAttribute("ac", list1);
        out.println("<script type=\"text/javascript\">");
        out.println("location='updateaccount.jsp';");
        out.println("</script>");
      }
    } catch (Exception var43) {
      var43.printStackTrace();
    }

  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request, response);
  }
}
