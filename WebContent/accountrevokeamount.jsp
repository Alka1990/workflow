
<!DOCTYPE html>

<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="com.vo.AccountVo"%> 
<%@page import ="java.text.SimpleDateFormat" %>
<%@page import ="java.util.Date" %>

<html lang="en">
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow :: Revoke Amount :: </title>
    
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
  <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
    <link href="${pageContext.request.contextPath}/CSS1/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

<style>
.panel-heading:hover{
cursor:pointer;
}

.glyphicon{
float:right;
margin-top:4px;
}
</style>

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
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Revoke Amount Details</div>
    <div class="panel-body">
    
    <%
HttpSession s=request.getSession();
String crm = (String) s.getAttribute("crm");   
String case_id = (String) s.getAttribute("case_id");
String doctor_name = (String)s.getAttribute("doctor_name");
String patient_name = (String)s.getAttribute("patient_name");
String payment_mode  = (String)s.getAttribute("payment_mode ");
String payment = (String)s.getAttribute("payment");
String remain_amount  = (String)s.getAttribute("remain_amount");
String submitted_amount  = (String)s.getAttribute("submitted_amount");
String paid_amount  = (String)s.getAttribute("aa");

String invoice_no  = (String)s.getAttribute("invoice_no");
String invoice_date  = (String)s.getAttribute("invoice_date");


if(invoice_no==null){
	invoice_no="";
}

if(invoice_date==null){
	invoice_date="";
}

List<AccountVo> list = (List)session.getAttribute("AccountVoList");
List<AccountVo> list1 = (List)session.getAttribute("acrvk");

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

<form class="form-verticle" method="post" action="AccountHandler?query=revokeamt" id="revokeForm">         
<div class="container">
 <div class="container" style="padding-top:20px;">
  <div class="panel panel-info" style="padding: 16px;">
   
   <div class="row">
   <div class="col-md-1"></div>
  <label class="col-md-3 control-label" >Case Id</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
  <label><input  type="text" class="form-control" name="caseid" id="caseId"  placeholder="Case ID" readonly value='<%=case_id%>' style="width:545px;  margin-top:10px"></label>

    </div>
  </div>
 
</div>


<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Plan Amount</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  readonly class="form-control" name="TotalAmount" id="TotalAmount" value='<%= payment %>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<div class="row" hidden>
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">User</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="hidden"  readonly class="form-control" name="user" id="user" value='<%= username  %>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Total Paid Amount</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  readonly class="form-control" name="paidAmount" id="paidAmount" value='<%= Integer.parseInt(payment)-Integer.parseInt(remain_amount) %>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>


<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Remain Amount</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  readonly class="form-control" name="RemainAmount" id="RemainAmount" value='<%=remain_amount%>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<!-- <div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Invoice No</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"   class="form-control" name="invoice_no" id="invoice_no"  style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Invoice Date</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="date"   class="form-control" name="invoice_date" id="invoice_date"  style="width:545px; readonly"></label>
    </div>
  </div>
</div> -->




<div class="container" style="padding-top:20px;width:98%;">
  <div class="panel panel-primary">
    <div class="panel-heading" onclick="showData('myinvoice','#dropDownIcon1')"><strong>Transaction History</strong> <i class='glyphicon glyphicon-chevron-down' id="dropDownIcon1"></i> </div>
    <div class="table-responsive">
    <table id="myinvoice" class="table table-bordered"  hidden>
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
                        <div class="table-responsive" >
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
    
      <tr role="row">
       
      <!--   <th class="sorting" >Transaction Id.</th>  -->
           <th class="sorting"> Invoice No.</th>
           <th class="sorting"> Invoice Date</th>
           <th class="sorting">Mode of Payment</th>
            <th class="sorting">Paid Amount</th>
          <!--          <th class="sorting"> Total Paid Amount</th>  -->
                   <th class="sorting"> Revoke Amount</th>
                 <th class="sorting"> Plan Amount</th>
                   <th class="sorting">Remarks</th>
                   <th class="sorting">User</th>
                    <th class="sorting">Date</th>
      </tr>
    </thead>
    
        <tbody>
     <% if(list==null){%>
    
    <tr class="even" role="row">
			    <TD colspan="7" align="center"><b> No Data Found<i class="fa fa-exclamation" ></i></b></TD>
			    </tr>
     <%  }else{
 
     int i=0;

for(AccountVo AccountVo1:list){
	
	String paymentMode="";
	paymentMode=AccountVo1.getModepayment();
	String caseid=AccountVo1.getCaseid();
	String account_id=AccountVo1.getAccount_id();
	String revoke_amount=AccountVo1.getRevoke_amount();
	
	String PaidAmt=AccountVo1.getPaidAmount();
	String  SubmittedAmt=AccountVo1.getSubmitted_amount() ;
	String accountremarks=AccountVo1.getRemarks();
	String user = AccountVo1.getUser();
	
	String Invoice_no=AccountVo1.getInvoice_no();
	String Invoice_date=AccountVo1.getInvoice_date();
	
	if(Invoice_no==null){
		Invoice_no="";
	}

	if(Invoice_date==null){
		Invoice_date="";
	}
	if(PaidAmt==null){
		PaidAmt="";
	}
	
	if(user==null){
		user="";
	}
	
	if(accountremarks==null){
		accountremarks="";
	}
	if(SubmittedAmt==null){
		SubmittedAmt="";
	}
	
	if(revoke_amount==null){
		revoke_amount="";
	}
	if(paymentMode==null){
		paymentMode="";
	}
	
	if(paymentMode.equals("cash")){
		paymentMode="Cash";
	}
	if(paymentMode.equals("dcard")){
		paymentMode="Debit Card";
	}
	if(paymentMode.equals("ccard")){
		paymentMode="Credit Card";
	}
	if(paymentMode.equals("netb")){
		paymentMode="NetBanking";
	}
	if(paymentMode.equals("upi")){
		paymentMode="UPI";
	}
	
	i++;	
	
	//int pp=Integer.parseInt(AccountVo1.getSubmitted_amount());
	// account_id=AccountVo1.getAccount_id();
%>

		<tr class="even" role="row">
		<TD> <%=Invoice_no %></TD>  
		<TD> <%=Invoice_date %></TD>  
			 <!--    <TD><%=account_id %></TD> -->
                 <TD><%=paymentMode %></TD>   	
                 <TD><%= PaidAmt %></TD> 
  			 <!--     <TD> <%= SubmittedAmt  %></TD>    -->
  			      <TD> <%= revoke_amount %></TD>   
  			     <TD> <%= AccountVo1.getTotal() %></TD>   
  			        <TD> <%=accountremarks %></TD>  
  			        <TD> <%=user %></TD>  
  			       <TD> <%= AccountVo1.getDate()%></TD>
			</tr>
<%} }%>
  </tbody>
  </table>		
  </div>
  </div>

