
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
 <script type="text/javascript" class="init">
 

 
/*$(document).ready(function() {
	$('#example').DataTable();
} );*/

	</script>
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 

 
</head>

<body class="nav-md" >


<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/HoldCaseValue" target="_self" >

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
            <input type="hidden" class="form-control"  id="casetage" name="casetage" value="">
            
            <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
<div class="container" style="padding-top:20px;">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Hold Case</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		
		</div>
		<table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>
 
     <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Case Number</label>

<span style="color:red" class="required">*</span></label>
     <span style="padding-left:129px; margin-top:5px;">
       
			
     			   <input class="form-control" id="case_number"  name="case_number">
     		
        </span>
      </div>
	  
	 
	  </div> 
  <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Remarks</label>

<span style="color:red" class="required">*</span></label>
     <span style="padding-left:129px; margin-top:5px;">
       
			
     			   <input class="form-control" id="remarks"  name="remarks">
     		
        </span>
      </div>
	  
	 
	  </div> 


      
			
      </div>
	  
	 
	  </div> 
	  
	   <div class="table-responsive">
        <table class="table table-no-bordered" >
       <tr>
      	
         <td width="50%">
         <input class="btn btn-success" type="hidden" id="BtnSubmit" name="BtnSubmit" value='submitButton'  disabled /></td>   
 	   <td  width="50%">
			<a class="btn btn-primary" style="display:none;" id="submitButton" style="margin-left:-66px;" name="BtnSubmit1" onclick="genrateDocs()">GenerateBarcode</a>

			
			  <td width="50%">
         <button class="btn btn-primary" type="button" id="searchScreen" name="searchScreen"  value='searchScreen'>Hold</button></td>   
			 <input class="form-control" type="hidden"  name="username" id="username" value='<%=(String)request.getAttribute("username")%>'> 
			 
			      
       </tr>       
       
        </table>
</div>

    	
    
  </div>
  </div>
  
   </div>
		</form>
		
		


                 <!-- footer content -->

                   
                <!-- /footer content -->
            </div>
            <!-- /page content -->

       <script>
 
       $('#searchScreen').click(function(){
    	   var username=$('#username').val();
    	   var case_number=$('#case_number').val();
    	   var remarks=$('#remarks').val();
    	   var casetage=$('#casetage').val();
	//alert(username+' '+case_number);
	if(case_number!=''){
		 $.ajax({
		 		

		 	    type : 'POST',
		 		data : {case_number:case_number,username:username,remarks:remarks,casetage:casetage},
		 	//	data : {table3Content:table3Content,reviewnumber:reviewnumber},
		 		url : 'HoldCaseValue',
		 		success : function(responseText) {
						
		 			var x=responseText;
		 		//	document.getElementById("form1").reset();
		 			alert(x);
		 			
		 			 $('#sidebarHold')[0].click();
					}
		 	
		 	  
		 		 
				});
	}else{
		alert('Kindly Enter Case Id');
	}
	//alert(stagelist);
	
	 
       });
 </script>

    
</body>

</html>
