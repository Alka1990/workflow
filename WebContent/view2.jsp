
<%@page import="com.vo.DisplayDecision"%>
<%@page import="com.vo.ViewVO"%>
<%@ page import="java.sql.*" %>
 <%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.text.*"%>
<%@page import="java.math.*"%> 
<%@page import="java.util.*"%>
 <%@ page import="com.workflow.connection.LoginDAO" %>
 





<html>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title> <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
         <link href="${pageContext.request.contextPath}/StyleSheet/jquery-ui.css" rel="stylesheet">
         <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script> 
         <script src="${pageContext.request.contextPath}/JavaScript/jquery.nicescroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
        
        <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
        -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/jquery.smartWizard.js"></script>
               
    <script type="text/javascript"> var contextPath ='${pageContext.request.contextPath}';</script>
      <script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
    <script  src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
      
         
    
    
   <style>
.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('${pageContext.request.contextPath}/Images/load.gif') 50% 50% no-repeat rgb(249,249,249);
}


@media only screen and (min-width: 1200px) {

#wo_date{
width:197px;}


#dispatch_date{
width:197px;}

#scanning_service{

width:197px;
}

   #A{
 padding-left:21px;

}
   #B{
 padding-left:188px;

}
#c{
 padding:5px;
}
#D{
  width:800px;
   padding-left:22px;
}
}


</style> 
 	<script>
function decisionFetch() {
	var caseid=document.getElementById("caseId").value;
	mywindow = window.open("DecisionDisplay.jsp?caseid="+caseid, "mywindow", "location=1,status=1,scrollbars=1,  width=1000,height=1000");
    mywindow.moveTo(0, 0);
}
</script>
 	
 
 <script>

 $(document).ready(function(){
	 $("#createSubmit").hide();
	 
	 $("#secondform").hide();
	 $("#thirdform").hide();
	 $("#sd").hide();
	 
	    $("#second").click(function(){
	    	 $("#createSubmit").hide();
	    	 
	        $("#firstform").hide();
	        $("#secondform").show();
	        $("#thirdform").hide();
	    });
	    $("#first").click(function(){
	    	$("#createSubmit").hide();
	    	 
	        $("#firstform").show();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	    });
	    $("#Third").click(function(){
	    	
	    	 
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").show();
	    });
	 
	 });
	 $(".gif").click(function(){
	 	$(".loader").fadeIn("slow");
	 });

	

</script>


</head>

<body class="nav-md" id="InvoiceformBody"  onkeydown="javascript:return customOnKeydown(this.id,event)">

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
                    	
                    <!-- /sidebar menu -->
					
					
					
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
 <div>
