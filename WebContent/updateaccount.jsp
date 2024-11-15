
<!DOCTYPE html>

<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="com.vo.AccountVo"%> 
<%@page import="com.workflow.connection.LoginDAO"%> 
 
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow :: Account Update :: </title>
    
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
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;"> Update Account Details</div>
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
String billingAmount = (String)s.getAttribute("billingAmount");

String invoice_no  = (String)s.getAttribute("invoice_no");
String invoice_date  = (String)s.getAttribute("invoice_date");

if(invoice_no==null)
	invoice_no="";
else
	invoice_no  = (String)s.getAttribute("invoice_no");
if(invoice_date==null)
	invoice_date="";
else
	invoice_date  = (String)s.getAttribute("invoice_date");

if(billingAmount==null)
	billingAmount = "0";

String paid_amount  = (String)s.getAttribute("aa");

List<AccountVo> list = (List)session.getAttribute("AccountVoList");
List<AccountVo> list1 = (List)session.getAttribute("ac");

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

<form class="form-verticle" action="UpdateAccount" method="post" id="updateForm">         
<div class="container">
<form action="" method=post>
 <div class="container" style="padding-top:20px;">
  <div class="" style="padding: 16px;"><!-- panel panel-info -->
   
   <div class="row">
   <div class="col-md-1"></div>
  <label class="col-md-3 control-label" >Case Id</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
  <label><input  type="text" class="form-control" name="caseid" id="caseId" readonly  placeholder="Case ID"  value='<%=case_id%>' style="width:545px;  margin-top:10px"></label>

    </div>
  </div>
</div>

<div class="row">
   <div class="col-md-1"></div>
  <label class="col-md-3 control-label">Doctor Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
 <label><input type="text" class="form-control" name="DoctorName" id="DoctorName" readonly placeholder="Doctor Name"  value='<%=session.getAttribute("dname")%>'  style="width:545px;"></label>
    </div>
  </div>
</div>


<div class="row">
   <div class="col-md-1"></div>

  <label class="col-md-3 control-label">Patient Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="PatientName" id="patientname" readonly placeholder="Patient Name" value='<%=session.getAttribute("pname")%>' style="width:545px;"></label>
        </div>
  </div>
</div>


<div class="row">
   <div class="col-md-1"></div>

  <label class="col-md-3 control-label">CRM Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="CRM" id="CRM" readonly  value='<%=session.getAttribute("crmname")%>'placeholder="CRM Name" style="width:545px;"></label>
        </div>
  </div>
</div>
<div class="row">
   <div class="col-md-1"></div>

  <label class="col-md-3 control-label">Plan Amount</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<label><input type="number"    class="form-control" maxlength="10"  name="total" id="total" readonly value='<%=payment%>' style="width:545px;"></label>
    </div>
  </div>
    
</div>

<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Total Paid Amount</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  readonly class="form-control" name="TotalAmount" id="TotalAmount" value='<%=  Integer.parseInt(payment)-Integer.parseInt(remain_amount) %>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Billing Amount</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  readonly class="form-control" name="billingAmount" id="billingAmount" value='<%=  billingAmount %>' style="width:545px; readonly"></label>
    </div>
  </div>
</div>

<div class="row" hidden>
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">User</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="hidden"  readonly class="form-control" name="user" id="user" value='<%= username %>' style="width:545px; readonly"></label>
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
<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Invoice No</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="text"  class="form-control" name="invoice_no" id="invoice_no"  style="width:545px; "></label>
    </div>
  </div>
</div>
<div class="row">
<div class="col-md-1"></div>
  <label class="col-md-3 control-label">Invoice Date</label>  
  <div class="col-md-1 ">
  <div class="input-group">
  		<label><input type="date"    class="form-control" name="invoice_date" id="invoice_date"  style="width:545px; "></label>
    </div>
  </div>
</div>
 
