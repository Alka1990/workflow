
<!DOCTYPE html>

<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html lang="en"> 

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title>
    
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
  <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

 
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
<%
HttpSession s=request.getSession();
String case_id = (String) s.getAttribute("case_id");
String total = (String)s.getAttribute("total1");
String subamount = (String)s.getAttribute("subamount");

%>

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
             <div class="container">
  <div class="panel panel-default" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Edit Account</div>
    <div class="panel-body">
<form class="form-verticle" action="SaveAccount" method="post"  >
             
<div class="container" style="padding-top:20px;">

 <div class="container" >
  <div class="panel panel-info" style="padding: 5px;">

<div class="row" style="margin-top:10px;">
  <label class="col-md-3 control-label">Case ID</label>  
  <div class="col-lg-8 ">
  <div class="input-group">	
  <label><input  type="text" class="form-control col-lg-8" name="caseid" id="caseId"   maxlength="12" placeholder="Case ID"  required style="width: 499px;" ></label>
    </div>
  </div>
  
  <div class="col-lg-1 ">
  <div class="input-group">
  <label> <button type="button" class="btn btn-success" style="margin-left: -97px;" id="fetch">Fetch Data</button></label>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Doctor Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
 <label><input type="text" class="form-control" name="DoctorName" id="DoctorName" placeholder="Doctor Name" required style="width:501px;"></label>
    </div>
  </div>
</div>


<div class="row">
  <label class="col-md-3 control-label">Patient Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="PatientName" id="patientname" placeholder="Patient Name"  required style="width:501px;"></label>
        </div>
  </div>
</div>


<div class="row">
  <label class="col-md-3 control-label">CRM Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="CRM" id="CRM" placeholder="CRM Name"  required style="width:501px;"></label>
        </div>
  </div>
</div>

<!-- <div class="row">
  <label class="col-md-3 control-label">Mode Of payment</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  
  <select class="form-control" name="modepayment"  id="modepayment" required  style="width:501px;" >
           		 		 <option value="" >--------------------------------Select Mode Of payment-------------------------------</option>
					  <option value="cash"> Cash</option>
					  <option value="dcard">Debit card</option>
					  	<option value="ccard">Credit card</option>
					  	<option value="netb">NetBanking</option>
					  	<option value="upi">UPI</option>
					  	
					 
				</select>
  </label>

    </div>
  </div>
  </div> -->
  
   <div class="row">
  <label class="col-md-3 control-label">Total</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="number" class="form-control" required name="total" id="total" style="width:501px;"></label>
    </div>
  </div>
</div>
  
  <div class="row">
  <label class="col-md-3 control-label"> Paid Amount</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type=number class="form-control" required  name="PaidAmount" id="PaidAmount" onblur="addamount()" style="width:501px;" value="0"></label>
    </div>
  </div>
    
</div>
  
<div class="row">
  <label class="col-md-3 control-label">Remain Amount</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="text" class="form-control" name="RemainAmount" id="RemainAmount"  style="width:501px;" ></label>
    </div>
  </div>
    
</div>

<div class="row">
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-success">Submit</button>
	</div>
</div>
 </div>
 <p id="para"></p>
</form>
</div>
</div>   
</div>


 <script>
 
 $('#fetch').click(function(){

		var cid=$("#caseId").val()
		if(cid==''){
			alert("Case Id must be fill out")
        return false;
 	}
		else{
	    $.ajax
	    ({ 
	        url: 'AccountdataShow?query=fetchdata',
	        data: {"caseId": cid},
	        type: 'post',
	        success: function(result)
	        {
	        	var data=result;
	        	var dataarray=(data).split(',');
	        	var DoctorName=dataarray[0];
	        	var patientname=dataarray[1];
	        	var CRM=dataarray[2];
	        	var Total=dataarray[3];
	        	$("#DoctorName").val(DoctorName);
	        	$("#patientname").val(patientname);
	        	$("#CRM").val(CRM);
	        	//$("#total").val(Total);
	       }
	       
	});
		}
	});

</script>


</body>
</html>