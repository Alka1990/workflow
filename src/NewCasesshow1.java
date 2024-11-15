
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/NewCasesshow1" })
public class NewCasesshow1 extends HttpServlet {
    static final Logger LOGGER = LogManager.getLogger(NewCasesshow1.class);
    private static final long serialVersionUID = 1L;

    public NewCasesshow1() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs0 = null;
        ResultSet rs2 = null;
        String id = "";
        String case_type = "";
        String case_id = "";
        String scan = "";
        String location = "";
        String city = "";
        String r_Doctor = "";
        String crm = "";
        String p_graph = "";
        String starter_kit = "";
        String type_request = "";
        String s_shown = "";
        String ppf_fill = "";
        String t_account = "";
        String corporate_account = "";
        String kol = "";
        String c_pkg = "";
        String pkg_name = "";
        String dispatch_crpt = "";
        String dispatch_address = "";
        String bill_address = "";
        String c_doctor = "";
        String case_stage = "";
        String delivery_note_no = "";
        String bgst_no = "";
        String category = "";
        String upper_aligner = "";
        String lower_aligner = "";
        String others = "";
        String Patient_Name = "";
        String priority = "";
        String remarks = "";
        String address1 = "";
        String address2 = "";
        String address3 = "";
        String address4 = "";
        String address5 = "";
        String default_address = "";

