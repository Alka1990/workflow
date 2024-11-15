import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({"/UpdateAccount"})
public class UpdateAccount extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(UpdateAccount.class);
  
  private static final long serialVersionUID = 1L;
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    String crm = request.getParameter("CRM");
    String DoctorName = request.getParameter("DoctorName");
    String PatientName = request.getParameter("PatientName");
    String caseid = request.getParameter("caseid");
    String modepayment = request.getParameter("modepayment");
    String Remarks = request.getParameter("Remarks");
    String invoice_no = request.getParameter("invoice_no");
    String invoice_date = request.getParameter("invoice_date");

    String invoiceres = LoginDAO.getInvoiceNo(invoice_no);    
    System.out.println("UpdateAccount invo : "+invoiceres);
    
    String user = request.getParameter("user");
    int toatalAmount = Integer.parseInt(request.getParameter("total"));
    int lastPayAmount = Integer.parseInt(request.getParameter("PaidAmount"));
    int remainingAmount = Integer.parseInt(request.getParameter("RemainAmount"));
        
    try {
      con = LoginDAO.getConnectionDetails();
      Statement st = null;
      ResultSet rs = null;
      st = con.createStatement();
      int sa = 0;
      int ra = 0;
      PreparedStatement ps = con.prepareStatement(" select * from account where case_id='" + caseid + "' order by account_id desc ");
      rs = ps.executeQuery();
      if (rs.next()) {
        rs.getInt("submitted_amount");
        rs.getInt("remain_amount");
        rs.getInt("paid_amount");
        sa = lastPayAmount + rs.getInt("submitted_amount");
        ra = toatalAmount - sa;
      } 
      boolean amountcheck = (lastPayAmount <= remainingAmount);
      String query = "";
      if (!amountcheck) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Payment is more than remaining amount!');");
        out.println("window.location='AccountdataShow?account_number=" + caseid + "';");
        out.println("</script>");
      } else {
    	  
    	  if(invoiceres.equals("false")  ) {		//
//        String query = "INSERT INTO account(crm, doctor_name , patient_name, case_id ,payment_mode,payment,remain_amount,paid_amount,submitted_amount,remarks,user,invoice_no,invoice_date) VALUES('" + 
//          crm + "','" + DoctorName + "','" + PatientName + "','" + caseid + "','" + modepayment + "','" + toatalAmount + "','" + ra + "','" + lastPayAmount + "','" + sa + "','" + Remarks + "','" + user + "','"+invoice_no+"','"+invoice_date+"') ";
//       
        if(invoice_date.equals("")) {
	    	System.out.println(" update pass...aaA");
	        query = "INSERT INTO account(crm, doctor_name , patient_name, case_id ,payment_mode,payment,remain_amount,paid_amount,submitted_amount,remarks,user,"
	      + "invoice_no,invoice_date) VALUES('" + crm + "','" + DoctorName + "','" + PatientName + "','" + caseid + "','" + modepayment + "',"
	        				+ "'" + toatalAmount + "','" + ra + "','" + lastPayAmount + "','" + sa + "','" + Remarks + "','" + user + "','"+invoice_no+"',NULL) ";
	             	    }else {
	    	System.out.println(" update  fail...");
	        query = "INSERT INTO account(crm, doctor_name , patient_name, case_id ,payment_mode,payment,remain_amount,paid_amount,submitted_amount,remarks,user,"
	        		+ "invoice_no,invoice_date) VALUES('" + 
	                crm + "','" + DoctorName + "','" + PatientName + "','" + caseid + "','" + modepayment + "','" + toatalAmount + "','" + ra + "',"
	                		+ "'" + lastPayAmount + "','" + sa + "','" + Remarks + "','" + user + "','"+invoice_no+"','"+invoice_date+"') ";
	    }
        System.out.println("UpdateAccount query:====> "+query);
        int row = st.executeUpdate(query);
        if (row > 0) {
          out.println("<script type='text/javascript'>");
          out.println("alert('SUCCESSFULLY SAVED!')");
          String value = "AccountdataShow?account_number=" + caseid;
          out.println("location='" + value + "';");
          out.println("</script>");
          con.close();
        } 
      } 
    	  else {
    			 out.println("<script type=\"text/javascript\">");
    		     out.println("alert('Invoice no is already exist!');");
    		     out.println("window.location='AccountdataShow?account_number=" + caseid + "';");
    		     out.println("</script>");
    		 }
    }
    } catch (Exception e) {
    e.printStackTrace();
      LOGGER.info("Error At updateaccount=" + e.getMessage());
    } finally {
      try {
        LoginDAO.getConnectionDetails().close();
      } catch (ClassNotFoundException|java.sql.SQLException classNotFoundException) {}
    } 
  }
}
