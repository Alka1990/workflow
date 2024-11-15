<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.workflow.connection.LoginDAO"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%-- <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>   --%>
<title>:: Workflow Side Menu ::</title>
</head>
<style>
.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background:
		url('${pageContext.request.contextPath}/Images/Hourglass.gif') 50% 50%
		no-repeat rgb(249, 249, 249);
}

.badge {
	background-color: #dc481c;
}

.blink_text {
	animation: 1s blinker linear infinite;
	-webkit-animation: 1s blinker linear infinite;
	-moz-animation: 1s blinker linear infinite;
}

@
-moz-keyframes blinker { 0% {
	opacity: 1.0;
}

50
%
{
opacity
:
0.0;
}
100
%
{
opacity
:
1.0;
}
}
@
-webkit-keyframes blinker { 0% {
	opacity: 1.0;
}

50
%
{
opacity
:
0.0;
}
100
%
{
opacity
:
1.0;
}
}
@
keyframes blinker { 0% {
	opacity: 1.0;
}
50
%
{
opacity
:
0.0;
}
100
%
{
opacity
:
1.0;
}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".loader").fadeOut("fast");
		$(".loader").click(function() {
			$(this).fadeToggle("slow");
		});
	});
	$(".gif").click(function() {
		$(".loader").fadeIn("slow");
	});
