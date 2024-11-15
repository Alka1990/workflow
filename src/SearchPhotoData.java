
// Source code is decompiled from a .class file using FernFlower decompiler.
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
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SearchPhotoData" })
public class SearchPhotoData extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SearchPhotoData.class);

  public SearchPhotoData() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    System.out.println("SearchPhotoData  hit ");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String CaseId = "";
    String DoctorName = "";
    String PatientName = "";
    String ClinicName = "";
    String viewphoto = "";
    CaseId = request.getParameter("caseId") == null ? "" : request.getParameter("caseId");
    DoctorName = request.getParameter("doctorname") == null ? "" : request.getParameter("doctorname");
    PatientName = request.getParameter("patient_Name") == null ? "" : request.getParameter("patient_Name");
    ClinicName = request.getParameter("clinicname") == null ? "" : request.getParameter("clinicname");
    viewphoto = request.getParameter("viewphoto") == null ? "" : request.getParameter("viewphoto");
    String sql = "select * from cc_crm where Case_Id='" + CaseId + "' ";

    try {
      con = LoginDAO.getConnectionDetails();
      if (viewphoto.endsWith("Y")) {
        System.out.println("i am in");
        response.sendRedirect("DispImageGrid?caseId=" + CaseId);
      } else {
        pstmt = con.prepareStatement(sql);
        System.out.println("pstmt   : " + pstmt.toString());
        rs = pstmt.executeQuery();
        if (rs.next()) {
          CaseId = rs.getString("Case_Id");
          DoctorName = rs.getString("Doctor_Name");
          PatientName = rs.getString("Patient_Name");
          ClinicName = rs.getString("clinic_Name");
        }

        response.sendRedirect("DragDropImages?caseId=" + CaseId + "&doctorname=" + DoctorName + "&patient_Name="
            + PatientName + "&clinicname=" + ClinicName);
      }
    } catch (SQLException | ClassNotFoundException var15) {
      var15.printStackTrace();
    }

  }
}
