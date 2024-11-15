
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class getnextreminder {
  static final Logger LOGGER = LogManager.getLogger(getnextreminder.class);

  public getnextreminder() {
  }

  public static void getnext(long caseid) throws ClassNotFoundException, SQLException {
    int hour = 0;
    String nextstage = "";
    String previousstage = "";
    Connection con = null;
    PreparedStatement ps = null;
    con = LoginDAO.getConnectionDetails();
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      String query = "select stage,next_stage from patient_details where case_id='" + caseid + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        nextstage = rs.getString("next_stage");
        previousstage = rs.getString("stage");
      }

      query = "select time from stage_time_map where stage_code='" + nextstage + "'";
      ps = con.prepareStatement("select time from stage_time_map where stage_code='" + nextstage + "'");
      rs1 = ps.executeQuery();
      if (rs1.next()) {
        hour += rs1.getInt("time");
      }

      SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Date date = new Date();
      Calendar c = Calendar.getInstance();
      c.setTime(date);
      c.add(11, hour);
      if (c.get(7) == 7) {
        c.add(11, 24);
      }

      Date date3 = new Date();
      Calendar c1 = Calendar.getInstance();
      c1.setTime(date3);
      ps = con.prepareStatement("select * from escalationreminder where caseid=" + caseid);
      ResultSet rs2 = ps.executeQuery();
      SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String d = "";
      if (rs2.next()) {
        Date date4 = f1.parse(rs2.getString("reminderhours"));
        long x = finddifference(date3, date4);
        int i = (int) x;
        if (i != 0) {
          c.add(11, 0 - i);
        }

        d = f.format(c.getTime());
        String query4;
        if (!nextstage.contentEquals("digiplan")) {
          query4 = "update escalationreminder set  previousstage='" + previousstage + "' and nextstage='" + nextstage
              + "' and reminderhours='" + d + "' and firstreminder='N' and secondreminder='N' and thirdreminder='N')";
          ps = con.prepareStatement("update escalationreminder set previousstage='" + previousstage + "', nextstage='"
              + nextstage + "', reminderhours='" + d
              + "', firstreminder='N', secondreminder='N', thirdreminder='N' where caseid=" + caseid);
          ps.executeUpdate();
        } else {
          query4 = "delete from escalationreminder where caseid=" + caseid;
          ps = con.prepareStatement(query4);
          ps.executeUpdate();
          ps = con.prepareStatement(
              "insert into escalationreminder(previousstage, nextstage, reminderhours, firstreminder, secondreminder, thirdreminder) values('"
                  + previousstage + "','" + nextstage + "','" + d + "','N','N','N') where caseid=" + caseid);
          ps.executeUpdate();
        }
      } else {
        ps = con.prepareStatement("insert into escalationreminder values('" + caseid + "','" + previousstage + "','"
            + nextstage + "','" + d + "','N','N','N')");
        ps.execute();
      }
    } catch (Exception var26) {
      LOGGER.info("Error At AddComment=" + var26.getMessage());
    } finally {
      con.close();
      ps.close();
    }

  }

  public static long finddifference(Date date1, Date date2) {
    Calendar c = Calendar.getInstance();
    c.setTime(date1);
    c.setTime(date2);
    long diff = date1.getTime() - date2.getTime();
    long diffHours = 0L;
    if (date1.compareTo(date2) > 0) {
      diffHours = diff / 3600000L % 24L;
    }

    return diffHours;
  }
}
