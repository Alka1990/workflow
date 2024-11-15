
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ForgotPassword extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(ForgotPassword.class);
  private static final long serialVersionUID = 1L;

  public ForgotPassword() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String username = "";
    String phoneNumber = "";
    String newpassword = "";
    String confirmnewpassword = "";
    String dbphoneNumberResult = null;
    String dbpass = "";
    String oldpass = "";
    String newpass = "";
    String cpass = "";

    try {
      con = LoginDAO.getConnectionDetails();
      username = request.getParameter("username") == null ? "" : request.getParameter("username");
      phoneNumber = request.getParameter("phoneNumber") == null ? "" : request.getParameter("phoneNumber");
      newpassword = request.getParameter("newpassword") == null ? "" : request.getParameter("newpassword");
      confirmnewpassword = request.getParameter("confirmnewpassword") == null ? ""
          : request.getParameter("confirmnewpassword");
      String newpassword64 = Base64Decoder.decodeString(newpassword);
      String confirmnewpassword64 = Base64Decoder.decodeString(confirmnewpassword);
      String newaes256de = AES256.encrypt(newpassword64);
      String confrmaes256de = AES256.encrypt(confirmnewpassword64);
      if (newaes256de.equals(confrmaes256de)) {
        ps = con.prepareStatement("select Phone from user_mstr where User_id='" + username + "'");
        rs = ps.executeQuery();

        int count;
        for (count = 0; rs.next(); dbphoneNumberResult = rs.getString("Phone")) {
          ++count;
        }

        if (count == 0) {
          out.println("User does not Exist");
        }

        if (dbphoneNumberResult.equals(phoneNumber)) {
          ps = con.prepareStatement("update user_mstr set password='" + newaes256de + "' where User_id='" + username
              + "' and Phone='" + phoneNumber + "'");
          ps.execute();
          out.println("Password Reset Successfully");
        } else {
          out.println("Mobile Number does not match");
        }
      } else {
        out.println("password does not match");
      }
    } catch (Exception var21) {
      LOGGER.info("Error At ForgotPassword=" + var21.getMessage());
    }

  }
}
