<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>

<%
String folderid="";
folderid=(String)request.getParameter("folderID");
System.out.println("folderid::"+folderid);

%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css"
	rel="stylesheet">
<title></title>
</head>
<body onload="getExistingFile()">
	<input type="hidden" id="folderID" name="folderID" />
	<table>
		<tr>
			<td><input type="file" class="form-control" id="adddoc"
				name="adddoc" /></td>
			<td><a id="Add-Document" class="btn btn-primary"
				onclick="addDoc();">Attach Document</a></td>
		</tr>
	</table>

	<table id="docDetails" class="table table-bordered">
		<thead>
			<tr style="background-color: #25486d; color: #FFF !important;">
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center">Document Name</td>
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center">Delete</td>

			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>


	<script>
function getExistingFile(){
	var id='<%=folderid%>';
//	alert("onload function");
var params="RequestType=GetFile&folderid="+'<%=folderid%>';
	//alert("params::"+params);
	  var urls="${pageContext.request.contextPath}/UploadDocumentServlet?RequestType=GetFile&folderid="+'<%=folderid%>';   
    // alert(urls);
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	
	    if(this.responseText!=null){
	    	var result=this.responseText;
	    	result=result.replace(/\r?\n|\r/g,"");
	    	var temp = new Array();
	    	temp =result.split(",");
	   
	    	if("Invalid"!=temp[0]){
	    		if(temp.length>1){
	    	       var i;
	    	       for (i = 1; i < temp.length; i++) {
	    	    	   var row=document.getElementById('docDetails').insertRow(i);
		    	      var cell1 = row.insertCell(0);
		    	       var cell2 = row.insertCell(1);
		    	        
		    	       cell1.setAttribute('align','center');
		    	       cell2.setAttribute('align','center');
	    	       var url="<a id=\"modal\" href=\"#\"  onclick=\"show('"+id+"','"+temp[i]+"','UploadDocumentServlet');\">"+temp[i]+"</a>";

	    	       cell1.innerHTML=url;
	    	       cell2.innerHTML =  "<img  onclick=\"deleteFile('"+id+"','"+temp[i]+"')\" src='${pageContext.request.contextPath}/Images/delete.bmp' id='"+[i-1]+"' width='20px' height='20px' >";    
	    	       }
	    		}
	    	}
	    	
	
	    }
	    }
	  };
	  xhttp.open("POST", urls, false);
	  xhttp.send();
}

function deleteFile(foldername,filename){

	  var urls="${pageContext.request.contextPath}/UploadDocumentServlet?RequestType=DeleteFile&foldername="+foldername+"&filename="+filename;   
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var result=this.responseText;
	    	result=result.replace(/\r?\n|\r/g,"");
	    	if("File deleted successfully"==result){
		        var jspcall = "DocUpload.jsp?folderID="+foldername;
		        window.location.href = jspcall;
		    	alert(this.responseText);	
	    	}else{
	    		alert(this.responseText);
	    	}

	    }
	  };
	  xhttp.open("POST", urls, false);
	  xhttp.send();

	
}
function show(foldername,filename,servlet){

	var mapForm = document.createElement("form");
	mapForm.method = "POST"; // or "post" if appropriate
	mapForm.action = "${pageContext.request.contextPath}/"+servlet;
	var mapInput = document.createElement("input");
	mapInput.type = "hidden";
	mapInput.name = "folderName";
	mapInput.value = foldername;
	
	var mapInput1 = document.createElement("input");
	mapInput1.type = "hidden";
	mapInput1.name = "fileName";
	mapInput1.value = filename;
	mapForm.appendChild(mapInput);
	mapForm.appendChild(mapInput1);
	document.body.appendChild(mapForm);	
	mapForm.submit();
	}
	
function addrow(){  
  	 if(request.readyState==4){  
  	 var val=request.responseText;
  	 val=val.replace(/\r?\n|\r/g,"");
  	 if(""!==val && "Duplicate File"!==val)
  		 { 	 
  		
  		var e1 = document.getElementById("adddoc").value;
  		e1 = e1.replace(/.*[\/\\]/, '');
  		 var table = document.getElementById("docDetails");

  	   var len = table.rows.length;
  	   console.log(len);
       var row = table.insertRow(len);
       var cell1 = row.insertCell(0);
       var cell2 = row.insertCell(1);
        
       cell1.setAttribute('align','center');
       cell2.setAttribute('align','center');

      var url="<a id=\"modal\" href=\"#\"  onclick=\"show('"+val+"','"+e1+"','UploadDocumentServlet');\">"+e1+"</a>";
       cell1.innerHTML=url;
       cell2.innerHTML =  "<img  onclick=\"deleteFile('"+val+"','"+e1+"',this)\" src='${pageContext.request.contextPath}/Images/delete.bmp'  width='20px' height='20px' >";    

     //  cell2.innerHTML = '<img alt=""  src="${pageContext.request.contextPath}/Images/delete.bmp"  width="20px" height="20px" >';
      //  cell3.innerHTML=val;
       alert("Document added successfully");
  		 }
  	 else
  		 {
  		 alert("Document already added. Kindly upload another document.");
  		 }
  	 }
 
  	}
  	 
  	 
function addDoc(){	
	var filedata="";
		filedata=document.getElementById("adddoc").value;
		if(filedata==null ||filedata=='')
	 	{
	 		alert("Choose a file");
	 		document.getElementById('adddoc').focus();
	 		return false;
	 	}
		
		  var urls="${pageContext.request.contextPath}/UploadDocumentServlet";   
		//  alert("urls::"+urls);
		 	 if(window.XMLHttpRequest){  
		 	   	 request=new XMLHttpRequest();  
		 	   	 }
		  	 else if(window.ActiveXObject){  
		  	   	 request=new ActiveXObject("Microsoft.XMLHTTP");  
		  	   	 }  
		  	   	   
		   	 try  
		   	 {  
		    request.onreadystatechange=addrow;  
		   	request.open("POST",urls,false);  
		   	var data = new FormData();
		  	data.append('folderid', '<%=folderid%>'); 
		   	data.append('file', document.getElementById('adddoc').files[0]);
	
		    request.send(data); 
		   	 }  
		   	 catch(e)  
		   	 {  
		   	 alert("Unable to connect to server"+e);  
		   	 } 
}


	
</script>
</body>
</html>