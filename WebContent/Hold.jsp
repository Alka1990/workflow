
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
      

 
<script src="javaScript/bootstrap.js"></script>
 
 <script src="JavaScript/custom.js"></script>
 <script type="text/javascript" class="init">
	
/*$(document).ready(function() {
	$('#example').DataTable();
} );*/

	</script>
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 
 <script>
 
function PrevButton(){
	
	document.getElementById('LinkType').value = 'prev';
	document.MyInvoiceForm.action = 'MyInvoiceServlet';
	document.MyInvoiceForm.submit();
}

function NextButton(){
	document.getElementById('LinkType').value = 'next';
	document.MyInvoiceForm.action = 'MyInvoiceServlet';
	document.MyInvoiceForm.submit();
}

function ClearSessionVariables(){
		
	document.getElementById('hiddenTopQueryNo').value = '<%=request.getAttribute("TopQueryNo") %>';
	document.getElementById('hiddenLastQueryNo').value = '<%=request.getAttribute("LastQueryNo") %>';		
}

function BarcodeGen(InvoiceNumber){
	document.getElementById('InvoiceNumber').value = InvoiceNumber;
	document.getElementById('MyInvoiceForm').submit();
		
}
function RaiseQuery(InvoiceNumber, TransactionNo){
	//document.getElementById('InvoiceNo').value = InvoiceNumber;
	document.getElementById('InvoiceNumber').value = InvoiceNumber;
	document.getElementById('TransactionNo').value = TransactionNo;

	document.MyInvoiceForm.action="${pageContext.request.contextPath}/SubmitQueryServlet";
	document.MyInvoiceForm.submit();		
}


function details(InvoiceId, BarcodeNumber){
	document.getElementById('BarcodeNumber').value=BarcodeNumber;
		document.getElementById('hiddenInvId').value=InvoiceId;
	document.MyInvoiceForm.action="${pageContext.request.contextPath}/GeneratedInvoiceDetailsServlet";
	document.MyInvoiceForm.submit();
}
 </script>
 
</head>

<body class="nav-md" >


<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/HoldCase" target="_self" >

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
		<table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>
 
 
  <% 
        
        List<ViewVO> list = (List)request.getAttribute("viewVOList");
        %>
 
    <table id="Hold" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
 <div class="table-responsive">
        <table class="table table-no-bordered">
       <tr>
        <input type="hidden" name="username" id="username" value="<%=(String)session.getAttribute("username")%>">
			  <td >
         <button class="btn btn-primary" type="submit" id="createSubmitHold" name="createSubmitHold" value='Hold Case'>Hold Case</button></td>   
			 <td >
			 <button class="btn btn-primary" type="submit" id="createSubmitUnhold" name="createSubmitUnhold" value='Hold Case'>UnHold Case</button></td>
			 <td><button class="btn btn-primary" type="submit" id="cancelcase" name="cancelcase" value='cancelcase'>Cancel Case</button></td>
       </tr>       
       
        </table>
</div>
   <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
          <TR>
            
           <TH class="sorting"> CASE ID</TH>
              <TH class="sorting"> LAST USER</TH>
                
                    <TH class="sorting">DECISION</TH>
                        <TH class="sorting">CURRENT STAGE</TH>
                        <TH class="sorting">CREATED BY</TH>
                     <TH class="sorting">CREATED DATE</TH>
                   </TR>  
    
  
    
    
   
    </thead>
       <%  
for(ViewVO viewVO:list){ %>
    <tbody>
    
     <TR  class="even">
<%--                 <TD><a href="view2.jsp?caseId=<%= viewVO.getCaseid() %>&NxtStage=<%= viewVO.getNext_stage() %>"><%=  viewVO.getCaseid() %></a></TD>
 --%>     
           <TD><a href="Approval.jsp?caseId=<%= viewVO.getCaseid() %>&NxtStage=<%= viewVO.getNext_stage() %>"><%=  viewVO.getCaseid() %></a></TD>
                <TD> <%= viewVO.getUserid() %></td>
               <TD> <%= viewVO.getDecision() %></TD>
                <TD> <%= viewVO.getNext_stage() %></TD>
                <TD> <%= viewVO.getInituserid() %></TD>
                <TD> <%= viewVO.getInitDate() %></TD>
            </TR>
    
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
