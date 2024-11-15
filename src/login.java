
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.security.AES256;
import com.security.Base64Decoder;
import com.workflow.connection.LoginDAO;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/login" })
public class login extends HttpServlet {
  public login() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("hello...");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    String passDecoder64 = "";
    String loginButton = request.getParameter("loginButton");
    HttpSession session = request.getSession();
    if (request.getParameter("registerButton") != null) {
      RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
      rd.forward(request, response);
    }

    if (loginButton != null) {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      String userid = request.getParameter("user_id");
      request.setAttribute("username", userid);
      System.out.println("userid: " + userid);
      String pwd = request.getParameter("password");

      try {
        passDecoder64 = Base64Decoder.decodeString(pwd);
      } catch (Exception var123) {
        System.out.println(var123);
      }

      String aes256 = AES256.encrypt(passDecoder64);
      AES256.encrypt(passDecoder64);
      System.out.println("pass hai " + AES256.decrypt("wWylRg//H4+VCaBjWc/b5g=="));
      if (LoginDAO.validate(userid, aes256)) {
        String profile = "";
        String initiationFlag = "";
        String sHold = "";
        String crm_Name = "";
        try {
          profile = LoginDAO.checkProfile(userid);
          String[] profiles = profile.split("~");

          for (int i16 = 0; i16 < profiles.length; ++i16) {
          }

          profile = profiles[0];
          initiationFlag = profiles[1];
          sHold = profiles[2];
          crm_Name = profiles[3];
        } catch (ClassNotFoundException var124) {
          System.out.println("loginpage " + var124);
        } catch (SQLException var125) {
          System.out.println("loginpage " + var125);
        }

        session.setAttribute("profile", profile);
        session.setAttribute("userid", userid);
        System.out.println("login userid: " + userid);
        session.setAttribute("initiationFlag", initiationFlag);
        session.setAttribute("sHold", sHold);
        session.setAttribute("crm_Name", crm_Name);
        List<String> getRight = LoginDAO.getRight(userid);
        session.setAttribute("getRight", getRight);
        ServletContext context = this.getServletContext();
        String path = context.getRealPath("/WEB-INF/resources/data32watts.properties");
        FileReader reader = new FileReader(path);
        Properties p = new Properties();
        p.load(reader);
        List<String> Print_Type = new ArrayList();
        String[] array_Print_Type = p.getProperty("DprintingDecesion").split(",");
        String[] arrayOfString1 = array_Print_Type;
        int i = array_Print_Type.length;

        for (byte b1 = 0; b1 < i; ++b1) {
          String a = arrayOfString1[b1];
          Print_Type.add(a);
        }

        session.setAttribute("Print_Type", Print_Type);
        List<String> Decesion_Type = new ArrayList();
        String[] DecesionFQC_FQc = p.getProperty("DecesionFQc").split(",");
        String[] arrayOfString2 = DecesionFQC_FQc;
        int j = DecesionFQC_FQc.length;

        for (byte b2 = 0; b2 < j; ++b2) {
          String a = arrayOfString2[b2];
          Decesion_Type.add(a);
        }

        session.setAttribute("Decesion_Type", Decesion_Type);
        List<String> Planning_Type = new ArrayList();
        String[] arrOfStr_Planning_Type = p.getProperty("Planning_Type").split(",");
        String[] arrayOfString3 = arrOfStr_Planning_Type;
        int k = arrOfStr_Planning_Type.length;

        for (byte b3 = 0; b3 < k; ++b3) {
          String a = arrayOfString3[b3];
          Planning_Type.add(a);
        }

        session.setAttribute("Planning_Type", Planning_Type);
        List<String> Decesionlab = new ArrayList();
        String[] Decesionlab_ary = p.getProperty("Decesionlab").split(",");
        String[] arrayOfString4 = Decesionlab_ary;
        int m = Decesionlab_ary.length;

        for (byte b4 = 0; b4 < m; ++b4) {
          String a = arrayOfString4[b4];
          Decesionlab.add(a);
        }

        session.setAttribute("Decesionlab", Decesionlab);
        List<String> PackingAPR = new ArrayList();
        String[] PackingAPR_ary = p.getProperty("PackingAPR").split(",");
        String[] arrayOfString5 = PackingAPR_ary;
        int n = PackingAPR_ary.length;

        for (byte b5 = 0; b5 < n; ++b5) {
          String a = arrayOfString5[b5];
          PackingAPR.add(a);
        }

        session.setAttribute("PackingAPR", PackingAPR);
        List<String> DispatchedDecesion = new ArrayList();
        String[] DispatchedDecesion_ary = p.getProperty("DispatchedDecesion").split(",");
        String[] arrayOfString6 = DispatchedDecesion_ary;
        int i1 = DispatchedDecesion_ary.length;

        for (byte b6 = 0; b6 < i1; ++b6) {
          String a = arrayOfString6[b6];
          DispatchedDecesion.add(a);
        }

        session.setAttribute("DispatchedDecesion", DispatchedDecesion);
        List<String> UploadDecesion = new ArrayList();
        String[] UploadDecesion_ary = p.getProperty("UploadDecesion").split(",");
        String[] arrayOfString7 = UploadDecesion_ary;
        int i2 = UploadDecesion_ary.length;

        for (byte b7 = 0; b7 < i2; ++b7) {
          String a = arrayOfString7[b7];
          UploadDecesion.add(a);
        }

        session.setAttribute("UploadDecesion", UploadDecesion);
        List<String> HallowDecesion = new ArrayList();
        String[] HallowDecesion_ary = p.getProperty("HallowDecesion").split(",");
        String[] arrayOfString8 = HallowDecesion_ary;
        int i3 = HallowDecesion_ary.length;

        for (byte b8 = 0; b8 < i3; ++b8) {
          String a = arrayOfString8[b8];
          HallowDecesion.add(a);
        }

        session.setAttribute("HallowDecesion", HallowDecesion);
        List<String> PrintDecesion = new ArrayList();
        String[] PrintDecesion_ary = p.getProperty("PrintDecesion").split(",");
        String[] arrayOfString9 = PrintDecesion_ary;
        int i4 = PrintDecesion_ary.length;

        for (byte b9 = 0; b9 < i4; ++b9) {
          String a = arrayOfString9[b9];
          PrintDecesion.add(a);
        }

        session.setAttribute("PrintDecesion", PrintDecesion);
        List<String> Mode_type = new ArrayList();
        String[] mode_ary = p.getProperty("Mode").split(",");
        String[] arrayOfString10 = mode_ary;
        int i5 = mode_ary.length;

        for (byte b10 = 0; b10 < i5; ++b10) {
          String a = arrayOfString10[b10];
          Mode_type.add(a);
        }

        session.setAttribute("Mode_type", Mode_type);
        List<String> Planning_Review = new ArrayList();
        String[] arrOfStr_Planning_Review = p.getProperty("Planning_Review").split(",");
        System.out.println(arrOfStr_Planning_Review);
        String[] arrayOfString11 = arrOfStr_Planning_Review;
        int i6 = arrOfStr_Planning_Review.length;

        for (byte b11 = 0; b11 < i6; ++b11) {
          String a = arrayOfString11[b11];
          Planning_Review.add(a);
        }

        session.setAttribute("Planning_Review", Planning_Review);
        List<String> customerlist = new ArrayList();
        String[] arrOfStr = p.getProperty("Type.of.Customer").split(",");
        String[] arrayOfString12 = arrOfStr;
        int i7 = arrOfStr.length;

        for (byte b12 = 0; b12 < i7; ++b12) {
          String a = arrayOfString12[b12];
          customerlist.add(a);
        }

        session.setAttribute("customerlist", customerlist);
        List<String> packagelist = new ArrayList();
        String[] arrOfStr1 = p.getProperty("PACKAGE").split(",");
        String[] arrayOfString13 = arrOfStr1;
        int i8 = arrOfStr1.length;

        for (byte b13 = 0; b13 < i8; ++b13) {
          String a = arrayOfString13[b13];
          packagelist.add(a);
        }

        session.setAttribute("packagelist", packagelist);
        List<String> kollist = new ArrayList();
        String[] arrOfStr2 = p.getProperty("KOL").split(",");
        String[] arrayOfString14 = arrOfStr2;
        int i9 = arrOfStr2.length;

        for (byte b14 = 0; b14 < i9; ++b14) {
          String a = arrayOfString14[b14];
          kollist.add(a);
        }

        session.setAttribute("kollist", kollist);
        List<String> typeofaccountlist = new ArrayList();
        String[] arrOfStr3 = p.getProperty("Type.of.account").split(",");
        String[] arrayOfString15 = arrOfStr3;
        int i10 = arrOfStr3.length;

        for (byte b15 = 0; b15 < i10; ++b15) {
          String a = arrayOfString15[b15];
          typeofaccountlist.add(a);
        }

        session.setAttribute("typeofaccountlist", typeofaccountlist);
        List<String> prioritylist = new ArrayList();
        String[] arrOfStr4 = p.getProperty("Priority").split(",");
        String[] arrayOfString16 = arrOfStr4;
        int i11 = arrOfStr4.length;

        for (byte b16 = 0; b16 < i11; ++b16) {
          String a = arrayOfString16[b16];
          prioritylist.add(a);
        }

        session.setAttribute("prioritylist", prioritylist);
        List<String> citylist = new ArrayList();
        String[] arrOfStr5 = p.getProperty("City").split(",");
        String[] arrayOfString17 = arrOfStr5;
        int i12 = arrOfStr5.length;

        for (byte b17 = 0; b17 < i12; ++b17) {
          String a = arrayOfString17[b17];
          citylist.add(a);
        }

        session.setAttribute("citylist", citylist);
        List<String> CRMLlist = new ArrayList();
        String[] arrOfStr6 = p.getProperty("CRM").split(",");
        String[] arrayOfString18 = arrOfStr6;
        int i13 = arrOfStr6.length;

        for (byte b18 = 0; b18 < i13; ++b18) {
          String a = arrayOfString18[b18];
          CRMLlist.add(a);
        }

        session.setAttribute("CRMLlist", CRMLlist);
        List<String> TRequestlist = new ArrayList();
        String[] TRequestlist6 = p.getProperty("TRequest").split(",");
        String[] arrayOfString19 = TRequestlist6;
        int i14 = TRequestlist6.length;

        for (byte b19 = 0; b19 < i14; ++b19) {
          String a = arrayOfString19[b19];
          TRequestlist.add(a);
        }

        session.setAttribute("TRequestlist", TRequestlist);
        List<String> Dispatch_ruleslist = new ArrayList();
        String[] Dispatch_rules6 = p.getProperty("Dispatch_rules").split(",");
        String[] arrayOfString20 = Dispatch_rules6;
        int i15 = Dispatch_rules6.length;

        for (byte b20 = 0; b20 < i15; ++b20) {
          String a = arrayOfString20[b20];
          Dispatch_ruleslist.add(a);
        }

        session.setAttribute("Dispatch_ruleslist", Dispatch_ruleslist);
      } else {
        out.println("error");
      }

      out.close();
    }

  }

  public InputStream getResource(String resourcePath) {
    ServletContext servletContext = this.getServletContext();
    InputStream openStream = servletContext.getResourceAsStream(resourcePath);
    return openStream;
  }
}
