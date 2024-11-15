<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drag and Drop images</title>
<!-- CSS only -->
<link href="css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js">
<!-- JavaScript Bundle with Popper -->
	<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<%
String case_id = request.getParameter("caseId");
String doctorname = request.getParameter("doctorname");
String patient_Name = request.getParameter("patient_Name");
String clinicname = request.getParameter("clinicname");


if (case_id == null) {
	case_id = "";
} else {
	case_id = request.getParameter("caseId");
}
if (doctorname == null) {
	doctorname = "";
} else {
	doctorname = request.getParameter("doctorname");
}
if (patient_Name == null) {
	patient_Name = "";
} else {
	patient_Name = request.getParameter("patient_Name");
}
if (clinicname == null) {
	clinicname = "";
} else {
	clinicname = request.getParameter("clinicname");
}
%>


<script>
	function validateUpload() {
		var case_id = document.getElementById('case_id').value;
		var doctor_name = document.getElementById("doctor_name");
		var patient_name = document.getElementById("patient_name");
		var clinic_name = document.getElementById("clinic_name");
		var options = document.getElementById("options");

		var img_1 = document.getElementById('img_1');
		var FileUploadPath1 = img_1.value;

		var img_2 = document.getElementById('img_2');
		var FileUploadPath2 = img_2.value;

		var img_3 = document.getElementById('img_3');
		var FileUploadPath3 = img_3.value;

		var img_4 = document.getElementById('img_4');
		var FileUploadPath4 = img_4.value;

		var img_5 = document.getElementById('img_5');
		var FileUploadPath5 = img_5.value;

		var img_6 = document.getElementById('img_6');
		var FileUploadPath6 = img_6.value;

		var img_7 = document.getElementById('img_7');
		var FileUploadPath7 = img_7.value;

		var img_8 = document.getElementById('img_8');
		var FileUploadPath8 = img_8.value;

		var pdf = document.getElementById('pdf');
		var FileUploadPath9 = pdf.value;

		if (case_id == '') {
			alert('Please Enter Case Id');
			return false;
		} else if (doctor_name == '') {
			alert('Please Enter Doctor Name');
			return false;
		} else if (patient_name == '') {
			alert('Patient Name');
			return false;
		} else if (clinic_name == '') {
			alert('Please Enter Clinic Name');
			return false;
		} else if (options == '') {
			alert('Please Enter select Menu');
			return false;
		}

		/*     	 else  if (FileUploadPath1 == '') {
		 alert("Please upload Upper Photo");
		 return false;
		 }
		 else  if (FileUploadPath2 == '') {
		 alert("Please upload Lower Photo");
		 return false;
		 }
		 else  if (FileUploadPath3 == '') {
		 alert("Please upload Front Photo");
		 return false;
		 }
		 else  if (FileUploadPath4 == '') {
		 alert("Please upload Left Photo");
		 return false;
		 }
		 else  if (FileUploadPath5 == '') {
		 alert("Please upload Rigth Photo");
		 return false;
		 }
		 else  if (FileUploadPath6 == '') {
		 alert("Please upload Simple Photo");
		 return false;
		 }
		 else  if (FileUploadPath7 == '') {
		 alert("Please upload Smile Photo");
		 return false;
		 }
		 else  if (FileUploadPath8 == '') {
		 alert("Please upload Side Photo");
		 return false;
		 }
		 else  if (FileUploadPath9 == '') {
		 alert("Please upload Pdf file");
		 return false;
		 }
		 return true; */
	}

	function show(input) {
		debugger;
		//var validExtensions = ['jpg','jpeg']; //array of valid extensions
		var validExtensions = [ 'pdf' ]; //array of valid extensions
		var fileName = input.files[0].name;
		var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1);
		if ($.inArray(fileNameExt, validExtensions) == -1) {
			input.type = ''
			input.type = 'file'
			/*  $('#img_1').attr('src',"");
			 $('#img_2').attr('src',"");
			 $('#img_3').attr('src',"");
			 $('#img_4').attr('src',"");
			 $('#img_5').attr('src',"");
			 $('#img_6').attr('src',""); 
			 $('#img_7').attr('src',"");*/
			$('#pdf').attr('src', "");
			alert("Only this file type is accepted : "
					+ validExtensions.join(', '));
		} else {
			if (input.files && input.files[0]) {
				var filerdr = new FileReader();
				filerdr.onload = function(e) {
					$('#user_img').attr('src', e.target.result);
				}
				filerdr.readAsDataURL(input.files[0]);
			}
		}
	}
