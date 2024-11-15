
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class NextDispatchDate {
  static final Logger LOGGER = LogManager.getLogger(NextDispatchDate.class);

  public NextDispatchDate() {
  }

  public void findandadd(String selecttable, String caseId, String case_number) {
    String date = "";
    String upper1 = "";
    String lower1 = "";
    String upper2 = "";
    String lower2 = "";
    String[] selectvaluegrid = selecttable.split("#");
    String[][] selectvaluematrix = new String[100][100];

    String[] x5;
    for (int i = 0; i < selectvaluegrid.length; ++i) {
      x5 = selectvaluegrid[i].split("~");

      for (int y = 0; y < x5.length; ++y) {
        selectvaluematrix[i][y] = x5[y];
      }
    }

    ResultSet rs = null;
    x5 = null;
    PreparedStatement ps = null;

    try {
      Connection con = LoginDAO.getConnectionDetails();
      String query1 = "delete from nextdispatchdate where case_id='" + caseId + "'";
      ps = con.prepareStatement(query1);
      ps.execute();

      String nextdate;
      for (int z = 0; z < selectvaluegrid.length; ++z) {
        nextdate = "insert into nextdispatchdate(case_id,case_number,upper1,upper2,lower,lower2,nextdate) values('"
            + caseId + "','" + case_number + "','" + selectvaluematrix[z][0] + "','" + selectvaluematrix[z][1] + "','"
            + selectvaluematrix[z][2] + "','" + selectvaluematrix[z][3] + "',sysdate())";
        ps = con.prepareStatement(nextdate);
        ps.execute();
      }

      String query2 = "select * from nextdispatchdate where case_id='" + caseId + "' order by id desc limit 1";
      ps = con.prepareStatement(query2);
      rs = ps.executeQuery();
      if (rs.next()) {
        upper1 = rs.getString("upper1");
        lower1 = rs.getString("lower");
        upper2 = rs.getString("upper2");
        lower2 = rs.getString("lower2");
        date = rs.getString("nextdate");
        nextdate = this.findnextdate(upper1, lower1, upper2, lower2, date);
        ps = con
            .prepareStatement("update nextdispatchdate set nextdate='" + nextdate + "' where case_id='" + caseId + "'");
        ps.execute();
      }
    } catch (Exception var17) {
      LOGGER.info("Error At AddComment=" + var17.getMessage());
    }

  }

  public String findnextdate(String upper1, String lower1, String upper2, String lower2, String date) {
    boolean totalAligner = false;
    int upper3 = Integer.parseInt(upper1);
    int upper4 = Integer.parseInt(upper2);
    int lower3 = Integer.parseInt(lower1);
    int lower4 = Integer.parseInt(lower2);
    int totalAligner1;
    if (lower4 < upper4) {
      totalAligner1 = upper4 - upper3 + 1;
    } else {
      totalAligner1 = lower4 - upper3 + 1;
    }

    int increasedate = (14 * totalAligner1 - 15) * 24;
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date3 = new Date();
    Calendar c = Calendar.getInstance();
    c.setTime(date3);
    c.add(11, increasedate);
    String d = f.format(c.getTime());
    return d;
  }
}
