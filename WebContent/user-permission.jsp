
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b58dabb0d1.js"
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
						<section class="users-permissions">
						<div class="container">
							<div class="header-wrap d-flex">
								<h3>Users and Permissions</h3>
								<button type="button" class="btn btn-info add-new">
									<i class="fa fa-plus"></i> Add New User
								</button>
							</div>
							<div class="table-wrap">
								<table class="table table-hover">
									<thead>
										<th scope="col">USER</th>
										<th scope="col">ROLE</th>
										<th scope="col">PERMISSIONS</th>
										<th scope="col">STATUS</th>
										<th scope="col">ACTIONS</th>
									</thead>
									<tbody>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class=" deleteIcon  material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Maintainer</td>
											<td>3D Printing, planning</td>
											<td>Pending</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class=" deleteIcon material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Editor</td>
											<td>3D Printing, planning</td>
											<td>Inctive</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="deleteIcon material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="deleteIcon material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>Ashima Gupta</td>
											<td>Admin</td>
											<td>3D Printing, planning</td>
											<td>Active</td>
											<td><a class="edit" title="Edit" data-toggle="tooltip"><i
													class="fa-solid fa-pen-to-square"></i></a> <a class="delete"
												title="Delete" data-toggle="tooltip"><i
													class="material-icons">&#xE872;</i></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						</section>
					</div>
					<script src="assets/js/custom.js"></script>
				</body>