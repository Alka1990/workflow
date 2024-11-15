
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
<%@page import="com.vo.ExportVo"%> 
 <% 

 
 List<ExportVo> list = (List)request.getAttribute("exportlist");
 String address="";
 String default_address="";
 %>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>:: WorkFlow Add Bar code Info ::</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
    <script src="JavaScript/bootstrap.js"></script>
    <script src="JavaScript/jquery-1.10.1.js"></script>
     	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/xlsx.full.min.js"></script>
  </head>
  <body class="nav-md">
   
      <div class="container body">
        <div class="main_container">
          <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
              <!-- Top Bar --><%@ include file="TopBar.jsp" %>
              <!-- Top Bar -->
              <!-- menu prile quick info --><%@ include file="LeftTopSide.jsp" %>
              <!-- /menu prile quick info -->
              <!-- sidebar menu --><%@ include file="SideBar.jsp" %>
              <!-- /sidebar menu -->
            </div>
          </div>
          <!-- top navigation --><%@ include file="TopNavigation.jsp" %>
          <!-- /top navigation -->
          <!-- page content -->
          <div class="right_col" role="main">
            <div class="container" style="padding-top:20px;">
              <div class="panel panel-primary">
               <div class="panel-heading">
                  <strong>Add Details </strong>
                </div><br>
              <%--     <form method="post" action="${pageContext.request.contextPath}/AddBarcodeInfo">
                <div class="table-responsive" style="margin-left:20px;margin-right:20px">
                  <br>
                  <table class="table table-no-bordered">
                    <tr>
                      <td width="25%">
                        <label>Case Id</label>
                        <span>
                          <input class="form-control" id="Case_Id" name="Case_Id"   autofocus required pattern="[0-9.]+" minlength="10" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                        </span>
                      </td>
                           <td width="25%">
                        <label>Patient Name</label>
                        <span>
                        
                          <input class="form-control" id="Patient_Name" name="Patient_Name" required readonly>
                        </span>
                      </td>
                      <td width="25%">
                        <label>Doctor Name</label>
                        <span>
                          <input class="form-control" id="Doctor_Name" name="Doctor_Name" required readonly>
                        </span>
                      </td>
                          <td width="25%">
                        <label>Tracking Id</label>
                        <span>
                          <input class="form-control" id="tracking_id" name="tracking_id" required>
                        </span>
                      </td>
                     
                  
                  
                      <td width="25%" valign="middle">
                        <label></label>
                        <span>
                          <button class="btn btn-success " type="submit" style="margin-top: 21px;">Submit</button>
                        </span>
                      </td>
                    </tr>
                  </table>
                  <br>
                </div>
                </form>  --%>
                
                <div class="row">
<div class="col-lg-11" style="margin-left:40px;">
<div class="panel panel-info">
<div class="panel-heading "style="color:black;" ><b>Export Data</b></div>
<div class="panel-body">

<div class="card-body scrollable"  style="overflow-x:auto;" >
    <table class="table table-bordered table-striped table-hover dataTable"  id="exportdata">
  <thead style="background:black;color:white;">
    <tr role="row">
        <th class="sorting">Case Id </th>
        <th class="sorting">Patient Name </th>
        <th class="sorting">Doctor Name </th>
         <TD class="sorting"> Address </TD>
         <TD class="sorting"> Mobile No</TD>
         <th class="sorting">Tracking Id </th>
      </tr>
    </thead>
         <tbody>
     <% if(list.size()==0){%>
    <tr><td colspan="6" align="center"><b>No data found!</b></td></tr>
  <%}else{
    	 for(ExportVo ex:list){	%>
    		 
    		 	<% default_address=ex.getDefault_address();
   
    		 	 if(default_address==null){
    		 		address="";
    		 		default_address="";
    		 	 }
    		 	
    			 if(default_address.equals("1")){
    				 address=ex.getAddress1();
    			 }
				if(default_address.equals("2")){
					address=ex.getAddress2();			 
				    			 }
				if(default_address.equals("3")){
					address=ex.getAddress3();
				}
				if(default_address.equals("4")){
					address=ex.getAddress4(); 
				}
				if(default_address.equals("5")){
					address=ex.getAddress5(); 
				}
		/* 		if(default_address.equals("") || default_address==null ){
					address="";
				} */

	%>
		<tr class="even" role="row">
         		<TD><span> <%=ex.getCase_id()%></span></td>
         		<TD><span> <%=ex.getPatient_Name()%></span></td>
                <TD><span> <%= ex.getDoctor_Name()%></span></TD>
        		 <TD> <span><%=address %></span></TD> 
        		 <TD><span><%= ex.getPhone()%></span></TD>
                <TD> <span><%=ex.getTracking_id() %></span></TD> 
			</tr>	
<%} }
    	 /* } */
%>  <tbody> 
  </tbody>

</table> 

</div>	
 <% if(list.size()!=0){%>
<table align="center">
<tr >

<td >
<button class="btn btn-success" onclick="ExportToExcel('xls')" style="float:right;"><i class="fa fa-file-excel-o"></i> Export to Excel</button> 
</td>
</tr>
</table>	
<%}%>				    
</div>
</div>
</div>
</div>
              </div>
            </div>
          </div>



    <div class="modal  fade" id="errormodal" role="dialog">
    <div class="modal-dialog modal-sm"  >
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-body" style="text-align: center;" >
        <br>
        	<label style="font-size: large; ">Password Change Successfully!</label>
        </div>
        <div class="modal-footer">
         <button class="btn btn-info" data-dismiss="modal" >Back</button>
        </div>
      </div>
    </div>
  </div>
  
  
       <script>
/*        
       $( document ).ready(function() {
    	    console.log( "ready event fire!" );
    	    
    	    $.ajax
    	    ({ 
    	        url: 'ExportDeliveryDetails',
    	        data: {"caseId": cid},
    	        type: 'post',
    	        success: function(result)
    	        {
    	        	var data=result;
    	        	var dataarray=(data).split(',');
    	        	var DoctorName=dataarray[0];
    	        	var patientname=dataarray[1];
    	        	
    	        	$("#Patient_Name").val(patientname);

    	        	$("#Doctor_Name").val(DoctorName);
    	       }
    	       
    	});
    		
    	});
    
    $('#Case_Id').keyup(function(){
		var cid=$("#Case_Id").val()

	    $.ajax
	    ({ 
	        url: 'FetchTrackdata?query=fetchdata',
	        data: {"caseId": cid},
	        type: 'post',
	        success: function(result)
	        {
	        	var data=result;
	        	var dataarray=(data).split(',');
	        	var DoctorName=dataarray[0];
	        	var patientname=dataarray[1];
	        	$("#Patient_Name").val(patientname);
	        	$("#Doctor_Name").val(DoctorName);
	       }    
	});
		
	}); */
    
    $(function(){
		$('#areaCode').keyup(function(e){
			if($(this).val().length==$(this).attr('maxlength'))
				$(this).next(':input').focus()
		})
	})

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = dd + '/' + mm + '/' + yyyy;
    
        function ExportToExcel(type, fn, dl) {
            var elt = document.getElementById('exportdata');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "ExportData" });
            return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('ExportDeliveryDetails_'+today+'.' + (type || 'xls')));
        }

    </script>
  </body>
</html>
