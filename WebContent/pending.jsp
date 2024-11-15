
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
<%@page import="com.vo.PendingVO"%> 
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title> <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
      

 
<script src="avaScript/bootstrap.js"></script>
 
 <script src="JavaScript/custom.js"></script>
 <script type="text/javascript" class="init">
	
$(document).ready(function() {
	var caseLock='<%=request.getAttribute("caseLock")%>';
	if(caseLock!='null'){
		alert(caseLock);
	}
	
} );

	</script>
	
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
    <div class="panel-heading"><strong>Data</strong> </div>
    <div class="table-responsive">
		
		
		<% 
//List<PendingVO> list=LoginDAO.getCaseID(session);
List<PendingVO> list = (List)request.getAttribute("pendingVOList");

String sDecision = (String)request.getAttribute("sDecision");

//System.out.println("<tr>");
//Iterator iterator = pendingVO.iterator();

//while(iterator.hasNext()){
	
/*	String temp = iterator.next().toString();
     
     out.println("<tr><td><input type=radio id=caseList>" + temp + "</td></tr>"); 
     
    // out.println("<td>"+ temp +"</td>");
    
   } 
*/
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
       
        <th class="sorting">Workorder Id</th>
        <th class="sorting">Case Id</th>
        
        <th class="sorting">LAST USER</th>
        <th class="sorting">DECISION</th>
        <th class="sorting">CURRENT STAGE</th>
        <th class="sorting">Last Stage</th>
        <th class="sorting">CREATED DATE</th>
          <th class="sorting">PRIORITY</th>
	
        
        
        
      </tr>
    </thead>
    
    
    
     <%  
for(PendingVO pendingVO:list){
	
	
	
	%>



    <tbody>
  	
		<tr class="even" role="row">
	
		     <TD><a href="Approval?caseId=<%= pendingVO.getCaseid() %>&logusername=<%= request.getAttribute("username") %>&NxtStage=<%= pendingVO.getNext_stage() %>&SearchStage=N"><%=  pendingVO.getCaseid() %></a></TD>
         
				<TD> <%=pendingVO.getCaserid() %></td>
			 <TD> <%=pendingVO.getUserid() %></td>
                <TD> <%= pendingVO.getDecision() %></TD>
                <TD> <%= pendingVO.getNext_stage() %></TD>
                <TD> <%= pendingVO.getStage() %></TD>
           <TD> <%= pendingVO.getInitDate() %></TD>	
            <TD> <%= pendingVO.getPriority() %></TD>	
		
			
			
		
<%-- 			<input type="button" id="BtnRaiseQuery" name="BtnRaiseQuery" value="Raise Query" /></td>
 --%>		
			
			</tr>
				
				
		
<% }
 
%>		
	
  <!--    <tr>
        <td colspan="9" align="right"><ul class="pager">
  		
											<li><a href="#" onclick="PrevButton()">Prev</a>
										
														<label style="color: gray;">Prev</label>

		
		&nbsp;&nbsp;&nbsp;&nbsp;	
		
		<label style="color: gray;">Next</label>
		
		<li><a href="#" onclick="NextButton()">Next</a>	
		
		 </ul></td>
		
        </tr> -->
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