</td>
 </tr>
 </thead>
 </table>	
  </div>
  </div>
  </div>


 <!-- change amount -->
 <div class="container" style="padding-top:20px;width:98%;">
  <div class="panel panel-primary">
    <div class="panel-heading"  onclick="showData('changeValue','#dropDownIcon2')"><strong>Change In Total Amount</strong> <i class='glyphicon glyphicon-chevron-down' id="dropDownIcon2"></i></div>
    <div class="table-responsive"  hidden id="changeValue">
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
         <th class="sorting"> Invoice No.</th>
           <th class="sorting"> Invoice Date</th>
        <th class="sorting">Case Id.</th>
                           <th class="sorting">Previous Amount</th>
                      <th class="sorting">New Amount</th>
                    <th class="sorting"> Reason</th>
                    <th class="sorting"> User</th>
                    <th class="sorting">Date</th>
      </tr>
    </thead>
    
        <tbody>
   <% if(list1==null){%>
    
    <tr class="even" role="row">
			    <TD colspan="5" align="center"><b> No Data Found<i class="fa fa-exclamation" ></i></b></TD>
			    </tr>
     <%  }else{

for(AccountVo ac1:list1){

String Invoice_no=ac1.getInvoice_no();
	String Invoice_date=ac1.getInvoice_date();
	
	if(Invoice_no==null){
		Invoice_no="";
	}

	if(Invoice_date==null){
		Invoice_date="";
	}%>

		<tr class="even" role="row">
		<TD> <%=Invoice_no %></TD>  
		<TD> <%=Invoice_date %></TD>  
		 <TD style="width:20%;"><%= ac1.getCaseid()%></TD> 
                 <TD><%= ac1.getPrevious_amount()%></TD> 
  			     <TD> <%=ac1.getNew_amount() %></TD>   
  			     <TD> <%=ac1.getRemarks() %></TD>
  			     <TD> <%if(ac1.getUser()==null){out.println("");}else{out.println(ac1.getUser());} %></TD>  
  			     <TD> <%=ac1.getDate() %></TD> 
			</tr>
<% } } %> 
  </tbody>
  </table>		
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
  
<div class="row" >
 <div class="col-md-1"></div>
  <label class="col-md-3 control-label">Revoke Amount</label>  
  <div class="col-lg-8 ">
  <div class="input-group">	
  <label><input class="form-control col-lg-8" type="number" class="form-control" name="RevAmount" id="RevAmount"  style="width: 545px;" placeholder="Revoke Amount" ></label>
    </div>
  </div>
</div>

    <div class="row">
     <div class="col-md-1"></div>
  
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	<label><input type="text"  class="form-control" name="remarks" id="Remarks"   required style="width:545px; "></label>
    </div>
  </div>
    
</div>

 <div class="col-md-12">
	<div class="text-center">
	<button type="submit" value="Save" class="btn btn-primary" id="saveRevokeForm">Click to Revoke</button>
	</div>
</div> 
<br><br>

</div>
</div>   
</div>



</form>

<script>
$(document).ready(function(){
	$("#revokeForm").submit(function(e){
		e.preventDefault();
		var planAmount = parseInt($("#TotalAmount").val());
		var remainAmount = parseInt($("#RemainAmount").val());
		var revokeAmount = parseInt($("#RevAmount").val());
		var check = revokeAmount<=planAmount-remainAmount;
		if(check==false){
			alert("Revoke amount is higger than paid amount!");
		}else{
			$(this).unbind('submit').submit()
		}
	});
});
</script>



<script>
function showData(element, icon){
	var table = document.getElementById(element);
	if($(table).is(":visible") == true){
		$(icon).removeClass("glyphicon glyphicon-chevron-up").addClass("glyphicon glyphicon-chevron-down");
	}else{
		$(icon).removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
	}
	$(table).toggle();
	
}
</script>


</body>
</html>