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
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
<%--     <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 --%> <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
   <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
 

<%
HttpSession s=request.getSession();
String case_id = (String) s.getAttribute("case_id");
String total = (String)s.getAttribute("total1");
String subamount = (String)s.getAttribute("subamount");

String username = (String)s.getAttribute("userid");
// System.out.println("testing "+username);
// String firstname = "";
// String middlename = "";
// String lastname = "";

// Connection connection = LoginDAO.getConnectionDetails();
// PreparedStatement preparedStatement = connection.prepareStatement("select * from user_mstr where User_id='"+username+"'");
// ResultSet resultSet = preparedStatement.executeQuery();
// if(resultSet.next()){
// 	firstname = resultSet.getString("First_name");
// 	middlename = resultSet.getString("Middle_name");
// 	lastname = resultSet.getString("Last_name");
// }
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
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Account</div>
    <div class="panel-body">
<form class="form-verticle" action="SaveAccount" method="post" id="saveAccountForm" >
             

<div class="row" style="margin-top:10px;">
  <label class="col-md-3 control-label">Case ID</label>  
  <div class="col-lg-8 ">
  <div class="input-group">	
  <label><input  type="text" class="form-control col-lg-8" name="caseid" id="caseId"   maxlength="12" placeholder="Case ID"  required style="width: 499px;" ></label>
    </div>
  </div>
  
  <div class="col-lg-1 ">
  <div class="input-group">
  <label> <button type="button" class="btn btn-primary" style="margin-left: -97px;" id="fetch">Fetch Data</button></label>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Doctor Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
 <label><input type="text" class="form-control" name="DoctorName" id="DoctorName" readonly placeholder="Doctor Name"  style="width:501px;"></label>
    </div>
  </div>
</div>

<div class="row" hidden>
  <label class="col-md-3 control-label">User</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
 <label><input type="hidden" class="form-control" name="user" id="user" readonly style="width:501px;" value='<%= username  %>'></label>
    </div>
  </div>
</div>


<div class="row">
  <label class="col-md-3 control-label">Patient Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="PatientName" id="patientname" readonly placeholder="Patient Name"  required style="width:501px;"></label>
        </div>
  </div>
</div>


<div class="row">
  <label class="col-md-3 control-label">CRM Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="CRM" id="CRM" placeholder="CRM Name" readonly required style="width:501px;"></label>
        </div>
  </div>
</div>

<div class="row">
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
						<option value="Viraavya">Viraavya</option>
					  	
					 
				</select>
  </label>

    </div>
  </div>
  </div>
  
  <div class="row">
  <label class="col-md-3 control-label">Total</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="number" class="form-control" required name="total" id="total" style="width:501px;"></label>
    </div>
  </div>
</div>

  <div class="row">
  <label class="col-md-3 control-label">Billing Amount</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="text" class="form-control" required name="billingAmount" id="billingAmount" readonly style="width:501px;"></label>
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
  		<label><input type="text" class="form-control" name="RemainAmount" readonly id="RemainAmount"  style="width:501px;" ></label>
    </div>
  </div>
    
</div>

<div class="row">
  <label class="col-md-3 control-label">Invoice No</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="text" class="form-control" name="invoice_no" id="invoice_no"  style="width:501px;" ></label>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Invoice Date</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="date" class="form-control" name="invoice_date"  id="invoice_date"  style="width:501px;" ></label>
    </div>
  </div>
</div>



<div class="row">
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div>
 </div>
 <p id="para"></p>
</form>
</div>
</div>   
</div>


<script>
 $(document).ready(function(){
 	$("#saveAccountForm").submit(function(e){
 		e.preventDefault();
 		var planAmount = parseInt($("#total").val());
 		var paidAmount = parseInt($("#PaidAmount").val());
 		var check = paidAmount<=planAmount;
 		if(check==false){
 			alert("Paid amount should be less than plan amount!");
 		}else{
 			$(this).unbind('submit').submit()
 		}
 	});
 });
</script>


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
	        	if(result.includes("Case_ID_Not_Present")){
	        		alert("Case id "+cid+" does not exists!");	
	        	}else{
	        	var data=result;
	        	var dataarray=(data).split(',');
	        	var DoctorName=dataarray[0];
	        	var patientname=dataarray[1];
	        	var CRM=dataarray[2];
	        	var Total=dataarray[3];
	        	var billingAmount = dataarray[5];
	        	$("#DoctorName").val(DoctorName);
	        	$("#patientname").val(patientname);
	        	$("#CRM").val(CRM);
	        	$("#billingAmount").val(billingAmount);
	        	}
	        	//$("#total").val(Total);

	       }
	       
	});
		}
	});
 
 function total(){
	 var totalamount=document.getElementById("total").value;
	document.getElementById("RemainAmount").value =totalamount;						
 }
 
function remainamount(){
var x=0;
var totalamount=document.getElementById("total").value;
var paidamount=document.getElementById("PaidAmount").value;
var remainpayment=parseFloat(totalamount)- parseFloat(paidamount);
	document.getElementById("RemainAmount").value =remainpayment;						
}

// function addamount(){
// 	remainamount();
// 	var totalamount=document.getElementById("total").value;
// 	var paidamount=document.getElementById("PaidAmount").value;
	
// 	if(paidamount>totalamount ){
// 		alert("Paid Amount cannot be greater than Total amount java");
// 		return false;
// 	}
	
// }

 $("#total").on("keyup keydown keypress",function(){
	 var totalamount=document.getElementById("total").value;
	 document.getElementById("RemainAmount").value =totalamount;	
	}); 
 
 $("#total").blur(function(){					
	 $("#PaidAmount").focus();
	}); 
 
 $("#PaidAmount").on("keyup keydown keypress",function(){					
	 var totalamount=document.getElementById("total").value;
	 var paidAmount=document.getElementById("PaidAmount").value;
	 document.getElementById("RemainAmount").value =totalamount-paidAmount;
	}); 
 
 $
 
</script>
</body>
</html>