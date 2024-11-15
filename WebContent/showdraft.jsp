  
        
        <%@page import="comm.CaseLock"%>
<%@page import="com.vo.DisplayDecision"%>
       
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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Workflow</title>
    <!-- Bootstrap core CSS -->
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
	    	 $("#createSubmit").show();
	    	 
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
 <div >
<div id="sd">hello</div>
 <div class="btn-group">
    <button type="button" class="btn btn-default" id="first">First</button>
    <button type="button" class="btn btn-default" id="second">Second</button>
  <button type="button" class="btn btn-default" id="Third">Decision And History</button>
  </div>
</div>
 <form style="margin-top:0px" class="form-inline" action="" method="post"  id="form1">  
 
  
  
  
  
  
        <% 
       
        
        String showdecision=(String)request.getAttribute("decisionshow");
        
        List<DisplayDecision> displayDecisionList = new ArrayList<DisplayDecision>();
     con=null;
     ps=null;
        PreparedStatement ps1=null;
        PreparedStatement ps2=null;
        PreparedStatement ps3=null;
        
         rs =null;
        rs1 =null;
         rs2 =null;
        ResultSet rs3 =null;
        
        String caseLock="Y";
        try{
   		   LoginDAO loginDAO = new LoginDAO();
     	 con=LoginDAO.getConnectionDetails();

       // Class.forName("com.mysql.jdbc.Driver");    
    	//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@192.168.55.243:1521:orcl","uw_app","uw_app");  
    	//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/workflow","root","admin");
    		//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/workflow", "root", "admin");
	//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/render_workflow", "render_digiplan", "Digiplan123#");//mylocal

    	//Connection con = LoginDAO.getConnectionDetails();
		// 
		
           
    		ps=con.prepareStatement("select * from patient_details where CASE_ID=?");  
    		String caseId=request.getParameter("caseId");
   		 
   		ps.setString(1, caseId);
    		rs = ps.executeQuery();
    		
    		ps2=con.prepareStatement("select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='Intro'");  
    		rs2 = ps2.executeQuery();
    		
    		
    		
    		ps1=con.prepareStatement("select * from payment_grid where case_id=?");
    		ps1.setString(1, caseId);
    		
    		rs1 = ps1.executeQuery();
    		String payment_grid="";
			
    		String val1="";
    		String val2="";
    		String val3="";
    		String val4="";
    		while(rs1.next()){
    			
    			val1=rs1.getString("payment_amount");
    			val2=rs1.getString("payment_date");
    			val3=rs1.getString("pending_amount");
    			if(val1.equals("null") ||val1.equals(null)){
    				val1="";
    			}
    			if(val2.equals("null") ||val2.equals(null)){
    				val2="";
    			}
    			if(val3.equals("null") ||val3.equals(null)){
    				val3="";
    			}
    			
    			 payment_grid+=val1+"~"+val2+"~"+val3+"#";
    			
    			
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
        			
        			val1=rs1.getString("review_number");
        			val2=rs1.getString("work_grid");
        			val3=rs1.getString("new_aligner_required");
        			val4=rs1.getString("redefine_aligner");
        			if(val1.equals("null") ||val1.equals(null)){
        				val1="";
        			}
        			if(val2.equals("null") ||val2.equals(null)){
        				val2="";
        			}
        			if(val3.equals("null") ||val3.equals(null)){
        				val3="";
        			}
        			if(val4.equals("null") ||val4.equals(null)){
        				val4="";
        			}
        			
        			reviewnumbergrid+=val1+"~"+val2+"~"+val3+"~"+val4+"#";
        			
        			
        			
        		}
        		if(reviewnumbergrid.equals("")){
        			
        		}else{
        			reviewnumbergrid=reviewnumbergrid.substring(0,reviewnumbergrid.length()-1);
        		}
        		
        		
        		
        		
        		
        		ps1=con.prepareStatement("select * from no_of_aligers_table where case_id=?");
        		ps1.setString(1, caseId);
        		
        		rs1 = ps1.executeQuery();
        		String no_of_aligers="";
    			
        		
        		while(rs1.next()){
        			
        			val1=rs1.getString("no_of_aligners_d_u");
        			val2=rs1.getString("no_of_aligners_d_l");
        			val3=rs1.getString("mode_of_delievery");
        			val4=rs1.getString("courier_track_no");
        			if(val1.equals("null") ||val1.equals(null)){
        				val1="";
        			}
        			if(val2.equals("null") ||val2.equals(null)){
        				val2="";
        			}
        			if(val3.equals("null") ||val3.equals(null)){
        				val3="";
        			}
        			if(val4.equals("null") ||val4.equals(null)){
        				val4="";
        			}
        			no_of_aligers+=val1+"~"+val2+"~"+val3+"~"+val4+"#";
        			
        			
        			
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
        		
    		//System.out.println(caseId);
    		//System.out.println(request.getAttribute("profile"));
    		//System.out.println(session.getAttribute("profile"));
    		
    		//request.setAttribute("profile"
    				
    				
    				String abc=(String)request.getAttribute("abc");
    				String logusername=(String)request.getAttribute("def");
    				
    				
    				
    				
    				ps2=con.prepareStatement("select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='Intro'");  
    	    		rs2 = ps2.executeQuery();
    	    		
    				
    				
    				
        %>
       
   
  
  
  
  
  
          <% while(rs.next()){%>
        
  <input type="hidden" name="username1" value='<%=(String)session.getAttribute("userid")%>'>
<input type="hidden" name="caseLockVal" id="caseLockVal" value='<%=caseLock%>'>

  <div class="panel panel-primary">
  				<div class="loader"></div>
    <div class="panel-heading"><strong>Pending Form</strong> </div>

	  			<div id ="error" style="width: 100%;display:none;color:green;" align="center"><h4 class="errorMsg"><label id="err"></label></h4></div>
 	  
	  	<div style="display: none;">
		<input type="text" id="hiddenNextInvNo" name="hiddenNextInvNo"/>
		</div>
		<div style="padding:10px 20px 10px 20px;">   
   
 
     
     
  
   
      <br>
     <div id="firstform">
    <div class="form-group" id="D">
		
		 <label>I have checked and filled the pre-requisite form.
				<span class="required" style="color:red">*</span></label> 
		 		<span style="padding-left:30px; margin-top:5px;">             					

        
					
       				
       <select class="form-control" id="prerequisite" name="prerequisite"  onchange="fun()" >
       <option style="padding:7px 0px 7px 7px;" value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
       <option  style="padding:7px 0px 7px 7px;">yes</option>
                                    <option  style="padding:7px 0px 7px 7px;">no</option>

      
   </select></span>
			
      </div>
      <div id="c">	 </div>

	    
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Case registration Form Number

<span style="color:red" class="required">*</span></label>
     <span style="padding-left:129px; margin-top:5px;">
       
			
     			   <input  class="form-control" id="case_number"  name="case_number">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
	 
      

	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group a" id="A">
                              <label>Registered Doctor
<span style="color:red" class="required">*</span></label>
     <span style="padding-left:69px; margin-top:5px;">
       
			
     			   <input  class="form-control" id="registered_doctor"  name="registered_doctor">
     		
        </span>
      </div>
	  
	  <div class="form-group" style="margin-top:5px;">
	  <label>User ID(CRM)</label>
<span style="padding-left:100px; margin-top:5px;">
       
		
				
			        &nbsp;<input  class="form-control" id="user_id"  name="user_id" />
			
      </span></div>
	  </div> 
      
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group"id="A" >
                              <label>Clinic Name<span style="color:red" class="required">*</span></label>
     <span style="padding-left:50px; margin-top:5px;">             					

        
					
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input  class="form-control" id="clinic_name"  name="clinic_name" />
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Clinic Address</label>
<span style="padding-left:93px; margin-top:5px;">
       
		
				
			        &nbsp;<input  class="form-control" id="clinic_address"  name="clinic_address"/>
			
      </span></div>
	  </div> 
	 
	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>GP<span style="color:red" class="required">*</span></label>
     <span style="padding-left:101px; margin-top:5px;">             					

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input  class="form-control" id="gp"  name="gp" />
					
     
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>City</label>
<span style="padding-left:160px; margin-top:5px;">
       
		
				
			        &nbsp;<input  class="form-control" id="city"  name="city" value="<%= rs.getString("city")%>"  onclick="cleanClinic()"/>
			
      </span></div>
	  </div>
	 
	 

	  
	  
 	


			<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Patient Name<span style="color:red" class="required">*</span></label>
     <span style="padding-left:72px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			
				 <select class="form-control" id="patient_name" name="patient_name" onBlur="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                    <option  style="padding:7px 0px 7px 7px;">KOL</option>
                                    <option  style="padding:7px 0px 7px 7px;">Corporate</option>
                                 
                                    </select>
					
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Patient Age And Other Details
</label>
<span style="padding-left:4px; margin-top:5px;">
       
		
			<input  class="form-control" id="patient_age"  name="patient_age"/>        

			
      </span></div>
	  </div> 
		


			<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Type of Account<span style="color:red" class="required">*</span></label>
     <span style="padding-left:54px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     	 <select class="form-control" id="type_of_account" name="type_of_account" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                    <option  style="padding:7px 0px 7px 7px;">KOL</option>
                                    <option  style="padding:7px 0px 7px 7px;">Corporate</option>
                                 
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Referred by:
</label>
<span style="padding-left:111px; margin-top:5px;">
       
			<input  class="form-control" id="referred_by"  name="referred_by"/>
			
      </span></div>
	  </div>  
		


	   	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>channel
<span style="color:red" class="required">*</span></label>
     <span style="padding-left:55px; margin-top:5px;">             					

       
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
     			 <select class="form-control" id="channel" name="channel" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Partner</option>
                                    <option  style="padding:7px 0px 7px 7px;">Digital</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                  
                                    </select>
					
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Corporate Account
</label>
<span style="padding-left:71px; margin-top:5px;">
       
		
				
		
			      <select class="form-control" id="corporate_account" name="corporate_account" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                              
                                    <option  style="padding:7px 0px 7px 7px;">Partner</option>
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
			     	<input  class="form-control" id="kol"  name="kol"/>
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Discount
</label>
<span style="padding-left:125px; margin-top:5px;">
       
		
				
			        &nbsp;	<input  class="form-control" id="discount"  name="discount"/>
			
      </span></div>
	  </div>  
    

 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>No of Aligners expected by Orthodontist
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:70px;;margin-top:5px;">             					

   <input  class="form-control" id="no_of_aligners"  name="no_of_aligners"/>
			
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Starter Kit Required<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:58;;margin-top:5px;">             					

 
   <input  class="form-control" id="starter_kit"  name="starter_kit"/>
					
      
</span>
			
      </div>
	  
	 
	  </div>  

	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Scanning Required<span style="color:red" class="required">*</span></label>
     <span style="padding-left:54px; margin-top:5px;">             					
   &nbsp;
    <select class="form-control" id="scanning" name="scanning" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Yes</option>
                                     <option  style="padding:7px 0px 7px 7px;">No</option>
                                    </select>
					
      		
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Pickup required?</label>
<span style="padding-left:79px; margin-top:5px;">
       
		
				
			
			       <select class="form-control" id="pickup" name="pickup" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;-- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Yes</option>
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
      <select class="form-control" id="dispatch" name="dispatch" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Courier</option>
                                     <option  style="padding:7px 0px 7px 7px;">Collect from Office</option>
                                     <option  style="padding:7px 0px 7px 7px;">In-person delivery</option>
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Dispatch to:</label>
<span style="padding-left:22px; margin-top:5px;">
       
		
				
			        <input type="checkbox" name="optradio">same as clinic
		
			       <input  class="form-control" id="dispatch_to"  name="dispatch_to"/>
			
      </span></div>
	  </div>  
	  
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Advance collected for Starter Kit?
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:108px;;margin-top:5px;">             					

    <input  class="form-control" id="advance_starter"  name="advance_starter" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Advance collected for Scanning Service?
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:63px;;margin-top:5px;">             					
 <input  class="form-control" id="advance_scanning"  name="advance_scanning"/>
							
      
</span>
			
      </div>
	  
	 
	  </div>  
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Scanning service requested  Date Time
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:80px;;margin-top:5px;">             					
<input type="datetime-local" class="form-control" id="scanning_service"  name="scanning_service"/>
				
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Dispatch requested Date Time

<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:132px;;margin-top:5px;">             					

  <input  type="datetime-local" class="form-control" id="dispatch_date"  name="dispatch_date" />

      
</span>
			
      </div>
	  
	 
	  </div>  
	
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for dispatch
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:100px;;margin-top:5px;">             					

    <input class="form-control"  id="person_dispatch"  name="person_dispatch"/>
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	
		 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for Scan
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:122px;;margin-top:5px;">             					

   <input  class="form-control" id="person_scan"  name="person_scan"/>

    
</span>
			
      </div>
	  
	 
	  </div>  
	
	  
	   <div style="padding:10px 0px 0px 0px;display:none;">  
      <div class="form-group" id="A">
                              <label>Scanning service requested  Date Time
</label>
                                <span style=" margin-top:5px;" id="B">
                                      

        
		
	 
      
   <input disabled class="form-control" id="scanning_service_date"  name="scanning_service_date" />

    
     </span> </div>
	 <div class="form-group" style="margin-top:10px;" >
	  <label>Contact person details for dispatch<span style="color:red" class="required">*</span></label>
                                <span style="padding-left:188px; margin-top:5px;" id="B">
           
   <input  class="form-control" id="contact_person"  name="contact_person"/>
	     
      </span>  </div>
	  </div>
	  
	  
	  
	 
	  
	   <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Bill To:


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:53px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input  class="form-control" id="bill_to"  name="bill_to" />
	
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>GST Number

</label>
<span style="padding-left:99px; margin-top:5px;">
       
		
				
			        &nbsp;         
   <input  class="form-control" id="gst_number"  name="gst_number"/>
	
      </span></div>
	  </div> 
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Payment Mode



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:76px; margin-top:5px;">             					

       
				&nbsp;	
      <select class="form-control" id="payment_mode" name="payment_mode" onchange="fun()" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;-- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Cash</option>
                                    <option  style="padding:7px 0px 7px 7px;">Cheque</option>
                                    <option  style="padding:7px 0px 7px 7px;">Online</option>
                                   
                                    </select>
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>W.O. Number


</label>
<span style="padding-left:100px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="wo_number"  name="wo_number" />
			
      </span></div>
	  </div> 
     
     
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>W.O. Date




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:100px; margin-top:5px;">             					

       
			       &nbsp;&nbsp; &nbsp;<input type="date" class="form-control" id="wo_date"  name="wo_date"/>
			
      
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Priority



</label>
<span style="padding-left:140px; margin-top:5px;">
       
		
				
			      				
    <select class="form-control" id="priority" name="priority" onchange="fun()" >
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
					
			
			
      </span></div>
	  </div> 
     












  
     
     
	 
</div>




   <div id="secondform">
   
   	
   	
   	
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of Stages


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:200px; margin-top:5px;">
       
			
     			   <input class="form-control" id="no_of_stages"  name="no_of_stages">
     		
        </span>
      </div>
	  
	 
	  </div> 
   	
   	
   	
   	                  <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Current Stage


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:226px; margin-top:5px;">
       
			
     			   <input class="form-control" id="current_stage"  name="current_stage">
     		
        </span>
      </div>
	  
	 
	  </div> 
   	
    
       
     
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Active


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:95px; margin-top:5px;">
       
			
     			   <input class="form-control" id="no_of_aligners_u_a"  name="no_of_aligners_u_a">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Passive



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:86px; margin-top:5px;">
       
			
     			   <input class="form-control" id="no_of_aligners_u_p"  name="no_of_aligners_u_p">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - lower - Active



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:97px; margin-top:5px;">
       
			
     			   <input class="form-control" id="no_of_aligners_l_a"  name="no_of_aligners_l_a">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - lower - Passive



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:88px; margin-top:5px;">
       
			
     			   <input class="form-control" id="no_of_aligners_l_p"  name="no_of_aligners_l_p">
     		
        </span>
      </div>
	  
	 
	  </div> 
	   
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Attachment Applicable



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:170px; margin-top:5px;">
       
			
     			   <input class="form-control" id="attachment_applicable"  name="attachment_applicable">
     		
        </span>
      </div>
	  
	 
	  </div> 
	   
	   
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Dispatch Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:110px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="dispatch_grid"  name="dispatch_grid" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Dispatch Date
	  

</label>
<span style="padding-left:103px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="dispatch_date2"  name="dispatch_date2" />
			
      </span></div>
	  </div> 
	  
	  
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Data Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:82px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="data_grid"  name="data_grid" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Final Amount
	  

</label>
<span style="padding-left:106px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="final_amount"  name="final_amount" />
			
      </span></div>
	  </div> 
	   
             
             

	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Status Grid




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:71px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="status_grid"  name="status_grid" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Payment Grid
	  

</label>
<span style="padding-left:106px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="payment_grid"  name="payment_grid" />
			
      </span></div>
	  </div> 
	   
             
             
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Batch Number




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:51px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="batch_number"  name="batch_number" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Work Date/Time
	  

</label>
<span style="padding-left:90px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="work_date"  name="work_date" />
			
      </span></div>
	  </div> 
	   
	   
	   <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Next Work




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:76px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="next_work"  name="next_work" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>Next Work Date/Time
	  

</label>
<span style="padding-left:60px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="next_work_date"  name="next_work_date" />
			
      </span></div>
	  </div> 
	   
                        <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Case For Review



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:111px; margin-top:5px;">
       
			
     			   <input class="form-control" id="case_review"  name="case_review">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Refinement package Required



<span style="color:red" class="required">*</span></label>
     <span style="padding-left:28px; margin-top:5px;">
       
			
     			   <input class="form-control" id="refinement_package"  name="refinement_package">
     		
        </span>
      </div>
	  
	 
	  </div>   
	   <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Remarks


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:111px; margin-top:5px;">
       
			
     			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input class="form-control" id="remarks"  name="remarks">
     		
        </span>
      </div>
	  
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>DECISION
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:152px;;margin-top:5px;">             					

     <select name="category" class="form-control" id="decision" name="decision" onchange="fun()" >
                                      <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
	       
	 <% while(rs2.next()){ %>
 <option><%= rs2.getString("display_name")%></option>
 
	 <%}%>
                                   
                                    </select>
					
					
      
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
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table>
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
            <td>Number of Aligners Dispatched - Upper</td>
            <td>Number of Aligners Dispatched - Lower
</td>
            <td>Mode of Delivery
</td>
              <td>Courier Track Number
</td>
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

  </div>
  </div>
  
   </div>
		</form>
 
 
 </div>
  
  
   <div class="table-responsive">
        <table class="table table-no-bordered">
       <tr>
      	
         <td width="50%">
         <input class="btn btn-success" type="hidden" id="BtnSubmit" name="BtnSubmit" value='submitButton'  disabled /></td>   
 	   <td  width="50%">
			<a class="btn btn-primary" style="display:none;" id="pendingSubmit" style="margin-left:-66px;" name="BtnSubmit1" onclick="genrateDocs()">GenerateBarcode</a>

			
			  <td width="50%">
         <input class="btn btn-success"  type="button" id="createSubmit" name="createSubmit" value='submitButton' onclick='pendingSubmit()'  /></td>   
			
			 
			      
       </tr>       
       
        </table>
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
$(document).ready(function(){
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
 
});
</script>
   
   
   
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
 // alert(tableContent);
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
   //alert(tableContent);
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
   // alert(tableContent);
   return tableContent;
}






$(document).ready(function () {
	
	
	var decisionshow='<%=showdecision%>';

	
	alert(decisionshow);
	document.getElementById("decision").value=decisionshow;
	
	
	var rd='<%=rs.getString("registered_doctor")%>';
	
	
	document.getElementById("registered_doctor").value=rd;
	
	
//	var registered_doctor = $('#registered_doctor').val();
   	var prerequisite1 ='<%=rs.getString("prerequisite")%>';
	document.getElementById("prerequisite").value=prerequisite1;
	
	
   	var case_number1 = '<%=rs.getString("case_number")%>';
	document.getElementById("case_number").value=case_number1;
	
	
   	var user_id1 = '<%=request.getParameter("logusername")%>';
	document.getElementById("user_id").value=user_id1;
	
	var clinic_name1 = '<%=rs.getString("clinic_name")%>';
	document.getElementById("clinic_name").value=clinic_name1;
	
	var clinic_address1 ='<%=rs.getString("clinic_address")%>';
   	
	document.getElementById("clinic_address").value=clinic_address1;
		
	var gp1 ='<%=rs.getString("gp")%>';
	document.getElementById("gp").value=gp1;
	
	var city1 = '<%=rs.getString("city")%>';
	document.getElementById("city").value=city1;
	
	var patient_name1 = '<%=rs.getString("patient_name")%>';
   	
	document.getElementById("patient_name").value=patient_name1;
	
	var patient_age1 ='<%=rs.getString("patient_age")%>';
	document.getElementById("patient_age").value=patient_age1;
	
	var referred_by1 = '<%=rs.getString("referred_by")%>';
	document.getElementById("referred_by").value=referred_by1;
		
	var type_of_account1 = '<%=rs.getString("type_of_account")%>';
	document.getElementById("type_of_account").value=type_of_account1;
			
	var channel1 = '<%=rs.getString("channel")%>';
	document.getElementById("channel").value=channel1;
				
	var corporate_account1 = '<%=rs.getString("corporate_account")%>';
	document.getElementById("corporate_account").value=corporate_account1;
					
	var kol1 = '<%=rs.getString("kol")%>';
	document.getElementById("kol").value=kol1;
						
		var discount1 ='<%=rs.getString("discount")%>';
	document.getElementById("discount").value=discount1;
							
	var starter_kit1 = '<%=rs.getString("starter_kit")%>';
	document.getElementById("starter_kit").value=starter_kit1;
								
	var no_of_aligners1 = '<%=rs.getString("no_of_aligners")%>';
	document.getElementById("no_of_aligners").value=no_of_aligners1;
		var scanning1 = '<%=rs.getString("scanning")%>';
	document.getElementById("scanning").value=scanning1;
	var pickup1 = '<%=rs.getString("pickup")%>';
	document.getElementById("pickup").value=pickup1;
 	var dispatch1 = '<%=rs.getString("dispatch")%>';
	document.getElementById("dispatch").value=dispatch1;
	var dispatch_to1 = '<%=rs.getString("dispatch_to")%>';
	document.getElementById("dispatch_to").value=dispatch_to1;
	var advance_starter1 = '<%=rs.getString("advance_starter")%>';
	document.getElementById("advance_starter").value=advance_starter1;
	var advance_scanning1 = '<%=rs.getString("advance_scanning")%>';
	document.getElementById("advance_scanning").value=advance_scanning1;
	var scanning_service1 ='<%=rs.getString("scanning_service")%>';
	document.getElementById("scanning_service").value=scanning_service1;
 	var dispatch_date1 ='<%=rs.getString("dispatch_date")%>';
	document.getElementById("dispatch_date").value=dispatch_date1;
 	var person_dispatch1 ='<%=rs.getString("person_dispatch")%>';
	document.getElementById("person_dispatch").value=person_dispatch1;
 	var person_scan1 = '<%=rs.getString("person_scan")%>';
	document.getElementById("person_scan").value=person_scan1;
 	var bill_to1 ='<%=rs.getString("bill_to")%>';
	document.getElementById("bill_to").value=bill_to1;
 	var gst_number1 = '<%=rs.getString("gst_number")%>';
	document.getElementById("gst_number").value=gst_number1;
 	var payment_mode1 = '<%=rs.getString("payment_mode")%>';
	document.getElementById("payment_mode").value=payment_mode1;
 	var wo_number1 = '<%=rs.getString("wo_number")%>';
	document.getElementById("wo_number").value=wo_number1;
 	var priority1 ='<%=rs.getString("priority")%>';
	document.getElementById("priority").value=priority1;
 	var wo_date1 ='<%=rs.getString("wo_date")%>';
   	
	document.getElementById("wo_date").value=wo_date1;
 	
	
	
	var no_of_stages1 = '<%=rs.getString("no_of_stages")%>';
	document.getElementById("no_of_stages").value=no_of_stages1;
 	
	var current_stage1 ='<%=rs.getString("current_stage")%>';
	document.getElementById("current_stage").value=current_stage1;
 	
	var no_of_aligners_u_p1 = '<%=rs.getString("no_of_aligners_u_p")%>';
	document.getElementById("no_of_aligners_u_p").value=no_of_aligners_u_p1;
 
	var no_of_aligners_u_a1 ='<%=rs.getString("no_of_aligners_u_a")%>';
	
 	document.getElementById("no_of_aligners_u_a").value=no_of_aligners_u_a1;
 
 	var no_of_aligners_l_a1='<%=rs.getString("no_of_aligners_l_a")%>';
   	
	document.getElementById("no_of_aligners_l_a").value=no_of_aligners_l_a1;
 	
	var no_of_aligners_l_p1 ='<%=rs.getString("no_of_aligners_l_p")%>';
	document.getElementById("no_of_aligners_l_p").value=no_of_aligners_l_p1;
 
	var attachment_applicable1 ='<%=rs.getString("attachment_applicable")%>';
	document.getElementById("attachment_applicable").value=attachment_applicable1;
 
	var dispatch_grid1 = '<%=rs.getString("dispatch_grid")%>';
	document.getElementById("dispatch_grid").value=dispatch_grid1;
 
	var dispatch_date21 = '<%=rs.getString("dispatch_date2")%>';
	document.getElementById("dispatch_date2").value=dispatch_date21;
 
	var data_grid1 = '<%=rs.getString("data_grid")%>';
	document.getElementById("data_grid").value=data_grid1;
 
	var final_amount1 = '<%=rs.getString("final_amount")%>';
	document.getElementById("final_amount").value=final_amount1;

	var status_grid1 = '<%=rs.getString("status_grid")%>';
	document.getElementById("status_grid").value=status_grid1;
 	
	var payment_grid1 = '<%=rs.getString("payment_grid")%>';
	document.getElementById("payment_grid").value=payment_grid1;
  
	var batch_number1 ='<%=rs.getString("batch_number")%>';
	document.getElementById("batch_number").value=batch_number1;
 
	var work_date1 ='<%=rs.getString("work_date")%>';
	document.getElementById("work_date").value=work_date1;
	
	var next_work1 = '<%=rs.getString("next_work")%>';
	document.getElementById("next_work").value=next_work1;
	
	var next_work_date1 = '<%=rs.getString("next_work_date")%>';
	document.getElementById("next_work_date").value=next_work_date1;
	
	var refinement_package1 = '<%=rs.getString("refinement_package")%>';
	document.getElementById("refinement_package").value=refinement_package1;

	var case_review1 ='<%=rs.getString("case_review")%>';
	document.getElementById("case_review").value=case_review1;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	if(content2==''){
		totalRowAdded2=1;
	}else{
		var sContent=content2.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded2=sContent.length+1;
		console.log(sContent.length);
		for (i = 0; i < sContent.length-1; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="name" id="table3r'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="table3r'+roid+'c1"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="table3r'+roid+'c2"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="table3r'+roid+'c3"/></td>';
				
			 cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
			
			newRow.append(cols);
			 $("#table3").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("table3r"+roid+"c"+j).value=CellContent[j];
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







	 function pendingSubmit(){
   	  var table3Content=getData2(4); 	
   	   	
      	  var caseId='<%=caseId%>';
      	 
      	 var tableContent=getData(3);
      	 var reviewnumber=getData1(4);
      	
      	
      	var registered_doctor = $('#registered_doctor').val();
      	var prerequisite = $('#prerequisite').val();
      	var case_number = $('#case_number').val();
    //  	var payment_grid_table = $('#tableContent').val();
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
      	var nextStage='Intro';
      	var remarks=$('#remarks').val();
     // 	alert(document.getElementById('logusername').value);
    
    		 if(decision=='' || decision==null){
    				alert('Kindly select the Decision');
    				document.getElementById("decision").focus();
    			}else if(remarks==''){
    				alert('Kindly Enter the Remarks');
    				document.getElementById("remarks").focus();
    			}
    			else{
    				$.ajax({
    		      		

    		      	    type : 'POST',
    		      		data : {table3Content:table3Content,nextStage:nextStage,caseId:caseId,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
    		      		url : 'drafttosubmit',
    		      		success : function(responseText) {
    		   				
    		      			var x=responseText;
    		      			
    		      			//document.getElementById("form1").reset();
    		      			alert(x);

    		   			 $('#sidebardraft')[0].click();
    		   			}
    		      	
    		      	  
    		      		 
    		   		});
    			}
      	
   }
    
    
  
    </script>

        
   
     <%}%>    
   
   
   
   
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
        
        