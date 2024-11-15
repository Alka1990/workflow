
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
<%@page import="com.vo.Comment"%> 
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
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
	<% List<Comment> list = (List)request.getAttribute("commentlist");%>
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
        <th class="sorting">Comment_ID</th>
        <th class="sorting">Case_ID </th>
        <th class="sorting">User Name</th>
        <th class="sorting">Stage</th>
        <th class="sorting">Comment</th>
          <th class="sorting">Date</th>
          <th>Decision</th>
          <!--<th class="sorting">Status</th>  -->
         
                
        
      </tr>
      
    </thead>
     <%  
for(Comment Nc:list){	
	%>
    <tbody>
		<tr class="even" role="row">
		
		         <TD> <%=Nc.getComment_id() %></td>
         		<TD> <%=Nc.getCase_id() %></td>
         		<TD> <%=Nc.getUser_name() %></td>
         		<TD> <%=Nc.getStage() %></td>
                <TD> <%= Nc.getComment() %></TD>
                <TD> <%= Nc.getDate() %></TD>
                <TD><select class="form-control" onchange="newdecesion(<%=Nc.getComment_id() %>, <%=Nc.getCase_id() %>)" name="stage" id="Stagedecesion" >
                       <option >----Select Stage----</option>
	  				   <option value="Pre"> Pre-requisite</option>
					   <option value="Plan">Planning</option>
					   <option value="CAD">CAD</option>
					   <option value="lab">LAB</option>
					   <option value="3DP">3D Print</option>
					   <option value="Rup">Review Upload Plan</option>
					   <option value="PCK">Packing</option>
					   <option value="DPH">Dispatch</option>
				</select></TD>
              <%--  <!-- <TD><a href='SeenComment?uname=<%=Nc.getComment_id()%>'><button type="button"  onclick="updatecomment()"class="btn btn-primary">OK</button></a></TD>
                --> 
			 --%></tr>	
<% }%>		
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

       

<script>





function updatecomment(x){
	
	 var case_id=document.getelementById("");

	$.ajax({
	
	    type : 'POST',
		data : {caseid:x,},
		url : 'SeenComment',
		success : function(responseText) {
			
			var x=responseText;
			alert(x);
			//location.reload();
			
		}

	  
		 
	});
	
}



function newdecesion(comment_id,case_id){
	
	 var decesion= document.getElementById("Stagedecesion").value;
//alert("comment_id=="+comment_id+" || y==="+case_id+" || decesion=="+decesion)
var url='SeenComment?uname='+decesion+','+comment_id+','+case_id;
$.ajax({
	
    type : 'POST',
	url : url,
	success : function(responseText) {
		
		var x=responseText;
		alert("The case_id:"+case_id+" Transferred to "+decesion+" Department ");
		//location.reload();
		
	}

  
	 
});

	 
}
</script>
    
</body>

</html>