<div class="container" style="padding-top:20px;width:98%;">
  <div class="panel panel-primary">
    <div class="panel-heading" onclick="showData('myinvoice','#dropDownIcon1')"><strong>Transaction History</strong> <i class='glyphicon glyphicon-chevron-down' id="dropDownIcon1"></i> </div>
    <div class="table-responsive" >
		<table class="fontTable" align="center">	
	<input type="hidden" name="username" id="logusername" value='<%=request.getAttribute("username")%>'/>
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
	
		</table>

 
    <table id="myinvoice" class="table table-bordered" hidden>
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
                        <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
    
      <tr role="row">
       
       <!--  <th class="sorting">Transaction Id.</th> -->
       <th class="sorting"> Sr.No.</th>
           <th class="sorting"> Invoice No.</th>
                    <th class="sorting"> Invoice Date</th>
         <th class="sorting">Mode of Payment</th>
            <th class="sorting">Paid Amount</th>
                  <!--  <th class="sorting"> Total Paid Amount</th> -->
                    <th class="sorting"> Revoke Amount</th>
                    <th class="sorting">Total Amount</th>
                    <!--  <th class="sorting"> Change Total Amount</th> -->
                            <th class="sorting">Billing Amount</th>
    
                    <th class="sorting">Remarks</th>
                    <th class="sorting">User</th>
                    <th class="sorting">Date</th>
      </tr>
    </thead>
    
        <tbody>
    <% if(list.size()==0){%>
    
    <tr class="even" role="row">
			     <TD colspan="11" align="center"><b> No Data Found<i class="fa fa-exclamation" ></i></b></TD>
			    </tr>
     <%}else{  
     int i=0;

for(AccountVo AccountVo1:list){
	
	String paymentMode="";
	paymentMode=AccountVo1.getModepayment();
	String caseid=AccountVo1.getCaseid();
	String account_id=AccountVo1.getAccount_id();
	String PaidAmt=AccountVo1.getPaidAmount();
	String  SubmittedAmt=AccountVo1.getSubmitted_amount() ;
	String revoke_amount=AccountVo1.getRevoke_amount();
	String accountremarks=AccountVo1.getRemarks();
	String user=AccountVo1.getUser();
	String invoiceDate = AccountVo1.getInvoice_date();
	String invoiceNo = AccountVo1.getInvoice_no();
	String billing_amount = AccountVo1.getBillingAmount();
	
	String Invoice_no=AccountVo1.getInvoice_no();
	
	String Invoice_date=AccountVo1.getInvoice_date();
	
	if(accountremarks==null){
		accountremarks="";
	}
	if(Invoice_no==null){
		Invoice_no="";
	}

	if(Invoice_date==null){
		Invoice_date="";
	}
	if(user==null){
		user="";
	}
	if(revoke_amount==null){
		revoke_amount="";
	}
	if(PaidAmt==null){
		PaidAmt="";
	}
	if(SubmittedAmt==null){
		SubmittedAmt="0";
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
	if(invoiceDate==null){
		invoiceDate="";
	}
	if(invoiceNo==null){
		invoiceNo="";
	}
	if(billing_amount==null){
		billing_amount="";
	}
	
	i++;	
	
/* 	int pp=Integer.parseInt(AccountVo1.getSubmitted_amount());
	 account_id=AccountVo1.getAccount_id();
 */
%>


		<tr class="even" role="row">
		
		<TD><%=i %></TD>
			<!--    <TD><%=account_id %></TD> -->
			<TD> <%=Invoice_no %></TD>  
		<TD> <%=Invoice_date %></TD>  
                 <TD><%=paymentMode %></TD>   	
                  <TD><%= PaidAmt %></TD>
  			   <!--  <TD> <%= SubmittedAmt  %></TD>  -->  
  			      <TD> <%= revoke_amount %></TD>   
  			      <TD> <%= AccountVo1.getTotal() %></TD> 
  			      <TD> <%= billing_amount %></TD> 
  			      
  			        <TD> <%=accountremarks %></TD>  
  			       <TD> <%= user%></TD>
  			       <TD> <%= AccountVo1.getDate()%></TD>
			</tr>
<% }}%>
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
  
 <!-- change amount -->
 <div class="container" style="padding-top:20px;width:98%;">
  <div class="panel panel-primary">
    <div class="panel-heading"  onclick="showData('changeValue','#dropDownIcon2')"><strong>Change In Total Amount</strong> <i class='glyphicon glyphicon-chevron-down' id="dropDownIcon2"></i></div>
    <div class="table-responsive" id="changeValue" hidden>
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
       
        <th class="sorting">Case Id.</th>
                           <th class="sorting">Previous Amount</th>
                      <th class="sorting">New Amount</th>
                    <th class="sorting"> Reason</th>
                   
                    <th class="sorting"> User</th>
                    
                    <th class="sorting">Date</th>
      </tr>
    </thead>
    
        <tbody>
     <%
          
     if(list1.size()==0){%>
    
    <tr class="even" role="row">
			     <TD colspan="6" align="center"><b> No Data Found<i class="fa fa-exclamation" ></i></b></TD>
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
	}
%>
		<tr class="even" role="row">
		
		 <TD><%= ac1.getCaseid()%></TD> 
                 <TD><%= ac1.getPrevious_amount()%></TD> 
  			     <TD> <%=ac1.getNew_amount() %></TD>   
  			     <TD> <%=ac1.getRemarks() %></TD>  

  			     
  			     <TD> <% if(ac1.getUser()==null){out.println("");}else{out.println(ac1.getUser());} %></TD>  
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
  <div class="row">
     <div class="col-md-1"></div>
  
  <label class="col-md-3 control-label"> Paid Amount</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	<label><input type="number"  class="form-control" name="PaidAmount" id="PaidAmount"   maxlength="10" required  style="width:545px; "></label>
    </div>
  </div>
    
</div>
  <div class="row">
     <div class="col-md-1"></div>
  
  <label class="col-md-3 control-label">Mode Of payment</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="form-control" name="modepayment" id="modepayment" required style="width:545px;">
           		 		 <option value="">-----------------------------------select mode of payment-------------------------------------</option>
					     <option value="cash">Cash</option>
					     <option value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option>
					 	 <option value="netb">NetBanking</option>
					 	 <option value="upi">UPI</option>
						 <option value="Viraavya">Viraavya</option>		 
	</select>
  </label>
  </div>
  </div>
  </div>
    <div class="row">
     <div class="col-md-1"></div>
  
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	<label><input type="text"  class="form-control" name="Remarks" id="Remarks"   required style="width:545px; "></label>
    </div>
  </div>
    
</div>

 <div class="col-md-12">
	<div class="text-center">
	<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
<br><br>
</form>
</div>
</div>   
</div>



</form>

<script>
$(document).ready(function(){
	$("#updateForm").submit(function(e){
		e.preventDefault();
		var remainAmount = parseInt($("#RemainAmount").val());
		var paidAmount = parseInt($("#PaidAmount").val());
		var check = paidAmount<=remainAmount;
		if(check==false){
			alert("Payment is more than remaining amount!");
		}else{
			$(this).unbind('submit').submit()
		}
	});
});
</script>




<script>
function remainamount(){
var x=0;
var paidamount=document.getElementById("PaidAmount").value;
  var remaimamount=document.getElementById("RemainAmount").value; 
	//alert("paidamount :: "+paidamount+" remaimamount :: "+remaimamount)
  if(paidamount>remaimamount){
	alert("Paid Amount  greater than Remain amount ");
	return false;
 
}

}

function totalPaidAmount(){
	var pttable=document.getElementById("myinvoice");                       
	 var Row = pttable.rows.length;
	var paidamount1 = 0;
	var paidamount=document.getElementById("PaidAmount").value;
	 for(var n=1;n<Row;n++){
			{	
				paidamount1 =  parseFloat(paidamount) + parseFloat(pttable.rows[n].childNodes[2].childNodes[0].value);								
			}
			document.getElementById("invoiceTotal").value=paidamount1;						 	
	
}
}
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