        try {
            Connection con = LoginDAO.getConnectionDetails();
            Statement st1 = null;
            st1 = con.createStatement();
            String Case_Id = request.getParameter("caseId");
            String newcase = request.getParameter("page");
            String cid = "";
            HttpSession session = request.getSession();
            ArrayList<String> cidarr = new ArrayList();
            String sql1 = "SELECT Case_Id FROM cc_crm where Case_Id='" + Case_Id + "'";
            rs2 = st1.executeQuery(sql1);

            while (rs2.next()) {
                cid = rs2.getString("Case_Id");
                cidarr.add(cid);
            }

            if (cidarr.contains(Case_Id)) {
                String sqlpn = "SELECT * FROM cc_crm where Case_Id='" + Case_Id + "'";
                ResultSet rs3 = st1.executeQuery(sqlpn);

                while (rs3.next()) {
                    case_id = rs3.getString("case_id");
                    String clinic = rs3.getString("clinic_name");
                    String add = rs3.getString("address");
                    String phn = rs3.getString("phone");
                    String bcn = rs3.getString("bclinic");
                    String badd = rs3.getString("badd");
                    case_type = rs3.getString("case_type");
                    scan = rs3.getString("scan");
                    r_Doctor = rs3.getString("registered_doctor");
                    crm = rs3.getString("crm_name");
                    p_graph = rs3.getString("p_graph");
                    starter_kit = rs3.getString("starter_kit");
                    type_request = rs3.getString("type_request");
                    s_shown = rs3.getString("s_shown");
                    ppf_fill = rs3.getString("ppf_fill");
                    t_account = rs3.getString("t_account");
                    corporate_account = rs3.getString("corporate_account");
                    kol = rs3.getString("kol");
                    c_pkg = rs3.getString("c_pkg");
                    pkg_name = rs3.getString("pkg_name");
                    dispatch_crpt = rs3.getString("dispatch_crpt");
                    dispatch_address = rs3.getString("dispatch_address");
                    bill_address = rs3.getString("bill_address");
                    c_doctor = rs3.getString("Doctor_Name");
                    case_stage = rs3.getString("case_stage");
                    delivery_note_no = rs3.getString("delivery_note_no");
                    Patient_Name = rs3.getString("Patient_Name");
                    bgst_no = rs3.getString("bgst_no");
                    category = rs3.getString("category");
                    upper_aligner = rs3.getString("upper_aligner");
                    lower_aligner = rs3.getString("lower_aligner");
                    others = rs3.getString("others");
                    remarks = rs3.getString("remark");
                    String total_amount = rs3.getString("total_amount");
                    String payment_processing = rs3.getString("payment_processing");
                    String payment_mode = rs3.getString("payment_mode");
                    session.setAttribute("cn", clinic);
                    session.setAttribute("add", add);
                    session.setAttribute("bcn", bcn);
                    session.setAttribute("badd", badd);
                    session.setAttribute("case_id", case_id);
                    session.setAttribute("case_type", case_type);
                    session.setAttribute("scan", scan);
                    session.setAttribute("city", "");
                    session.setAttribute("r_Doctor", r_Doctor);
                    session.setAttribute("crm", crm);
                    session.setAttribute("p_graph", p_graph);
                    session.setAttribute("starter_kit", starter_kit);
                    session.setAttribute("type_request", type_request);
                    session.setAttribute("s_shown", s_shown);
                    session.setAttribute("ppf_fill", ppf_fill);
                    session.setAttribute("t_account", t_account);
                    session.setAttribute("corporate_account", corporate_account);
                    session.setAttribute("kol", kol);
                    session.setAttribute("c_pkg", c_pkg);
                    session.setAttribute("pkg_name", pkg_name);
                    session.setAttribute("dispatch_crpt", dispatch_crpt);
                    session.setAttribute("dispatch_address", dispatch_address);
                    session.setAttribute("bill_address", bill_address);
                    session.setAttribute("c_doctor", c_doctor);
                    session.setAttribute("case_stage", case_stage);
                    session.setAttribute("delivery_note_no", delivery_note_no);
                    session.setAttribute("bgst_no", bgst_no);
                    session.setAttribute("category", category);
                    session.setAttribute("upper_aligner", upper_aligner);
                    session.setAttribute("lower_aligner", lower_aligner);
                    session.setAttribute("others", others);
                    session.setAttribute("Patient_Name", Patient_Name);
                    session.setAttribute("priority", "");
                    session.setAttribute("remarks", remarks);
                    session.setAttribute("total_amount", total_amount);
                    session.setAttribute("payment_processing", payment_processing);
                    session.setAttribute("payment_mode", payment_mode);
                    session.setAttribute("address1", rs3.getString("address1"));
                    session.setAttribute("address2", rs3.getString("address2"));
                    session.setAttribute("address3", rs3.getString("address3"));
                    session.setAttribute("address4", rs3.getString("address4"));
                    session.setAttribute("address5", rs3.getString("address5"));
                    session.setAttribute("pincode1", rs3.getString("pincode1"));
                    session.setAttribute("pincode2", rs3.getString("pincode2"));
                    session.setAttribute("pincode3", rs3.getString("pincode3"));
                    session.setAttribute("pincode4", rs3.getString("pincode4"));
                    session.setAttribute("pincode5", rs3.getString("pincode5"));
                    session.setAttribute("phone1", rs3.getString("phone1"));
                    session.setAttribute("phone2", rs3.getString("phone2"));
                    session.setAttribute("phone3", rs3.getString("phone3"));
                    session.setAttribute("phone4", rs3.getString("phone4"));
                    session.setAttribute("phone5", rs3.getString("phone5"));
                    session.setAttribute("city1", rs3.getString("city"));
                    session.setAttribute("city2", rs3.getString("city2"));
                    session.setAttribute("city3", rs3.getString("city3"));
                    session.setAttribute("city4", rs3.getString("city4"));
                    session.setAttribute("city5", rs3.getString("city5"));
                    session.setAttribute("location1", rs3.getString("location"));
                    session.setAttribute("location2", rs3.getString("location2"));
                    session.setAttribute("location3", rs3.getString("location3"));
                    session.setAttribute("location4", rs3.getString("location4"));
                    session.setAttribute("location5", rs3.getString("location5"));
                    session.setAttribute("default_starterkit", rs3.getString("default_starterkit"));
                    session.setAttribute("default_address", rs3.getString("default_address"));
                    session.setAttribute("patient_email", rs3.getString("patient_email"));
                    session.setAttribute("treating_dr_email", rs3.getString("treating_dr_email"));
                }

                session.setAttribute("cid", Case_Id);
                if (newcase != null) {
                    response.sendRedirect("EditCaseDetails.jsp?page=newcase");
                } else {
                    response.sendRedirect("EditCaseDetails.jsp");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('CASE ID NOT EXIST!');");
                out.println("location='CreateCC';");
                out.println("</script>");
            }
        } catch (Exception var64) {
            LOGGER.info("Error At NewCaseshow1=" + var64.getMessage());
        }

    }
}
