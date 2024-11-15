<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@page import="java.math.*"%> 
<%@page import="java.util.*"%>
 
<%String currentstage=(String)request.getAttribute("currentstage");%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel=icon type="image/ico"  href="${pageContext.request.contextPath}/Images/favicon.ico"  sizes=32x32 />
    
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
        <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.min.js"></script>
        
        <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/jquery.smartWizard.js"></script>             
        <script type="text/javascript"> var contextPath ='${pageContext.request.contextPath}';</script>
        <script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
        <script  src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
        <script  src="${pageContext.request.contextPath}/JavaScript/common.js"></script>

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
 .A{
 
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

#amit{

 padding:5px;
}
}


</style> 



<style type="text/css">
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
 
</style>
 	
 
 <script>

 $(document).ready(function(){
	 
	
	 $.ajax({
			

		    type : 'POST',
			data : {stage:"workorder"},
			url : 'geteditables',
			success : function(responseText) {
				var x=responseText.slice(1);
				//alert(x);
				var array = x.split(","); 
				//alert(array);
				
				
				/*to make crm field disabled
				for (index = 0; index < array.length; index++) { 
					document.getElementById(array[index]).disabled = true;
					
				} */
								
			}

			
		  
			 
		});
	 

	 
	 
	
	 
	 $("#createSubmit").hide();
	 
	 $("#secondform").hide();
	 
	 $("#sd").hide();
	    $("#second").click(function(){
	    	 $("#createSubmit").show();
	    	 
	        $("#firstform").hide();
	        $("#secondform").show();
	    });
	    $("#first").click(function(){
	    	 $("#createSubmit").hide();
	    	 
	        $("#firstform").show();
	        $("#secondform").hide();
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

	
	













 <div class="btn-group">
    <button type="button" class="btn btn-default" id="first">First</button>
    <button type="button" class="btn btn-default" id="second">Second</button>
 
  </div>
</div>
 <form id="form1" style="margin-top:0px" class="form-inline"  method="post"  >  
 
  
  <input type="hidden" name="username" value='<%=(String)session.getAttribute("userid")%>'>
  
  
  <div class="panel panel-primary">
  				<div class="loader"></div>
    <div class="panel-heading"><strong>Create New</strong> </div>

	  			<div id ="error" style="width: 100%;display:none;color:green;" align="center"><h4 class="errorMsg"><label id="err"></label></h4></div>
 	  
	  	<div style="display: none;">
		<input type="text" id="hiddenNextInvNo" name="hiddenNextInvNo"/>
		</div>
		<div style="padding:10px 20px 10px 20px;">   
   
 
     
     
  
   
      <br>
     <div id="firstform">
    <div class="form-group" id="D">
		
		 <label>I have checked and filled the pre-requisite form.</label> 
		 		<span style="padding-left:30px; margin-top:5px;">             					
		
       <select class="form-control" id="prerequisite" name="prerequisite"  onchange="getComData()" >
       <option style="padding:7px 0px 7px 7px;" value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select -- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
       <option  style="padding:7px 0px 7px 7px;">yes</option>
       <option  style="padding:7px 0px 7px 7px;">no</option>
      
   </select></span>
			
      </div>
      <div id="c">	 </div>

	    
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Case registration Form Number<span style="color:red" class="required">*</span></label>
     <span style="padding-left:129px; margin-top:5px;">
     			   <input class="form-control" id="case_number"  name="case_number" required>
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
	 
      

	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group a" id="A">
                              <label>Registered Doctor<span style="color:red" class="required">*</span></label>
     <span style="padding-left:69px; margin-top:5px;">
	 <input class="form-control" id="registered_doctor"  name="registered_doctor">
	</span>
      </div>
	  
	  <div class="form-group" style="margin-top:5px;">
	  <label>CRM NAME<span style="color:red" class="required">*</span></label>
<span style="padding-left:100px; margin-top:5px;">
       
		
				
			         &nbsp; &nbsp;&nbsp;<input class="form-control" id="user_id"  name="user_id" />
			
      </span></div>
	  </div> 
      
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group"id="A" >
                              <label>Clinic Name<span style="color:red" class="required">*</span></label>
     <span style="padding-left:50px; margin-top:5px;">             					

        
					
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input class="form-control" id="clinic_name" name="clinic_name"  />
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Clinic Address<span style="color:red" class="required">*</span></label>
<span style="padding-left:93px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="clinic_address"  name="clinic_address" />
			
      </span></div>
	  </div> 
	 
	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>GP</label>
     <span style="padding-left:101px; margin-top:5px;">             					

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input class="form-control" id="gp"  name="gp" />
					
     
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>City</label>
<span style="padding-left:160px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="city"  name="city" />
			
      </span></div>
	  </div>
	 
	 

	  
	  
 	


			<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Patient Name<span style="color:red" class="required">*</span></label>
     <span style="padding-left:72px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input class="form-control" id="patient_name"  name="patient_name" />        

					
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Patient Age And Other Details
</label>
<span style="padding-left:4px; margin-top:5px;">
       
		
			<input class="form-control" id="patient_age"  name="patient_age" />        

			
      </span></div>
	  </div> 
		


			<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Type of Account</label>
     <span style="padding-left:54px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <select class="form-control" id="type_of_account" name="type_of_account" onBlur="javascript:customOnBlur(this.id, event)" >
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
       
		
			<input class="form-control" id="referred_by"  name="referred_by" />        

			
      </span></div>
	  </div>  
		


	   	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>channel
</label>
     <span style="padding-left:55px; margin-top:5px;">             					

       
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
      <select class="form-control" id="channel" name="channel" onBlur="javascript:customOnBlur(this.id, event)" >
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
				
			      <select class="form-control" id="corporate_account" name="corporate_account" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Partner</option>
                                    <option  style="padding:7px 0px 7px 7px;">Digital</option>
                                    <option  style="padding:7px 0px 7px 7px;">Retail</option>
                                    </select>
			
      </span></div>
	  </div>  
    	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>KOL</label>
     <span style="padding-left:105px; margin-top:5px;">             					

      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      <select class="form-control" id="kol" name="kol" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                              
                                  
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Discount
</label>
<span style="padding-left:129px; margin-top:5px;">
       
		
				
			        &nbsp;<input class="form-control" id="discount"  name="discount" />
			
      </span></div>
	  </div>  
    

 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>No of Aligners expected by Orthodontist
</label>
     <span style=" padding-left:70px;;margin-top:5px;">             					

    <input class="form-control" id="no_of_aligners"  name="no_of_aligners" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Starter Kit Required</label>
     <span style=" padding-left:58;;margin-top:5px;">             					

    <input class="form-control" id="starter_kit"  name="starter_kit" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  

	 	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Scanning Required</label>
     <span style="padding-left:54px; margin-top:5px;">             					
   &nbsp;
       <select class="form-control" id="scanning" name="scanning" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Yes</option>
                                     <option  style="padding:7px 0px 7px 7px;">No</option>
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Pickup required?</label>
<span style="padding-left:79px; margin-top:5px;">
       
		
				
			       <select class="form-control" id="pickup" name="pickup" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;-- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Yes</option>
                                     <option  style="padding:7px 0px 7px 7px;">No</option>
                                    </select>
			
      </span></div>
	  </div>  
      	<div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Dispatch Mode:
</label>
     <span style="padding-left:50px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <select class="form-control" id="dispatch" name="dispatch" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Courier</option>
                                     <option  style="padding:7px 0px 7px 7px;">Collect from Office</option>
                                     <option  style="padding:7px 0px 7px 7px;">In-person delivery</option>
                                    </select>
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Dispatch to:<span style="color:red" class="required">*</span></label>
<span style="padding-left:7px; margin-top:5px;">
       
		
				
			        <input type="checkbox" if="optchk" name="optchk"  onchange="CopyAdd(this.form);">same as clinic
			<input class="dispatch_to form-control" id="dispatch_to"  name="dispatch_to"  />
      </span></div>
	  </div>  
	  
	  
	  
	  <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Advance collected for Starter Kit?</label>
     <span style=" padding-left:108px;;margin-top:5px;">             					

    <input class="form-control" id="advance_starter"  name="advance_starter" />
					
      
</span>
			
      </div>
	  
	 
	  </div> 
	   <div style="padding:10px 0px 0px 0px;">   
       <div class="form-group" id="D">
       <label>Advance collected for Scanning Service?</label>
     <span style=" padding-left:63px;;margin-top:5px;">             					
    <input class="form-control" id="advance_scanning"  name="advance_scanning" />
					  
</span>
			
      </div>
	  
	 
	  </div>  
	 <div style="padding:10px 0px 0px 0px;">   
     <div class="form-group" id="D">
     <label>Scanning service requested  Date Time
</label>
     <span style=" padding-left:80px;;margin-top:5px;">             					

    <input  type="datetime-local" class="form-control A" id="scanning_service"  name="scanning_service" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	  
	  
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Dispatch requested Date Time</label>
     <span style=" padding-left:132px;;margin-top:5px;">             					

    <input type="datetime-local" class="form-control" id="dispatch_date"  name="dispatch_date" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	
	 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for dispatch
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:92px;;margin-top:5px;">             					

    <input class="form-control" id="person_dispatch"  name="person_dispatch" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	
		 <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="D">
                              <label>Contact person details for Scan
</label>
     <span style=" padding-left:122px;;margin-top:5px;">             					

    <input class="form-control" id="person_scan"  name="person_scan" />
					
      
</span>
			
      </div>
	  
	 
	  </div>  
	
	  
	  
	  
	  
	  
	 
	  
	   <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Bill To:


<span style="color:red" class="required">*</span></label>
     <span style="padding-left:57px; margin-top:5px;">             					
&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="bill_to"  name="bill_to" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>GST Number
</label>
<span style="padding-left:103px; margin-top:5px;">
			        &nbsp;<input class="form-control" id="gst_number"  name="gst_number" />
      </span>
      </div>
	  </div> 
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Payment Mode</label>
     <span style="padding-left:84px; margin-top:5px;">&nbsp;	
      <select class="form-control" id="payment_mode" name="payment_mode" onBlur="javascript:customOnBlur(this.id, event)" >
                                    <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;-- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    <option  style="padding:7px 0px 7px 7px;">Cash</option>
                                    <option  style="padding:7px 0px 7px 7px;">Cheque</option>
                                    <option  style="padding:7px 0px 7px 7px;">Online</option>
                                    </select>     
	</span>		
      </div>
     
	  <div class="form-group" style="margin-top:10px;">
	  <label>W.O. Number</label>
	<span style="padding-left:100px; margin-top:5px;">
        &nbsp;<input class="form-control" id="wo_number"  name="wo_number" />	
      </span>
      </div>
	  </div> 
     
     
     
      <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>W.O. Date




<span style="color:red" class="required">*</span></label>
     <span style="padding-left:100px; margin-top:5px;">             					

       
			       &nbsp;&nbsp; &nbsp;<input type="date" class="form-control" id="wo_date"  name="wo_date" />
					
      
					
      
</span>
      </div>
	  
	  <div class="form-group" style="margin-top:10px;">
	  <label>Priority</label>
	  <span style="padding-left:140px; margin-top:5px;">
       
		
				
			      				
      <select class="form-control" id="priority" name="priority" onBlur="javascript:customOnBlur(this.id, event)" >
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
					      </span>
					      </div>
	  </div> 
 
</div>



   <div id="secondform">

                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of Stages</label>
     <span style="padding-left:200px; margin-top:5px;">

     			   <input class="form-control" id="no_of_stages"  name="no_of_stages">
        </span>
      </div>
      </div> 

   	                  <div style="padding:10px 0px 0px 0px;" >   
                     <div class="form-group" id="D">
                     <label>Current Stage</label>
     				<span style="padding-left:226px; margin-top:5px;">
     			   		<input class="form-control" id="current_stage"  name="current_stage">	
        		    </span>
      </div>
	  </div> 

                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Active</label>
     <span style="padding-left:95px; margin-top:5px;">
     			   <input class="form-control" id="no_of_aligners_u_a"  name="no_of_aligners_u_a">
        </span>
      </div>
	  </div> 
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - upper - Passive</label>
     <span style="padding-left:86px; margin-top:5px;">
     			   <input class="form-control" id="no_of_aligners_u_p"  name="no_of_aligners_u_p">
        </span>
      </div>
	  </div> 
	 
                          <div style="padding:10px 0px 0px 0px;" >   
                          <div class="form-group" id="D">
                          <label>Number of aligners - lower - Active</label>
     <span style="padding-left:97px; margin-top:5px;">
     			   <input class="form-control" id="no_of_aligners_l_a"  name="no_of_aligners_l_a">
     		
        </span>
      </div>
	  
	 
	  </div> 
	  
	  
                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="D">
                              <label>Number of aligners - lower - Passive</label>
     <span style="padding-left:88px; margin-top:5px;">
     			   <input class="form-control" id="no_of_aligners_l_p"  name="no_of_aligners_l_p">
        </span>
      </div>
	  </div> 
                          <div style="padding:10px 0px 0px 0px;" >   
                          <div class="form-group" id="D">
                          <label>Attachment Applicable</label>
     <span style="padding-left:170px; margin-top:5px;">
     			   <input class="form-control" id="attachment_applicable"  name="attachment_applicable">
        </span>
      </div>
	  
	 
	  </div> 
	   
	   
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Dispatch Grid</label>
     <span style="padding-left:110px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="dispatch_grid"  name="dispatch_grid" />
</span>		
</div>
	  
	  <div class="form-group" >
	  <label>Dispatch Date</label>
<span style="padding-left:103px; margin-top:5px;">
 &nbsp;<input class="form-control" id="dispatch_date2"  name="dispatch_date2" />
</span></div>
	  </div> 

	  
	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Data Grid




</label>
     <span style="padding-left:82px; margin-top:5px;">             					
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="data_grid"  name="data_grid" />
					
      
</span>
			
      </div>
	  
	  <div class="form-group" >
	  <label>
	  

</label>
<span style="padding-left:106px; margin-top:5px;">
       
		
				
			        <!-- &nbsp;<input class="form-control" id="final_amount"  name="final_amount" /> -->
			
      </span></div>
	  </div> 
	   
             
             

	        <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>Status Grid</label>
     <span style="padding-left:71px; margin-top:5px;">             					

         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" id="status_grid"  name="status_grid" />
					
      
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
                              <label>Batch Number</label>
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
                              <label>Next Work</label>
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
                            <div class="form-group" id="A">
                             <label>Case For Review</label>
     						<span style="padding-left:111px; margin-top:5px;">
     			   				<input class="form-control" id="case_review"  name="case_review">		
       					    </span>
      					 </div>
      					 
      					 <div class="form-group">
						  <label> Tax Rate</label>
						  <span style="padding-left:60px; margin-top:5px;">
					      &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					      <input class="form-control" type="number" id="taxrate"  name="taxrate" required>
						  </span>
						</div>
      					  </div> 

                          <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="A">
                              <label>Refinement package Required</label>
     <span style="padding-left:28px; margin-top:5px;">
     			   <input class="form-control" id="refinement_package"  name="refinement_package">
     		
        </span>
      </div>
	  
	  		 			 <div class="form-group">
						  <label> Tax Amount</label>
						  <span style="padding-left:60px; margin-top:5px;">
					      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					     <input class="form-control" type="number" id="final_amount"  name="final_amount"   required>
						  </span>
						</div> 
	 
	  </div>   
	  
	  <div style="padding:10px 0px 0px 0px;" >   
                            <div class="form-group" id="A">
                              <label>Remarks<span style="color:red" class="required">*</span></label>
     <span style="padding-left:111px; margin-top:5px;">
       
			
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			   <input class="form-control" id="remarks"  name="remarks">
     		
        </span>
      </div>
      					<div class="form-group">
						  <label>Grand Total</label>
						  <span style="padding-left:60px; margin-top:5px;">
					     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
			     	<input class="form-control" type="number" id="grandtotal"  name="grandtotal" required>
						  </span>
						</div> 
	  
	 
	  </div>   



     <div style="padding:10px 0px 0px 0px;">   
                            <div class="form-group" id="A">
                              <label>DECISION
<span style="color:red" class="required">*</span></label>
     <span style=" padding-left:143px;;margin-top:5px;">             					

     <select name="category" class="form-control" id="decision" name="decision" onBlur="javascript:customOnBlur(this.id, event)" >
                         <option style="padding:7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
	          <%
		String decMap=(String)request.getAttribute("sDecision");
String[] decArr=decMap.split("~");
for(int i=0;i<decArr.length;i++) {
	%>
	<option><%= decArr[i]%></option>
	
	 <%
}
%>
                                   
                                    </select>
					
					
      
</span>
			
      </div>
      
     				<!-- 	<div class="form-group">
						  <label>Total</label>
						  <span style="padding-left:60px; margin-top:5px;">
					     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					     <input class="form-control" type="number" id="total"  name="total" required>
						  </span>
						</div> -->
	  
	 
	  </div> 

	<hr>
	
	
	<div>
	<input type="file" name="file1" multiple>
	</div>
	
	<!-- workorder rows -->
	
	<div class="container">
    <table id="workorder" class="table "  >
    <thead>
        <tr style="color: #212529;background-color: #b8daff;">
            <td align="center" valign="middle">Quantity</td>
            <td align="center" valign="middle">Item </td>
            <td align="center" valign="middle">Unit Price</td>
            <td align="center" valign="middle">Line Total</td>
            <td></td>
        </tr>
    </thead>
    <tbody>
     
    </tbody>
    
            
       
     </table>
     <table>
     	<tr>
          <td>
               <input type="button" class="btn btn-success"  id="addworowwo" value="Add Row+" />
           </td>
           
            </tr>
     </table>
	</div>
	<!--  -->
	
	
	 <div class="container">
    <table id="payment" class="table table-responsive"  >
    <thead>
        <tr style="color: #212529;background-color: #b8daff;">
            <td align="center" valign="middle">payment_amount</td>
            <td align="center" valign="middle">payment date</td>
            <td align="center" valign="middle">pending amount</td>
             <td></td>
        </tr>
    </thead>
     
    <tbody>
   
    </tbody>
     </table>
     
      <table>
        <tr>
            <td>
                <input type="button" class="btn btn-success" id="addrow" value="Add Row+"/>
    
           </td>
        </tr>
</table>
</div>
	        
	        
	  
	           
	             
	<div class="container">
    <table id="reviewnumber" class=" table table-responsive" >
    <thead>
        <tr style="color: #212529;background-color: #b8daff;">
            <td align="center" valign="middle">Review Number</td>
            <td align="center" valign="middle">Work Grid</td>
            <td align="center" valign="middle">New aligner required?</td>
              <td align="center" valign="middle">New aligner required?</td>
              <td></td>
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table>
   
        <tr>
            <td >
                <input type="button" class="btn btn-success" id="addrow1" value="Add Row+"  />
           </td>
        </tr>
      
    
</table>
</div>
                
   <div class="container">
    <table id="table3" class=" table table-responsive" >
    <thead>
        <tr style="color: #212529;background-color: #b8daff;">
            <td align="center" valign="middle">Number of Aligners Dispatched - Upper</td>
            <td align="center" valign="middle">Number of Aligners Dispatched - Lower</td>
            <td align="center" valign="middle">Mode of Deliver</td>
            <td align="center" valign="middle">Courier Track Number</td>
            <td></td>
        </tr>
    </thead>
     
    <tbody>
       
    </tbody>
     </table>
      <table>
   
        <tr>
            <td>
                <input type="button" class="btn btn-success" id="addrow2" value="Add Row+"  />
            
           </td>
        </tr>
</table>
</div>
	      
	      
	        
	        
	          
	        
	          

 </div></div></div>
  
  
   <div class="table-responsive">
        <table class="table table-no-bordered" >
       <tr>
      	<!-- genrateworkorder() -->
         <td width="50%">
         <input class="btn btn-success" type="hidden" id="BtnSubmit" name="BtnSubmit" value='submitButton'  disabled /></td>   
 	   <td  width="50%">
			<a class="btn btn-primary"  style="display:none;" id="submitButton" style="margin-left:-66px;" name="BtnSubmit1" onclick="genrateDocs()">GenerateBarcode</a>
		</td>
		<td width="50%">
					<a class="btn btn-primary" id="workordergen" name="workordergen" onclick="genrateworkorder()">Generate Work Order</a>
		
<!--          	<button class="btn btn-success" type="button" id="workordergen" name="workordergen"  onclick="genrateworkorder()">Generate Work Order</button></td>
 -->         </td>   	
		<td width="50%">
         	<button class="btn btn-success" type="button" id="saveDraft" name="saveDraft" value='Save to Drafts' onclick="saveDraft()">Save To Drafts</button></td>
         </td>   
		<td width="50%">
         	<button class="btn btn-success" type="button" id="createSubmit" name="createSubmit" value='submitButton' onclick="submitclick()">Submit button</button></td>
         </td>   
			
			 
			      
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
   

        <script>
        
        
        var totalRowAdded='';
        function getData0(cell)
        {
        	var rowContent='';
        	var tableContent='';
        	var cellcount='';
        	var table = document.getElementById('workorder');
        	/* alert('getData0 totalRowAdded0 '+totalRowAdded); */
        	
        	for (var r = 1;r < totalRowAdded; r++)
        	{
            	if(document.getElementById('workorderr'+r+'c0')!=null)
            	{   		
            		for (var c = 0; c < 4; c++) 
            		{
                    	rowContent=rowContent+'~'+document.getElementById("workorderr"+r+"c"+c).value;
                    	/* alert("rowContent==="+rowContent) */
                    }
            		rowContent=rowContent.substring(1, rowContent.length);
            	    
            	    tableContent=tableContent+'#'+rowContent;
            	    rowContent='';
            	}
                
            }
            tableContent=tableContent.substring(1, tableContent.length);
           return tableContent;
        }
        

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
   // alert(tableContent);
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


	
/* 	 $(document).ready(function(){
         $("#rate").keyup(function(){
          	var rate=$("#rate").val();
         	var quantity=$("#quantity").val();
            var total = (rate*quantity);   
            $("#total").val(total);
         });   
     }); */

 
/*start workorderrow*/
 $(document).ready(function () {
	var table = document.getElementById('workorder');
	var content='';
	if(content==''){
		totalRowAdded=1;
	}else{
		var sContent=content.split('#');
		var CellContent='';
		
		totalRowAdded=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="quantity" id="quantity'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="item" id="item'+roid+'c1"/></td>';
			cols += '<td><input type="text" class="form-control" name="rate" id="rate'+roid+'c2"/></td>';
			cols += '<td><input type="text" class="form-control" name="total"  readonly id="total'+roid+'c2"/></td>';
			cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger"  value="Delete"></td>';
			
			 newRow.append(cols);
			 $("#workorder").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("myTabler"+roid+"c"+j).value=CellContent[j];
				} 
		}
	}

	var table = document.getElementById('workorder');
	var rowct = table.rows.length;
//	alert(rowct);

    $("#addworowwo").on("click", function () {
    	
    	totalRowAdded++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input type="text" class="form-control numonly" name="quantity' + counter + '" id="workorderr'+rowct+'c'+cellct+'" required /></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="item' + counter + '" id="workorderr'+rowct+'c'+cellct+'" required  maxlength="100"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control numonly" name="rate' + counter + '" id="workorderr'+rowct+'c'+cellct+'" required oninput="linetotal()"/></td>'; 
        cellct++;
        cols += '<td><input type="text" class="form-control " name="total' + counter + '" id="workorderr'+rowct+'c'+cellct+'" readonly /></td>'; 
        cellct++;
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        
        newRow.append(cols);
        $("#workorder").append(newRow);
        counter++;
        rowct++;
        cellct=0;
    });



    $("#workorder").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });

    
    
    /*end workorderrow*/    
    
	<%-- var user_id1 = '<%=request.getAttribute("loginusername")%>';
	document.getElementById("user_id").value=user_id1; --%>
	
	
	var table = document.getElementById('payment');
//	alert(table.rows.length);
	var content='';
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
					document.getElementById("myTabler"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	 
	var table = document.getElementById('payment');
	var rowct = table.rows.length;
//	alert(rowct);

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
	var content1='';
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
			cols += '<td><input type="text" class="form-control" name="name" id="paymentr'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="paymentr'+roid+'c1"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="paymentr'+roid+'c2"/></td>';
			 
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
	//alert(rowct1);

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
	//alert(table3.rows.length);
	//var content2='aa~bb~cc#zz~xx~CC';
	var content2='';
	if(content2==''){
		totalRowAdded2=1;
	}else{
		var sContent=content2.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded2=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="name" id="table3r'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="table3r'+roid+'c1"/></td>';
			 cols += '<td><input type="text" class="form-control" name="phone" id="table3r'+roid+'c2"/></td>';
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
    	alert();
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
  
     
var decisionvalue="";  
$('#decision').on('change', function() {
	  alert( this.value );
	  
	  decisionvalue=this.value;
	  
	});

    var xy='abc';

     <!--  start genrate workorder -->
    function genrateworkorder(){

    	alert('work order start');
    	var table3Content0=getData0(4); 
    	var table3Content=getData2(4); 
    	var tableContent=getData(3);
    	var reviewnumber=getData1(4); 
    	var registered_doctor = $('#registered_doctor').val();
    	var prerequisite = $('#prerequisite').val();
    	var case_number = $('#case_number').val();
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
    	
    	var quantity=$('#quantity').val();
    	var rate=$('#rate').val();
    	var item=$('#item').val();
    	var total=$('#total').val();
    	
    	var taxrate=$('#taxrate').val();
    	var taxamount=$('#final_amount').val();
    	var grandtotal=$('#grandtotal').val();
    	
     	if(case_number==''){
    		alert(' Please Enter the Case number');
    		document.getElementById("case_number").focus();
    	}
    	else if(registered_doctor==''){
    		alert('Please Enter the Registered Doctor');
    		document.getElementById("registered_doctor").focus();
    	}

    	else if(user_id==''){
    		alert(' Please Enter the CRM Name');
    		document.getElementById("user_id").focus();
    	}
    	else if(clinic_name==''){
    		alert('Please Enter the Clinic name');
    		document.getElementById("clinic_name").focus();
    	} 
    	else if(clinic_address==''){
    		alert(' Please Enter the  Clinic address');
    		document.getElementById("clinic_address").focus();
    	}
    	
    	else if(patient_name==''){
    		alert(' Please Enter the  Patient Name');
    		document.getElementById("patient_name").focus();
    	}
    	else if(dispatch_to==''){
    		alert('Please Enter the  dispatch to');
    		document.getElementById("dispatch_to").focus();
    	} 
    	
     	
    	else if(wo_date==''){
    		alert(' Please Enter the  WO Date');
    		document.getElementById("wo_date").focus();
    	}
    	else if(dispatch_to==''){
    		alert('Please Enter the  dispatch to');
    		document.getElementById("dispatch_to").focus();
    	}

    	else if(remarks==''){
    		alert('Please Enter the Remarks');
    		document.getElementById("remarks").focus();
    	}

    	else if(decision==''){
    		alert('Please select the Decision');
    		document.getElementById("decision").focus();
    	}

    	else{
    		$.ajax({
    		    type : 'POST',
/*     			data : {xy:xy,table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
 */
   
 				data : {xy:xy,table3Content0:table3Content0,table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks,quantity:quantity,rate:rate,item:item,total:total,taxrate:taxrate,taxamount:taxamount,grandtotal:grandtotal},
    			url : 'Workorder', 
    			success : function(responseText) {		
    				var x=responseText;
    				document.getElementById("form1").reset();
    				alert("x======="+x);
    				$('#sidebarcreate')[0].click();}
    		});
    	}
    	
    	
    }
    <!--end genrate workorder -->
    
$('#saveDraft').on('click', function() {

	
	
	  
 var table3Content=getData2(4); 	

	 
	 var tableContent=getData(3);
	 var reviewnumber=getData1(4);
//	 alert("this is table content"+tableContent);

	var registered_doctor = $('#registered_doctor').val();
	var prerequisite = $('#prerequisite').val();
	var case_number = $('#case_number').val();
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

	if(decision==''){
		alert('Kindly select the Decision');
		document.getElementById("decision").focus();
	}else if(remarks==''){
		alert('Kindly Enter the Remarks');
		document.getElementById("remarks").focus();
	}
	else{
		$.ajax({
			

		    type : 'POST',
			data : {xy:xy,table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
			url : 'SaveDraft',
			success : function(responseText) {
				
				var x=responseText;
			
				alert("saved to drafts");
				console.log(x);
				xy=x;
			
				
				
			}
					

		  
			 
		});
	}
	
	
	
	
	 
 
	});
    





    
function submitclick(){
	//alert('submitclick');
	 var table3Content=getData2(4); 	

	 
	 var tableContent=getData(3);
	 var reviewnumber=getData1(4);
//		 alert("this is table content"+tableContent);

	 
	var registered_doctor = $('#registered_doctor').val();
	var prerequisite = $('#prerequisite').val();
	var case_number = $('#case_number').val();
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

	if(decision==''){
		alert('Kindly select the Decision');
		document.getElementById("decision").focus();
	}else if(remarks==''){
		alert('Kindly Enter the Remarks');
		document.getElementById("remarks").focus();
	}
	else{
		
		
		
		
		$.ajax({
			

		    type : 'POST',
			data : {xy:xy,table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},

			url : 'Submit',
			success : function(responseText) {
				
				var x=responseText;
				document.getElementById("form1").reset();
				alert(x);
				
				
									
				
				
				 $('#sidebarcreate')[0].click();}
		
			
			
			
			
			

		  
			 
		});
	}
	
	
}



$('#createSubmit').click(function(){	
 alert('here');
  var table3Content=getData2(4); 	

 
 var tableContent=getData(3);
 var reviewnumber=getData1(4);
//	 alert("this is table content"+tableContent);

 
var registered_doctor = $('#registered_doctor').val();
var prerequisite = $('#prerequisite').val();
var case_number = $('#case_number').val();
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
	data : {table3Content:table3Content,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
	url : 'Submit',
	success : function(responseText) {
		
		var x=responseText;
		document.getElementById("form1").reset();
		alert(x);
		
		 $('#sidebarcreate')[0].click();
	}

  
	 
});
	
  	
	  
});

function calculate()
{
	var rate = $('#next_work_date').val();
	var rate = $('#next_work_date').val();
	
	}
	

	
function linetotal()
{
	var table = document.getElementById('workorder');
	var row = table.rows.length; 
	row=row-1;
	var col=0;
	var col1=1;
	var col2=2;
	var col3=3;
	
    var quantity=$("#workorderr"+row+'c'+col).val();
    var rate=$("#workorderr"+row+'c'+col1).val();
	var rate=$("#workorderr"+row+'c'+col2).val();
    var total = (rate*quantity);   
    $("#workorderr"+row+'c'+col3).val(total);
    
 }
 
 

 
 
/* function linetotal()
{
	var table = document.getElementById('workorder');
	var rowct = table.rows.length; 
	rowct=rowct-1;
	
    var rate=$("#rate"+rowct).val();
    var quantity=$("#quantity"+rowct).val();
    var total = (rate*quantity);   
    $("#total"+rowct).val(total);
        
 } */
 
  
    </script>

        
        
        
        
        
        
        
        
        
        
        
       
   </div></div>
</body>

</html>