<div id="sd">hello</div>






   <% 
   
   
	String abc=(String)request.getAttribute("caseId");
	String logusername=(String)session.getAttribute("userid");
   
   List<DisplayDecision> displayDecisionList = new ArrayList<DisplayDecision>();
         con=null;
        ps=null;
        PreparedStatement ps1=null;
        PreparedStatement ps2=null;
      	rs =null;
        rs1 =null;
        ResultSet rs5=null;
        ResultSet rs6=null;
        
        try{
        	 LoginDAO loginDAO = new LoginDAO();
        	 con=LoginDAO.getConnectionDetails();
            String profilestage=(String)session.getAttribute("profile");
	ps=con.prepareStatement("select * from profile_stage_map where profile_id='"+profilestage+"'");  
	String stages="";
	    	rs5=ps.executeQuery();
	    	while(rs5.next()){
	    		
	    		stages=stages+rs5.getString("stage_code")+",";
	    		
	    		
	    	}
	    	ArrayList<String> stageslist = new ArrayList<String>();
			ps=con.prepareStatement("select * from profile_stage_map where profile_id='"+profilestage+"'");
			rs6=ps.executeQuery();
			while(rs6.next()){
				
				stageslist.add(rs6.getString("stage_code"));
				

			}
			           
    		ps=con.prepareStatement("select * from patient_details where CASE_ID=?");  
    		String caseId=request.getParameter("caseId");
    		String nextStage = (String)request.getParameter("NxtStage");
    		ps.setString(1, caseId);
    		rs = ps.executeQuery();
    		
    		ps2=con.prepareStatement("select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='Intro'");  
    		rs2 = ps2.executeQuery();
    		
    		
    		
    		ps1=con.prepareStatement("select * from payment_grid where case_id=?");
    		ps1.setString(1, caseId);
    		
    		rs1 = ps1.executeQuery();
    		String payment_grid="";
			
    		while(rs1.next()){
    			
    			
    			 payment_grid+=rs1.getString("payment_amount")+"~"+rs1.getString("payment_date")+"~"+rs1.getString("pending_amount")+"#";
    			
    			
    			
    		}
    		
			if(payment_grid.equals("")){
    			
    		}else{
        		
       		 payment_grid=payment_grid.substring(0,payment_grid.length()-1);
    		}
    		
    		 
    		 
    		 
    			ps1=con.prepareStatement("select * from reviewnumbergrid where case_id=?");
        		ps1.setString(1, caseId);
        		
        		rs1 = ps1.executeQuery();
        		String reviewnumbergrid="";
    			
        		while(rs1.next()){
        			
        			
        			reviewnumbergrid+=rs1.getString("review_number")+"~"+rs1.getString("work_grid")+"~"+rs1.getString("new_aligner_required")+"~"+rs1.getString("redefine_aligner")+"#";
        			
        			
        			
        		}
        	
if(reviewnumbergrid.equals("")){
        			
        		}else{
        			reviewnumbergrid=reviewnumbergrid.substring(0,reviewnumbergrid.length()-1);
        		}
        		
        		
        		
        		ps1=con.prepareStatement("select * from no_of_aligers_table where case_id=?");
        		ps1.setString(1, caseId);
        		
        		rs1 = ps1.executeQuery();
        		String no_of_aligers="";
    			
				String selectvalue="";
        		while(rs1.next()){
        			String upper1=rs1.getString("upper1");
        			String upper2=rs1.getString("upper2");
        			String lower1=rs1.getString("lower1");
        			String lower2=rs1.getString("lower2");
        			
        			selectvalue+=upper1+"~"+upper2+"~"+lower1+"~"+lower2+"#";
        			
        			no_of_aligers+=rs1.getString("no_of_aligners_d_u")+"~"+rs1.getString("no_of_aligners_d_l")+"~"+rs1.getString("mode_of_delievery")+"~"+rs1.getString("courier_track_no")+"#";
        			
        			
        			
        		}
    	
        		ps1=con.prepareStatement("select decision,remarks,date_time,stage,userid from Decision_History where caseid=?");
        		ps1.setString(1, caseId);
        		
        		rs1 = ps1.executeQuery();
        		
        		while(rs1.next()){
        			DisplayDecision displayDecision= new DisplayDecision();
        			displayDecision.setDateTime(rs1.getString("date_time"));
        			displayDecision.setDecision(rs1.getString("decision"));
        			displayDecision.setRemarks(rs1.getString("remarks"));
        			displayDecision.setStage(rs1.getString("stage"));
        			displayDecision.setUserName(rs1.getString("userid"));
        			displayDecisionList.add(displayDecision);
        		}
        		for(int i=0;i<displayDecisionList.size();i++){
        		
        		}
    		//System.out.println(caseId);
    		//System.out.println(request.getAttribute("profile"));
    		//System.out.println(session.getAttribute("profile"));
    	
 		
    		
    		//request.setAttribute("profile"
    				String profile=(String)session.getAttribute("profile");
        %>
       
   
  	
<div class="container">
  
  <!-- Trigger the modal with a button -->
  <div class="row">
   <!-- <div class="col-sm-3">
  		<label>
  		Patient Name : </label>
  		<span type="text" style=" border: none;background: transparent;" id="patient_name" name="patient_name"></span>
  	</div>
  	<div class="col-sm-3">
  		<label>
  		Registered Doctor : </label>
  		<span  style=" border: none;background: transparent;" id="registered_doctor" name="registered_doctor"></span>
  	</div>
  	<div class="col-sm-2">
  		<label>
  		Case Id : </label>
  		<span  style=" border: none;background: transparent;" id="case_number" name="case_number"></span>
  	</div>
  	<div class="col-sm-2">
  		<label>
  		Clinic Name : </label>
  		<span  style=" border: none;background: transparent;" id="clinic_name" name="clinic_name"></span>
  	 
  	</div>
  	<div class="col-sm-2">
  		<label>
  		Priority : </label>
  		<span  style=" border: none;background: transparent;" id="priority" name="priority"></span>
  	 
  	</div> -->
  <div class="col-sm-1" style="display:none">
  
  <button type="button" style="right:0px" class="btn btn-info btn-sm " data-toggle="modal" data-target="#myModal">Edit</button>
  	</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
<form action="changedetail" method="post">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Change Details</h4>
        </div>
      
        <div class="modal-body" style="margin-top:10px">
          <table>
          <tr><td>
          <span class="">Case ID : &nbsp;</span></td><td><input type="text" readonly="readonly" value="<%= caseId %>" id="case_id1" name="case_id1"></td><tr>
          
          <tr><td>
          <span class="">Enter Patient Name : &nbsp;</span></td><td><input type="text" id="p_name" name="p_name"></td><tr>
        <tr><td>
          <span class="">Enter Registered Doctor Name : &nbsp;</span></td><td><input type="text" id="r_doctor" name="r_doctor"></td><tr>
            <tr><td>
          <span class="">Enter Priority : &nbsp;</span></td><td>  <select class="form-control" id="priority1" name="priority1" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">1</option>
                                    <option  style="padding:7px 0px 7px 7px;">2</option>
                                    <option  style="padding:7px 0px 7px 7px;">3</option>
                                    
                                    <option  style="padding:7px 0px 7px 7px;">4</option>
                                    <option  style="padding:7px 0px 7px 7px;">5</option>
                                    <option  style="padding:7px 0px 7px 7px;">6</option>
                                    <option  style="padding:7px 0px 7px 7px;">7</option>
                                    <option  style="padding:7px 0px 7px 7px;">8</option>
                                    <option  style="padding:7px 0px 7px 7px;">9</option>
                                    <option  style="padding:7px 0px 7px 7px;">10</option>
                                  
                                   </select>
         
            </table>
            
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default" >CHANGE</button>
        </div>
      </div>
      </form>
      </div>
    </div>
  </div>
 
</div>
			







 <div class="btn-group">
    <button type="button" class="btn btn-default" id="first">First</button>
    <button type="button" class="btn btn-default" id="second">Second</button>
 <button type="button" class="btn btn-default" id="Third">Decision And History</button>
  </div>
</div>
 <form class="form-inline" method="post"  >  
 
  
  
  
  

  
  
     
      
  
  <input type="hidden" name="username" value='<%=(String)session.getAttribute("userid")%>'>
  
  
  
  
  <script>
  
 
  
  
  
  </script>
  <div class="panel panel-primary">
  				<div class="loader"></div>
    <div class="panel-heading"><strong>View Page</strong> </div>

	  			<div id ="error" style="width: 100%;display:none;color:green;" align="center"><h4 class="errorMsg"><label id="err"></label></h4></div>
 	  
	  	<div style="display: none;">
		<input type="text" id="hiddenNextInvNo" name="hiddenNextInvNo"/>
		</div>
		<div style="padding:10px 20px 10px 20px;">   
   
 
     
     <%if(rs.next()){ %>
  
   
      <br>
        	 
     <div id="firstform">
     
     
      
      <% if(stageslist.contains("initial stage"))
    		  {%>
      <div class="form-group">
      
      <button type="button"  class="btn btn-primary"  onclick="myFunction1()" type="submit">Add patient Prescription</button>
      </div>
      <% }%>
     
    <div class="form-group" id="D">
		
		 
		 		<span style="padding-left:30px; margin-top:5px;">             					

        
					
       				
       <select disabled class="form-control" id="prerequisite" name="prerequisite"  onchange="getComData()" value="<%= rs.getString("prerequisite")%>">
       <option style="padding:7px 0px 7px 7px;" value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
       <option  selected style="padding:7px 0px 7px 7px;"><%=rs.getString("prerequisite") %></option>
                                   
      
   </select></span>
			
      </div>
      <div id="c">	 </div>

	    
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D" >
                              <label>Case registration Form Number

<span style="color:red" class="required">*</span></label>
     <span style="padding-left:129px; margin-top:5px;">
       
			
     			   <input disabled class="form-control" id="case_rnumber"  name="case_number" value="<%= rs.getString("case_number")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
	 
      
  <div class="form-group" style="margin-top: 10px;">
			<button type="button" class="btn btn-primary" onclick="myFunction11()">View And Attach Document</button>
		</div>
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group a" id="A" >
                            <label>Registered Doctor</label>
<span style="color:red" class="required">*</span></label>
     <span style="padding-left:69px; margin-top:5px;">
       
			
     			   <input disabled class="form-control" id="registered_doctor"  name="registered_doctor" value="<%= rs.getString("registered_doctor")%>">
     		
        </span>
      </div>
	  
	  <div class="form-group" style="margin-top:5px;">
	  <label>CRM Name</label>
<span style="padding-left:100px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled class="form-control" id="user_id"  name="user_id" />
			
      </span></div>
	  </div> 
      
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group"id="A"  >
                              <label>Clinic Name<span style="color:red" class="required">*</span></label>
     <span style="padding-left:50px; margin-top:5px;">             					

        
					
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled class="form-control" id="clinic_name"  name="clinic_name" value="<%= rs.getString("clinic_name")%>" />
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Clinic Address</label>
<span style="padding-left:93px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled class="form-control" id="clinic_address"  name="clinic_address" value="<%= rs.getString("address")%>"/>
			
      </span></div>
	  </div> 
	 
	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>GP<span style="color:red" class="required">*</span></label>
     <span style="padding-left:101px; margin-top:5px;">             					

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input disabled class="form-control" id="gp"  name="gp" value="<%= rs.getString("gp")%>"/>
					
     
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>City</label>
<span style="padding-left:160px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled class="form-control" id="city"  name="city" value="<%= rs.getString("city")%>"/>
			
      </span></div>
	  </div>
	 
	 

	  
	  
 	


			<div style="padding:10px 0px 0px 0px;">   
               <div class="form-group" id="A">
               <label>Patient Name<span style="color:red" class="required" >*</span></label>
                 <span style="padding-left:72px; margin-top:5px;">             					
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<input disabled class="form-control" id="patient_name"  name="patient_name" value="<%= rs.getString("patient_name")%>"/>        

      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Patient Age And Other Details
</label>
<span style="padding-left:4px; margin-top:5px;">
       
		
			<input disabled class="form-control" id="patient_age"  name="patient_age" value="<%= rs.getString("patient_age")%>"/>        

			
      </span></div>
	  </div> 
		


			<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Type of Account<span style="color:red" class="required">*</span></label>
     <span style="padding-left:54px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	  <select disabled class="form-control" id="type_of_account" name="type_of_account" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option selected style="padding:7px 0px 7px 7px;"><%= rs.getString("type_of_account")%></option>
                                    <option  style="padding:7px 0px 7px 7px;">KOL</option>
                                    <option  style="padding:7px 0px 7px 7px;">Corporate</option>
                                 
                                    </select>
					
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Referred by:
</label>
<span style="padding-left:111px; margin-top:5px;">
       
			<input disabled class="form-control" id="referred_by"  name="referred_by" value="<%= rs.getString("referred_by")%>"/>
			
      </span></div>
	  </div>  
		


	   	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>channel
<span style="color:red" class="required">*</span></label>
     <span style="padding-left:55px; margin-top:5px;">             					

       
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
     			  <select disabled class="form-control" id="channel" name="channel" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option selected style="padding:7px 0px 7px 7px;"><%= rs.getString("channel")%></option>
                                    <option  style="padding:7px 0px 7px 7px;">Digital</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                  
                                    </select>
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Corporate Account
</label>
<span style="padding-left:71px; margin-top:5px;">
       
		
				
			 <select disabled class="form-control" id="corporate_account" name="corporate_account" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                              
                                    <option selected style="padding:7px 0px 7px 7px;"><%= rs.getString("corporate_account")%></option>
                                    <option  style="padding:7px 0px 7px 7px;">Digital</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                    </select>
			
      </span></div>
	  </div>  
    	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>KOL<span style="color:red" class="required">*</span></label>
     <span style="padding-left:105px; margin-top:5px;">             					

       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			     	<input disabled class="form-control" id="kol"  name="kol" value="<%= rs.getString("kol")%>"/>
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Discount
</label>
<span style="padding-left:125px; margin-top:5px;">
       
		
				
			        &nbsp;	<input disabled class="form-control" id="discount"  name="discount" value="<%= rs.getString("discount")%>"/>
			
      </span></div>
	  </div>  
    

 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>No of Aligners expected by Orthodontist
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:70px;;margin-top:5px;">             					

   <input disabled class="form-control" id="no_of_aligners"  name="no_of_aligners" value="<%= rs.getString("no_of_aligners")%>"/>
			
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Starter Kit Required<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:58;;margin-top:5px;">             					

 
   <input disabled class="form-control" id="starter_kit"  name="starter_kit" value="<%= rs.getString("starter_kit")%>"/>
					
      
</span>
			
      </div>
	  
	 
	  </div>  

	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Scanning Required<span style="color:red" class="required">*</span></label>
     <span style="padding-left:54px; margin-top:5px;">             					
   &nbsp;
   <select disabled class="form-control" id="scanning" name="scanning" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option selected style="padding:7px 0px 7px 7px;"><%= rs.getString("scanning")%></option>
                                     <option  style="padding:7px 0px 7px 7px;">No</option>
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Pickup required?</label>
<span style="padding-left:79px; margin-top:5px;">
       
		
				
			  <select disabled class="form-control" id="pickup" name="pickup" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;-- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option selected style="padding:7px 0px 7px 7px;"><%= rs.getString("pickup")%></option>
                                     <option  style="padding:7px 0px 7px 7px;">No</option>
                                    </select>
			
			
			
      </span></div>
	  </div>  
      	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Dispatch Mode:
<span style="color:red" class="required">*</span></label>
     <span style="padding-left:50px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <select disabled class="form-control" id="dispatch" name="dispatch" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  selected style="padding:7px 0px 7px 7px;"><%= rs.getString("dispatch")%></option>
                                      </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Dispatch to:</label>
<span style="padding-left:22px; margin-top:5px;">
       
		
				
			        <input type="checkbox" name="optradio">same as clinic
		
			       <input disabled class="form-control" id="dispatch_to"  name="pickup" value="<%= rs.getString("dispatch_to")%>"/>
			
      </span></div>
	  </div>  
	  
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Advance collected for Starter Kit?
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:108px;;margin-top:5px;">             					

    <input disabled class="form-control" id="advance_starter"  name="advance_starter" value="<%= rs.getString("advance_starter")%>"/>
					
      
</span>
			
      </div>
	  
	 
	  </div>  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Advance collected for Scanning Service?
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:63px;;margin-top:5px;">             					
 <input disabled class="form-control" id="advance_scanning"  name="advance_scanning" value="<%= rs.getString("advance_scanning")%>"/>
							
      
</span>
			
      </div>
	  
	 
	  </div>  
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Scanning service requested  Date Time
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:80px;;margin-top:5px;">             					
<input disabled type="datetime-local"class="form-control" id="scanning_service"  name="scanning_service" value="<%= rs.getString("scanning_service")%>"/>
				
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Dispatch requested Date Time

<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:132px;;margin-top:5px;">             					

  <input disabled type="datetime-local" class="form-control" id="dispatch_date"  name="dispatch_date" value="<%= rs.getString("dispatch_date")%>"/>

      
</span>
			
      </div>
	  
	 
	  </div>  
	
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for dispatch
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:100px;;margin-top:5px;">             					

    <input class="form-control" disabled id="person_dispatch"  name="person_dispatch" value="<%=rs.getString("person_dispatch") %>" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	
		 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for Scan
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:122px;;margin-top:5px;">             					

   <input disabled class="form-control" id="person_scan"  name="person_scan" value="<%= rs.getString("person_scan")%>"/>

    
</span>
			
      </div>
	  
	 
	  </div>  
	
	  
	   <div style="padding:10px 0px 0px 0px;display:none;">  
      <div class="form-group" id="A">
                              <label>Scanning service requested  Date Time
</label>
                                <span style=" margin-top:5px;" id="B">
                                      

        
		
	 
      
   <input disabled type="datetime-local" class="form-control" id="scanning_service_date"  name="scanning_service_date" value="<%= rs.getString("scanning_service")%>"/>

    
     </span> </div>
	 <div class="form-group" style="margin-top:10px;" >
	  <label>Contact person details for dispatch<span style="color:red" class="required">*</span></label>
                                <span style="padding-left:188px; margin-top:5px;" id="B">
           
   <input disabled class="form-control" id="contact_person"  name="contact_person" value="<%= rs.getString("person_dispatch")%>"/>
	     
      </span>  </div>
	  </div>
	  
	  
	  
	 
	  
	   <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Bill To:


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:53px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input disabled class="form-control" id="bill_to"  name="bill_to" value="<%= rs.getString("bill_to")%>"/>
	
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>GST Number

</label>
<span style="padding-left:99px; margin-top:5px;">
       
		
				
			        &nbsp;         
   <input disabled class="form-control" id="gst_number"  name="gst_number" value="<%= rs.getString("bgst_no")%>"/>
	
      </span></div>
	  </div> 
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Payment Mode



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:76px; margin-top:5px;">             					

       
				&nbsp;	
       <select disabled class="form-control" id="dispatch" name="dispatch" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  selected style="padding:7px 0px 7px 7px;"><%= rs.getString("payment_mode")%></option>
                                      </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>W.O. Number


</label>
<span style="padding-left:100px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="wo_number"  name="wo_number" disabled value="<%=rs.getString("wo_number")%>"/>
			
      </span></div>
	  </div> 
     
     
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>W.O. Date




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:100px; margin-top:5px;">             					

       
			       &nbsp;&nbsp; &nbsp;<input type="date" class="form-control" id="wo_date"  name="wo_date" disabled value="<%=rs.getString("wo_date")%>"/>
			
      
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;" >
	  <label>Priority



</label>
<span style="padding-left:140px; margin-top:5px;">
       
		
				
			      				
      <select disabled class="form-control" id="priority" name="priority" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  selected style="padding:7px 0px 7px 7px;"><%=rs.getString("priority") %></option>
                                  
                                    </select>
					
			
      </span></div>
	  </div> 
     







<%}%>




  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>DECISION
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:113px;;margin-top:5px;">             					

     <select disabled name="category" class="form-control" id="decision" name="decision" onBlur="javascript:customOnBlur(this.id, event)" >
                         <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
	         
                                     <option  selected style="padding:7px 0px 7px 7px;"><%=rs.getString("decision") %></option>
                                  
                                    </select>
					
					
      
</span>
			
      </div>
	  
	 
	  </div> 
     
     
	 
</div>



   <div id="secondform">
   
   	
   	
   	
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of Stages


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:200px; margin-top:5px;">
       
			
     			   <input   disabled class="form-control" id="no_of_stages"  name="no_of_stages" value="<%=rs.getString("no_of_stages")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
   	
   	
   	
   	                  <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Current Stage


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:226px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="current_stage"  name="current_stage" value="<%=rs.getString("current_stage")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
   	
    
       
     
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Active


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:95px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="no_of_aligners_u_a"  name="no_of_aligners_u_a" value="<%=rs.getString("no_of_aligners_u_a")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Passive



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:86px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="no_of_aligners_u_p"  name="no_of_aligners_u_p" value="<%=rs.getString("no_of_aligners_u_p")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - lower - Active



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:97px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="no_of_aligners_l_a"  name="no_of_aligners_l_a"  value="<%=rs.getString("no_of_aligners_l_a")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - lower - Passive



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:88px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="no_of_aligners_l_p"  name="no_of_aligners_l_p"  value="<%=rs.getString("no_of_aligners_l_p")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	   
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Attachment Applicable



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:170px; margin-top:5px;">
       
			
     			   <input disabled  class="form-control" id="attachment_applicable"  name="attachment_applicable"  value="<%=rs.getString("attachment_applicable")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	   
	   
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Dispatch Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:110px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input disabled  class="form-control" id="dispatch_grid"  name="dispatch_grid"    value="<%=rs.getString("dispatch_grid")%>"/>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Dispatch Date
	  

</label>
<span style="padding-left:103px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled  class="form-control" id="dispatch_date2"  name="dispatch_date2"  value="<%=rs.getString("dispatch_date2")%>"/>
			
      </span></div>
	  </div> 
	  
	  
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Data Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:82px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  disabled class="form-control" id="data_grid"  name="data_grid"  value="<%=rs.getString("data_grid")%>" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Final Amount
	  

</label>
<span style="padding-left:106px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled  class="form-control" id="final_amount"  name="final_amount"   value="<%=rs.getString("final_amount")%>"/>
			
      </span></div>
	  </div> 
	   
             
             

	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Status Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:71px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input disabled  class="form-control" id="status_grid"  name="status_grid"  value="<%=rs.getString("status_grid")%>"/>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Payment Grid
	  

</label>
<span style="padding-left:106px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled  class="form-control" id="payment_grid"  name="payment_grid" value="<%=rs.getString("payment_grid")%>"/>
			
      </span></div>
	  </div> 
	   
             
             
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Batch Number




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:51px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input disabled  class="form-control" id="batch_number"  name="batch_number" value="<%=rs.getString("batch_number")%>"/>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Work Date/Time
	  

</label>
<span style="padding-left:90px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled  class="form-control" id="work_date"  name="work_date"  value="<%=rs.getString("work_date")%>"/>
			
      </span></div>
	  </div> 
	   
	   
	   <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Next Work




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:76px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  disabled class="form-control" id="next_work"  name="next_work"  value="<%=rs.getString("next_work")%>"/>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Next Work Date/Time
	  

</label>
<span style="padding-left:60px; margin-top:5px;">
       
		
				
			        &nbsp;<input disabled class="form-control" id="next_work_date"  name="next_work_date"  value="<%=rs.getString("next_work_date")%>"/>
			
      </span></div>
	  </div> 
	   
                        <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Case For Review



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:111px; margin-top:5px;">
       
			
     			   <input disabled class="form-control" id="case_review"  name="case_review"  value="<%=rs.getString("case_review")%>">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Refinement package Required



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:28px; margin-top:5px;">
       
			
     			   <input disabled class="form-control" id="refinement_package"  name="refinement_package"  value="<%=rs.getString("refinement_package")%>">
     		
        </span>
      </div>
	  
	 
	  </div>   
	  
	  
	  
	<hr>
	 <div class="container">
    <table id="payment" class=" table order-list">
    <thead>
        <tr>
            <td>payment_amount</td>
            <td>payment date</td>
            <td>pending amount</td>
             <td>Delete</td>
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table >
    <tfoot>
        <tr>
            <td colspan="5" style="text-align: left;">
                <input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
    
           </td>
        </tr>
      
    </tfoot>
</table>
</div>
	        
	        
	  
	           
	             
	   <div class="container">
    <table id="reviewnumber" class=" table order-list">
    <thead>
        <tr>
            <td>Review Number</td>
            <td>Work Grid</td>
            <td>New aligner required?</td>
            <td>New aligner required?</td>
            <td>Delete</td>
            
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table>
    <tfoot>
        <tr>
            <td colspan="5" style="text-align: left;">
                <input type="button" class="btn btn-lg btn-block " id="addrow1" value="Add Row" />
       
           </td>
        </tr>
      
    </tfoot>
</table>
</div>
	           
	      
	      
	      
	      
	      
	                   
	   <div class="container">
    <table id="table3" class=" table order-list">
    <thead>
        <tr>
            <td>Number of Aligners - Upper</td>
            <td>Number of Aligners - Lower
</td>
            <td>Mode of Delivery
</td>
              <td>Courier Track Number
</td>
<td>Delete</td>
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table>
    <tfoot>
        <tr>
            <td colspan="5" style="text-align: left;">
                <input type="button" class="btn btn-lg btn-block " id="addrow2" value="Add Row" />
            
           </td>
        </tr>
      
    </tfoot>
</table>
</div>
	      
	      
	        
	        
	          
	        
	          

 </div></div>
 
 
 
 
 
  <div id="thirdform">
  
  <form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >

 
 
  <% 
        
        List<DisplayDecision> list = displayDecisionList;
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
            
           <TH class="sorting"> STAGE</TH>
              <TH class="sorting"> USER</TH>
                    <TH class="sorting">DECISION</TH>
                        <TH class="sorting">REMARKS</TH>
                        <TH class="sorting">DATE AND TIME</TH>
                    
                   </TR>  
    
  
    
    
   
    </thead>
       <%  
for(DisplayDecision decisionVO:list){ %>
    <tbody>
    
     <TR  class="even">
           <TD> <%= decisionVO.getStage() %></td>
                <TD> <%= decisionVO.getUserName() %></td>
               <% if(decisionVO.getDecision().equals("Dispatched")){%>
																		<TD>Sent</TD>
																		<% }else{%>
																			<TD><%=decisionVO.getDecision()%></td>
																		<%} %>
                <TD> <%= decisionVO.getRemarks() %></TD>
                <TD> <%= decisionVO.getDateTime() %></TD>
                
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
  
  
     <div class="table-responsive">
        <table class="table table-no-bordered">
       <tr>
      	
         <td width="50%">
         <input class="btn btn-success" type="hidden" id="BtnSubmit" name="BtnSubmit" value='submitButton'  disabled /></td>   
 	   <td  width="30%">
			</td>
			
			  <td width="20%">
         <input class="btn btn-success"  onclick="modifysubmit()" id="createSubmit" name="createSubmit" value='submitButton'   /></td>   
			
			 
			      
       </tr>       
       
        </table>
</div>
  
  
  
   </div>
		</form>
  </div>
  
  
  </div>
  






</form>


  </div></div> 

   


    <div id="customModal"></div>
       <!-- Modal -->

   <div class="modal fade" id="myModal" style="z-index:10" role="dialog"> 
    <div class="modal-dialog modal-md">
     <!--  Modal content -->
      <div class="modal-content">
      		<div class="modal-header">
			<button  id="popupclose" type="button"	class="close" data-dismiss="modal">&times;</button>
				<button class="close modalMinimize" id="maximize"> <i class='fa fa-compress'></i> </button>
			</div>
			<div class="modal-body">
			<iframe  width="480" height="360" id="DocView" class="embed-responsive-item" ></iframe>
				<div class="embed-responsive embed-responsive-4by3">
				</div>
			</div>
			<div class="modal-footer">
 	 			 <button type='button' class='btn btn-primary custombutton close' data-dismiss="modal">Close</button>
     		</div>      
     </div>
      
    </div>
  </div>
   
        <script src="${pageContext.request.contextPath}/JavaScript/jquery-ui.js"></script>
       
   </div></div>
   
   
   
   
   
   <script>
var totalRowAdded='';
function getData(cell){
	
	var table = document.getElementById('payment');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded);
	for (var r = 1;r < totalRowAdded; r++) {
    	if(document.getElementById('paymentr'+r+'c0')!=null){   		
    		for (var c = 0; c < 3; c++) {
            	rowContent=rowContent+'~'+document.getElementById("paymentr"+r+"c"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
  //  alert(tableContent);
   return tableContent;
}






var totalRowAdded1='';
function getData1(cell){
	
	var table1 = document.getElementById('reviewnumber');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded1);
	for (var r = 1;r < totalRowAdded1; r++) {
    	if(document.getElementById('reviewnumberr'+r+'c0')!=null){   		
    		for (var c = 0; c < 4; c++) {
            	rowContent=rowContent+'~'+document.getElementById("reviewnumberr"+r+"c"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
 //   alert(tableContent);
   return tableContent;
}





var totalRowAdded2='';


function getData2(cell){
	
	var table1 = document.getElementById('table3');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded2);
	for (var r = 1;r < totalRowAdded2; r++) {
    	if(document.getElementById('table3r'+r+'c0')!=null){   		
    		for (var c = 0; c < 4; c++) {
            	rowContent=rowContent+'~'+document.getElementById("table3r"+r+"c"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
  //  alert(tableContent);
   return tableContent;
}



	

$(document).ready(function () {
	
	

	
	
	
	var stageslist='<%=stages%>';
	
	
	
	//alert(stageslist);
	
	 $.ajax({
			

		    type : 'POST',
			data : {stage:stageslist},
			url : 'geteditables1',
			success : function(responseText) {
				var x=responseText.slice(1);
				//alert(x);
				var array = x.split(","); 
				//alert(array);
				
				for (index = 0; index < array.length; index++) { 
					console.log(array[index]);
					
					document.getElementById(array[index]).disabled = false;
				
					
				}
			
							
			}

			
		  
			 
		});
	 
	 
	 
		
	  $("input").keydown(function(){
	 

			
			var caseidcheck='<%=abc%>';
			var logusernamecheck='<%=logusername%>';	
					
					
					
					$.ajax({
						  	    type : 'POST',
				  		data : {a:caseidcheck,b:logusernamecheck},
				  		url : 'hehe',
				  		success : function(responseText) {
								
				  			
							var x=responseText;
							var n = x.localeCompare("allowed");
						
							if(n==0){
							}
							
							else{
								
								alert(x);
								window.location = "Dashboard.jsp";
							}
				  		}
				  
				 	});
					
		  
		  
		  
		  
	  });
	 
	
	
	var crmname='<%=rs.getString("crm_name")%>';
	document.getElementById("user_id").value=crmname;
	
	var profile="<%=profile%>";
	console.log("njfnnfiunfljsfhseihfhfngfjhbfkjsef  "+profile);
	if(profile.localeCompare("admin")===0){
		
		$("#editbutton").show();
		document.getElementById("user_id").disabled=false;
		
		
	}


	var rd='<%=rs.getString("registered_doctor")%>';
	
	$("#registered_doctor").html(rd);
	document.getElementById("registered_doctor").value=rd;
	document.getElementById("r_doctor").value=rd;
	
	
	var case_number1 = '<%=caseId%>';
   	$("#case_number").html(case_number1);
	
   	var clinic_name1 = '<%=rs.getString("clinic_name")%>';
	$("#clinic_name").html(clinic_name1);
	document.getElementById("clinic_name").value=clinic_name1;
	
	var patient_name1 = '<%=rs.getString("patient_name")%>';
	$("#patient_name").html(patient_name1);
	document.getElementById("p_name").value=patient_name1;
	
   	
	var priority1 ='<%=rs.getString("priority")%>';
 	$("#priority").html(priority1);
 	document.getElementById("priority1").value=priority1;
 	
   	
   	
   	

	
	var table = document.getElementById('payment');
//	alert(table.rows.length);
	var content='<%=payment_grid%>';
	if(content==''){
		totalRowAdded=1;
	}else{
		var sContent=content.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="name" id="paymentr'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="paymentr'+roid+'c1"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="paymentr'+roid+'c2"/></td>';
			 cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
			
			newRow.append(cols);
			 $("#payment").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("paymentr"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	 
	var table = document.getElementById('payment');
	var rowct = table.rows.length;
	//alert(rowct);

    $("#addrow").on("click", function () {
    	
    	totalRowAdded++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input type="text" class="form-control" name="name' + counter + '" id="paymentr'+rowct+'c'+cellct+'" /></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="mail' + counter + '" id="paymentr'+rowct+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="paymentr'+rowct+'c'+cellct+'"/></td>';
        cellct++;
        
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        newRow.append(cols);
        $("#payment").append(newRow);
        counter++;
        rowct++;
        cellct=0;
    });



    $("#payment").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });





    var table1 = document.getElementById('reviewnumber');
//	alert(table1.rows.length);
	var content1='<%=reviewnumbergrid%>';
	if(content1==''){
		totalRowAdded1=1;
	}else{
		var sContent=content1.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded1=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="name" id="reviewnumberr'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="reviewnumberr'+roid+'c1"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="reviewnumberr'+roid+'c2"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="reviewnumberr'+roid+'c3"/></td>';
				
			 cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
			 cols += '<td><button type="button"  id="reviewnumberr'+roid+'file" onclick="myFunction111(this.id)">View And Attach</button></td>';
				
			newRow.append(cols);
			 $("#reviewnumber").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("reviewnumberr"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	
	
	
	
	


	
	
	
	
	
	
	 
	var table1 = document.getElementById('reviewnumber');
	var rowct1 = table1.rows.length;
//	alert(rowct1);



  
        
  
        
        
       
    // Used to toggle the menu on small screens when clicking on the menu button
    function myFunction() {
        var x = document.getElementById("sidebar");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else { 
            x.className = x.className.replace(" w3-show", "");
        }
    }
    
    
    
 
    
    
    
    
    
    $("#addrow1").on("click", function () {
    	
    	totalRowAdded1++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input type="text" class="form-control" name="name' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'" /></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="mail' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></td>';
        cellct++;
        
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        cellct++;
        cols += '<td><button type="button"  id="reviewnumberr'+rowct1+'file" onclick="myFunction111(this.id)">Upload</button></td>';
    
        
        newRow.append(cols);
        $("#reviewnumber").append(newRow);
        counter++;
        rowct1++;
        cellct=0;
    });
    
    
    
    
    $("#reviewnumber").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
    
    
    
    
    
    
    


    var table3 = document.getElementById('table3');
//	alert(table3.rows.length);
	//var content2='aa~bb~cc#zz~xx~CC';

	var content2='<%=no_of_aligers%>';
	var selectvalues='<%=selectvalue%>';
	
	if(content2==''){
		totalRowAdded2=1;
	}else{
		var sContent=content2.split('#');
		var ssvalue=selectvalues.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded2=sContent.length+1;
		console.log(sContent.length);
		for (i = 0; i < sContent.length-1; i++) { 
			CellContent=sContent[i].split('~');
			CellContent1=ssvalue[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			var roid=i+1;
			cols += '<td><input style="width:30%;" type="text" class="form-control" name="name" id="table3r'+roid+'c0" /><select id="table3r'+roid+'select1" class="form-control"><option>1</option><option>2</option><option>3</option></option><option>4</option></option><option>5</option></option><option>6</option></option><option>7</option></option><option>8</option></option><option>9</option></option><option>10</option></option><option>11</option></option><option>12</option></option><option>13</option></option><option>14</option></option><option>15</option></option><option>16</option></option><option>17</option></option><option>18</option></option><option>19</option></option><option>20</option></option><option>21</option></option><option>22</option></option><option>23</option></option><option>24</option></option><option>25</option></option><option>26</option></option><option>27</option></option><option>28</option></option><option>29</option></option><option>30</option></option><option>31</option></option><option>32</option></option><option>33</option></option><option>34</option></option><option>35</option></option><option>36</option></option><option>37</option></option><option>38</option></option><option>39</option></option><option>40</option></option><option>41</option></option><option>42</option></option><option>43</option></option><option>44</option></option><option>45</option></select><select id="table3r'+roid+'select2" class="form-control"><option>1</option><option>2</option><option>3</option></option><option>4</option></option><option>5</option></option><option>6</option></option><option>7</option></option><option>8</option></option><option>9</option></option><option>10</option></option><option>11</option></option><option>12</option></option><option>13</option></option><option>14</option></option><option>15</option></option><option>16</option></option><option>17</option></option><option>18</option></option><option>19</option></option><option>20</option></option><option>21</option></option><option>22</option></option><option>23</option></option><option>24</option></option><option>25</option></option><option>26</option></option><option>27</option></option><option>28</option></option><option>29</option></option><option>30</option></option><option>31</option></option><option>32</option></option><option>33</option></option><option>34</option></option><option>35</option></option><option>36</option></option><option>37</option></option><option>38</option></option><option>39</option></option><option>40</option></option><option>41</option></option><option>42</option></option><option>43</option></option><option>44</option></option><option>45</option></select></td>';
			cols += '<td><input  style="width:30%;" type="text" class="form-control" name="mail" id="table3r'+roid+'c1"/><select id="table3r'+roid+'select3" class="form-control"><option>1</option><option>2</option><option>3</option></option><option>4</option></option><option>5</option></option><option>6</option></option><option>7</option></option><option>8</option></option><option>9</option></option><option>10</option></option><option>11</option></option><option>12</option></option><option>13</option></option><option>14</option></option><option>15</option></option><option>16</option></option><option>17</option></option><option>18</option></option><option>19</option></option><option>20</option></option><option>21</option></option><option>22</option></option><option>23</option></option><option>24</option></option><option>25</option></option><option>26</option></option><option>27</option></option><option>28</option></option><option>29</option></option><option>30</option></option><option>31</option></option><option>32</option></option><option>33</option></option><option>34</option></option><option>35</option></option><option>36</option></option><option>37</option></option><option>38</option></option><option>39</option></option><option>40</option></option><option>41</option></option><option>42</option></option><option>43</option></option><option>44</option></option><option>45</option></select><select id="table3r'+roid+'select4" class="form-control"><option>1</option><option>2</option><option>3</option></option><option>4</option></option><option>5</option></option><option>6</option></option><option>7</option></option><option>8</option></option><option>9</option></option><option>10</option></option><option>11</option></option><option>12</option></option><option>13</option></option><option>14</option></option><option>15</option></option><option>16</option></option><option>17</option></option><option>18</option></option><option>19</option></option><option>20</option></option><option>21</option></option><option>22</option></option><option>23</option></option><option>24</option></option><option>25</option></option><option>26</option></option><option>27</option></option><option>28</option></option><option>29</option></option><option>30</option></option><option>31</option></option><option>32</option></option><option>33</option></option><option>34</option></option><option>35</option></option><option>36</option></option><option>37</option></option><option>38</option></option><option>39</option></option><option>40</option></option><option>41</option></option><option>42</option></option><option>43</option></option><option>44</option></option><option>45</option></select></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="table3r'+roid+'c2"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="table3r'+roid+'c3"/></td>';
				
			 cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
			
			newRow.append(cols);
			 $("#table3").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("table3r"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
			 for (j = 1; j <= CellContent1.length; j++) { 
					
					document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j-1];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	
	
	
	
	


	
	
	
	
	
	
	 
	var table3 = document.getElementById('table3');
	var rowct3 = table3.rows.length;
	//alert(rowct3);



    
    
    
    
    
    
    
    
    $("#addrow2").on("click", function () {
    	
    	totalRowAdded2++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input type="text" class="form-control" name="name' + counter + '" id="table3r'+rowct3+'c'+cellct+'" /></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="mail' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/></td>';
        cellct++;
        
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        newRow.append(cols);
        $("#table3").append(newRow);
        counter++;
        rowct3++;
        cellct=0;
    });
    
    
    
    
    $("#table3").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
    
        
	
	
   		
    	
    
    
    
    
    
    
  
    	
    	
});
    
    
    
    
    
    function modifysubmit(){
    	
  
   	 var table3Content=getData2(4); 	
     var caseId='<%=caseId%>';
    // alert(caseId);
   	 
   	 var tableContent=getData(3);
   	 var reviewnumber=getData1(4);
	var registered_doctor = $('#registered_doctor').val();
   	var prerequisite = $('#prerequisite').val();
   	var case_number = $('#case_rnumber').val();
   	var payment_grid_table = $('#tableContent').val();
   	var user_id = $('#user_id').val();
   	var clinic_name = $('#clinic_name').val();
   	var clinic_address = $('#clinic_address').val();

   	var gp = $('#gp').val();
   	var city = $('#city').val();
   	var patient_name = $('#patient_name').val();

   	var patient_age = $('#patient_age').val();
   	var referred_by = $('#referred_by').val();
   	var type_of_account = $('#type_of_account').val();
   	var channel = $('#channel').val();
   	var corporate_account = $('#corporate_account').val();
   	var kol = $('#kol').val();
   	var discount = $('#discount').val();
   	var starter_kit = $('#starter_kit').val();
   	var no_of_aligners = $('#no_of_aligners').val();
   	var scanning = $('#scanning').val();
   	var pickup = $('#pickup').val();
   	var dispatch = $('#dispatch').val();
   	var dispatch_to = $('#dispatch_to').val();
   	var advance_starter = $('#advance_starter').val();
   	var advance_scanning = $('#advance_scanning').val();
   	var scanning_service = $('#scanning_service').val();
   	var dispatch_date = $('#dispatch_date').val();
   	var person_dispatch = $('#person_dispatch').val();
   	var person_scan = $('#person_scan').val();
   	var bill_to = $('#bill_to').val();
   	var gst_number = $('#gst_number').val();
   	var payment_mode = $('#payment_mode').val();
   	var wo_number = $('#wo_number').val();
   	var priority = $('#priority').val();
   	var wo_date = $('#wo_date').val();

   	var decision = $('#decision').val();
   	var no_of_stages = $('#no_of_stages').val();
   	var current_stage = $('#current_stage').val();
   	var no_of_aligners_u_p = $('#no_of_aligners_u_p').val();
   	var no_of_aligners_u_a = $('#no_of_aligners_u_a').val();
   	var no_of_aligners_l_a = $('#no_of_aligners_l_a').val();

   	var no_of_aligners_l_p = $('#no_of_aligners_l_p').val();
   	var attachment_applicable = $('#attachment_applicable').val();
   	var dispatch_grid = $('#dispatch_grid').val();
   	var dispatch_date2 = $('#dispatch_date2').val();
   	var data_grid = $('#data_grid').val();
   	var final_amount = $('#final_amount').val();
   	var status_grid = $('#status_grid').val();
   	var payment_grid = $('#payment_grid').val();
   	var batch_number = $('#batch_number').val();
   	var work_date = $('#work_date').val();
   	var next_work = $('#next_work').val();
   	var next_work_date = $('#next_work_date').val();
   	var refinement_package = $('#refinement_package').val();
   	var case_review = $('#case_review').val();
   	var remarks=$('#remarks').val();

  
   		
   		
   		
   		$.ajax({
   			

   		    type : 'POST',
   			data : {caseId:caseId,table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
   			url : 'modifysubmit',
   			success : function(responseText) {
   				
   				var x=responseText;
   				alert(x);
   				
   				
   									
   			location.reload();	
   			}  			
   			
   			
   			

   		  
   			 
   		});
   	
    	
    }
    
    
    
    
    function myFunction1(){

    	
    	
        var mapForm = document.createElement("form");
        mapForm.target = "Map";
        mapForm.method = "POST"; // or "post" if appropriate
        mapForm.action = "prescriptionpopup.jsp";
     
        var mapInput = document.createElement("input");
        mapInput.type = "hidden";
        mapInput.name = "case_id";
        mapInput.value ='<%=caseId%>'
        mapForm.appendChild(mapInput);
        document.body.appendChild(mapForm);
    	
    	map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

    	
    	if (map) {
    	    mapForm.submit();
    	} else {
    	    alert('You must allow popups for this to work.');
    	}		

    	 


    		
    }
    
    
    

    	function myFunction11(){

    		if(document.getElementById("case_rnumber").value!="")
    {		
    	    var mapForm = document.createElement("form");
    	    mapForm.target = "Map";
    	    mapForm.method = "POST"; // or "post" if appropriate
    	    mapForm.action = "${pageContext.request.contextPath}/DocUpload.jsp";

    	    var mapInput = document.createElement("input");
    	    mapInput.type = "hidden";
    	    mapInput.name = "folderID";
    	    mapInput.value = document.getElementById("case_rnumber").value;
    	   // alert("this is casenumber  "+document.getElementById("case_rnumber").value);
    	    mapForm.appendChild(mapInput);
    	    document.body.appendChild(mapForm);
    		
    		map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

    		if (map) {
    		    mapForm.submit();
    		} else {
    		    alert('You must allow popups for this to work.');
    		}		


    			
    	}
    	
    	else{
    		
    		
    		alert("Please Enter Case Id first");
    	}

    	}

    	
    	

    			function myFunction111(x){

    					if(document.getElementById("case_rnumber").value!="")
    			{		
    						
    					var data=document.getElementById("case_rnumber").value+","+x;	
    						alert(data);
    				    var mapForm = document.createElement("form");
    				    mapForm.target = "Map";
    				    mapForm.method = "POST"; // or "post" if appropriate
    				    mapForm.action = "${pageContext.request.contextPath}/DocUpload.jsp";
    				    var mapInput = document.createElement("input");
    				    mapInput.type = "hidden";
    				    mapInput.name = "folderID";
    				    mapInput.value =data;
    				   // alert("this is casenumber  "+document.getElementById("case_rnumber").value);
    				    mapForm.appendChild(mapInput);
    				  
    				    document.body.appendChild(mapForm);
    					
    					map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

    					if (map) {
    					    mapForm.submit();
    					} else {
    					    alert('You must allow popups for this to work.');
    					}		


    						
    				}
    				
    				else{
    					
    					
    					alert("Please Enter Case Id first");
    				}

    				}
     
    	
    	
  
    </script>

        
   
         
   
   
   
   
</body>

</html>
<%
        }catch (Exception e) {
			e.printStackTrace();
		}
finally {
			
			
			 if (rs != null) {
		            // closes the database connection
		            try {
		            	rs.close();
		            	rs=null;
		            } catch (SQLException ex) {
		                          ex.printStackTrace();
		            }
			 }
		            if (ps != null) {
			            // closes the database connection
			            try {
			            	ps.close();
			            	ps=null;
			            } catch (SQLException ex) {
			                          ex.printStackTrace();
			            }
		            }
		           
			
	       if (con != null) {
	           // closes the database connection
	           try {
	               con.close();
	               con=null;
	           } catch (SQLException ex) {
	                         ex.printStackTrace();
	           }
	             
	       }           
	       }
        
        %>
        
        