
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/favicon.ico">

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Workflow</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">
<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/customized.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<link rel="stylesheet" href="script/accordion.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="JavaScript/bootstrap.js"></script>

<script src="JavaScript/custom.js"></script>
<script type="text/javascript" class="init"></script>

<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>

<style>
.clr {
	background: #EDEDED;
}
</style>

</head>

<body class="nav-md">


	<form name="MyInvoiceForm" id="MyInvoiceForm">
		<%-- <form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >
	--%>
		<div class="container body">
			<div class="main_container">
				<div class="col-md-3 left_col">
					<div class="left_col scroll-view">
						<!-- Top Bar -->
						<%@ include file="TopBar.jsp"%>
						<!-- Top Bar -->
						<!-- menu prile quick info -->

						<%@ include file="LeftTopSide.jsp"%>
						<!-- /menu prile quick info -->


						<!-- sidebar menu -->
						<%@ include file="SideBar.jsp"%>
						<!-- /sidebar menu -->
					</div>
				</div>

				<!-- top navigation -->
				<%@ include file="TopNavigation.jsp"%>
				<!-- /top navigation -->

				<body>
					<div class="right_col" role="main">
						<section class="add-user">
						<div class="container">
							<h3>Add User</h3>
							<span>User Details</span>
							<form>
								<div class="form-row">
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault01" placeholder="First name" />
									</div>
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault02" placeholder="Middle name" />
									</div>
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault02" placeholder="Last name" />
									</div>
								</div>
								<div class="form-row">
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault01" placeholder="Profile Id" />
									</div>
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault02" placeholder="Password" />
									</div>
									<div class="col-sm-4 mb-3">
										<input type="text" class="form-control"
											id="validationDefault02" placeholder=" Email" />
									</div>
								</div>
								<button class="btn btn-primary" type="submit">Save</button>
							</form>
						</div>
						</section>
						<section class="user-permission">
						<div class="container">
							<span>User Permissions</span>
							<form>
								<select class="col-sm-4 form-control">
									<option value="volvo">User Id</option>
									<option value="saab"></option>
									<option value="opel"></option>
									<option value="audi"></option>
								</select> <br />
								<br />
								<div class="user-choice d-flex">
									<fieldset>
										<div>
											<input type="checkbox" id="coding" name="interest"
												value="coding" /> <label for="coding">Case
												Initiation</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">3D
												Printing</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Account</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Cad
												Biasing Segmentation</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Dispatch</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Finishing
												Quality Check</label>
										</div>
									</fieldset>
									<fieldset>
										<div>
											<input type="checkbox" id="coding" name="interest"
												value="coding" /> <label for="coding">Case
												Initiation</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">3D
												Printing</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Account</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Cad
												Biasing Segmentation</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Dispatch</label>
										</div>
										<div>
											<input type="checkbox" id="music" name="interest"
												value="music" /> <label for="music">Finishing
												Quality Check</label>
										</div>
									</fieldset>
								</div>
								<button class="btn btn-primary" type="submit">Save</button>
							</form>
						</div>
						</section>
					</div>
				</body>