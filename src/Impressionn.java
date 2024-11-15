import com.workflow.connection.LoginDAO;
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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/Impressionn")
public class Impressionn extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = LogManager.getLogger(Impressionn.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No need for a JSP page, just forwarding to the doPost method
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Getting parameters from the form
        String impressionId = request.getParameter("impression_id");
        String stage = request.getParameter("stage");
        String decision = request.getParameter("decision");
        String username = request.getParameter("username");
        String decisionAt = request.getParameter("decision_at");

        try (PrintWriter out = response.getWriter();
             Connection con = LoginDAO.getConnectionDetails()) {
            // Retrieve necessary values from the impression table
            String selectImpressionSQL = "SELECT * FROM impression";
            try (PreparedStatement selectStmt = con.prepareStatement(selectImpressionSQL)) {
                selectStmt.setString(1, impressionId);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        // Values retrieved from the impression table
                        String labUser = rs.getString("lab_user");
                        String patientName = rs.getString("patient_name");
                        String plnAt = rs.getString("pln_at");

                        // Insert values into the impression_history table
                        String insertImpressionHistorySQL = "INSERT INTO impression_history (impression_id, stage, decision, username, decision_at, lab_user, patient_name, pln_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        try (PreparedStatement pstmt = con.prepareStatement(insertImpressionHistorySQL)) {
                            pstmt.setString(1, impressionId);
                            pstmt.setString(2, stage);
                            pstmt.setString(3, decision);
                            pstmt.setString(4, username);
                            pstmt.setString(5, decisionAt);
                            pstmt.setString(6, labUser);
                            pstmt.setString(7, patientName);
                            pstmt.setString(8, plnAt);

                            int result = pstmt.executeUpdate();
                            if (result > 0) {
                                out.println("Data inserted successfully.");
                            } else {
                                out.println("Failed to insert data.");
                            }
                        }
                    } else {
                        out.println("Impression with ID " + impressionId + " not found.");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            LOGGER.error("Exception: ", e);
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
