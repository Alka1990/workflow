
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/geteditables1" })
public class geteditables1 extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(geteditables1.class);

  public geteditables1() {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String stage = request.getParameter("stage");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String currentstage = "";
    List<String> caselist = new ArrayList();
    String[] stagelist = stage.split(",");

    int i;
    for (i = 0; i < stagelist.length; ++i) {
      try {
        con = LoginDAO.getConnectionDetails();
        String decquery = "select * from editable where stage_code='" + stagelist[i] + "'";
        ps = con.prepareStatement(decquery);
        rs = ps.executeQuery();

        while (rs.next()) {
          if (!caselist.contains(rs.getString("inputid"))) {
            caselist.add(rs.getString("inputid"));
          }
        }
      } catch (Exception var28) {
        LOGGER.info("Error At AddComment=" + var28.getMessage());
      } finally {
        if (rs != null) {
          try {
            rs.close();
            rs = null;
          } catch (SQLException var27) {
            LOGGER.info("Error At AddComment=" + var27.getMessage());
          }
        }

        if (ps != null) {
          try {
            ps.close();
            ps = null;
          } catch (SQLException var26) {
            var26.printStackTrace();
          }
        }

        if (con != null) {
          try {
            con.close();
            con = null;
          } catch (SQLException var25) {
            LOGGER.info("Error At AddComment=" + var25.getMessage());
          }
        }

      }
    }

    for (i = 0; i < caselist.size(); ++i) {
      currentstage = String.valueOf(currentstage) + "," + (String) caselist.get(i);
    }

    response.getWriter().write(currentstage);
  }
}
