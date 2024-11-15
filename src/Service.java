
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Service" })
public class Service extends HttpServlet {
    static final Logger LOGGER = LogManager.getLogger(Service.class);
    private static final long serialVersionUID = 1L;

    public Service() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs = null;
        String sql = "";
        String issue = "";
        String upperAligner = "";
        String lowerAligner = "";
        String remarks = "";
        String others = "";
        boolean caseid = false;
        int caseid1 = Integer.parseInt(request.getParameter("caseid"));
        issue = request.getParameter("issue");
        upperAligner = request.getParameter("upperAligner");
        lowerAligner = request.getParameter("lowerAligner");
        remarks = request.getParameter("remarks");

        try {
            con = LoginDAO.getConnectionDetails();
            pstmt1 = con.prepareStatement(
                    "INSERT INTO service(caseId,issue,date,upperAligner,lowerAligner,Remarks) values(?,?,now(),?,?,?)");
            pstmt1.setInt(1, caseid1);
            pstmt1.setString(2, issue);
            pstmt1.setString(3, upperAligner);
            pstmt1.setString(4, lowerAligner);
            pstmt1.setString(5, remarks);
            int rowaffected = pstmt1.executeUpdate();
            if (rowaffected > 0) {
                out.print("Service of " + caseid1 + " has been successfully Saved");
            }
        } catch (Exception var365) {
            LOGGER.info("Error At Searchcase=" + var365.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    ((PreparedStatement) pstmt).close();
                } catch (Exception var363) {
                } finally {
                    pstmt = null;
                }
            }

            if (pstmt1 != null) {
                try {
                    pstmt1.close();
                } catch (Exception var361) {
                } finally {
                    pstmt1 = null;
                }
            }

            if (rs != null) {
                try {
                    ((ResultSet) rs).close();
                } catch (Exception var359) {
                } finally {
                    rs = null;
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (Exception var357) {
                } finally {
                    con = null;
                }
            }

            out.flush();
            System.gc();
        }

    }
}
