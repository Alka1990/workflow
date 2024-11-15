
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Loginbk extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Loginbk.class);

  public Loginbk() {
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    if (request.getParameter("registerButton") != null) {
      System.out.println("here");
      RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
      rd.forward(request, response);
    }

    if (request.getParameter("loginButton") != null) {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      String userid = request.getParameter("username");
      String pwd = request.getParameter("password");
      String profile;
      if (LoginDAO.validate(userid, pwd)) {
        profile = "";
        String initiationFlag = "";

        try {
          profile = LoginDAO.checkProfile(userid);
          String[] profiles = profile.split("~");

          for (int i = 0; i < profiles.length; ++i) {
          }

          profile = profiles[0];
          initiationFlag = profiles[1];
        } catch (ClassNotFoundException var10) {
          LOGGER.info("Error At AddComment=" + var10.getMessage());
        } catch (SQLException var11) {
          LOGGER.info("Error At AddComment=" + var11.getMessage());
        }

        request.setAttribute("profile", profile);
        HttpSession session = request.getSession();
        session.setAttribute("profile", profile);
        session.setAttribute("userid", userid);
        session.setAttribute("initiationFlag", initiationFlag);
        RequestDispatcher rd = request.getRequestDispatcher("welcome");
        rd.forward(request, response);
      } else {
        profile = "";
        request.setAttribute("Sorry username or password error!", profile);
        RequestDispatcher rd = request.getRequestDispatcher("index.html");
        rd.forward(request, response);
      }

      out.close();
    }

  }

  public synchronized JsonArray convertResponseInJsonArray(List dataList) throws Exception {
    String METHOD_NAME = "convertResponseInJsonArray";
    Gson gson = null;
    JsonElement element = null;
    JsonArray jsonArray = new JsonArray();

    try {
      if (dataList != null && !dataList.isEmpty()) {
        gson = new Gson();
        element = gson.toJsonTree(dataList, ArrayList.class);
        jsonArray = element.getAsJsonArray();
      }
    } catch (Exception var7) {
      LOGGER.info("Error At AddComment=" + var7.getMessage());
    }

    return jsonArray;
  }
}
