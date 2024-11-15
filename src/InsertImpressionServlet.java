import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.StringUtils;
import com.workflow.connection.LoginDAO;

@WebServlet({"/InsertImpressionServlet"})
public class InsertImpressionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public InsertImpressionServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String impressionId = request.getParameter("impression_id");

    	request.setAttribute("dataInserted", true);
        request.getRequestDispatcher("ImpressionTable.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    	Connection con = null;
        PreparedStatement pstmt = null;
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

            long impressionId = Long.parseLong(request.getParameter("impression_id")); // Updated to long
            String senderName = request.getParameter("sender_name");
            String receiverName = request.getParameter("receiver_name");
            String trackingId = request.getParameter("tracking_id");
            String location = request.getParameter("location");
            String impressionUser =user;
            String impressionReceivedDateStr = request.getParameter("impression_received_date");
            String impressionAtStr = request.getParameter("impression_at");
            String labUser = request.getParameter("lab_user");
            String labAtStr = request.getParameter("lab_at");
            String uplUser = request.getParameter("upl_user");
            String uplAtStr = request.getParameter("upl_at");
            String plnUser = request.getParameter("pln_user");
            String plnAtStr = request.getParameter("pln_at");
            String decision = "Impression_INI";
            String remarks = request.getParameter("remarks");
            String caseId = request.getParameter("case_id");
           
            String patientName = request.getParameter("patient_name");
            String doctorName = request.getParameter("doctor_name");
            String crmName = request.getParameter("crm_name");
            String caseType = request.getParameter("caseType");
            String updatedBy = request.getParameter("Updated_By");

            // Print debug information
            System.out.println("Impression ID: " + impressionId);
            System.out.println("Sender Name: " + senderName);
            System.out.println("Receiver Name: " + receiverName);
            System.out.println("caseId: " + caseId);
            // Add more debug statements as needed

            try {
                String sql = "INSERT INTO impression (impression_id, sender_name, receiver_name, tracking_id, location, impression_received_date, impression_user, impression_at, lab_user, lab_at, upl_user, upl_at, pln_user, pln_at, decision, remarks, case_id, patient_name, doctor_name, crm_name, caseType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setLong(1, impressionId); // Updated to setLong
                pstmt.setString(2, senderName);
                pstmt.setString(3, receiverName);
                pstmt.setString(4, trackingId);
                pstmt.setString(5, location);
                pstmt.setTimestamp(6, convertStringToTimestamp(impressionReceivedDateStr));
                pstmt.setString(7, impressionUser);
                pstmt.setTimestamp(8, convertStringToTimestamp(impressionAtStr));
                pstmt.setString(9, labUser);
                pstmt.setTimestamp(10, labAtStr != null && !labAtStr.isEmpty() ? convertStringToTimestamp(labAtStr) : null);
                pstmt.setString(11, uplUser);
                pstmt.setTimestamp(12, uplAtStr != null && !uplAtStr.isEmpty() ? convertStringToTimestamp(uplAtStr) : null);
                pstmt.setString(13, plnUser);
                pstmt.setTimestamp(14, plnAtStr != null && !plnAtStr.isEmpty() ? convertStringToTimestamp(plnAtStr) : null);
                pstmt.setString(15, decision);
                pstmt.setString(16, remarks);
                if(StringUtils.isNullOrEmpty(caseId)|| caseId.equals("null")) {
                	pstmt.setNull(17, java.sql.Types.BIGINT);
                }else {
                	
                    pstmt.setLong(17, Long.parseLong(caseId));
                    
                }
//                pstmt.setString(17, caseId);
                
                pstmt.setString(18, patientName);
                pstmt.setString(19, doctorName);
                pstmt.setString(20, crmName);
                pstmt.setString(21, caseType);

                int rows = pstmt.executeUpdate();

                String insertHistorySQL = "INSERT INTO impression_history (impression_id, stage, decision, username, decision_at) SELECT impression_id, 'lab_user' AS stage, decision, impression_user AS username, impression_received_date AS decision_at FROM impression";
                pstmt = con.prepareStatement(insertHistorySQL);

                int rowsInserted = pstmt.executeUpdate();

                if (rows > 0 && rowsInserted > 0) {
                	 if (!response.isCommitted()) {
                         response.sendRedirect("ImpressionTable.jsp");  // Redirect to a success page
                     }                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Data Insertion Failed!');");
                    out.println("</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('An error occurred!');");
                out.println("</script>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private Timestamp convertStringToTimestamp(String dateStr) throws Exception {
        if (dateStr == null || dateStr.isEmpty()) {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date parsedDate = dateFormat.parse(dateStr);
        return new Timestamp(parsedDate.getTime());
    }
    
}
