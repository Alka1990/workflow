
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
<%@page import="com.vo.DraftVo"%> 
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
	<script src="JavaScript/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.min"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<script src="javaScript/bootstrap.js"></script>
 <script src="JavaScript/custom.js"></script>
 
 <script type="text/javascript" class="init">
	
$(document).ready(function() {
	var caseLock='<%=request.getAttribute("caseLock")%>';
	//alert(caseLock)
	if(caseLock!='null'){
		alert(caseLock);
	}
	
} );

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
    <div class="panel-heading"><strong>Draft</strong> </div>
    <div class="table-responsive">
		
		
		
		<% 
//List<PendingVO> list=LoginDAO.getCaseID(session);
List<DraftVo> list = (List)request.getAttribute("DraftVoList");




for(DraftVo DraftVo1:list){
	 
	 
	 
	 
}



String sDecision = (String)request.getAttribute("sDecision");

//System.out.println("<tr>");
//Iterator iterator = pendingVO.iterator();

//while(iterator.hasNext()){
	
/*	String temp = iterator.next().toString();
     
     out.println("<tr><td><input type=radio id=caseList>" + temp + "</td></tr>"); 
     
    // out.println("<td>"+ temp +"</td>");
    
   } 
*/
%>
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
       
        <th class="sorting">CASE_ID</th>
       <th class="sorting">DECISION</th>
        <th class="sorting">CURRENT STAGE</th>
       <th class="sorting">CREATED DATE</th>
	 <!-- <th class="sorting">DELETE</th> -->
        
        
        
      </tr>
    </thead>
    
    
    
     <%  
for(DraftVo DraftVo1:list){
	
	
	
	
	%>



    <tbody>
  	
		<tr class="even" role="row">
	
		     <!-- <TD><a href="showdraft?caseId=<%= DraftVo1.getDraftid() %>&logusername=<%= request.getAttribute("username") %>"><%= DraftVo1.getDraftid() %></a></TD>-->
         	<%-- 	     <TD><a href="Showdrafts.jsp?caseId=<%= DraftVo1.getDraftid() %>&logusername=<%= request.getAttribute("username") %>"><%= DraftVo1.getDraftid() %></a></TD>
       --%>    <TD><a href="NewCasesshow1?caseId=<%=  DraftVo1.getDraftid()%>&page=newcase"><%= DraftVo1.getDraftid() %></a></TD>
				
			    <TD> <%= DraftVo1.getDecision() %></TD>
                <TD> <%= DraftVo1.getStage() %></TD>
                <TD> <%= DraftVo1.getCreatedate() %>  </TD>
                
               <!--  <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"  onclick="fun('<%= DraftVo1.getDraftid() %>')" >delete</button></td>-->
        	        <%--         <td><button type="button" class="btn btn-danger"   onclick="fun('<%= DraftVo1.getDraftid() %>')">delete</button></td>
        	 --%>
		
<%-- 			<input type="button" id="BtnRaiseQuery" name="BtnRaiseQuery" value="Raise Query" /></td>
 --%>		
			
			</tr>
				
				
		
<% }
 
%>		
	
     <tr>
        <td colspan="9" align="right"><ul class="pager">
  		
											<li><a href="#" onclick="PrevButton()">Prev</a>
										
														<label style="color: gray;">Prev</label>

		
		&nbsp;&nbsp;&nbsp;&nbsp;	
		
		<label style="color: gray;">Next</label>
		
		<li><a href="#" onclick="NextButton()">Next</a>	
		
		 </ul></td>
		
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

       


<!-- onclick decline modal -->


<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >Decline</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form class="formcontrol" action="DraftDelete" method="post"> 
      <div class="modal-body ">
       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Password:</label>
            

            
           <input type="hidden" class="form-control" id="caseid" name="caseid" value=''>
            <input type="password" class="form-control" id="password" name="password" maxlength="30" required>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Reason for Decline:</label>
            <textarea class="form-control" id="decline" name="decline" required maxlength="100"></textarea>
          </div>
        
      </div>
      <div class="modal-footer">
      
        <button type="reset" class="btn btn-secondary" >Clear</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end onclick decline modal -->

    
</body>



<script>


function fun(x){
	 	document.getElementById("caseid").value='';
	    document.getElementById("caseid").value=x;
		$('#exampleModal').modal('show'); 
 }


</script>

</html>
