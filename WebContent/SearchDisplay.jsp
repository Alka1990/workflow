
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
	<script src="JavaScript/bootstrap.js"></script>
	<script src="JavaScript/custom.js"></script>
 

 
</head>

<body class="nav-md" >
 

<form  method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >

<div class="container body">
  <div class="main_container">
  
  <%-- 	<%  System.out.println("searchdisplay jsp");%> --%>

	
		
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
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
		<table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>
 
 
  <% 
        
        List<ViewVO> list = (List)request.getAttribute("viewVOList");
        List<PendingVO> pendingList = (List)request.getAttribute("pendingVOList");
        %>
 
 
 
 
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
                        <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
          <TR>
            
           <TH class="sorting"> WORK ORDER ID</TH>
           <TH class="sorting"> CASE ID</TH>
                    <TH class="sorting">REMARK</TH>
                        <TH class="sorting">CURRENT STAGE</TH>
                    
                      <!--  <TH class="sorting">Add Comment</TH>
                      <TH class="sorting">Service</TH> -->
                   </TR>  
    
  
    
    
   
    </thead>
       <%  
for(ViewVO viewVO:list){ %>
    <tbody>
    
     <TR  class="even">
           <TD><a href="view2.jsp?caseId=<%= viewVO.getCaseid() %>&NxtStage=<%= viewVO.getNext_stage() %>"><%=  viewVO.getCaseid() %></a></TD>
              
                <%-- <TD> <%= viewVO.getUserid() %></td> --%>
                <TD> <%=viewVO.getCaseid() %></td>
			 
			 <TD> <%= viewVO.getDecision() %></TD>
             <TD> <%= viewVO.getNext_stage() %></TD>
               
               <%--  <TD> <%= viewVO.getPriority() %></td> --%>
                             <%--  <td><input type="hidden" id="caseid0" value="<%=viewVO.getCaserid() %>">
			<button id="myButton0" class="btn btn-success" type="button">Add Comment</button></td>
             <td><input type="hidden" id="caseid" value="<%=viewVO.getCaserid() %>">
			<button id="myButton1" class="btn btn-success" type="button">Service</button></td> --%>
            </TR>
    
     <% } 
            
            %>
    
     <%  
