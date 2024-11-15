<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css" rel="stylesheet">
</head>
<body>
	<div style="padding: 10px 0px 0px 0px;">
		<div class="form-group">
			<label>Folder ID<span style="color: red" class="required">*</span></label>
			<span style="padding-left: 19px; margin-top: 5px;"> <input
				type="text" id="folderID" name="folderID" value='' />
			</span>
		</div>
		<div class="form-group" style="margin-top: 10px;">
			<button class="btn btn-primary" onclick="OpenNewWindow()">Click</button>
		</div>
	</div>

	<script>


function OpenNewWindow(){

    var mapForm = document.createElement("form");
    mapForm.target = "Map";
    mapForm.method = "POST"; // or "post" if appropriate
    mapForm.action = "${pageContext.request.contextPath}/DocUpload.jsp";

    var mapInput = document.createElement("input");
    mapInput.type = "hidden";
    mapInput.name = "folderID";
    mapInput.value = document.getElementById("folderID").value;
    mapForm.appendChild(mapInput);
    document.body.appendChild(mapForm);
	
	map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

	if (map) {
	    mapForm.submit();
	} else {
	    alert('You must allow popups for this to work.');
	}		


		
}

</script>
</body>
</html>