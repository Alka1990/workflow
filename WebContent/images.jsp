
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
<%@page import="com.vo.ImagesVo"%> 
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
    <div class="panel-heading"><strong>MyInvoice</strong> </div>
    <div class="table-responsive">
		
		
		
<%
List<ImagesVo> list = (List)request.getAttribute("ImgVoList");%>
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
    <thead style="background:black;color:white;">
    
       <tr role="row">
       <th class="sorting">ID</th>
       <th class="sorting">CASE_ID</th>
       <th class="sorting">DOCTOR NAME</th>
       <th class="sorting">PATIENT NAME</th>
       <th class="sorting">CLINIC NAME</th>
       <th class="sorting">User</th>
       <th class="sorting">PPF</th>
       <th class="sorting">TPR</th>      
       <th class="sorting">CBF</th>
       <th class="sorting">SAD</th>
       <th class="sorting">DAF</th>
       <th class="sorting">DATE</th>
       
	 <!-- <th class="sorting">DELETE</th> -->   
        
      </tr>
    </thead>
    
    
     <tbody> 
     <%if(list.size()==0){ %>
     <tr>
     	<td colspan="5" align="center"><b>No Data Found!</b></td>
     </tr>
<%}else{ for(ImagesVo ImagesVo1:list){
	String date=ImagesVo1.getDate();
    System.out.println("hi getCase_booking_form " +ImagesVo1.getCase_booking_form());
    System.out.println("hi getSales_approval_docs " + ImagesVo1.getSales_approval_docs());
    System.out.println("hi getDoc_approval_form " + ImagesVo1.getDoc_approval_form());
    
    
	if(date==null){
		date="";
	}else{
		date=ImagesVo1.getDate();
	}
%>
		<tr class="even" role="row">
		 	<TD><a href="showimages.jsp?id=<%=ImagesVo1.getImgid()%>"><%= ImagesVo1.getImgid() %></a></TD>
			<TD> <%= ImagesVo1.getCase_id() %></TD>
			<TD> <%= ImagesVo1.getDoctor_name() %></TD>
            <TD> <%= ImagesVo1.getPatient_name() %></TD>
            <TD> <%= ImagesVo1.getClinic_name() %>  </TD>
            <TD> <%= ImagesVo1.getUser_name() %></TD>
            
            <%if(ImagesVo1.getPpf_doc()!=null && ImagesVo1.getPpf_doc()!=""){ %>
            	<TD>Yes</TD>
            <% }else{%>
            <TD></TD>
            <%}if(ImagesVo1.getTpr_doc()!=null && ImagesVo1.getTpr_doc()!=""){ %>
            	<TD>Yes</TD>
            <% }else{%>
            <TD></TD>
            <%} %>
            
      
             <%if(ImagesVo1.getCase_booking_form()!=null && !ImagesVo1.getCase_booking_form().trim().isEmpty()){ %>
            	<TD>Yes</TD>
            <% }else{%>
            <TD></TD>
            <%}if(ImagesVo1.getSales_approval_docs()!=null && !ImagesVo1.getSales_approval_docs().trim().isEmpty()){ %>
            	<TD>Yes</TD>
            <% }else{%>
            <TD></TD>
            <%}if(ImagesVo1.getDoc_approval_form()!=null && !ImagesVo1.getDoc_approval_form().trim().isEmpty()){ %>
        	<TD>Yes</TD>
        <% }else{%>
        <TD></TD>
        <%} %>
           
            <TD> <%= date %>  </TD>
			</tr>
<% }}%>		 
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
