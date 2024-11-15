
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.security.AES256;
import com.security.Base64Decoder;
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
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/ChangePassword" })
public class ChangePassword extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(ChangePassword.class);
  private static final long serialVersionUID = 1L;

  public ChangePassword() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String userId = "";
    String oldpassword = "";
    String newpassword = "";
    String confirmnewpassword = "";
    HttpSession session = request.getSession();

    try {
      con = LoginDAO.getConnectionDetails();
      String user_id = (String) request.getSession().getAttribute("userid");
      oldpassword = request.getParameter("oldpass") == null ? "" : request.getParameter("oldpass");
      newpassword = request.getParameter("newpass") == null ? "" : request.getParameter("newpass");
      confirmnewpassword = request.getParameter("confirmpass") == null ? "" : request.getParameter("confirmpass");
      String dboldpass = "";
      String oldpassword64 = Base64Decoder.decodeString(oldpassword);
      String newpassword64 = Base64Decoder.decodeString(newpassword);
      String confirmnewpassword64 = Base64Decoder.decodeString(confirmnewpassword);
      String oldaes256en = AES256.encrypt(oldpassword64);
      String newaes256de = AES256.encrypt(newpassword64);
      String confrmaes256de = AES256.encrypt(confirmnewpassword64);
      if (newaes256de.equals(confrmaes256de)) {
        ps = con.prepareStatement("select Password from user_mstr where User_id='" + user_id + "'");
        System.out.println("ps  :: " + ps);
        rs = ps.executeQuery();

        int count;
        for (count = 0; rs.next(); dboldpass = rs.getString("Password")) {
          ++count;
        }

        if (count == 0) {
          out.println("User does not Exist");
        }

        if (dboldpass.equals(oldaes256en)) {
          ps = con.prepareStatement("update user_mstr set password='" + newaes256de + "' where User_id='" + user_id
              + "' and password='" + oldaes256en + "'");
          ps.executeUpdate();
          out.println("Success Data");
        } else {
          out.println("Wrong old password");
        }
      } else {
        out.println("password does not match");
      }
    } catch (Exception var21) {
      LOGGER.info("Error At Changepassword=" + var21.getMessage());
    }

  }
}
