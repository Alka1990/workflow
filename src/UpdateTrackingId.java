
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;




@WebServlet({ "/UpdateTrackingId" })
public class UpdateTrackingId extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateTrackingId() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String trackingId = request.getParameter("newTrackingId");
            Integer dispatchId = Integer.parseInt(request.getParameter("dispatchedId"));
           //String currentDate = request.getParameter("date"); 
            Connection connection12 = LoginDAO.getConnectionDetails();
            PreparedStatement stmt12 = connection12
                    .prepareStatement("update dispatched_scan set tracking_id=? where dispatched_id=?");
            stmt12.setString(1, trackingId);
            stmt12.setInt(2, dispatchId);
            int count = stmt12.executeUpdate();
            if (count != 0 && count > 0) {
                out.println("success");
            } else {
                out.println("error");
            }
        } catch (Exception var9) {
            System.out.println("Exception = " + var9);
        }

    }
}
