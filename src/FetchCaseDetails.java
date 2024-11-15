import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.workflow.connection.LoginDAO;

import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/FetchCaseDetails")
public class FetchCaseDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String caseId = request.getParameter("case_id");
        System.out.println("Received case_id: " + caseId);  // Logging

        JSONObject jsonResponse = new JSONObject();
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = LoginDAO.getConnectionDetails();
            String sql = "SELECT patient_name, doctor_name FROM wisealign_workflow.cc_crm WHERE case_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, caseId);
            rs = ps.executeQuery();

            if (rs.next()) {
                jsonResponse.put("patient_name", rs.getString("patient_name"));
                jsonResponse.put("doctor_name", rs.getString("doctor_name"));
                System.out.println("Found details: " + jsonResponse.toString());  // Logging
            }
        } catch (SQLException | ClassNotFoundException | JSONException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
