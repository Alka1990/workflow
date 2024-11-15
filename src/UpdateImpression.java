import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.workflow.connection.LoginDAO;

@WebServlet("/UpdateImpression")
public class UpdateImpression extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        try {
            con = LoginDAO.getConnectionDetails();
            

            String user = (String) session.getAttribute("userid");
            String UpdatedBy = (String) session.getAttribute("Update_By");

            if (user == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You must be logged in to perform this action.');");
                out.println("location='login.jsp';");
                out.println("</script>");
                return;
            }
            
            String impressionId = request.getParameter("impression_id");
            String caseId = request.getParameter("case_id");
            String remarks = request.getParameter("remarks");
            String patientName = request.getParameter("patient_name");
            String doctorName = request.getParameter("doctor_name");
            String crmName = request.getParameter("crm_name");
            String caseType = request.getParameter("caseType");
            String impressionReceivedDate = request.getParameter("impression_received_date");
            
            
            
            
            // Update impression table
            String updateSql = "UPDATE impression SET case_id = ?, patient_name = ?, doctor_name = ?, crm_name = ?, caseType = ?, impression_received_date = ?, remarks = ? WHERE impression_id = ?";
            ps = con.prepareStatement(updateSql);
            ps.setString(1, caseId);
            ps.setString(2, patientName);
            ps.setString(3, doctorName);
            ps.setString(4, crmName);
            ps.setString(5, caseType);
            ps.setString(6, impressionReceivedDate);
            ps.setString(7, remarks);
            ps.setString(8, impressionId);
            
            int rowsUpdated = ps.executeUpdate();

            response.setContentType("text/html");
            PrintWriter out1 = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            if (rowsUpdated > 0) {
                out.println("alert('Impression updated successfully.');");
            } else {
                out.println("alert('Failed to update impression.');");
            }
            out.println("window.location.href = 'Newcase1';"); // Redirect to Newcase1.java
            out.println("</script>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out1 = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('An error occurred while updating impression.');");
            out.println("window.location.href = 'Newcase1';"); // Redirect to Newcase1.java
            out.println("</script>");
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