</script>
<body>

	<form action="Create" method="get">

		<%
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;

		try {
			LoginDAO loginDAO = new LoginDAO();
			con = LoginDAO.getConnectionDetails();
			ps = con.prepareStatement("select count(*) from cc_crm where draft='Y'");
			rs = ps.executeQuery();
			rs.next();
			String profile = (String) session.getAttribute("profile");
			String query = "select count(*) from cc_crm where case_stage in (select stage_code from profile_stage_map where profile_id='"
			+ profile + "') and holdflag='N' and draft not in('Y')";
			ps = con.prepareStatement(query);

			rs1 = ps.executeQuery();
			rs1.next();
			ps = con.prepareStatement("select count(*) from newcase where flag='y'");
			rs2 = ps.executeQuery();
			rs2.next();
		%>

		<!-- 	<script>
$(document).ready(function(){

	  $.get("http://107.167.80.130:8080/MobileApp/rest/getAllScanningDoneForm", function(data, status){
		  var myBooks = data;
		  document.getElementById("reqcnt").innerHTML=myBooks.length;
		  
	  });
});
</script> -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

			<div class="menu_section">
				<div class="loader"></div>

				<ul class="nav side-menu">
					<input type="hidden" name="username" id="logusername"
						value='<%=request.getAttribute("username")%>' />
					<li><a class="gif" id="SubmitNewInvoice" href="Case_Stage"><i
							class="fa fa-dashboard"></i> DASHBOARD <span
							class="fa fa-chevron-right"></span></a></li>
					<%-- <%
 if(session.getAttribute("initiationFlag").equals("I")){%>
 
 		
	  <li><a  class="gif" id="sidebarcreate" href="Create"><i class="fa fa-file-o"></i> CREATE <span class="fa fa-chevron-right"></span></a>
  </li>
<%
 }
 
 %>
  --%>
  
  <%
					List<String> getRight = (ArrayList<String>) session.getAttribute("getRight");
					%>
					
					<%
					if (session.getAttribute("initiationFlag").equals("I")||getRight.contains("WFC")||getRight.contains("INI")) {
					%>


					<li><a class="gif" id="sidebarcreate" href="CreateCC"><i
							class="fa fa-file-o"></i> CREATE<span class="fa fa-chevron-right"></span></a>
					</li>
					<%
					}
					%>
<%-- 
					<%
					List<String> getRight = (ArrayList<String>) session.getAttribute("getRight");
					%> --%>
					

					<%
					if (getRight.contains("WFC") || getRight.contains("PRE") || getRight.contains("QA") ) {
					%>

					<li><a class="gif" id="sidebardraft" href="Drafts"><i
							class="fa fa-file-o"></i> DRAFTS<span class="fa fa-chevron-right"></span></a></li>
					<%}%>
					
					
						<%
					if (!getRight.contains("VO") || getRight.contains("VO")) {
					%>
							<li><a class="gif" id="sidebarcreatez" href="Newcase1"><i
							class="fa fa-file-o"></i> MY CASES<span
							class="fa fa-chevron-right"></span></a></li>
					<%}%>
					
					

					<!--                                 <li><a  class="gif" id="MyInvoice" href="View"><i class="fa fa-file-text-o"></i>View <span class="fa fa-chevron-right"></span></a>
 </li>-->


					<%--                                 <li><a   class="gif" id="sidebarpending" href="Pending"><i class="fa fa-tasks"></i> PENDING <span class="badge"><%=rs1.getString(1) %></span><span class="fa fa-chevron-right"></span></a>
 --%>




					<%
					if (session.getAttribute("sHold").equals("Y")) {
					%>

					<%
					if (getRight.contains("account")) {
					} else {
					%>

					<li><a class="gif" id="sidebarHold" href="Hold"><i
							class="fa fa-tasks"></i> HOLD / UNHOLD <span
							class="fa fa-chevron-right"></span></a></li>
					<%}%>
					<%
					}
					%>
					<!--                     <li><a   class="gif" id="sidebarfindnext" href="nextdispatch.jsp"><i class="fa fa-tasks"></i> NextDispatch Date <span class="fa fa-chevron-right"></span></a>
                 </li>
 -->

					<%--                                  <%
 if(session.getAttribute("initiationFlag").equals("I")){%>
 
 		
	  <li><a  class="gif" id="sidebarcreate" href="multifrm.jsp"><i class="fa fa-tasks"></i>Multiple Form <span class="fa fa-chevron-right"></span></a>
  </li>
<%
 }
 
 %> --%>

					<%
					if (getRight.contains("account")) {
					%>

					<li><a class="gif" id="sidebarcreate"
						href="SearchAccountNumber"><i class="fa fa-search"></i>Search
							To Update</a></li>
					<li><a class="gif" id="sidebarcreate" href="account.jsp"><i
							class="fa fa-money"></i>Add Account</a></li>
					<li><a class="gif" id="sidebarcreate"
						href="accountupdateamount.jsp"><i class="	fa fa-money"></i>Change
							Total Amount</a></li>
					<li><a class="gif" id="sidebarcreate"
						href="SearchAccountRevokeNumber"><i class="	fa fa-money"></i>Revoke
							Amount</a></li>
					

					<%
					}
					%>
					<%
					if (getRight.contains("INI")) {
					%>

					<li><a class="gif" id="sidebardraft" href="SearchPhoto"><i
							class="fa fa-picture-o" aria-hidden="true"></i>ADD / VIEW PHOTO <span
							class="fa fa-chevron-right"></span></a></li>   
								<li><a class="gif" id="sidebardraft" href="InsertImpressionServlet"><i
                            class="fa fa-file-o"></i>ADD IMPRESSION<span
                             class="fa fa-chevron-right"></span></a></li>
                           <!--   	<li><a class="gif" id="sidebardraft" href="ImpressionHistory"><i
                            class="fa fa-file-o"></i> IMPRESSION LIST<span
                             class="fa fa-chevron-right"></span></a></li>  -->               
					<%}%>
					
		<%if (getRight.contains("DPH")) {
					%>

					<li><a class="gif" id="sidebardraft" href="SearchPhoto"><i
							class="fa fa-picture-o" aria-hidden="true"></i>VIEW DOCUMENTS <span
							class="fa fa-chevron-right"></span></a></li>
							<li><a class="gif" id="dispatchedData" href="dispatchedData.jsp"><i
							class="fa fa-picture-o" aria-hidden="true"></i>CHANGE TRACKING ID <span
							class="fa fa-chevron-right"></span></a></li>
						
                    
					<%}%>


					<%
					if (getRight.contains("OTPLN")) {
					%>

					<li><a class="gif" id="sidebardraft" href="SearchPhoto"><i
							class="fa fa-picture-o" aria-hidden="true"></i>VIEW PHOTO<span
							class="fa fa-chevron-right"></span></a></li>
							
					<%}%>

				<%-- 	<%
					if (getRight.contains("DPH")) {
					%>

					<!-- <li><a class="gif" id="sidebardraft" href="barcodegenerate.jsp"><i class="fa fa-barcode" aria-hidden="true"></i>Generate Bar Code<span class="fa fa-chevron-right"></span></a></li> -->
					<li>
					<a class="gif" id="sidebardraft"
						href="ExportDeliveryDetails">
						<i class="fa fa-barcode"
							aria-hidden="true"></i>Add / EXPORT DATA
							<span
							class="fa fa-chevron-right">
							</span></a></li>


					<!-- 	<li><a class="gif" id="sidebardraft" href="ExportDeliveryDetails"><i class="fa fa-file-excel-o" aria-hidden="true"></i>Export Delivery Details<span class="fa fa-chevron-right"></span></a></li>
 -->
					<%}%> --%>
					<%
					if (!getRight.contains("VO") || getRight.contains("VO")) {
					%>

						<li><a class="gif" id="sidebarSearch" href="reports.jsp"><i
							class="fa fa-file" aria-hidden="true"></i> REPORTS</a></li>
	
<%}%>


					<li><a class="gif" id="sidebarSearch" href="SearchParam1.jsp"><i
							class="fa fa-search"></i> SEARCH </a> </li><%-- <%
 if(getRight.contains("WFC")||getRight.contains("PRE")){%>
 
	  <li><a class="gif" id="sidebardraft" href="SearchDigiComments"><i class="fa fa-comment"></i>Digi Doctor Comment <span class="fa fa-chevron-right"></span></a></li>
<%}%> --%>
				</ul>
			</div>
		</div>


		<%
		} catch (Exception e) {
		e.printStackTrace();
		} finally {

		if (rs != null) {
			// closes the database connection
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		if (ps != null) {
			// closes the database connection
			try {
				ps.close();
				ps = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		if (con != null) {
			// closes the database connection
			try {
				con.close();
				con = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		}
		}
		%>



	</form>
</body>
</html>