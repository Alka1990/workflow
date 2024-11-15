
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

<% List userRights = (List) session.getAttribute("getRight"); %>

<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow :: Search Patient Photo </title><!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
    <script src="avaScript/bootstrap.js"></script>
    <script src="JavaScript/custom.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 

 
</head>

<body class="nav-md" >


<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/SearchPhotoData" target="_self" >

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
            <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
<div class="container" style="padding-top:20px;">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Search Photo Case ID</strong> </div>
    <div class="table-responsive" style="margin-left:20px;margin-right:20px">
		<div style="display: none;">
		
		</div>
		<table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>


     <div style="padding:10px 0px 0px 0px;" >   
              <div class="form-group" id="D">
                <label>Case ID</label>

<span style="color:red" class="required">*</span></label>
 <span style="padding-left:129px; margin-top:5px;">	
   <input class="form-control" id="caseId"  required name="caseId">
     		
    </span>
    
      </div>
	  
	  </div> 
	   <div class="table-responsive">
        <table class="table table-no-bordered" >
        <!-- Romy -->
               <tr>
       <td width="50%" align="right" <% if (userRights.contains("DPH") == true) {%> hidden<% }%>>
         	<label>If you want to see Uploaded Photo click on check box<span style="color:red" class="required">*</span> <input type="checkbox" name="viewphoto" value="Y" <% if (userRights.contains("DPH") == true) {%> checked<% }%> style=" width: 20px;
       height: 20px;"/></label>
         </td>
         </tr>
         <!-- Romy -->
       <tr>
	   <td width="50%" align="right">
         <button class="btn btn-primary" type="submit" id="searchScreen" name="searchScreen"  value='searchScreen'><i class="fa fa-picture-o" aria-hidden="true"></i>Search</button>
        </td>   	      
         
       </tr>       

        </table>
</div>

    	
    
  </div>
  </div>
  
   </div>
		</form>

            </div>
            <!-- /page content -->
 
</body>

</html>