</script>
<style>
form>button {
	-webkit-appearance: none;
	cursor: pointer;
	font-family: 'Montserrat', sans-serif;
	font-weight: 600;
	padding: 1rem 2rem;
	border: none;
	background-color: #50ce7d;
	color: #fff;
	text-transform: uppercase;
	display: block;
	margin: 2rem 0 2rem auto;
	font-size: 1em;
}

.container {
	padding: 12px 15px;
}

.box {
	position: relative;
	background: #ffffff;
	width: 100%;
}

.form-control {
	font-size: 1rem;
	padding: 5px 5px;
	min-height: auto;
}

.box-header {
	color: #444;
	display: block;
	padding: 10px;
	position: relative;
	border-bottom: 1px solid #f4f4f4;
	margin-bottom: 10px;
}

.box-tools {
	position: absolute;
	right: 10px;
	top: 5px;
}

.dropzone-wrapper {
	border: 2px dashed #91b0b3;
	color: #dc3545;
	position: relative;
	height: 150px;
}

.dropzone-desc {
	position: absolute;
	margin: 0 auto;
	left: 0;
	right: 0;
	text-align: center;
	width: 40%;
	top: 50px;
	font-size: 16px;
}

.btn {
	padding: 5px 20px;
}

.dropzone, .dropzone:focus {
	position: absolute;
	outline: none !important;
	width: 100%;
	height: 150px;
	cursor: pointer;
	opacity: 0;
}

.dropzone-wrapper:hover, .dropzone-wrapper.dragover {
	background: #ecf0f5;
}

.preview-zone {
	text-align: center;
	padding: 0;
}

.preview-zone .box {
	box-shadow: none;
	border-radius: 0;
	margin-bottom: 0;
}

.border {
	position: relative;
	height: 150px;
	border: 2px dashed #91b0b3;
	background: #fff;
	border: 2px dashed #c2cdda;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.drag-drop {
	max-width: 992px;
	margin: 0 auto;
}

.drag-drop-wrap {
	padding: 20px 0;
}

.form-group {
	margin-bottom: 8px;
}

.form-group label {
	margin-bottom: 8px;
}

@media screen and (min-width:575px) {
	.dropzone-wrapper {
		height: 185px;
	}
	.border {
		width: 100%;
		height: 185px;
	}
	.drag-drop-wrap h1 {
		margin-bottom: 20px;
	}
}

@media screen and (min-width:992px) {
	.dropzone-wrapper {
		height: 220px;
	}
	.border {
		height: 220px;
	}
}
</style>


