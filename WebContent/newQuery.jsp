
<!DOCTYPE html>
<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="com.vo.ImagesVo"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page import="com.workflow.connection.LoginDAO" %>
<% 
List userRights = (List) session.getAttribute("getRight"); 
session = request.getSession(false);
if (session.getAttribute("userid") == null || session.getAttribute("userid").equals(""))
{
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
    <meta content="Author" name="Vikas Predhva" >
    <title>WorkFlow :: Image Viewer</title>
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
      
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <!-- Custom styling plus plugins -->
        <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 	<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  	<script  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
    

    
     
<style>

	  
.img-rounded {
			width: 260px;
			height: 160px;
			object-fit: contain;
			//object-fit: scale-down;
           border-radius: 6px !important;     
           
}

.img-roundedmdl {
			
			object-fit: contain;
           
}


</style>
<script>
$(function(){
  $("#image img").on("click",function(){
     var src = $(this).attr("src");
     $(".modal-img").prop("src",src);
  })
})
</script>

<style>
.modal-img {
  width:100%;
}
</style>

<script>

function newQueryRequest() {
	var images;

	
    var reqId = new URLSearchParams(window.location.search).get('reqId');
    
    console.log("reqId: "+reqId)
    var url = 'http://112.196.167.2:8080/scanupload/api/getAllDetailsById/'+reqId;
    $.ajax({
        type: 'GET',
        url: url,
        success: function (response,status) {
            console.log(response);
       
    if(status == 'success'){
    	 var formdata = response.data;    	
    	  $('#caseId').val(response.data.caseId);
    	  
    	  if (response.data.hasOwnProperty('images')) {
    	 	for (var i = 0; i < response.data.images.length; i++) {
                if (response.data.frontPhoto === response.data.images[i].filename) {
                    formdata.frontPhoto = response.data.images[i].byteArray;
                    $("#frontPhoto").attr("src", "data:image/jpeg;base64,"+formdata.frontPhoto);
                }
                if (response.data.frontPhoto1 === response.data.images[i].filename) {
                    formdata.frontPhoto1 = response.data.images[i].byteArray;
           	 	    $("#frontPhoto1").attr("src", "data:image/jpeg;base64,"+formdata.frontPhoto1);
                }
                if (response.data.rightPhoto === response.data.images[i].filename) {
                    formdata.rightPhoto = response.data.images[i].byteArray;
           	 	    $("#rightPhoto").attr("src", "data:image/jpeg;base64,"+formdata.rightPhoto);
                }
                if (response.data.leftPhoto === response.data.images[i].filename) {
                    formdata.leftPhoto = response.data.images[i].byteArray;
           	 	    $("#leftPhoto").attr("src", "data:image/jpeg;base64,"+formdata.leftPhoto);
                }
                
                if (response.data.uploadPhoto === response.data.images[i].filename) {
                    formdata.retainerPhoto = response.data.images[i].byteArray;
           	 	    $("#retainerPhoto").attr("src", "data:image/jpeg;base64,"+formdata.retainerPhoto);
                }
                if (response.data.breakagePhoto === response.data.images[i].filename) {
                    formdata.breakagePhoto = response.data.images[i].byteArray;
           	 	   $("#breakagePhoto").attr("src", "data:image/jpeg;base64,"+formdata.breakagePhoto);
                }
            } 
			}
    	  else{
          		$("#frontPhoto").attr("src", "Images/dummy.png");
          		$("#frontPhoto1").attr("src", "Images/dummy.png");
          		$("#rightPhoto").attr("src", "Images/dummy.png");
          		$("#leftPhoto").attr("src", "Images/dummy.png");
          		$("#breakagePhoto").attr("src", "Images/dummy.png");
          		$("#retainerPhoto").attr("src", "Images/dummy.png");
            }
    	 	
    	 	//$('#frontPhoto').val("data:image/jpeg;base64,"+formdata.frontPhoto);
    	 	/* $("#frontPhoto").attr("src", "data:image/jpeg;base64,"+formdata.frontPhoto);
    	 	$("#frontPhoto1").attr("src", "data:image/jpeg;base64,"+formdata.frontPhoto1);
    	 	 $("#rightPhoto").attr("src", "data:image/jpeg;base64,"+formdata.rightPhoto);
    	 	 $("#leftPhoto").attr("src", "data:image/jpeg;base64,"+formdata.leftPhoto);
    	 	 $("#breakagePhoto").attr("src", "data:image/jpeg;base64,"+formdata.breakagePhoto);
    	 	 $("#retainerPhoto").attr("src", "data:image/jpeg;base64,"+formdata.retainerPhoto);*/
    	 	
        }
        },
        error: function (error) {
            console.error('Error occurred:', error);
        }
    });
}
</script>
    </head>

<body class="nav-md"  onload="newQueryRequest()">

<div class="container body" style="background-color:white;" >
  <div class="main_container" style="margin-top: -20px;">
			

<div class="container" style="margin-top:22px;width:70%;">

<br>
	<div class="panel panel-primary">
		<div class="container" style="width:98%;">	
			<table  align="center" >

		    <tbody>
		   <tr>

  
  <button class="" type="button"  value="searchScreen"  onclick="window.history.back()" style="margin-left: -10px;color: #fff;
    background-color: #26B99A; border:none;"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back</button>
  
  </tr>
		    <tr align="center">
   
         <td align="center">    
       
          <div id="image">
      <figure >
   <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal"> 
   <div class="Scriptcontent">
   		<img src=""   id="frontPhoto" width="250" height="250" class="img-rounded" /> 
   </div>
   </a>
</figure>
 </div>
    
  
   <h2 class="btn btn-primary">Front Photo</h2></td>
   
      <td  align="center"> 
        
     <div id="image">
    <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
    <img src=""  id="frontPhoto1"  width="250" height="250" class="img-rounded" />
    </div>
    </a> 
</figure>
</div>
   <h2 class="btn btn-primary">Front Photo1</h2></td>
    <td width="33%" align="center">  
  
   <div id="image">
      <figure>
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
    <div class="Scriptcontent">
    <img src=""  id="rightPhoto" width="250" height="250" class="img-rounded" /> 
    </div></a>
</figure>
</div>
   

   <h2 class="btn btn-primary">Right Photo</h2>
   </td>
    </tr>
    
     <tr align="center">
   
         <td align="center" id="retainerPhototd">    
       
          <div id="image">
      <figure >
   <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal"> 
   <div class="Scriptcontent">
   		<img src="" id="retainerPhoto" width="250" height="250" class="img-rounded" /> 
   </div>
   </a>
</figure>
 </div>
    
  
   <h2 class="btn btn-primary">Retainer Photo</h2></td>
   
      <td  align="center" id="breakagePhototd"> 
        
     <div id="image">
    <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
    <img src=""  id="breakagePhoto"  width="250" height="250" class="img-rounded" />
    </div>
    </a> 
</figure>
</div>
   <h2 class="btn btn-primary">Breakage Photo</h2></td>

    </tr>
</tbody>
</table>

		</div>
	</div>

</div>

            <!-- /page content -->
        </div>
    </div>
    
    
    <!-- Button trigger modal -->
    <!-- Modal -->
    
<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" style="margin-top:10px;">
    <div class="modal-content">
    <div class="modal-header"    style="padding: -0px;border-bottom: 1px solid #e5e5e5;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <img class="modal-img" style="height:50%;width:100%;margin-top: -8px;"/>
      </div>
      
      
    </div>
  </div>
</div>

</body>

</html>