for(PendingVO pendingVO:pendingList){
	
	
	
	%>



    <tbody>
  	
		<tr class="even" role="row">
	
		     <TD><a href="Approval?caseId=<%= pendingVO.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %>&NxtStage=<%= pendingVO.getNext_stage() %>&SearchStage=Y"><%=  pendingVO.getCaseid() %></a></TD>
			 <TD> <%=pendingVO.getCaseid() %></td>
			 
			 <TD> <%= pendingVO.getDecision() %></TD>
             <TD> <%= pendingVO.getNext_stage() %></TD>
             	
            <%--  <TD> <%= pendingVO.getPriority() %></TD>	 --%>
             <%-- <td><input type="hidden" id="caseidcmnt" value="<%=pendingVO.getCaseid() %>">
			<button id="myButtoncmnt1" class="btn btn-success" type="button"> Add Comment</button></td>
             
			<td>
			<input type="hidden" id="caseid" value="<%=pendingVO.getCaseid() %>">
			<button id="myButton1" class="btn btn-success" type="button">open service</button></td> --%>
			
			
<%-- 			<input type="button" id="BtnRaiseQuery" name="BtnRaiseQuery" value="Raise Query" /></td>
 --%>		
			
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
		<input type="hidden" name="InvoiceNumber" id="InvoiceNumber" value=""></input>
				<input type="hidden" name="InvoiceNo" id="InvoiceNo" value=""></input>
		
				<input type="hidden" name="BarcodeNumber" id="BarcodeNumber" value=""></input>
		
	   <input type="hidden" name="TransactionNo" id="TransactionNo" value=""></input>
	   <input type="hidden" name="InvPage" id="InvPage" value=""></input>
		
		<input type="hidden" name="InvoiceData" id="InvoiceData" value=""></input>
		<input type="hidden" name="hiddenInvoiceNumber" id="hiddenInvoiceNumber"></input>
		<input type="hidden" name="InvoicesDetails" id="InvoicesDetails"></input>
		<input type="hidden" name="currentInvoice" id="currentInvoice"></input>
  </div>
  </div>
  
   </div>
		</form>
</div>

                 <!-- footer content -->

                   
                <!-- /footer content -->
            </div>
            <!-- /page content -->

    
    
    <script>
    $(function() {

    	  $("#dialog").dialog({
    	     autoOpen: false,
    	     modal: true
    	   });

    	  $("#myButton1").on("click", function(e) {
    		 
    		  var caseid = $('#caseid').val();
    		 // alert(caseid)
    		 document.getElementById("caseid1").value=caseid;
    	     // e.preventDefault();
    	      $("#dialog").dialog("open");
    	      
    	  });
    	 
    	  $('#servicebtn').click(function () {
    		    $('#dialog').dialog('close');
    		    return false;
    		}); 

    	});
    
    </script>

    <script>
    $(function() {

    	  $("#dialogcmnt").dialog({
    	     autoOpen: false,
    	     modal: true
    	   });

    	  $("#myButtoncmnt1").on("click", function(e) {
    		  var caseid = $('#caseidcmnt').val();
    		 // alert(caseid)
    		 document.getElementById("caseid2").value=caseid;
    		  
    	      $("#dialogcmnt").dialog("open");
    	      
    	  });
    	 
    	  $('#servicebtn').click(function () {
    		    $('#dialogcmnt').dialog('close');
    		    return false;
    		});
    	  

    	});
    
    </script>
<!-- <div id="dialogcmnt" title="Comment Box">
<form  action="AddComment" method ="post"> 
 <div class="mb-6">

<h4>Add your comment </h4>
 <div class="mb-6">
  <label for="exampleFormControlInput1" class="form-label">Case Id</label>
  <input type="text" class="form-control" id="caseid2" name="caseid2"   readonly >
</div>
  <label for="exampleFormControlInput1" class="form-label">Comment</label>

<input type= "text" name="comment" class="form-control"  id="comment" />
<div class="text-center"><br>
  <button type="submit"  class="btn btn-success">Add Comment</button>
  </div>


  </div>
</form>
</div> -->


<script>


$(document).ready ( function(){
	   $('#upperAligner').hide();
	   $('#lowerAligner').hide();
	   $('#upperAlignerlbl').hide();
	   $('#lowerAlignerlbl').hide();
	});
	
	
function getissue()
{

var issue=$('#issue').val();

if(issue==='Aligner Broken'){
	
	   $('#upperAligner').show();
	   $('#lowerAligner').show();
	   $('#upperAlignerlbl').show();
	   $('#lowerAlignerlbl').show();
}
else{
	
	   $('#upperAligner').hide();
	   $('#lowerAligner').hide();
	   $('#upperAlignerlbl').hide();
	   $('#lowerAlignerlbl').hide();
}

	}


</script>

<script type="text/javascript">


function xyz(){
	var issue=$('#issue').val();
	var upperaligner=$('#upperAligner').val();
	var lowerAligner=$('#lowerAligner').val();
	var cid=$('#caseid1').val();
	var remarks=$('#remarks').val();
	
	if(issue==='others'){

		if(remarks!='' && remarks!=undefined ){
			
			$.ajax({
				
			    type : 'POST',
				data : {caseid:cid,issue:issue,remarks:remarks},
				url : 'Service',
				success : function(responseText) {
					var x=responseText;
					alert(x);
					location='Dashboard.jsp'
				}	 
			});
			
		}
		else{
			alert("Please enter Remarks")
			document.getElementById("remarks").focus();
			return false;
		}
		
	}
	else if(issue==='Aligner Broken' && upperaligner==''){

		alert("Please enter Upper Aligner")
		document.getElementById("upperAligner").focus();
		return false;
	}
	else if(issue==='Aligner Broken' && lowerAligner==''){

		alert("Please enter Lower Aligner")
		document.getElementById("lowerAligner").focus();
		return false;
	}

	else {
	 	$.ajax({
			
		    type : 'POST',
			data : {caseid:cid,issue:issue,upperaligner:upperaligner,lowerAligner:lowerAligner,remarks:remarks},
			url : 'Service',
			success : function(responseText) {
				var x=responseText;
				alert(x);
				location='Dashboard.jsp'
			}	 
		}); 
	}
	
}

</script>
</body>

</html>
