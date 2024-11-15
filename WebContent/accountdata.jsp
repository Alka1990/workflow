
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.MathContext"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="com.vo.AccountVo"%> 
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Workflow</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<script src="javaScript/bootstrap.js"></script>
 <script src="JavaScript/custom.js"></script>

	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 
</head>

<body class="nav-md" >


<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >

<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <!-- Top Bar -->
                 	<%@ include file="TopBar.jsp" %>
				<!-- Top Bar -->
                      <!-- menu prile quick info -->
                   
                    <%@ include file="LeftTopSide.jsp" %>
                    <!-- /menu prile quick info -->


                       	<!-- sidebar menu -->
						    <%@ include file="SideBar.jsp" %>
                    <!-- /sidebar menu -->
                </div>
            </div>

            <!-- top navigation -->
            <%@ include file="TopNavigation.jsp" %>
            <!-- /top navigation -->


            <!-- page content -->
            <div class="right_col" role="main">
<div class="container" style="padding-top:20px;">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>MyInvoicedddd</strong> </div>
    <div class="table-responsive">
		
		
		
		<% 
//List<PendingVO> list=LoginDAO.getCaseID(session);
List<AccountVo> list = (List)request.getAttribute("AccountVoList");

%>
		<table class="fontTable" align="center">	
	<input type="hidden" name="username" id="logusername" value='<%=request.getAttribute("username")%>'/>
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>

 
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
                        <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead>
    
      <tr role="row">
       
        <th class="sorting">CASE_ID</th>
       <th class="sorting">Doctor Name</th>
        <th class="sorting">Patient Name</th>
       <th class="sorting">CRM</th>
         <th class="sorting">MODE OF PAYMENT</th>
           <th class="sorting">Total</th>
              <th class="sorting">Paid Amount</th>
           
         
       
	 <!-- <th class="sorting">DELETE</th> -->
        
        
        
      </tr>
    </thead>
    
    
    
     <%  
for(AccountVo AccountVo1:list){
	
	
	
	
	%>



    <tbody>
  	
		<tr class="even" role="row">
	
		     <!-- <TD><a href="showdraft?caseId=<%= AccountVo1.getCaseid() %>&logusername=<%= request.getAttribute("username") %>"><%= AccountVo1.getCaseid() %></a></TD>-->
         	<%-- 	     <TD><a href="Showdrafts.jsp?caseId=<%= AccountVo1.getDraftid() %>&logusername=<%= request.getAttribute("username") %>"><%= AccountVo1.getDraftid() %></a></TD>
       --%>   
        <TD><a href="AccountdataShow?caseId=<%= AccountVo1.getCaseid()%>&page=Updateaccount&crm=<%=AccountVo1.getCrm() %>"><%= AccountVo1.getCaseid() %></a></TD>
                <TD> <%= AccountVo1.getDoctorName() %></TD>
                 <TD> <%= AccountVo1.getPatientName() %></TD>
  			    <TD><%=AccountVo1.getCrm() %></TD>
                <TD><%=AccountVo1.getModepayment() %></TD>
                <TD><%=AccountVo1.getTotal() %> </TD>
  			    <TD> <%=AccountVo1.getPaidAmount() %></TD>
			
                
               	
			</tr>
				
				
		
<% }
 
%>		
	
    
    </tbody>
  </table>
  
  		<br><br>
		
  </div>
  </div>

</td>
        </tr>
    </thead>
    </table>
    	
    	<div class="bottomMenu"></div>
		
  </div>
  </div>
  
   </div>
		</form>
</div>

                 <!-- footer content -->

                   
                <!-- /footer content -->
            </div>
            <!-- /page content -->

       

</body>


</html>
