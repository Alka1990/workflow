<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>WorkFlow</title> <!-- Bootstrap core CSS -->
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
	
/*$(document).ready(function() {
	$('#example').DataTable();
} );*/

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
        %>
 
 
 
 
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
                        <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead>
          <TR>
            
           <TH class="sorting"> WORD ORDER ID</TH>
            <TH class="sorting"> CASE ID</TH>
           
               <TH class="sorting"> LAST USER</TH> 
                
                    <TH class="sorting">DECISION</TH>
                        <TH class="sorting">CURRENT STAGE</TH>
                        <TH class="sorting">CREATED BY</TH>
                     <TH class="sorting">CREATED DATE</TH>
                     <!--  <TH class="sorting">PRIORITY</TH> -->
                      <TH class="sorting">Workorder Template</TH>
                     
                   </TR>  
    
  
    
    
   
    </thead>
       <%  
for(ViewVO viewVO:list){ %>
    <tbody>
    
     <TR  class="even">
           <TD><a href="view2.jsp?caseId=<%= viewVO.getCaseid() %>&NxtStage=<%= viewVO.getNext_stage() %>"><%=  viewVO.getCaseid() %></a></TD>
                <TD> <%= viewVO.getCaseid() %></td>
                 <TD> <%= viewVO.getUserid() %></td> 
         		 <TD> <%= viewVO.getDecision() %></TD> 
                <TD> <%= viewVO.getNext_stage() %></TD>
                <TD> <%= viewVO.getInituserid() %></TD>
                <TD> <%= viewVO.getInitDate() %></TD>
               <%--  <TD> <%= viewVO.getPriority() %></TD> --%>
                <TD><a href="workorder.jsp?caseId=<%= viewVO.getCaseid() %>"><i class="fa fa-file-o" aria-hidden="true"></i></a></TD>
            </TR>
    
     <% } 
            
            %>
    
    	
     <tr>
        <td colspan="9" align="right">
        
<!--       <nav aria-label="...">
		  <ul class="pagination">
			    <li class="page-item disabled"><span class="page-link">Previous</span></li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item active"><span class="page-link">2<span class="sr-only">(current)</span></span></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
	</nav> -->

</td>
		
        </tr>
    
  	
		
	
   
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
