
<!DOCTYPE html>

<%@page import="com.vo.Newcase1"%> 
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo1.jpeg">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title>
    
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
 
    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
	<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
 	<script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js">
 <script type="text/javascript">
 
function callModal(){
		$('#myModal').modal({
			backdrop: 'static',
			keyboard: false

		}); 
};
</script>
<style>
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
backdrop: 'static'
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;

}
/* The Close Button */
.close {
 	color: #000;
    float: right;
    font-size: 14px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    text-decoration: none;
    cursor: pointer;
}
</style>
 <script>
 
			
		
</script>
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
<div class="container" style="padding-top:20px; ">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Notifications</strong> </div>
    <div class="table-responsive">
    <table class="table table-bordered">
    <thead>
    <tr>
        <td><div class="table-responsive">
    <table class="table table-bordered" >
    <thead>
     
      <tr style="background-color:#f2f2f2;">
        <td align="center">Stage</td>
        <td align="center">Pending Count </td>            
      </tr>
      	
          <% 
          LinkedHashMap<String, String> linkedHashMap= (LinkedHashMap)request.getAttribute("Case_stage");
          for (Map.Entry<String,String> entry : linkedHashMap.entrySet())	
          {  
        	//returns keys and values respectively  
        %>
        
      <tr>
      
      <td>
        <span><%=entry.getKey()%></span>
            <%-- <span><%=entry.getValue()%></span> --%>
        
      
      </td>       
<%-- <TD><a href="Case_Stage?caseStage=<%= entry.getKey() %>&Casestage=<%= entry.getKey()%>"></a></TD>  --%>
       
  <TD><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></TD> 
            
            
      </tr>
      <%} %>
    </thead>
     </tbody>
  </table>
  </div></td>
        </tr>
    </thead>
    </table>
    
      
      
        <div class="row">
        <div class="col-lg-6 " style="width:95%;">
  		           <H2 align="center"> Starter kit</H2>  
  		     
  <table class="table table-bordered"  ;>
    <thead>
     
      <tr style="background-color:#f2f2f2;">
        <td align="center">Stage</td>
        <td align="center">Pending Count </td>            
      </tr>
     <tr>
        <% 
          LinkedHashMap<String, String> linkedHashMap2= (LinkedHashMap)request.getAttribute("Starterkit");
          for (Map.Entry<String,String> entry : linkedHashMap2.entrySet())	
          {  
        	//returns keys and values respectively  
        %> 
        </tr>
      <tr>
      <td>
        <span><%=entry.getKey()%></span>      
      </td>      
		  <TD>
		  <a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a>
		  </TD>      
		      </tr>
      <%} %>
   
   
    </thead>
     
  </table>
  </div>
  
 
</div>  
      
 
        
        <div class="col-lg-6 " style="width:80%;">
      <H2 align="center"> Holdcases</H2>  

	 <table class="table table-bordered"  ;>
    <thead>
     
     	<% List<Newcase1> list = (List)request.getAttribute("holdflag");
 
 %>
	<table class="fontTable" align="center">	
	<input type="hidden" name="username" id="logusername" value='<%=request.getAttribute("username")%>'/>
	<tr id="mesg"><td colspan="6" style="color: red;" class="errorMsg"><strong></strong></td></tr>
		</table>
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="6">
<div class="col-lg-12">
    <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead>
      <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">STARTER DOCTOR </th>
        <th class="sorting"> DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
        
      </tr>
    </thead>
     <% 
    	 for(Newcase1 Nc:list){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		 <TD><a href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage() %>&SearchStage=Y"><%=Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
                <TD> <%= Nc.getCrm() %></TD>
              
				 
			</tr>	
<% }%>
 </thead>
     
  </table>
  </div>
</div>
    

  </div>

  </div>

</div>



    

   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> 

    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <table style="width:100%">
        <tr>
        <td width="30%"></td>
        <td width="40%" align="center" style="font-weight:bold; font-size:16px;">Workflow</td>
         <td width="30%" align="right"> <button  id="popupclose" type="button" class="close" data-dismiss="modal">&times;</button></td>
          </tr>
        </table>  
        </div>
        <div class="modal-body">
        <div class="embed-responsive embed-responsive-4by3">
  <!--  <iframe class="embed-responsive-item" src="${pageContext.request.contextPath}/Images/Features Walk Through_x264.mp4" frameborder="0" allowfullscreen></iframe>-->
         <video id="watchdemoVid" width="480" height="360" controls>
   
   </video>
        </div>
        </div>
       
      </div>
      
    </div>
  </div>
               

		
            </div>
            <!-- /page content -->

        </div>

    </div>


<script>



</script>

</body>

</html>