</head>
<body>
	<section class="drag-drop-wrap">

	<form action="UploadImages" method="post" enctype="multipart/form-data"
		onsubmit="return validateUpload()">
		<h1 class="text-center">Drag and Drop Images</h1>
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group mb-3">
						<label for="input1">Case Id</label> <input type="text" required
							pattern="[0-9]{10,10}" class="form-control form-control-lg"
							name="case_id" id="case_id" placeholder="Case Id"
							value="<%=case_id%>">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group mb-3">
						<label for="input2">Doctor Name</label> <input type="text"
							required class="form-control form-control-lg" name="doctor_name"
							id="doctor_name" placeholder="Doctor Name"
							value="<%=doctorname%>">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group mb-3">
						<label for="input1">Patient Name</label> <input type="text"
							class="form-control form-control-lg" name="patient_name"
							id="patient_name" placeholder="Patient Name"
							value="<%=patient_Name%>">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group mb-3">
						<label for="input2">Clinic Name</label> <input type="text"
							class="form-control form-control-lg" name="clinic_name"
							id="clinic_name" placeholder="ClinicName" value="<%=clinicname%>">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group mb-3">
						<label for="input1">Menu</label> <select
							class="form-select input-field aria-label" name="options"
							id="options">
							<!--  <option >Select Menu</option> -->
							<option value="NEW">New</option>
							<option value="MID">Mid</option>
						</select>
					</div>
				</div>
			</div>

			<br>

			<div class="row p-2 drag-drop">
				<div class="col-md-12">

					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc ">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_1" id="img_1" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>
							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Upper</h2>
					</label>
				</div>
			</div>
			<br>
			<!-- end row1 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_2" id="img_2" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>

					<label class="control-label"><h2
							class="btn btn-primary mt-2">Lower</h2></label>

				</div>
			</div>
			<!-- end row2 -->
			<br>
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_3" id="img_3" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>

					<label class="control-label"><h2
							class="btn btn-primary mt-2">Front</h2></label>

				</div>
			</div>
			<br>
			<!-- end row3 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_4" id="img_4" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Left</h2>
					</label>

				</div>
			</div>
			<br>
			<!-- end row4 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_5" id="img_5" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Right</h2>
					</label>

				</div>
			</div>
			<br>
			<!-- end row5 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_6" id="img_6" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>


					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Simple</h2>
					</label>

				</div>
			</div>
			<br>
			<!-- end row6 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_7" id="img_7" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Smile</h2>
					</label>
				</div>

			</div>
			<br>
			<!-- end row7 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">

					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop files here or click to browse</p>
							</div>
							<input type="file" name="img_8" id="img_8" class="dropzone"
								accept="image/png , image/jpg , image/jpeg">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>

							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">Side</h2>
					</label>
				</div>
			</div>
			<br>
			<!-- end row8 -->


			<!--   row9 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop PDF files here or click to browse</p>
							</div>
							<input type="file" name="pdf" id="pdf" class="dropzone"
								accept="image/pdf" onchange="show(this)">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>
							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">PDF Doc</h2>
					</label>
				</div>
			</div>
			<br>
			<!-- end row9 -->

			<!--   row10 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop PDF files here or click to browse</p>
							</div>
							<input type="file" name="ppf" id="ppf" class="dropzone"
								accept="pdf" onchange="show(this)">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>
							</div>
						</div>
					</div>
					<label class="control-label">
						<h2 class="btn btn-primary mt-2">PPF Doc</h2>
					</label>
				</div>
			</div>
			<br>
			<!-- end row10 -->

			<!--   row11 -->
			<div class="row p-2 drag-drop">
				<div class="col-md-12">
					<div class="row">
						<div class="dropzone-wrapper col-md-6 mb-3">
							<div class="dropzone-desc">
								<i class="fa fa-upload" aria-hidden="true"></i>
								<p>Drag & Drop PDF files here or click to browse</p>
							</div>
							<input type="file" name="tpr" id="tpr" class="dropzone"
								accept="pdf" onchange="show(this)">
						</div>
						<div class="preview-zone hidden col-md-6">
							<div class="box box-solid border">
								<div class="box-body"></div>
							</div>
						</div>
					</div>

					<label class="control-label">
						<h2 class="btn btn-primary mt-2">TPR Doc</h2>
					</label>
				</div>
			</div>
			<br>
			<!-- end row11 -->

			<!--  end row12  -->
			<div class="row" style="margin-top: 10px;">
				<div class="col-md-10 ">
					<div class="text-center">
						<button type="submit" id="ddbtn" class="btn btn-success">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	</section>

	<script>
		function readFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					var htmlPreview = '<img " class="undo" width="150" height="150" src="' + e.target.result + '" title="click to remove"></img>';
					var wrapperZone = $(input).parent();
					var previewZone = $(input).parent().parent().find(
							'.preview-zone');
					var boxZone = $(input).parent().parent().find(
							'.preview-zone').find('.box').find('.box-body');
					wrapperZone.removeClass('dragover');
					previewZone.removeClass('hidden');
					boxZone.empty();
					boxZone.append(htmlPreview);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}

		function reset(e) {
			e.wrap('<form>').closest('form').get(0).reset();
			e.unwrap();
		}

		$(".dropzone").change(function() {
			readFile(this);
		});

		$('.dropzone-wrapper').on('dragover', function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).addClass('dragover');
		});

		$('.dropzone-wrapper').on('dragleave', function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).removeClass('dragover');
		});

		$('.remove-preview').on('click', function() {
			var boxZone = $(this).parents('.preview-zone').find('.box-body');
			var previewZone = $(this).parents('.preview-zone');

			var dropzone = $(this).parents('.form-group').find('.dropzone');
			boxZone.empty();
			previewZone.addClass('hidden');
			reset(dropzone);
		});

		$(document).on('click', '.undo', function(e) {
			$(this).prev().remove();
			$(this).remove();

		});
	</script>
</body>
</html>
