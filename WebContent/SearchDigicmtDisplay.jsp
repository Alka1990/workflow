
<%@page import="com.vo.DigiCommentVO"%>
<%@page import="com.vo.PendingVO"%>
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
<%@page import="com.vo.ViewVO"%> 
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title><!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
    <script src="JavaScript/tether.min.js"></script>
	<script src="JavaScript/bootstrap.js"></script>
 	<script src="JavaScript/custom.js"></script>
 	<script src="JavaScript/jquery-1.10.1.js"></script>
	<script src="JavaScript/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="CSS1/jquery-ui.css" />
</head>

<body class="nav-md">
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
    <div class="panel-heading"><strong>Digi Comment</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
		<table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>
 
 
  <% List<DigiCommentVO> list=(List)request.getAttribute("digicomtlist");%>

    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
<div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
          <TR>            
           <TH class="sorting"> COMMENT ID</TH>
           <TH class="sorting"> CASE ID</TH>
                    <TH class="sorting">COMMENT</TH>
                        <TH class="sorting">COMMENT STAGE</TH>
                         <TH class="sorting">COMMENT BY DOCTOR</TH>
                        <TH class="sorting">DATE</TH>
                   </TR>  
    </thead>   
    <tbody>
 
    <% if(list.size()!=0){
  		for(DigiCommentVO digicomment:list) {%>
     <TR  class="even">
           <TD><%=  digicomment.getCommentId() %></TD>
           <TD> <%= digicomment.getCaseId() %></td>
           <TD> <%= digicomment.getComment()%></TD>
           <TD> <%= digicomment.getStage() %></TD>
            <TD><%= digicomment.getUserName() %></TD>
           <TD> <%= digicomment.getDate()%></TD>
     <% } }else{%>
 <TR  class="even">
 <TD colspan="6" align="center"> <b>No Data Found!</b></TD>
 </TR>
 <%} %>
    </tbody>
  </table>
  
  		<br><br>
		
  </div>
  </div>

</td>
        </tr>
    </thead>
    </table>

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