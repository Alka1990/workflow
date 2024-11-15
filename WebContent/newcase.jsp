
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
<%@page import="com.vo.Newcase"%> 
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Workflow</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
      

 
<script src="JavaScript/bootstrap.js"></script>
 
 <script src="JavaScript/custom.js"></script>
 <script type="text/javascript" class="init">
	


	</script>
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $.get("http://107.167.80.130:8080/MobileApp/rest/getAllScanningDoneForm", function(data, status){
var userData = data;

for (var i = 0; i < userData.length; i++) {
    console.log(userData[i].doctor_name);
}

    });
   
</script>


<script>
$(document).ready(function(){

	  $.get("http://107.167.80.130:8080/MobileApp/rest/getAllScanningDoneForm", function(data, status){
		  var myBooks = data;


     // EXTRACT VALUE FOR HTML HEADER. 
     var tableBody = '<table role="grid" id="example" style="margin-top:6px;" class="table table-bordered table-striped table-hover dataTable"><thead style="background:black;color:white;"><tr ><th >FormID</th><th>Patient Name</th><th>Doctor Name</th><th>Clinic Name</th><th >Contact number</th><th >Username</th><th>Date</th></tr></thead>';
     var url='newcaseshow.jsp?id=';
     myBooks.forEach(function(d)
     {
    	 
     if(d.patient_name==null)
    	 {
    	  d.patient_name="";
    	 }
	     if(d.doctor_name==null)
		 {
	    	 d.doctor_name="";
		 }
	     if(d.clinic_name==null)
		 {
	    	 d.clinic_name="";
		 }
	     if(d.contact_no==null)
		 {
	    	 d.contact_no="";
		 }
         tableBody += '<tr><td><a href='+url+d.id+'>'+d.id+'</td><td>'+d.patient_name+'</td><td>'+d.doctor_name+'</td><td>'+d.clinic_name+'</td><td>'+d.contact_no+'</td><td>'+d.user_name+'</td><td>'+d.date+'</td></tr>';   
     });
     //alert("count table row "+document.getElementById('example').rows.length)
         tableBody += '<table>';

     // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
       
        var divContainer = document.getElementById("showData");
           divContainer.innerHTML = tableBody;

	  });
});
</script> 
<script>
    function CreateTableFromJSON() {
                     }
</script> 
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
    <div class="panel-heading"><strong>New Request</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
		
		
		
 
 
 
 

<div class="col-lg-12">
                        <div class="table-responsive">
                           <p id="showData"></p>
      
  
  		<br><br>
		
  </div>
  </div>


    	
    	
  

       

<script>





function startcase(x){

	$.ajax({
	
	    type : 'POST',
		data : {caseid:x},
		url : 'Startcase',
		success : function(responseText) {
			
			var x=responseText;
			alert(x);
			location.reload();
			
		}

	  
		 
	});
	
}
</script>
    
</body>

</html>
