
<!DOCTYPE html>
<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="com.vo.ImagesVo"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page import="com.workflow.connection.LoginDAO"%>

<%
List userRights = (List) session.getAttribute("getRight");
session = request.getSession(false);
if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")) {
	response.sendRedirect("login.jsp?msg=You are not logged in..!");
}
%>

<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Images/logo.png">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="Author" name="Vikas Predhva">
<title>WorkFlow :: Image Viewer</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>




<style>
/* .box {
        
        height: 250px;
        border: 5px dashed #f7a239;
      }
      img {
        width: 100%;
        height: 100%;
      }*/
.img-rounded {
	width: 260px;
	height: 160px;
	object-fit: contain; //
	object-fit: scale-down;
	border-radius: 6px !important;
}

.img-roundedmdl {
	object-fit: contain;
}
</style>
<script>
	$(function() {
		$("#image img").on("click", function() {
			var src = $(this).attr("src");
			$(".modal-img").prop("src", src);
		})
	})
</script>

<style>
.modal-img {
	width: 100%;
}
</style>
</head>

<body class="nav-md">

	<div class="container body" style="background-color: white;">
		<div class="main_container" style="margin-top: -20px;">
			<%
			String id = request.getParameter("id");
			File file = null;
			File file1 = null;
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			String case_id = "";
			String left_photo = "";
			String right_photo = "";

			String front_photo = "";
			String front_photo1 = "";
			String breakage_photo = "";
			String upload_photo = "";
			String file_path = "";
			String typeOfRequest = "";

			String separator = "";

			try {

				LoginDAO loginDAO = new LoginDAO();
				conn = LoginDAO.getDigiConnectionDetails();

				ps = conn.prepareStatement(" select * from wisealign_case_booking where case_booking_id='" + id + "' ");
				rs = ps.executeQuery();
				if (rs.next()) {
					case_id = rs.getString("case_id");
					left_photo = rs.getString("left_photo");
					right_photo = rs.getString("right_photo");
					front_photo = rs.getString("front_photo");
					front_photo1 = rs.getString("front_photo1");
					breakage_photo = rs.getString("breakage_photo");
					upload_photo = rs.getString("upload_photo"); //used for retainer
					file_path = rs.getString("folder_name");
					typeOfRequest = rs.getString("type_of_request");
				}
				separator = File.separator;
				separator = System.getProperty("file.separator");
				separator = String.valueOf(File.separatorChar);

				/////////////////////// left_photo 
				if (left_photo != null  && !left_photo.equals("null")) {
					file = new File(file_path + separator + left_photo);
					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					left_photo = new String(encodeBase64, "UTF-8");
				}
				if (right_photo != null  && !right_photo.equals("null")) {
					file = new File(file_path + separator + right_photo);

					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					right_photo = new String(encodeBase64, "UTF-8");
				}
				if (front_photo != null  && !front_photo.equals("null")) {
					file = new File(file_path + separator + front_photo);

					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					front_photo = new String(encodeBase64, "UTF-8");
				}
				if (front_photo1 != null  && !front_photo1.equals("null")) {
					file = new File(file_path + separator + front_photo1);

					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					front_photo1 = new String(encodeBase64, "UTF-8");
				}
				if (breakage_photo != null && !breakage_photo.equals("null")) {
					
					file = new File(file_path + separator + breakage_photo);

					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					breakage_photo = new String(encodeBase64, "UTF-8");
				} else {
				}
				
				
				if (upload_photo != null  && !upload_photo.equals("null")) { //this is for Retainer photo
					file = new File(file_path + separator + upload_photo);

					//File file = new File("D:\\uploads\\1000000015_28.07.2021.12.39.38\\1.jpg");
					FileInputStream fis = new FileInputStream(file);
					//create FileInputStream which obtains input bytes from a file in a file system
					//FileInputStream is meant for reading streams of raw bytes such as image data. For reading streams of characters, consider using FileReader.
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					byte[] buf = new byte[1024];
					try {
				for (int readNum; (readNum = fis.read(buf)) != -1;) {
					//Writes to this byte array output stream
					bos.write(buf, 0, readNum);
				}
					} catch (IOException ex) {
					}
					byte[] bytes = bos.toByteArray();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					upload_photo = new String(encodeBase64, "UTF-8");
				}

				/////////////////////// end upper_img
			%>

			<div class="container" style="margin-top: 22px; width: 70%;">
				<div class="panel panel-primary">
					<div class="container" style="width: 98%;">
						<table align="center">
							<tbody>
								<tr>
									<button class="" type="button" value="searchScreen"
										onclick="window.history.back()"
										style="margin-left: -10px; color: #fff; background-color: #26B99A; border: none;">
										<i class="fa fa-arrow-left" aria-hidden="true"></i>Back
									</button>
								</tr>
								<tr align="center">

									<td align="center">
										<%
										if (left_photo != null  && !left_photo.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=left_photo%>"
															id="myImg1" width="250" height="250" class="img-rounded"
															alt="Left Photo" />
													</div>
												</a>
											</figure>
										</div> <%
 } else {
 %>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%
 }
 %>

										<h2 class="btn btn-primary">Left</h2>
									</td>

									<td align="center">
										<%
										if (right_photo != null  && !right_photo.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=right_photo%>"
															id="myImg2" width="250" height="250" class="img-rounded"
															alt="Right Photo" />
													</div>
												</a>
											</figure>
										</div> <%
 } else {
 %>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%
 }
 %>
										<h2 class="btn btn-primary">Right</h2>
									</td>
									<td width="33%" align="center">
										<%
										if (front_photo != null  && !front_photo.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=front_photo%>"
															id="myImg3" width="250" height="250" class="img-rounded"
															alt="Front Photo" />
													</div>
												</a>
											</figure>
										</div> <%
 } else {
 %>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%
 }
 %>

										<h2 class="btn btn-primary">Front</h2>
									</td>
								</tr>


								<!-- dadfsfasdf -->
								<tr>
								</tr>
								<tr align="center">

									<td align="center">
										<%
										if (front_photo1 != null  && !front_photo1.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=front_photo1%>"
															id="myImg1" width="250" height="250" class="img-rounded"
															alt="Front Photo1" />
													</div>
												</a>
											</figure>
										</div> <%
 } else {
 %>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%
 }
 %>

										<h2 class="btn btn-primary">front_photo1</h2>
									</td>

									<td align="center">
										<%
										if (breakage_photo != null  && !breakage_photo.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=breakage_photo%>"
															id="myImg2" width="250" height="250" class="img-rounded"
															alt="Breakage Photo" />
													</div>
												</a>
											</figure>
										</div> <%} else {%>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%}%>
										<h2 class="btn btn-primary">Breakage</h2>
									</td>
									<td width="33%" align="center">
										<%
										if (upload_photo != null  && !upload_photo.equals("null")) {
										%>
										<div id="image">
											<figure>
												<a class="example-image-link" href="#imagemodal"
													data-toggle="modal" data-target="#imagemodal">
													<div class="Scriptcontent">
														<img src="data:image/jpeg;base64,<%=upload_photo%>"
															id="myImg3" width="250" height="250" class="img-rounded"
															alt="Upload Photo" />
													</div>
												</a>
											</figure>
										</div> <%
 } else {
 %>
										<figure>
											<img src="Images/dummy.png" alt="dummy" class="img-rounded"
												width="250" height="250" />
										</figure> <%
 }
 %>
										<h2 class="btn btn-primary">Retainer</h2>
									</td>
								</tr>
							<tbody>
							</tbody>

						</table>

					</div>

				</div>


				<!-------------------------------------------------------------------------------------------------------------------------->












			</div>
			<!--     </div> -->
			<!-- /page content -->
		</div>
	</div>


	<!-- Button trigger modal -->
	<!-- Modal -->

	<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" style="margin-top: 10px;">
			<div class="modal-content">
				<div class="modal-header"
					style="padding: -0px; border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img class="modal-img"
						style="height: 50%; width: 100%; margin-top: -8px;" />
				</div>


			</div>
		</div>
	</div>

</body>

<%

}
catch(Exception e){
	e.printStackTrace();
	out.println("<script type=\"text/javascript\">");
	out.println("alert('The system cannot find the path specified!');");
	out.println("location='NewQueryPhotoGrid?caseId="+case_id+"&typeOfRequest="+typeOfRequest+"';");
	out.println("</script>");

}
%>
</html>