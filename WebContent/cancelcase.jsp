
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
    <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title>   <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
     
<script src="JavaScript/bootstrap.js"></script>
<script src="JavaScript/custom.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
</head>

<body class="nav-md">
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
				<div class="container">
							<div class="panel panel-default">
								<div class="panel-heading"><i class="fa fa-address-card-o" style="font-size: 20px;"></i>Address Details
								</div>
								<div class="panel-body">
										<form>
											<input type="hidden" class="form-control"  id="casetage" name="casetage" value="REJ">
										    <input type="hidden" name="username"  id="username" value='<%=request.getAttribute("username")%>'/> 
											  <div class="form-row">
											    <div class="form-group col-md-5">
											      <label for="inputCity">Case Id</label>
											      <input type="text" class="form-control" id="case_number"  name="case_number" required >
											    </div>
											    <div class="form-group col-md-5">
											      <label for="inputState">Remarks</label>
											      	<input type="text" class="form-control" id="remarks"  name="remarks" required>
											    </div>
											    <div class="form-group col-md-2">
											    <br>
											  		<button type="button" class="btn btn-primary" id="searchScreen" name="searchScreen" style="margin-top: 6px;">Submit</button>
											    </div>
											  </div>
										
										</form>
											<br><br><br>
							    </div>
								</div>
								
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  </div>
   </div>
                <!-- /footer content -->
            </div>
            <!-- /page content -->
       <script>
 
       $('#searchScreen').click(function(){
    	   var userid=$('#username').val();
    	   var case_number=$('#case_number').val();
    	   var remarks=$('#remarks').val();
    	   var casetage=$('#casetage').val();
    	   
    	   if(case_number==''){
    		   alert("Case Id required!");
    		   return false;
    	   }
    	   if(remarks==''){
        	   alert("Remarks required!");
    	   	   return false;
       		}
    		   $.ajax({
		 	    type : 'POST',
		 		data : {case_number:case_number,userid:userid,remarks:remarks,casetage:casetage},
		 		url : 'HoldCaseValue',
		 		success : function(responseText) {
		 			alert(responseText);
		 			window.location='Newcase1';
		 			// $('#sidebarcancel')[0].click();
					}
		 		}); 
     
       });
 </script>

    
</body>

</html>
