    
<%@page import="javax.xml.transform.Result"%>
<%@ page import="java.sql.*" %>     
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@page import="java.math.*"%> 
<%@page import="java.util.*"%>
<%@page  import="java.text.SimpleDateFormat"%>
<%@page  import="java.util.Date"%>
 <%@ page import="com.workflow.connection.LoginDAO" %>


<!-- Note : For this template
			printer setting : default(everthing)
			screen resolution : 1366 X 768 (Recommended)  -->
 			

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
	
	<TITLE>Workflow</TITLE>
	<link rel="stylesheet" type="text/css" href="CSS1/bootstrap.min.css">
	
</HEAD>
<BODY>
 <div class="container">
  <div class="row">
  
    <%

   Connection  con=null;
   Date date = new Date();  
   SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy");
   PreparedStatement ps=null;
   PreparedStatement ps1=null;
   PreparedStatement ps2=null;
   PreparedStatement ps3=null;
   PreparedStatement pstmt=null;
   ResultSet rs1=null;
   ResultSet rs =null;
   ResultSet rs3 =null;
    
    String caseid="";
    String caseNumber="";
    String caseId="";
    String clinicName="";
    String clinicAddress="";
    String patientName="";
    String registeredDoctor="";
    String discount="";
    String crmName="";
    String dispatchTo="";
    String dispatchToAddress="";
    String billTo="";
    String gstNumber="";
    String woDate="";
    String stage="";
    
    int quantity=0;
    String item="";
    int rate=0;
    double total=0.00;
    
    int taxRate=0;
    double taxAmount=0.00;
    double grandTotal=0.00;
    
    
    try{
    	
    	 LoginDAO loginDAO = new LoginDAO();
    	con=LoginDAO.getConnectionDetails();
    	caseId=request.getParameter("caseId");
        ps=con.prepareStatement("select cm.clinic_name,cm.clinic_address,cm.patient_name,cm.registered_doctor,cm.discount,cm.crmname,cm.STAGE,cm.dispatch_to,cm.Dispatch_to_address,cm.bill_to,cm.gst_number,cm.wo_date,wod.item,wod.quantity,cm.Tax_rate,wod.total,cm.Tax_amount,cm.Grand_total from patient_details cm,workorder_details wod where cm.case_id=wod.case_id and cm.case_id=?");
		ps.setString(1, caseId);
		rs = ps.executeQuery();
		 while(rs.next())
		 {
			 clinicName=rs.getString("clinic_name");
			 clinicAddress=rs.getString("clinic_address");
			 patientName=rs.getString("patient_name");
			 discount=rs.getString("discount");
			 crmName=rs.getString("crmname");
			 gstNumber=rs.getString("gst_number");
			 woDate=rs.getString("wo_date");
			 registeredDoctor=rs.getString("registered_doctor");
			 stage =rs.getString("STAGE");
			 billTo=rs.getString("bill_to");
			 dispatchTo=rs.getString("dispatch_to");
			 dispatchToAddress=rs.getString("Dispatch_to_address");
			
			 quantity=rs.getInt("quantity");
			 item=rs.getString("item");
			 total=rs.getDouble("total");
			 
			 taxRate=rs.getInt("Tax_rate");
			 taxAmount=rs.getDouble("Tax_amount");
			 grandTotal=rs.getDouble("Grand_total");
			 woDate = formatter.format(date);  
			 	
		} 

   %>
   
<TABLE width="100%" height="100%" border=1px>


	<TBODY>
	<TR  VALIGN=TOP STYLE="line-height: 5px;">
			<TD  COLSPAN="2" WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" border-right: none;border-bottom: none; padding-top: none; padding-right: none;padding-bottom: 0in; padding-left: 0in; padding-right: 0in;">
				<P ALIGN=RIGHT STYLE="margin-right: 0.04in;margin-top: 0px;">
				<img src="Images/workordertop.png" alt="logo" align="left"  style="height: 85px;">
				</P>
			</TD>
			
			<TD COLSPAN=8 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" none; border-left: none; border-bottom: none; border-top: none; padding-top: none; padding-right: none;  padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.04in; margin-top: 0.13in">
				<FONT SIZE=6 STYLE="font-size: 22pt;" COLOR="#7a8ec6" FACE="Arial, serif">WORK ORDER</FONT><p>
				</P>
				<P ALIGN=RIGHT STYLE="margin-right: 0.04in; margin-top: 0.13in">
					<FONT SIZE=6 STYLE="font-size: 8pt;" FACE="Arial, serif"><b>Work Order / Case ID # &nbsp;:&nbsp;</b>
					<input type="text" id="caseid" name="caseid" readonly value=<%=caseId %>></FONT><br>
					<FONT SIZE=6 STYLE="font-size: 8pt;"FACE="Arial, serif"><b>W.O. Date &nbsp;:&nbsp;</b>
					<input type="text" id="wodate" name="wodate" readonly value=<%=woDate %>></FONT>
				</P>
			</TD>
		</TR>
		<TR VALIGN=TOP  STYLE="line-height: 5px;">
			<TD COLSPAN=2  HEIGHT=55 VALIGN=TOP  STYLE="border-right: none;border-bottom: none;border-top: none; padding-top: none; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=left STYLE="margin-right: 0.04in; margin-top: 0.13in;">
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><b>&emsp;A-93/1-5, 1st Floor, Wazirpur Indl. Area</b></FONT><p>
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><b>&emsp;New Delhi-110052, India</b></FONT><p>
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><b>&emsp;Phone: 011-27371074</b></FONT><p>
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><b>&emsp;GSTIN: 07AAICR0930R1ZX</b></FONT><p>
				</P>			
			</TD>
			<TD COLSPAN=8 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE="border-left: none;border-bottom: none;border-top: none; padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.04in; margin-top: 0.13in">
				<FONT SIZE=6 STYLE="font-size: 8pt;" " FACE="Arial, serif"><b>Marketing Representative&nbsp;:&nbsp;</b>
				<input type="text" id="crm" name="crm" style="width:200px;" readonly value=<%=crmName%>></FONT><br>
				<label></label>
				<FONT SIZE=6 STYLE="font-size: 8pt;" " FACE="Arial, serif"><b>Doctor's Name&nbsp;:&nbsp;</b>
				<input type="text" id="doctorname" name="doctorname" readonly style="width:200px;" value=<%=registeredDoctor%>></FONT><br>
				<label></label>
				<FONT SIZE=6 STYLE="font-size: 8pt;" " FACE="Arial, serif" ><b>Patient's Name&nbsp;:&nbsp;</b>
				<input type="text" id="patientname" name="patientname" readonly style="width:200px;" readonly value=<%=patientName%> ></FONT>
				</P>
			</TD>
		</TR>
		<TR>
			<TD colspan="1"  align="left" valign="middle" BGCOLOR="#3c4f87" STYLE="border-top: none; border-bottom: none;  border-right: none;">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>&emsp;JOB</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
			<TD colspan="3"  valign="middle" align=center BGCOLOR="#3c4f87" STYLE="border: none; padding: 0in;" >
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>BILL TO</B>
				</FONT></FONT></FONT>
			</TD>
			<TD colspan="4" valign="middle" align="center" colspan="3" BGCOLOR="#3c4f87" STYLE="border: none; padding: 0in;">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>SHIP TO (if different)</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
		</TR>
		
		<TR>
			<TD COLSPAN=1 HEIGHT=50 VALIGN=TOP STYLE="border-top: none;border-right: none; border-bottom: none;padding-top: 1px;padding-left: 1px;">
				<p align="justify"><FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
					<%=stage %>
				</FONT>
				</FONT>
				</p>
			</TD>
			<TD COLSPAN=3 HEIGHT=100 VALIGN=TOP STYLE="border-top: none; border-left: none;border-right: none;border-bottom: none;padding-top: 1px;padding-left: 1px;">
				<p align="center">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
					<%=billTo %>
				</FONT>
				</FONT>
				</p>
			</TD>
			<TD COLSPAN=4 HEIGHT=100 VALIGN=TOP STYLE="border-top: none;border-left: none; border-bottom: none;padding-top: 1px;padding-left: 1px;">
				<p align="justify">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
					<%=dispatchTo%>
				</FONT>
				</FONT>
				</p>
			</TD>
		</TR>

		<!-- <TR>
			<TD COLSPAN=9 HEIGHT=100 VALIGN=TOP STYLE="border-top: none; border-bottom: none;padding-top: 0in;">
				<P><BR>
				</P>
			</TD>
		</TR> -->
		
		
		<TR>
			<TD valign="middle" align="center" colspan="1" BGCOLOR="#3c4f87" STYLE="border-top: none; border-bottom: none; border-right: none; ">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>QTY</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center"  colspan="2" BGCOLOR="#3c4f87" STYLE="border: none; padding: 0in;" >
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>DESCRIPTION</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center"  colspan="2" BGCOLOR="#3c4f87" STYLE="border: none; padding: 0in;">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>TAXED</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center"  colspan="2" BGCOLOR="#3c4f87" STYLE="border: none; padding: 0in;">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>UNIT PRICE</B>
				</FONT>
				</FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center" colspan="2" BGCOLOR="#3c4f87" STYLE="border-top: none; border-bottom: none; border-left: none;  padding: 0in;width:20%;">
				<FONT COLOR="#ffffff">
				<FONT FACE="Arial, serif">
				<FONT SIZE=1 STYLE="font-size: 8pt">
				<B>LINE TOTAL</B>
				</FONT></FONT></FONT>
			</TD>
		</TR>
		
		
			
				<!-- start loop --> 
			<%
			

				 
				pstmt=con.prepareStatement("select quantity,item,rate, total  from workorder_details where  case_id=? ");
				pstmt.setString(1, caseId);
				rs1 = pstmt.executeQuery();
				 while(rs1.next())
				 {
			     
					  quantity=rs1.getInt("quantity");
					  item=rs1.getString("item");
					  rate=rs1.getInt("rate");
					  total=rs1.getDouble("total");

					%> 
	
		<TR VALIGN=TOP  STYLE="line-height: 20px;">
			<TD  valign="middle" align="center"  colspan="1" WIDTH=49 HEIGHT=12 STYLE=" padding-left: 11px;">
				<FONT COLOR="#020303">
				<FONT SIZE=1 STYLE="font-size: 8pt"><%=quantity %></FONT>
				</FONT>	
			</TD>
			<TD valign="middle" align="center" COLSPAN=2 WIDTH=369 HEIGHT=12 STYLE="border-top: none;padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in;">
				
				<FONT COLOR="#020303">
				<FONT SIZE=1 STYLE="font-size: 8pt"><%=item %></FONT>
				</FONT>				
			</TD>
			<TD valign="middle" align="center" COLSPAN=2 WIDTH=75 HEIGHT=12 STYLE="border-top: none;padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in;">
				<FONT COLOR="#020303">
				<FONT SIZE=1 STYLE="font-size: 8pt"></FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center" COLSPAN=2 WIDTH=75 HEIGHT=12 STYLE="border-top: none;padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in;">
				<FONT COLOR="#020303">
				<FONT SIZE=1 STYLE="font-size: 8pt"><%=rate %></FONT>
				</FONT>
			</TD>
			<TD valign="middle" align="center" COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" HEIGHT=12 STYLE="border-top: none;padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in;">
				<FONT COLOR="#020303">
				<FONT SIZE=1 STYLE="font-size: 8pt"><%=total %>-</FONT>
				</FONT>
			</TD>
		</TR>

		<% }%>
		
		<!-- end loop -->
		

	
	
		
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.17in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>
	
	
		<TR VALIGN=TOP STYLE="line-height: 3px;">
			<TD WIDTH=49 HEIGHT=12 STYLE="    padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=369 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=75 STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P><BR>
				</P>
			</TD>
			<TD COLSPAN=2 WIDTH=114 BGCOLOR="#f3f3f3" STYLE="   padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=RIGHT STYLE="margin-right: 0.18in; margin-top: 0.01in"><FONT COLOR="#020303"><FONT SIZE=1 STYLE="font-size: 8pt">-</FONT></FONT></P>
			</TD>
		</TR>

	<TR VALIGN=TOP  STYLE="line-height: 12px;">
	<TD WIDTH=49 HEIGHT=12 COLSPAN=5  STYLE="padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
	<BR>
	<p style="margin-left: 0.12in; margin-top: 0in"><font color="#020303"style="background: #d9d9d9">
	<font face="Arial, serif"><font size="1" style="font-size: 8pt"><b>Other
				Comments or Special Instructions</b></font></font></font></p>
	<p style="margin-left: 0.12in; margin-top: 0in"><font color="#020303"style="background: #d9d9d9"></font>
	<ol >
		<li style="font-size: 8pt">
			<p align="left" style="margin-top: 0in; margin-bottom: 0in">
					<font color="#020303">
					<font size="1" style="font-size: 8pt">Total payment due 30 days after completion of</font>
					</font>
					<font color="#020303">
					<font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.7pt"></span></font>
					</font>
					<font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">work</span></font></font></p>
					</li>
					<li style="font-size: 8pt">
<p align="left" style="margin-top: 0.04in; margin-bottom: 0in">
					<font color="#020303"><font size="1" style="font-size: 8pt">Please
					refer to the </font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: 0.2pt">W.O.
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">#
					in </font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">all
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">your</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -1.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">correspondence</font></font></p>
					</li>
					<li style="font-size: 8pt">
<p align="left" style="margin-top: 0.04in; margin-bottom: 0in">
					<font color="#020303"><font size="1" style="font-size: 8pt">Please
					send correspondence regarding this </font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">work
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">order</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: 0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">to:</font></font></p>
				</li></ol>
				<p style="margin-left: 0.24in; margin-top: 0.04in; margin-bottom: 0in">
				<font color="#020303"><font size="1" style="font-size: 8pt"><b>[Name,
				Phone #, Email]</b></font></font></p>
				<ol start="4" >
					<li style="font-size: 8pt">
					
<p align="left" style="margin-top: 0.05in"><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">All</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.7pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">the</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">cheque/draft</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.3pt">
					will</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.6pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">be</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">made</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">in</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">favour</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.2pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt">of</font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.1pt">
					</span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><u><b>Renderwise</b></u></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.5pt"><u><b>
					</b></u></span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><u><b>Solutions</b></u></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: 0.1pt"><u><b>
					</b></u></span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><u><b>Pvt.</b></u></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><span style="letter-spacing: -0.1pt"><u><b>
					</b></u></span></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><u><b>Ltd</b></u></font></font><font color="#020303"><font size="1" style="font-size: 8pt"><b>.</b></font></font></p>
				</li></ol>
	
	</p>
	</TD>
	
	<TD WIDTH=49 HEIGHT=12 COLSPAN=2  STYLE="padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13inl;margin-top: 1px; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;SUBTOTAL </B></FONT></P>
	<P ALIGN=LEFT  STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;TAXABLE </B></FONT></P>
	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;TAX RATE</B> </FONT></P>
	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;TAX </B></FONT></P>
	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;S & H </B></FONT></P>
	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;OTHER </B></FONT></P>

	<P ALIGN=LEFT STYLE="margin-right: 0.04in; margin-top: 0.13in; margin-bottom: -7px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ></FONT></P>
<br><br>
	<P ALIGN=LEFT STYLE="margin-right: 0.04in;margin-top: 2px;"><FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>&nbsp;TOTAL </B></FONT></P>
	</TD>
	<td colspan="2" width="114" bgcolor="#f3f3f3" style="padding-top: 0in;  padding-left: 0in; padding-right: 0in">
	



<%
        ps1=con.prepareStatement("select cm.discount,wod.quantity,cm.Tax_rate, SUM(wod.total) as linetotal,cm.Tax_amount,cm.Grand_total from patient_details cm,workorder_details wod where cm.case_id=wod.case_id and cm.case_id=?");
		ps1.setString(1, caseId);
		rs1 = ps1.executeQuery();
		
		while(rs1.next())
		 {
		 	 double linetotal=rs1.getDouble("linetotal");
			 taxRate=rs1.getInt("Tax_rate");
			 double tax =0;	
			 double grandtotal =0.00;	
			 int taxable=0;
			
			 if(linetotal<=250000)
			 {
				 	tax = 0;
					taxable=(5*250000)/100;
			 }
			 else if(linetotal>250000 && linetotal<=500000)
			 {
				 	tax = (linetotal-500000)*5/100;  //5
				 	taxable=(5*500000)/100;
		 	 }
			 else if(linetotal>500000 && linetotal<=1000000)
			 {
				 	tax = (linetotal-1000000)*20/100;  //20
				 	taxable=(5*1000000)/100;
    		 }
			 else if(linetotal>1000000)
			 {
				 	tax = (linetotal-1000000)*30/100;  //30
				 	taxable=(5*1000000)/100;
			 }
			 
			 grandtotal=linetotal;

			%>
			 
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -1px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt"><%=linetotal %>-</font></font></p>
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt"><%=taxable %>-</font></font></p>
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;"></span><font color="#020303"><font size="1" style="font-size: 8pt"><%=taxRate %>%</font></font></p>
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt"><%=tax %>-</font></font></p>
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt">-</font></font></p>
				<p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt">-</font></font></p>
				<hr><p align="RIGHT" style="margin-right: 0.18in; margin-top: -8px;"><span style="float: left;">&nbsp; &#8377;</span><font color="#020303"><font size="1" style="font-size: 8pt"><%=grandtotal %>-</font></font></p>
			
			<% } %>
				</td>

	</TR>
	
		<!--  bottom start -->
		
		<TR >
			<TD COLSPAN=2 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" border:none; border-right: none; padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=center STYLE="margin-right: 0.04in; margin-top: 0.13in;margin-left: 27px;">
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>I agree to the Purchase order</B></FONT>
				</P>
			</TD>
			
			<TD COLSPAN=8 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" border-left: none;border-bottom: none;  padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=center STYLE="margin-right: 0.04in; margin-top: 0.13in;margin-left: 27px;">
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>Completed Date:     
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				 <hr style="margin-top: -1rem !important;margin-bottom: 2px !important;border-color: black; width:336px;float: right;"></B></FONT>
				</P>
			</TD>
			</TR>
			<TR>
			<TD COLSPAN=2 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE="  border:none;border-bottom: none;  padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=left STYLE="margin-right: 0.04in; margin-top: 0.13in;margin-left: 27px;">
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif" ><B>Signature:
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				 <hr style="margin-top: -1rem !important;margin-bottom: 2px !important;border-color: black; width:320px;"></B>
				 </FONT>
				</P>
			</TD>
			<TD COLSPAN=8 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" border:none; border-bottom: none;  padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=center STYLE="margin-right: 0.04in; margin-top: 0.13in;margin-left: 27px;">
				<FONT SIZE=6 STYLE="font-size: 8pt;"  FACE="Arial, serif">&emsp;&emsp;&emsp;&emsp;&emsp;<B>Date:     
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				 	<hr style="margin-top: -1rem !important;margin-bottom: 2px !important;border-color: black; width:338px;float: right;">				
				 </FONT>
				</P>
			</TD>
			</TR>
			
			<TR>
			<TD COLSPAN=10 WIDTH=694 HEIGHT=55 VALIGN=TOP  STYLE=" border:none; border-bottom: none;  padding-top: 0in; padding-bottom: 0in; padding-left: 0in; padding-right: 0in">
				<P ALIGN=center STYLE="margin-right: 0.04in; margin-top: 0.13in;margin-left: 27px;">
				<FONT SIZE=6 STYLE="font-size: 10pt;"  FACE="Arial, serif" >
				<B>Thank You For Your Business!</B></FONT>
				</P>
			</TD>
			
			</TR>
		
		<!--  bottom end -->
		
	</TBODY>
</TABLE>
</div>
</div>

</BODY>
</html>

	<%
	        }catch (Exception e){}
	finally {
				
			   if (rs != null) { try {rs.close();rs=null;} catch (SQLException ex) {ex.printStackTrace();}}
			   if (ps != null) {try {ps.close();ps=null;} catch (SQLException ex) {ex.printStackTrace();}}     
		       if (con != null) {try {con.close();con=null;} catch (SQLException ex) {ex.printStackTrace();}}           
		       }
	        
	%>