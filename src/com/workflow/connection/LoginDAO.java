// Source code is decompiled from a .class file using FernFlower decompiler.
package com.workflow.connection;

import com.vo.AccountVo;
import com.vo.DraftVo;
import com.vo.ImagesVo;
import com.vo.MidAssessmentVo;
import com.vo.NewQueryPhotoVo;
import com.vo.Newcase1;
import com.vo.PendingVO;
import com.vo.ProfileVO;
import com.vo.StageMasterVO;
import com.vo.ViewVO;
import com.vo.nextdispatch;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class LoginDAO {
  static final Logger LOGGER = LogManager.getLogger(LoginDAO.class);
  private static final int List = 0;
  public static Map<String, Map<String, Timestamp>> caseLockMap = new HashMap();
  public static Properties properties = new Properties();

  public LoginDAO() {
  }

  public static void setCaseLock(String caseId, String userId) {
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    Map<String, Timestamp> userTimeMap = new HashMap();
    userTimeMap.put(caseId, timestamp);
    caseLockMap.put(userId, userTimeMap);
  }

  public static void getCaseLock(String caseId, String userId) {
    Iterator<Map.Entry<String, Map<String, Timestamp>>> itr = caseLockMap.entrySet().iterator();

    while (true) {
      Map.Entry entry;
      do {
        if (!itr.hasNext()) {
          return;
        }

        entry = (Map.Entry) itr.next();
      } while (!((String) entry.getKey()).equals(userId));

      Map<String, Timestamp> userTimeMap = (Map) entry.getValue();
      Iterator<Map.Entry<String, Timestamp>> itrins = userTimeMap.entrySet().iterator();

      while (itrins.hasNext()) {
        Map.Entry<String, Timestamp> entryins = (Map.Entry) itrins.next();
        if (((String) entryins.getKey()).equals(caseId)) {
          Timestamp timestamp = new Timestamp(System.currentTimeMillis());
          double var10000 = (double) (timestamp.getTime() - ((Timestamp) entryins.getValue()).getTime());
        }
      }
    }
  }

  public static String strkitStatus(Long cid) {
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = "select starter_case_stage from cc_crm where case_id='" + cid + "' ";
    String resultdata = "";

    try {
      System.out.println("try...");
      con = getConnectionDetails();
      pstmt = con.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      System.out.println("rs=>" + rs);
      if (rs.next()) {
        resultdata = rs.getString("starter_case_stage");
        System.out.println("resultdata: " + resultdata);
      }
    } catch (Exception var6) {
      System.out.println("throw starstaus => " + var6.getMessage());
    }

    return resultdata;
  }

  public static Connection getConnectionDetails() throws ClassNotFoundException, SQLException {
    Connection con = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/wisealign_workflow?characterEncoding=latin1&useConfigs=maxPerformance&autoReconnect=true&useSSL=false",
          "wisealign_workflow", "Render@323#");
      System.out.println("Connection Successful");
    } catch (Exception var2) {
      System.out.println("Error in DB Connection \n" + var2);
    }

    return con;
  }

  public static Connection getDigiConnectionDetails() throws ClassNotFoundException, SQLException {
    Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = getConnectionDetails();
    return  con;
  }

  public static boolean validate(String name, String pass) {
    boolean status = false;
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    Statement stat = null;

    try {
      System.out.println("name: " + name + " pass: " + pass);
      con = getConnectionDetails();
      System.out.println("con" + con);

      String query = "select * from user_mstr where UPPER(User_id)='<USERID>' and Password='<PASSWORD>'";
      query = query.replace("<USERID>", name.toUpperCase());
      query = query.replace("<PASSWORD>", pass);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      status = rs.next();
      if (status) {
        query = "insert into LoggedInUsers(UserId,loginTime)values ('" + name + "',sysdate())";
        stat = con.createStatement();
        stat.executeUpdate(query);
      }
    } catch (Exception var28) {
      System.out.println("Error At LoginDAO class validate()=" + var28.getMessage());
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var27) {
          var27.printStackTrace();
        }
      }

      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var26) {
          LOGGER.info("Error At UnHoldCaseValue=" + var26.getMessage());
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          LOGGER.info("Error At UnHoldCaseValue=" + var25.getMessage());
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

    return status;
  }

  public static boolean logOut(String nam) {
    boolean status = false;
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    Statement stat = null;

    try {
      con = getConnectionDetails();
      String query = "insert into LoggedInUsersHistory (userId,loginTime) select userId,loginTime from LoggedInUsers where userId ='"
          + nam + "' order by loginTime desc LIMIT 1";
      stat = con.createStatement();
      stat.executeUpdate(query);
      query = "delete from LoggedInUsers where userId='" + nam + "'";
      stat.executeUpdate(query);
    } catch (Exception var27) {
      LOGGER.info("Error At UnHoldCaseValue=" + var27.getMessage());
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var26) {
          var26.printStackTrace();
        }
      }

      if (rs != null) {
        try {
          ((ResultSet) rs).close();
          rs = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ((PreparedStatement) ps).close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return status;
  }

  public static ProfileVO ProfileMapping(String userid, String decision, String stage, Long caseId)
      throws ClassNotFoundException, SQLException {
    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    Statement stat = null;
    ProfileVO profileVO = new ProfileVO();
    String query = "";

    try {
      con = getConnectionDetails();
      query = "select DECS_CODE from DECISION_MASTER where DISPLAY_NAME='<DECISION>'";
      query = query.replace("<DECISION>", decision);
      ps = con.prepareStatement(query);
      ResultSet rst = ps.executeQuery();
      String decs_code = "";
      if (rst.next()) {
        decs_code = rst.getString("DECS_CODE");
      }

      query = "select PROFILE_ID from user_mstr where UPPER(USER_ID)='<USERID>'";
      query = query.replace("<USERID>", userid.toUpperCase());
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        String profile_id = rs.getString("PROFILE_ID");
        profileVO.setProfileId(profile_id);
        query = "select * from SYSTEM_CONFIGURATION_TBL where PROFILE_ID='<PROFILEID>' and DECS_CODE='<DECSCODE>' and stage_code='"
            + stage + "' and Primary_stage='Y'";
        query = query.replace("<PROFILEID>", profile_id);
        query = query.replace("<DECSCODE>", decs_code);
        ps1 = con.prepareStatement(query);
        rs1 = ps1.executeQuery();
        String insquery;
        if (rs1.next()) {
          profileVO.setDecisionCode(decs_code);
          insquery = rs1.getString("STATUS_CODE");
          profileVO.setStatusCode(insquery);
          String stage_code = rs1.getString("STAGE_CODE");
          profileVO.setStageCode(stage_code);
          String next_stage = rs1.getString("NEXT_STAGE");
          profileVO.setNextStage(next_stage);
        }

        query = "select * from SYSTEM_CONFIGURATION_TBL where PROFILE_ID='<PROFILEID>' and DECS_CODE='<DECSCODE>' and stage_code='"
            + stage + "' and Primary_stage='N'";
        query = query.replace("<PROFILEID>", profile_id);
        query = query.replace("<DECSCODE>", decs_code);
        query = query.replace("<Stage>", stage);
        ps1 = con.prepareStatement(query);
        rs1 = ps1.executeQuery();
        insquery = "";

        while (rs1.next()) {
          stat = con.createStatement();
          if (!rs1.getString("NEXT_STAGE").equals((Object) null)) {
            insquery = "Insert into case_routing values(" + caseId + ",'" + stage + "','"
                + rs1.getString("NEXT_STAGE") + "','N','N',sysdate(),sysdate())";
            stat.executeUpdate(insquery);
          }
        }
      }
    } catch (Exception var46) {
      LOGGER.info("Error At Exception=" + var46.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var45) {
          var45.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          rs1.close();
          rs1 = null;
        } catch (SQLException var44) {
          var44.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var43) {
          var43.printStackTrace();
        }
      }

      if (ps1 != null) {
        try {
          ps1.close();
          ps1 = null;
        } catch (SQLException var42) {
          var42.printStackTrace();
        }
      }

      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var41) {
          var41.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var40) {
          var40.printStackTrace();
        }
      }

    }

    return profileVO;
  }

  public static String checkProfile(String userID) throws ClassNotFoundException, SQLException {
    String profile = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sInitiation = null;
    String shold = null;
    String crm_Name = null;
    try {
      con = getConnectionDetails();
      String query = "select a.crm_Name,a.PROFILE_ID,b.Initiation,b.hold from user_mstr a,profile_master b where a.PROFILE_ID=b.PROFILE_ID  and UPPER(a.User_id)='<USERID>'";
      
      query = query.replace("<USERID>", userID.toUpperCase());
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        profile = rs.getString("PROFILE_ID");
        sInitiation = rs.getString("Initiation");
        shold = rs.getString("hold");
        crm_Name = rs.getString("crm_Name");
      }
    } catch (Exception var24) {
      LOGGER.info("Error At UnHoldCaseValue=" + var24.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

    }

    return profile + "~" + sInitiation + "~" + shold + "~" + crm_Name ;
  }

  public static String getStages(String userID) throws ClassNotFoundException, SQLException {
    String profile = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String stageCode = "";
    String stageCodeval = "";
    String sInitiation = null;

    try {
      con = getConnectionDetails();
      String query = "select stage_code from profile_stage_map a, profile_master b where a.Profile_id=b.Profile_id and b.profile_id=(select profile_id from user_mstr where user_id='"
          + userID + "')";
      ps = con.prepareStatement(query);

      for (rs = ps.executeQuery(); rs.next(); stageCodeval = stageCodeval + "~" + stageCode) {
        stageCode = rs.getString("stage_code");
      }

      stageCodeval = stageCodeval.substring(1, stageCodeval.length());
    } catch (Exception var25) {
      LOGGER.info("Error At UnHoldCaseValue=" + var25.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

    }

    return stageCodeval;
  }

  public static String updatecaseRouting(String caseID, String stage) throws ClassNotFoundException, SQLException {
    String rescaseid = "";
    String res1caseid = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement stat = null;
    String updateRoutingFlag = "";
    String cancelRoutingFlag = "N";
    String sInitiation = null;

    try {
      con = getConnectionDetails();
      String query = "select caseID from case_routing where caseid='" + caseID + "' and stage_completed='N'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        res1caseid = rs.getString("caseID");
      }

      if (!res1caseid.equals("") && !res1caseid.equals((Object) null)) {
        cancelRoutingFlag = "Y";
      }

      query = "select caseID from case_routing where caseid='" + caseID + "' and next_stage='" + stage + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        rescaseid = rs.getString("caseID");
        if (!rescaseid.equals("") && !rescaseid.equals((Object) null)) {
          query = "update case_routing set stage_completed='Y', UpdatedateTime=sysdate() where caseid='"
              + caseID + "' and next_stage='" + stage + "'";
          stat = con.createStatement();
          stat.executeUpdate(query);
          updateRoutingFlag = "Y";
          cancelRoutingFlag = "N";
        } else {
          updateRoutingFlag = "N";
        }
      }
    } catch (Exception var32) {
      LOGGER.info("Error At Exception=" + var32.getMessage());
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var31) {
          var31.printStackTrace();
        }
      }

      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var30) {
          var30.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var29) {
          var29.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var28) {
          var28.printStackTrace();
        }
      }

    }

    return updateRoutingFlag + "~" + cancelRoutingFlag;
  }

  public static List<StageMasterVO> getStageMaster() throws ClassNotFoundException, SQLException {
    List<StageMasterVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String query = "select * from stage_master  ";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        StageMasterVO list1 = new StageMasterVO();
        list1.setDisplayName(rs.getString("DISPLAY_NAME"));
        list1.setIsActive(rs.getString("Is_Active"));
        list1.setStage_sequence(rs.getString("stage_sequence"));
        list1.setCategory_default(rs.getString("category_default"));
        list.add(list1);
      }
    } catch (Exception var215) {
      LOGGER.info("Error At Exception=" + var215.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (Exception var213) {
        } finally {
          rs = null;
        }
      }

      if (ps != null) {
        try {
          ps.close();
        } catch (Exception var211) {
        } finally {
          ps = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var209) {
        } finally {
          con = null;
        }
      }

      System.gc();
    }

    return list;
  }

  public static List<ViewVO> getCase(String userid) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from patient_details where USER_ID='" + userid + "' order by initiated_Date desc";
      query = query.replace("<USERID>", userid.toUpperCase());
      query = query.replace("<STATUS>", STATUS);
      ps = con.prepareStatement(query);
      List<String> caselist = new ArrayList();
      rs = ps.executeQuery();

      ViewVO viewVO;
      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision(rs.getString("DECISION"));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        caselist.add(rs.getString("CASE_ID"));
        list.add(viewVO);
      }

      query = "select * from patient_details where case_id in (select distinct(case_id) from case_mstr_history where user_id='"
          + userid + "') order by initiated_Date desc";
      query = query.replace("<USERID>", userid.toUpperCase());
      query = query.replace("<STATUS>", STATUS);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        viewVO.setCaserid(rs.getString("case_number"));
        viewVO.setPriority(rs.getString("priority"));
        if (!caselist.contains(rs.getString("CASE_ID"))) {
          list.add(viewVO);
        }
      }
    } catch (Exception var27) {
      LOGGER.info("Error At Exception=" + var27.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var26) {
          var26.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<ViewVO> getprevious(String userid) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from patient_details where user_id='" + userid + "' order by initiated_Date desc";
      query = query.replace("<USERID>", userid.toUpperCase());
      query = query.replace("<STATUS>", STATUS);
      ps = con.prepareStatement(query);
      List<String> caselist = new ArrayList();
      rs = ps.executeQuery();

      ViewVO viewVO;
      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        caselist.add(rs.getString("CASE_ID"));
        list.add(viewVO);
      }

      query = "select * from patient_details where case_id in (select distinct(case_id) from case_mstr_history where user_id='"
          + userid + "') order by initiated_Date desc";
      query = query.replace("<USERID>", userid.toUpperCase());
      query = query.replace("<STATUS>", STATUS);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        if (!caselist.contains(rs.getString("CASE_ID"))) {
          list.add(viewVO);
        }
      }
    } catch (Exception var27) {
      var27.printStackTrace();
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var26) {
          LOGGER.info("Error At Exception=" + var26.getMessage());
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          LOGGER.info("Error At Exception=" + var25.getMessage());
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<String> getRight(String username) {
    List<String> getRight = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String decquery = "select user_right from user_right where user_id='" + username + "'";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();

      while (rs.next()) {
        getRight.add(rs.getString("user_right"));
      }
    } catch (ClassNotFoundException var26) {
      var26.printStackTrace();
    } catch (SQLException var27) {
      var27.printStackTrace();
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return getRight;
  }

  public static List<ViewVO> getHoldCase(String userid) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from CC_CRM where HoldFlag='Y'  order by CREATED_DATE desc";
      query = query.replace("<USERID>", userid.toUpperCase());
      query = query.replace("<STATUS>", STATUS);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        ViewVO viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision(rs.getString("remark"));
        viewVO.setStatus(rs.getString("draft"));
        viewVO.setStage(rs.getString("Case_STAGE"));
        viewVO.setNext_stage(rs.getString("Case_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("CREATED_DATE"));
        viewVO.setInituserid(rs.getString("USER_ID"));
        list.add(viewVO);
      }
    } catch (Exception var26) {
      LOGGER.info("Error At Exception=" + var26.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return list;
  }

  public static String rejectCase(String userid, String caseid, String remarks, String casetage)
      throws ClassNotFoundException, SQLException {
    Connection con = null;
    Connection con1 = null;
    PreparedStatement pstmt = null;
    PreparedStatement ps = null;
    Statement stmt = null;
    ResultSet rs = null;
    Statement stat = null;
    String response = "";
    String dbcaseStage = "";

    try {
      con = getConnectionDetails();
      stmt = con.createStatement();
      stat = con.createStatement();
      ps = con.prepareStatement(" select case_id,case_stage from CC_CRM where case_id='" + caseid + "'");
      rs = ps.executeQuery();
      if (rs.next()) {
        dbcaseStage = rs.getString("case_stage");
      }

      if (!dbcaseStage.equals(casetage)) {
        pstmt = con.prepareStatement(" update CC_CRM set case_stage='REJ' where case_id='" + caseid + "' ");
        int rowaffected = pstmt.executeUpdate();
        if (rowaffected > 0) {
          stat.executeUpdate("insert into HoldStatus values ('" + userid + "','" + caseid
              + "','REJ',sysdate(),'" + remarks + "')");
          stmt.executeUpdate(
              " Insert into Decision_History(decision,Remarks,date_time,stage, UserId,caseid) values( 'REJ','"
                  + remarks + "', sysdate(),'Hold','" + userid + "','" + caseid + "') ");
        }

        response = "Canceled Request Successful for Case Id " + caseid;
      } else {
        response = "Case Id " + caseid + " is already Canceled";
      }
    } catch (Exception var34) {
      var34.printStackTrace();
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var33) {
          var33.printStackTrace();
        }

        if (rs != null) {
          try {
            rs.close();
            rs = null;
          } catch (SQLException var32) {
            var32.printStackTrace();
          }
        }

        if (ps != null) {
          try {
            ps.close();
            ps = null;
          } catch (SQLException var31) {
            var31.printStackTrace();
          }
        }

        if (con != null) {
          try {
            con.close();
            con = null;
          } catch (SQLException var30) {
            var30.printStackTrace();
          }
        }
      }

    }

    return response;
  }

  public static String setHoldCase(String userid, String caseid, String remarks)
      throws ClassNotFoundException, SQLException {
    new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement stat = null;
    String holdCount = "N";
    String response = "";

    try {
      con = getConnectionDetails();
      String decquery = "select case_id from CC_CRM where Holdflag='Y' and case_id='" + caseid + "'";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      if (rs.next()) {
        holdCount = "Y";
      }

      if (holdCount.equals("N")) {
        decquery = "update CC_CRM set Holdflag='Y' where case_id='" + caseid + "'";
        stat = con.createStatement();
        stat.executeUpdate(decquery);
        decquery = "insert into HoldStatus values ('" + userid + "','" + caseid + "','Hold',sysdate(),'"
            + remarks + "')";
        stat.executeUpdate(decquery);
        decquery = "Insert into Decision_History(decision,Remarks,date_time,stage, UserId,caseid) values( 'Hold','"
            + remarks + "', sysdate(),'Hold','" + userid + "','" + caseid + "') ";
        stat.executeUpdate(decquery);
        decquery = "update case_routing set Holdflag='Y' where caseid='" + caseid + "'";
        stat = con.createStatement();
        stat.executeUpdate(decquery);
        response = "Hold Request Successful for Case Id " + caseid;
      } else {
        response = "Case Id " + caseid + " is already Hold";
      }
    } catch (Exception var31) {
      var31.printStackTrace();
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var30) {
          var30.printStackTrace();
        }

        if (rs != null) {
          try {
            rs.close();
            rs = null;
          } catch (SQLException var29) {
            var29.printStackTrace();
          }
        }

        if (ps != null) {
          try {
            ps.close();
            ps = null;
          } catch (SQLException var28) {
            var28.printStackTrace();
          }
        }

        if (con != null) {
          try {
            con.close();
            con = null;
          } catch (SQLException var27) {
            var27.printStackTrace();
          }
        }
      }

    }

    return response;
  }

  public static String setUnHoldCase(String userid, String caseid, String remarks)
      throws ClassNotFoundException, SQLException {
    new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement stat = null;
    String unholdCount = "N";
    String response = "";

    try {
      con = getConnectionDetails();
      String decquery = "select case_id from CC_CRM where Holdflag='N' and case_id='" + caseid + "'";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      if (rs.next()) {
        unholdCount = "Y";
      }

      if (unholdCount.equals("N")) {
        decquery = "update CC_CRM set Holdflag='N' where case_id='" + caseid + "'";
        stat = con.createStatement();
        stat.executeUpdate(decquery);
        decquery = "insert into HoldStatus values ('" + userid + "','" + caseid + "','UnHold',sysdate(),'"
            + remarks + "')";
        stat.executeUpdate(decquery);
        decquery = "Insert into Decision_History(decision,Remarks,date_time,stage, UserId,caseid) values( 'UnHold','"
            + remarks + "', sysdate(),'UnHold','" + userid + "','" + caseid + "') ";
        stat.executeUpdate(decquery);
        decquery = "update case_routing set Holdflag='N' where caseid='" + caseid + "'";
        stat = con.createStatement();
        stat.executeUpdate(decquery);
        response = "UnHold Request Successful for Case Id " + caseid;
      } else {
        response = "Case Id " + caseid + " is already UnHold";
      }
    } catch (Exception var31) {
      LOGGER.info("Error At Exception=" + var31.getMessage());
    } finally {
      if (stat != null) {
        try {
          stat.close();
          stat = null;
        } catch (SQLException var30) {
          var30.printStackTrace();
        }

        if (rs != null) {
          try {
            rs.close();
            rs = null;
          } catch (SQLException var29) {
            var29.printStackTrace();
          }
        }

        if (ps != null) {
          try {
            ps.close();
            ps = null;
          } catch (SQLException var28) {
            var28.printStackTrace();
          }
        }

        if (con != null) {
          try {
            con.close();
            con = null;
          } catch (SQLException var27) {
            var27.printStackTrace();
          }
        }
      }

    }

    return response;
  }

  public static List<ViewVO> searchCase(String caseid) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from cc_crm where case_id='" + caseid + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      ViewVO viewVO;
      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("CASE_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision(rs.getString("remark"));
        viewVO.setStatus(rs.getString("crm_name"));
        viewVO.setStage(rs.getString("case_stage"));
        viewVO.setNext_stage(rs.getString("case_stage"));
        viewVO.setCraeted(rs.getString("case_stage"));
        viewVO.setInitDate(rs.getString("case_stage"));
        viewVO.setInituserid(rs.getString("case_stage"));
        list.add(viewVO);
      }

      query = "select b.user_id,b.case_id,b.status,b.case_number,b.priority,b.decision,b.stage,a.next_stage,b.CREATED_DATE,b.initiated_Date,b.initiated_by,a.stage_completed from case_routing a, patient_details b where a.caseid=b.case_id and a.stage_completed='N' and a.caseid='"
          + caseid + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCaserid(rs.getString("case_number"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        viewVO.setPriority(rs.getString("priority"));
        list.add(viewVO);
      }
    } catch (Exception var26) {
      LOGGER.info("Error At Exception=" + var26.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<ViewVO> DigisearchCase(String caseid) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "";

    try {
      con = getDigiConnectionDetails();
      sql = "select b.user_id,b.case_id,b.status,b.case_number,b.priority,b.decision,b.stage,a.next_stage,b.CREATED_DATE,b.initiated_Date,b.initiated_by,a.stage_completed from case_routing a, patient_details b where a.caseid=b.case_id and a.stage_completed='N' and a.caseid='"
          + caseid + "'";
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();

      while (rs.next()) {
        ViewVO viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCaserid(rs.getString("case_number"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        viewVO.setPriority(rs.getString("priority"));
        list.add(viewVO);
      }
    } catch (Exception var23) {
      LOGGER.info("Error At Exception=" + var23.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<ViewVO> searchCasebystage(String stage) throws ClassNotFoundException, SQLException {
    List<ViewVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from case_mstr where next_stage='" + stage + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      ViewVO viewVO;
      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        viewVO.setCaserid(rs.getString("case_number"));
        viewVO.setPriority(rs.getString("priority"));
        list.add(viewVO);
      }

      query = "select b.user_id,b.case_id,b.status,b.decision,b.stage,a.next_stage,b.CREATED_DATE,b.initiated_Date,b.initiated_by,a.stage_completed from case_routing a, patient_details b where a.caseid=b.case_id and a.stage_completed='N' and a.next_stage='"
          + stage + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        viewVO = new ViewVO();
        viewVO.setUserid(rs.getString("USER_ID"));
        viewVO.setCaseid(rs.getString("CASE_ID"));
        viewVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        viewVO.setStatus(rs.getString("STATUS"));
        viewVO.setStage(rs.getString("STAGE"));
        viewVO.setNext_stage(rs.getString("NEXT_STAGE"));
        viewVO.setCraeted(rs.getString("CREATED_DATE"));
        viewVO.setInitDate(rs.getString("initiated_Date"));
        viewVO.setInituserid(rs.getString("initiated_by"));
        viewVO.setPriority(rs.getString("priority"));
        viewVO.setCaserid(rs.getString("case_number"));
        list.add(viewVO);
      }
    } catch (Exception var26) {
      LOGGER.info("Error At Exception=" + var26.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<String> stageList(String profileId) throws ClassNotFoundException, SQLException {
    List<String> stageList = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String query = "select Stage_code from profile_stage_map where profile_id='" + profileId + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        stageList.add(rs.getString("Stage_code").toLowerCase());
      }
    } catch (Exception var23) {
      LOGGER.info("Error At Exception=" + var23.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

    }

    return stageList;
  }

  public static List<String> getdecision(String userId) throws ClassNotFoundException, SQLException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<String> list = new ArrayList();

    try {
      con = getConnectionDetails();
      String decquery = "select display_name from profile_decision_map a, decision_master b where a.decs_code=b.decs_code and profile_id=(select profile_id from user_mstr where user_id='"
          + userId + "')";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();

      while (rs.next()) {
        list.add(rs.getString("display_name"));
      }
    } catch (Exception var22) {
      LOGGER.info("Error At Exception=" + var22.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var19) {
          var19.printStackTrace();
        }
      }

    }

    return list;
  }

  public static String geteditables(String stage) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String currentstage = "";

    try {
      con = getConnectionDetails();
      String decquery = "select * from editable where stage_code='" + stage + "'";
      ps = con.prepareStatement(decquery);

      for (rs = ps.executeQuery(); rs.next(); currentstage = currentstage + "," + rs.getString("inputid")) {
      }
    } catch (Exception var22) {
      LOGGER.info("Error At Exception=" + var22.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var19) {
          var19.printStackTrace();
        }
      }

    }

    return currentstage;
  }

  public static List<String> getdecisionprofile() throws ClassNotFoundException, SQLException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<String> list = new ArrayList();

    try {
      con = getConnectionDetails();
      String decquery = "select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='workorder'";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();

      while (rs.next()) {
        list.add(rs.getString("display_name"));
      }
    } catch (Exception var21) {
      LOGGER.info("Error At Exception=" + var21.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var19) {
          var19.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var18) {
          var18.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> totalCaseID(Object session, String profile)
      throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String query = "select case_id from patient_details";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        PendingVO pendingVO = new PendingVO();
        pendingVO.setCaseid(rs.getString("case_id"));
        list.add(pendingVO);
      }
    } catch (Exception var29) {
      LOGGER.info("Error At Exception=" + var29.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var28) {
          var28.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var27) {
          var27.printStackTrace();
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
          var25.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<DraftVo> getDraft(String user_id) {
    List<DraftVo> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String query = "select * from cc_crm where user_id='" + user_id + "' and draft='Y' order by case_id desc";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        DraftVo DraftVo = new DraftVo();
        DraftVo.setDecision(rs.getString("remark"));
        DraftVo.setStage(rs.getString("case_stage"));
        DraftVo.setCreatedate(rs.getString("CREATED_DATE"));
        DraftVo.setDraftid(rs.getString("case_id"));
        list.add(DraftVo);
      }
    } catch (Exception var28) {
      LOGGER.info("Error At Exception=" + var28.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var27) {
          var27.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var26) {
          var26.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> getCaseID(Object session, String profile)
      throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select * from patient_details where next_stage in (select stage_code from profile_stage_map where profile_id='"
          + profile + "') and holdflag='N' and draftflag not in('Y') order by initiated_Date desc";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      PendingVO pendingVO;
      while (rs.next()) {
        pendingVO = new PendingVO();
        pendingVO.setUserid(rs.getString("USER_ID"));
        pendingVO.setCaseid(rs.getString("CASE_ID"));
        pendingVO.setDecision((String) decMap.get(rs.getString("DECISION")));
        pendingVO.setStatus(rs.getString("STATUS"));
        pendingVO.setStage(rs.getString("STAGE"));
        pendingVO.setNext_stage(rs.getString("NEXT_STAGE"));
        pendingVO.setCraeted(rs.getString("CREATED_DATE"));
        pendingVO.setInitDate(rs.getString("initiated_Date"));
        pendingVO.setInituserid(rs.getString("initiated_by"));
        pendingVO.setCaserid(rs.getString("case_number"));
        pendingVO.setPriority(rs.getString("priority"));
        list.add(pendingVO);
      }

      query = "select caseid,Next_stage from case_routing where stage_completed='N' and next_stage in (select stage_code from profile_stage_map where profile_id='"
          + profile + "') and holdflag='N'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        query = "select * from patient_details where holdflag='N' and case_id=" + rs.getInt("caseid");
        ps = con.prepareStatement(query);
        rs1 = ps.executeQuery();

        while (rs1.next()) {
          pendingVO = new PendingVO();
          pendingVO.setUserid(rs1.getString("USER_ID"));
          pendingVO.setCaseid(rs1.getString("CASE_ID"));
          pendingVO.setDecision(rs1.getString("DECISION"));
          pendingVO.setStatus(rs1.getString("STATUS"));
          pendingVO.setStage(rs1.getString("STAGE"));
          pendingVO.setNext_stage(rs.getString("NEXT_STAGE"));
          pendingVO.setCraeted(rs1.getString("CREATED_DATE"));
          pendingVO.setInitDate(rs1.getString("initiated_Date"));
          pendingVO.setInituserid(rs1.getString("initiated_by"));
          pendingVO.setCaserid(rs.getString("caseid"));
          pendingVO.setPriority(rs1.getString("priority"));
          list.add(pendingVO);
        }
      }
    } catch (Exception var32) {
      LOGGER.info("Error At Exception=" + var32.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var31) {
          var31.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          rs1.close();
          rs1 = null;
        } catch (SQLException var30) {
          var30.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var29) {
          var29.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var28) {
          var28.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> getCaseIDStageCount(Object session, String profile)
      throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String STATUS = "pending";
      String decquery = "select display_name,decs_code  from decision_master";
      ps = con.prepareStatement(decquery);
      rs = ps.executeQuery();
      HashMap<String, String> decMap = new LinkedHashMap();

      while (rs.next()) {
        decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
      }

      String query = "select case_stage,count(case_stage)as stageCount  from cc_crm where case_stage in (select stage_code from profile_stage_map where profile_id='"
          + profile + "') and holdflag='N' group by case_stage";
      ps = con.prepareStatement(query);
      List<String> stagelist = new ArrayList();
      rs = ps.executeQuery();

      PendingVO pendingVO;
      while (rs.next()) {
        pendingVO = new PendingVO();
        pendingVO.setStage(rs.getString("case_stage"));
        pendingVO.setStageCount(rs.getString("stageCount"));
        stagelist.add(rs.getString("case_stage"));
        list.add(pendingVO);
      }

      query = "select next_stage,count(next_stage) as stageCount from case_routing where stage_completed='N' and next_stage in (select stage_code from profile_stage_map where profile_id='"
          + profile + "')  and holdflag='N' group by next_stage";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (true) {
        while (rs.next()) {
          pendingVO = new PendingVO();
          if (stagelist.contains(rs.getString("next_stage"))) {
            for (int i = 0; i < list.size(); ++i) {
              if (((PendingVO) list.get(i)).getStage().equals(rs.getString("next_stage"))) {
                String scount = ((PendingVO) list.get(i)).getStageCount();
                list.remove(i);
                int oldval = Integer.parseInt(scount);
                int newval = Integer.parseInt(rs.getString("stageCount"));
                String updatedVal = Integer.toString(oldval + newval);
                PendingVO pendingVO1 = new PendingVO();
                pendingVO1.setStage(rs.getString("next_stage"));
                pendingVO1.setStageCount(updatedVal);
                list.add(pendingVO1);
              }
            }
          } else {
            pendingVO.setStage(rs.getString("next_stage"));
            pendingVO.setStageCount(rs.getString("stageCount"));
            list.add(pendingVO);
          }
        }

        return list;
      }
    } catch (Exception var39) {
      LOGGER.info("Error At Exception=" + var39.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var38) {
          var38.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var37) {
          var37.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var36) {
          var36.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var35) {
          var35.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> getCaseIDapproved(Object session) throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String s = "approved";
      String t = "L1";
      String query = "select * from patient_details where STATUS='<STATUS>' and STAGE in (select stage_code from profile_stage_map where profile_id='Profile1' )";
      query = query.replace("<STATUS>", s);
      query = query.replace("<STAGE>", t);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        PendingVO pendingVO = new PendingVO();
        pendingVO.setUserid(rs.getString("USER_ID"));
        pendingVO.setCaseid(rs.getString("CASE_ID"));
        pendingVO.setDecision(rs.getString("DECISION"));
        pendingVO.setStatus(rs.getString("STATUS"));
        pendingVO.setStage(rs.getString("STAGE"));
        pendingVO.setNext_stage(rs.getString("NEXT_STAGE"));
        pendingVO.setCraeted(rs.getString("CREATED_DATE"));
        list.add(pendingVO);
      }
    } catch (Exception var25) {
      LOGGER.info("Error At Exception=" + var25.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> getCaseIDupload(Object session) throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String s = "L2";
      String query = "select * from patient_details where STAGE='<STAGE>'";
      query = query.replace("<STAGE>", s);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        PendingVO pendingVO = new PendingVO();
        pendingVO.setUserid(rs.getString("USER_ID"));
        pendingVO.setCaseid(rs.getString("CASE_ID"));
        pendingVO.setDecision(rs.getString("DECISION"));
        pendingVO.setStatus(rs.getString("STATUS"));
        pendingVO.setStage(rs.getString("STAGE"));
        pendingVO.setNext_stage(rs.getString("NEXT_STAGE"));
        pendingVO.setCraeted(rs.getString("CREATED_DATE"));
        list.add(pendingVO);
      }
    } catch (Exception var24) {
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<PendingVO> getCaseIDDownload(Object session) throws ClassNotFoundException, SQLException {
    List<PendingVO> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String s = "L2.1";
      String query = "select * from patient_details where STAGE='<STAGE>'";
      query = query.replace("<STAGE>", s);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        PendingVO pendingVO = new PendingVO();
        pendingVO.setUserid(rs.getString("USER_ID"));
        pendingVO.setCaseid(rs.getString("CASE_ID"));
        pendingVO.setDecision(rs.getString("DECISION"));
        pendingVO.setStatus(rs.getString("STATUS"));
        pendingVO.setStage(rs.getString("STAGE"));
        pendingVO.setNext_stage(rs.getString("NEXT_STAGE"));
        pendingVO.setCraeted(rs.getString("CREATED_DATE"));
        list.add(pendingVO);
      }
    } catch (Exception var24) {
      LOGGER.info("Error At Exception=" + var24.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<nextdispatch> findnextdispatchdata(String case_number) {
    List<nextdispatch> li = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String query = "select * from nextdispatchdate where case_number='" + case_number + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        nextdispatch nd = new nextdispatch();
        nd.setCase_number(rs.getString("case_number"));
        nd.setLastupper("U" + rs.getString("upper1") + "-" + "U" + rs.getString("upper2"));
        nd.setLastlower("L" + rs.getString("lower") + "-" + "L" + rs.getString("lower2"));
        nd.setNextdate(rs.getString("nextdate"));
        li.add(nd);
      }
    } catch (Exception var23) {
      var23.printStackTrace();
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

    }

    return li;
  }

  public static List<nextdispatch> findnextdispatchdatabydate(String fromdate, String todate) {
    List<nextdispatch> li = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String query = "select * from nextdispatchdate where nextdate<='" + todate + "' and nextdate>='" + fromdate
          + "'";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        nextdispatch nd = new nextdispatch();
        nd.setCase_number(rs.getString("case_number"));
        nd.setLastupper("U" + rs.getString("upper1") + "-" + "U" + rs.getString("upper2"));
        nd.setLastlower("L" + rs.getString("lower") + "-" + "L" + rs.getString("lower2"));
        nd.setNextdate(rs.getString("nextdate"));
        li.add(nd);
      }
    } catch (Exception var24) {
      LOGGER.info("Error At Exception=" + var24.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var22) {
          var22.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

    }

    return li;
  }

  public static int fetchID(int caseid) throws ClassNotFoundException, SQLException {
    Connection con = null;
    String sql1 = "";

    try {
      con = getConnectionDetails();
      Statement st = null;
      Statement st2 = null;
      st = con.createStatement();
      sql1 = "SELECT Case_Id FROM patient_details";
      st.executeQuery(sql1);
    } catch (Exception var6) {
      var6.printStackTrace();
    }

    return caseid;
  }

  public static List<ImagesVo> getImages(String caseId) {
    List<ImagesVo> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String query = " select * from uploadsimages where  case_id='" + caseId + "' order by id desc ";
      System.out.println("query getImages() : " + query);
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        ImagesVo ImagesVo = new ImagesVo();
        ImagesVo.setCase_id(rs.getString("case_id"));
        ImagesVo.setDoctor_name(rs.getString("doctor_name"));
        ImagesVo.setPatient_name(rs.getString("patient_name"));
        ImagesVo.setClinic_name(rs.getString("clinic_name"));
        ImagesVo.setOptions(rs.getString("options"));
        ImagesVo.setImgid(rs.getString("id"));
        ImagesVo.setUser_name(rs.getString("user_id"));
        ImagesVo.setPpf_doc(rs.getString("ppf_doc"));
        ImagesVo.setTpr_doc(rs.getString("tpr_doc"));
        ImagesVo.setDate(rs.getString("date"));
        ImagesVo.setCase_booking_form(rs.getString("case_booking_form"));
        ImagesVo.setSales_approval_docs(rs.getString("sales_approval_docs"));
        ImagesVo.setDoc_approval_form(rs.getString("doc_approval_form"));
        list.add(ImagesVo);
      }
    } catch (Exception var28) {
      LOGGER.info("Error At LoginDAO getImages() : " + var28.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var27) {
          LOGGER.info("Error At LoginDAO getImages() : " + var27.getMessage());
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var26) {
          LOGGER.info("Error At LoginDAO getImages() : " + var26.getMessage());
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          LOGGER.info("Error At LoginDAO getImages() : " + var25.getMessage());
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          LOGGER.info("Error At LoginDAO getImages() : " + var24.getMessage());
        }
      }

    }

    return list;
  }

  public static void insertrecords(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement pstmt = null;
    String doctor_name = "";
    String patient_name = "";
    String clinic_name = "";
    String options = "";
    String user_id = "";
    boolean case_id = false;
    HttpSession session = request.getSession();
    user_id = (String) session.getAttribute("username");
    int case_id1 = Integer.parseInt(request.getParameter("case_id") == null ? "0" : request.getParameter("case_id"));
    doctor_name = request.getParameter("doctor_name") == null ? "" : request.getParameter("doctor_name");
    patient_name = request.getParameter("patient_name") == null ? "" : request.getParameter("patient_name");
    clinic_name = request.getParameter("clinic_name") == null ? "" : request.getParameter("clinic_name");
    options = request.getParameter("options") == null ? "" : request.getParameter("options");

    try {
      con = getConnectionDetails();
      pstmt = con.prepareStatement(
          "INSERT INTO uploadsimages(case_id,doctor_name,patient_name,clinic_name,options,status,user_id) values(?,?,?,?,?,?)");
      pstmt.setInt(1, case_id1);
      pstmt.setString(2, doctor_name);
      pstmt.setString(3, patient_name);
      pstmt.setString(4, clinic_name);
      pstmt.setString(5, options);
      pstmt.setString(6, "Y");
      pstmt.setString(7, user_id);
      System.out.println("pstmt : " + pstmt);
      int rowaffected = pstmt.executeUpdate();
      if (rowaffected > 0) {
        out.print("Records has been successfully Saved");
      } else {
        out.print("ERROR occuring ");
      }
    } catch (Exception var118) {
    } finally {
      if (pstmt != null) {
        try {
          pstmt.close();
        } catch (Exception var116) {
        } finally {
          pstmt = null;
        }
      }

      if (con != null) {
        try {
          con.close();
        } catch (Exception var114) {
        } finally {
          con = null;
        }
      }

      out.flush();
      System.gc();
    }

  }

  public static List<AccountVo> getAccount(String user_id) {
    List<AccountVo> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String query = "select * from account order by case_id desc";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        AccountVo accountVo = new AccountVo();
        accountVo.setCaseid(rs.getString("case_id"));
        accountVo.setCrm(rs.getString("crm"));
        accountVo.setDoctorName(rs.getString("doctor_name"));
        accountVo.setPatientName(rs.getString("patient_name"));
        accountVo.setTotal(rs.getString("payment"));
        accountVo.setPaidAmount(rs.getString("submitted_amount"));
        accountVo.setModepayment(rs.getString("payment_mode"));
        list.add(accountVo);
      }
    } catch (Exception var28) {
      LOGGER.info("Error At Exception=" + var28.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var27) {
          var27.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var26) {
          var26.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

    return list;
  }

  public static void AddressLogs(String address1, String address2, String address3, String address4, String address5,
      String case_id, String remarks, String stage, String user_id) {
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
      con = getConnectionDetails();
      ArrayList<String> alist = new ArrayList();
      alist.add(address1);
      alist.add(address2);
      alist.add(address3);
      alist.add(address4);
      alist.add(address5);
      Iterator var13 = alist.iterator();

      while (var13.hasNext()) {
        String item = (String) var13.next();
        if (!item.equals("")) {
          pstmt = con.prepareStatement(
              " insert into address_logs(case_id,address,remarks,decision,user_id,created_on) values(?,?,?,?,?,now()) ");
          pstmt.setString(1, case_id);
          pstmt.setString(2, item);
          pstmt.setString(3, remarks);
          pstmt.setString(4, stage);
          pstmt.setString(5, user_id);
          pstmt.executeUpdate();
        }
      }
    } catch (Exception var26) {
      System.out.println("Error At LoginDAO AddressLogs() =" + var26.getMessage());
    } finally {
      if (pstmt != null) {
        try {
          pstmt.close();
          pstmt = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

    }

  }

  public static void zeroAligner(String starter_case_stage) {
    Connection con = null;
    PreparedStatement pstmt = null;
    System.out.println();
    List<String> zeroAligner = Arrays.asList("INISTRKIT", "LABSTRKIT", "LABSTRKITCOR", "PCKSTRKIT", "PCKSTRKITCOR",
        "DPHSTRKIT", "MTPSTRKIT", "FQCSTRKIT", "3DPSTRKIT", "3DPSTRKITCOR");

    try {
      con = getConnectionDetails();
      if (!starter_case_stage.equals(zeroAligner.toString())) {
        pstmt = con.prepareStatement(
            " update cc_crm set starter_case_stage='" + starter_case_stage + "',inistrkit_at=now() ");
        pstmt.executeUpdate();
      }
    } catch (Exception var17) {
      System.out.println("Error At LoginDAO zeroAligner() =" + var17.getMessage());
    } finally {
      if (pstmt != null) {
        try {
          pstmt.close();
          pstmt = null;
        } catch (SQLException var16) {
          var16.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var15) {
          var15.printStackTrace();
        }
      }

    }

  }

  public static String getcdt() {
    LocalDateTime ldt = LocalDateTime.now();
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    String dt = ldt.format(dtf);
    return dt;
  }

  public static String getInvoiceNo(String invoice_no) {
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = "select invoice_no from account where invoice_no='" + invoice_no + "' ";
    String invoiceResponse = "false";
    String dbcheck = null;

    try {
      System.out.println("try...getInvoiceNo");
      con = getConnectionDetails();
      pstmt = con.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      System.out.println("rs=> " + rs);

      while (true) {
        while (rs.next()) {
          dbcheck = rs.getString("invoice_no");
          System.out.println("dbcheck: " + dbcheck);
          if (dbcheck.equals(invoice_no) && !dbcheck.equals("")) {
            System.out.println("login dao else");
            invoiceResponse = "true";
          } else {
            System.out.println(" login dao if");
            invoiceResponse = "false";
          }
        }

        System.out.println("sss invoiceResponse: " + invoiceResponse);
        break;
      }
    } catch (Exception var19) {
      var19.printStackTrace();
    } finally {
      if (pstmt != null) {
        try {
          pstmt.close();
          pstmt = null;
        } catch (SQLException var18) {
          var18.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var17) {
          var17.printStackTrace();
        }
      }

    }

    return invoiceResponse;
  }

  public static List<Newcase1> getPLNSheet() {
    List<Newcase1> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rs1 = null;

    try {
      con = getConnectionDetails();
      String query = "select * from sheet order by name desc";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        Newcase1 Newcase1 = new Newcase1();
        Newcase1.setSheetId(rs.getString("id"));
        Newcase1.setSheetname(rs.getString("name"));
        list.add(Newcase1);
      }
    } catch (Exception var27) {
      LOGGER.info("Error At getPLNSheet{} =" + var27.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var26) {
          var26.printStackTrace();
        }
      }

      if (rs1 != null) {
        try {
          ((ResultSet) rs1).close();
          rs1 = null;
        } catch (SQLException var25) {
          var25.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var24) {
          var24.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var23) {
          var23.printStackTrace();
        }
      }

    }

    return list;
  }

  public static List<Newcase1> getRPIssue() {
    List<Newcase1> list = new ArrayList();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      con = getConnectionDetails();
      String query = "select * from issue order by name desc";
      ps = con.prepareStatement(query);
      rs = ps.executeQuery();

      while (rs.next()) {
        Newcase1 Newcase1 = new Newcase1();
        Newcase1.setIssueid(rs.getString("id"));
        Newcase1.setIssuename(rs.getString("name"));
        System.out.println("logindao issue: " + rs.getString("name"));
        list.add(Newcase1);
      }
    } catch (Exception var22) {
      LOGGER.info("Error At getRPIssue{} =" + var22.getMessage());
    } finally {
      if (rs != null) {
        try {
          rs.close();
          rs = null;
        } catch (SQLException var21) {
          var21.printStackTrace();
        }
      }

      if (ps != null) {
        try {
          ps.close();
          ps = null;
        } catch (SQLException var20) {
          var20.printStackTrace();
        }
      }

      if (con != null) {
        try {
          con.close();
          con = null;
        } catch (SQLException var19) {
          var19.printStackTrace();
        }
      }

    }

    return list;
  }

  public static String getApprovedPlan(String caseId) {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select planning_id from cc_crm where case_id='" + caseId + "' ";
    String resultdata = "";

    try {
      System.out.println("try...");
      con = getConnectionDetails();
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        resultdata = rs.getString("planning_id");
        System.out.println("getApprovedPlan resultdata: " + resultdata);
      }
    } catch (Exception var7) {
      System.out.println("Exception @ getApprovedPlan{} " + var7.getMessage());
    }

    return resultdata;
  }

public static java.util.List<NewQueryPhotoVo> getNewQueryPhotoGrid(String caseId, String typeOfRequest) {
	// TODO Auto-generated method stub
	return null;
}

public static java.util.List<MidAssessmentVo> getMidAssessmentPhotoGrid(String caseId) {
	// TODO Auto-generated method stub
	return null;
}


}
