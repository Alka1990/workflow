import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.workflow.connection.LoginDAO;

@WebServlet("/ImpressionProcess")
public class ImpressionProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            HttpSession session = request.getSession();
            con = LoginDAO.getConnectionDetails();
            String user = (String) session.getAttribute("userid");

            if (user == null) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('You must be logged in to perform this action.');");
                response.getWriter().println("location='login.jsp';");
                response.getWriter().println("</script>");
                return;
            }

            String impressionId = request.getParameter("impression_id");
            String decision = request.getParameter("decision");
            String remarks = request.getParameter("remarks");
            String UpdatedBy = user;
            String Lab = request.getParameter("impression_user");
            String UPL = user;
            String PLN = user;
            
            String sql = null;

            if ("Impression_LAB".equals(decision)||"Impression_Upl".equals(decision)||"Impression_Pln".equals(decision)||"Impression_Accept".equals(decision) || "Impression_Reject".equals(decision)) {
                sql = "UPDATE impression SET decision = ?, pln_user = ?, pln_at = NOW(), Updated_By = ?,remarks = ?,impression_user = ?,lab_user = ?,upl_user = ? WHERE impression_id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, decision);
                ps.setString(2, user);
                ps.setString(3, UpdatedBy);
                ps.setString(4, remarks);
                ps.setString(5, Lab);
                ps.setString(6, UPL);
                ps.setString(7, PLN);
                ps.setString(8, impressionId);
            } else {
                switch (decision) {
                    case "Impression_LAB":
                        sql = "UPDATE impression SET decision = ?, lab_user = ?, lab_at = NOW(),impression_user = ?, WHERE impression_id = ?";
                        break;
                    case "Impression_Upl":
                        sql = "UPDATE impression SET decision = ?, upl_user = ?, upl_at = NOW(),lab_user = ?, WHERE impression_id = ?";
                        break;
                    case "Impression_Pln":
                        sql = "UPDATE impression SET decision = ?, pln_user = ?,  pln_at = NOW(),remarks = ?, upl_user = ?, WHERE impression_id = ?";
                        
                        break;
                    case "Impression_INI":
                        sql = "UPDATE impression SET decision = ?, impression_user = ? impression_at = NOW(), remarks = ?,Updated_By = ?  WHERE impression_id = ?";
                        break;
                    case "Impression_Accept":
                        sql = "UPDATE impression SET decision = 'Impression_Accept',remarks = ?, Updated_By = ?  WHERE impression_id = ?";
                        break;
                    case "Impression_Reject":
                        sql = "UPDATE impression SET decision = 'Impression_Reject',remarks = ?, Updated_By = ?   WHERE impression_id = ?";
                        break;
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, decision);
                ps.setString(2, user);
                if ("Impression_Pln".equals(decision)) {
                    ps.setString(3, UpdatedBy );
                    ps.setString(4, remarks);
                    ps.setString(5, Lab);
                    ps.setString(6, UPL);
                    ps.setString(7, PLN);
                    ps.setString(8, impressionId);
                } else {
                    ps.setString(7, impressionId);
                }
            }

            int rowsUpdated = ps.executeUpdate();

            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            if (rowsUpdated > 0) {
                response.getWriter().println("alert('Impression updated successfully.');");
            } else {
                response.getWriter().println("alert('Failed to update impression.');");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Newcase1" );
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('An error occurred while updating impression.');");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Newcase1" );
            dispatcher.forward(request, response);
            response.getWriter().println("</script>");
        } finally {
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
    private void forwardRequest(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }
}
