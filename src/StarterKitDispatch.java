
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.AddresshandlerVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/StarterKitDispatch" })
public class StarterKitDispatch extends HttpServlet {
    static final Logger LOGGER = LogManager.getLogger(Multifrm.class);
    private static final long serialVersionUID = 1L;

    public StarterKitDispatch() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String code_id = request.getParameter("caseId");
        String crm = request.getParameter("crm");
        String patient_Name = request.getParameter("patient_Name");
        String cdoc = request.getParameter("cdoc");
        List<AddresshandlerVO> addresshandlervo = new ArrayList();

        try {
            con = LoginDAO.getConnectionDetails();
            pstmt = con.prepareStatement(" select * from cc_crm where case_id=?");
            pstmt.setString(1, code_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                AddresshandlerVO address = new AddresshandlerVO();
                address.setAddress1(rs.getString("address1"));
                address.setAddress2(rs.getString("address2"));
                address.setAddress3(rs.getString("address3"));
                address.setAddress4(rs.getString("address4"));
                address.setAddress5(rs.getString("address5"));
                address.setCity1(rs.getString("city"));
                address.setCity2(rs.getString("city2"));
                address.setCity3(rs.getString("city3"));
                address.setCity4(rs.getString("city4"));
                address.setCity5(rs.getString("city5"));
                address.setPhone1(rs.getString("phone1"));
                address.setPhone2(rs.getString("phone2"));
                address.setPhone3(rs.getString("phone3"));
                address.setPhone4(rs.getString("phone4"));
                address.setPhone5(rs.getString("phone5"));
                address.setPincode1(rs.getString("pincode1"));
                address.setPincode2(rs.getString("pincode2"));
                address.setPincode3(rs.getString("pincode3"));
                address.setPincode4(rs.getString("pincode4"));
                address.setPincode5(rs.getString("pincode5"));
                address.setLocation1(rs.getString("location"));
                address.setLocation2(rs.getString("location2"));
                address.setLocation3(rs.getString("location3"));
                address.setLocation4(rs.getString("location4"));
                address.setLocation5(rs.getString("location5"));
                address.setDefault_starterkit(rs.getString("default_starterkit"));
                addresshandlervo.add(address);
                System.out.println("address size str :: " + addresshandlervo.size());
            }

            request.setAttribute("addresshandler2", addresshandlervo);
        } catch (Exception var221) {
            var221.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception var219) {
                } finally {
                    rs = null;
                }
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception var217) {
                } finally {
                    pstmt = null;
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (Exception var215) {
                } finally {
                    con = null;
                }
            }

        }

        RequestDispatcher rd = request.getRequestDispatcher("starterkitdispatch.jsp?caseId=" + code_id + "&crm=" + crm
                + "&patient_Name=" + patient_Name + "&cdoc=" + cdoc);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }
}
