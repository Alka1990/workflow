
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
    </head>

<body class="nav-md">

<div class="container body" style="background-color:white;" >
  <div class="main_container" style="margin-top: -20px;">
 
 <%
 
String id=request.getParameter("id");
File file =null;
File file1 =null;
Connection conn=null;
PreparedStatement pss=null;
ResultSet rss=null;

String case_id="";
String doctor_name="";
String patient_name="";
String clinic_name="";
String options="";
String upper_img="";
String lower_img="";
String front_img="";
String left_img="";
String right_img="";
String simple_img="";
String smile_img="";
String side_img="";
String file_path="";
String ppf="";
String tpr="";
String pdf_doc="";
String case_booking_form = "";
String sales_approval_docs = "";
String doc_approval_form = "";

String upper_img1 ="";
String lower_img1="";
String right_img1 ="";
String left_img1 ="";
String front_img1 ="";
String simple_img1="";
String smile_img1 = "";
String side_img1 ="";

String case_booking_form1 = "";
String sales_approval_docs1 = "";
String doc_approval_form1 = ""; 

String separator = "";

try{

LoginDAO loginDAO = new LoginDAO();
conn=LoginDAO.getConnectionDetails();

pss=conn.prepareStatement(" select * from uploadsimages where id='"+id+"' ");
rss=pss.executeQuery();
if(rss.next()){
	case_id=rss.getString("case_id");
	doctor_name=rss.getString("doctor_name");
	patient_name=rss.getString("patient_name");
	clinic_name=rss.getString("clinic_name");
	options=rss.getString("options");
	upper_img=rss.getString("upper_img");
	lower_img=rss.getString("lower_img");
	front_img=rss.getString("front_img");
	left_img=rss.getString("left_img");
	right_img=rss.getString("right_img");
	simple_img=rss.getString("simple_img");
	smile_img=rss.getString("simle_img");
	side_img=rss.getString("side_img");
	pdf_doc=rss.getString("pdf_doc");
	ppf=rss.getString("ppf_doc");
	tpr=rss.getString("tpr_doc");
	file_path=rss.getString("file_path");
	case_booking_form = rss.getString("case_booking_form");
	sales_approval_docs = rss.getString("sales_approval_docs");
	doc_approval_form = rss.getString("doc_approval_form");
	}
    separator = File.separator;
    separator = System.getProperty("file.separator");
    separator = String.valueOf(File.separatorChar);
    //String separator1 = "test separator" + separator + "render.txt";
    //System.out.println("separator new = " + separator); 
    
	/////////////////////// upper_img 
	 if(upper_img!=null){
 		file = new File(file_path+separator+upper_img);
 	
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
               //  System.out.println("read " + readNum + " bytes,");
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes = bos.toByteArray();
         byte[] encodeBase64 = Base64.encodeBase64(bytes);
          upper_img1 = new String(encodeBase64, "UTF-8"); 
}
   /////////////////////// end upper_img  
   
   	/////////////////////// lower_img 
   if(lower_img!=null){
 		file = new File(file_path+separator+lower_img);
         FileInputStream fis1 = new FileInputStream(file);
         ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
         byte[] buf1 = new byte[1024];
         try {
             for (int readNum; (readNum = fis1.read(buf1)) != -1;) {
                 bos1.write(buf1, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes1 = bos1.toByteArray();
        
         byte[] encodeBase641 = Base64.encodeBase64(bytes1);
         lower_img1 = new String(encodeBase641, "UTF-8");
   }
       
   /////////////////////// end lower_img 
    
            	/////////////////////// front_img 
       if(front_img!=null){
 		 file = new File(file_path+separator+front_img);
         FileInputStream fis2 = new FileInputStream(file);
         ByteArrayOutputStream bos2 = new ByteArrayOutputStream();
         byte[] buf2 = new byte[1024];
         try {
             for (int readNum; (readNum = fis2.read(buf2)) != -1;) {
                 bos2.write(buf2, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes2 = bos2.toByteArray();
         byte[] encodeBase642 = Base64.encodeBase64(bytes2);
         front_img1 = new String(encodeBase642, "UTF-8"); 
}
   	/////////////////////// end front_img 
   
   	
   	
            	/////////////////////// left_img 
      if(left_img!=null){
 		 file = new File(file_path+separator+left_img);
         FileInputStream fis3 = new FileInputStream(file);
         ByteArrayOutputStream bos3 = new ByteArrayOutputStream();
         byte[] buf3 = new byte[1024];
         try {
             for (int readNum; (readNum = fis3.read(buf3)) != -1;) {
                 bos3.write(buf3, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes3 = bos3.toByteArray();
         byte[] encodeBase643 = Base64.encodeBase64(bytes3);
         left_img1 = new String(encodeBase643, "UTF-8"); 
}
   	/////////////////////// end left_img 
  
   	
   	
            	/////////////////////// right_img 
       if(right_img!=null){
 		 file = new File(file_path+separator+right_img);
         FileInputStream fis4 = new FileInputStream(file);
         ByteArrayOutputStream bos4 = new ByteArrayOutputStream();
         byte[] buf4 = new byte[1024];
         try {
             for (int readNum; (readNum = fis4.read(buf4)) != -1;) {
                 bos4.write(buf4, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes4 = bos4.toByteArray();
         byte[] encodeBase644 = Base64.encodeBase64(bytes4);
   		 right_img1 = new String(encodeBase644, "UTF-8"); 
}
   	/////////////////////// end right_img 
   	
   	           	/////////////////////// simple_img 
   	   if(simple_img!=null){
 		 file = new File(file_path+separator+simple_img);
         FileInputStream fis5 = new FileInputStream(file);
         ByteArrayOutputStream bos5 = new ByteArrayOutputStream();
         byte[] buf5 = new byte[1024];
         try {
             for (int readNum; (readNum = fis5.read(buf5)) != -1;) {
                 bos5.write(buf5, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes5 = bos5.toByteArray();
         byte[] encodeBase645 = Base64.encodeBase64(bytes5);
         simple_img1 = new String(encodeBase645, "UTF-8"); 
}
   	/////////////////////// end simple_img 
   	
   	  /////////////////////// simle_img 
   	  if(smile_img!=null){
 		 file = new File(file_path+separator+smile_img);
         FileInputStream fis6 = new FileInputStream(file);
         ByteArrayOutputStream bos6 = new ByteArrayOutputStream();
         byte[] buf6 = new byte[1024];
         try {
             for (int readNum; (readNum = fis6.read(buf6)) != -1;) {
                 bos6.write(buf6, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes6 = bos6.toByteArray();
         byte[] encodeBase646 = Base64.encodeBase64(bytes6);
         smile_img1 = new String(encodeBase646, "UTF-8"); 
         }
   	/////////////////////// end simle_img 
   	   /////////////////////// side_img 
   	   if(side_img!=null){
 		 file = new File(file_path+separator+side_img);
         FileInputStream fis7 = new FileInputStream(file);
         ByteArrayOutputStream bos7 = new ByteArrayOutputStream();
         byte[] buf7 = new byte[1024];
         try {
             for (int readNum; (readNum = fis7.read(buf7)) != -1;) {
                 bos7.write(buf7, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes7 = bos7.toByteArray();
         byte[] encodeBase647 = Base64.encodeBase64(bytes7);
         side_img1 = new String(encodeBase647, "UTF-8");  
}
   	   if(ppf!=null){
 		 file = new File(file_path+separator+ppf);
         FileInputStream fis7 = new FileInputStream(file);
         
         ByteArrayOutputStream bos7 = new ByteArrayOutputStream();
         byte[] buf7 = new byte[1024];
         try {
             for (int readNum; (readNum = fis7.read(buf7)) != -1;) {
                 bos7.write(buf7, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes7 = bos7.toByteArray();
         byte[] encodeBase647 = Base64.encodeBase64(bytes7);
         ppf = new String(encodeBase647, "UTF-8");  
}
   	   if(tpr!=null){
 		 file = new File(file_path+separator+tpr);
         FileInputStream fis7 = new FileInputStream(file);
         ByteArrayOutputStream bos7 = new ByteArrayOutputStream();
         byte[] buf7 = new byte[1024];
         try {
             for (int readNum; (readNum = fis7.read(buf7)) != -1;) {
                 bos7.write(buf7, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes7 = bos7.toByteArray();
         byte[] encodeBase647 = Base64.encodeBase64(bytes7);
         tpr = new String(encodeBase647, "UTF-8");  
}
   	   if(pdf_doc!=null){
 		 file = new File(file_path+separator+pdf_doc);
         FileInputStream fis7 = new FileInputStream(file);
         ByteArrayOutputStream bos7 = new ByteArrayOutputStream();
         byte[] buf7 = new byte[1024];
         try {
             for (int readNum; (readNum = fis7.read(buf7)) != -1;) {
                 bos7.write(buf7, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes7 = bos7.toByteArray();
         byte[] encodeBase647 = Base64.encodeBase64(bytes7);
         pdf_doc = new String(encodeBase647, "UTF-8");  
}
   	
   	
   	/////////////////////// end side_img 
 
   	 if(case_booking_form!=null && !case_booking_form.isEmpty()){
 		 file = new File(file_path+separator+case_booking_form);
 		
         FileInputStream fis8 = new FileInputStream(file);
         ByteArrayOutputStream bos8 = new ByteArrayOutputStream();
         byte[] buf8 = new byte[1024];
         try {
             for (int readNum; (readNum = fis8.read(buf8)) != -1;) {
                 bos8.write(buf8, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes8 = bos8.toByteArray();
         byte[] encodeBase648 = Base64.encodeBase64(bytes8);
         case_booking_form1 = new String(encodeBase648, "UTF-8"); 
         
         }
   	 if(sales_approval_docs!=null &&  !sales_approval_docs.isEmpty()){
 		 file = new File(file_path+separator+sales_approval_docs);
         FileInputStream fis9 = new FileInputStream(file);
        
         ByteArrayOutputStream bos9 = new ByteArrayOutputStream();
         byte[] buf9 = new byte[1024];
         
         try {
             for (int readNum; (readNum = fis9.read(buf9)) != -1;) {
                 bos9.write(buf9, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         byte[] bytes9 = bos9.toByteArray();
         byte[] encodeBase649 = Base64.encodeBase64(bytes9);
         sales_approval_docs1 = new String(encodeBase649, "UTF-8"); 
         }
   	 if(doc_approval_form!=null && !doc_approval_form.isEmpty()){
 		 file = new File(file_path+separator+doc_approval_form);
         FileInputStream fis10 = new FileInputStream(file);
         
         ByteArrayOutputStream bos10 = new ByteArrayOutputStream();
         byte[] buf10 = new byte[1024];
         try {
             for (int readNum; (readNum = fis10.read(buf10)) != -1;) {
                 bos10.write(buf10, 0, readNum); 
             }
         } catch (IOException ex) {
        	 System.out.println("Error processing lower_img: " + ex.getMessage());
             ex.printStackTrace();
         }
         System.out.println(" bos6 = " + bos10);
         System.out.println(" fis6 = " + fis10);
         byte[] bytes10 = bos10.toByteArray();
         byte[] encodeBase6410 = Base64.encodeBase64(bytes10);
         doc_approval_form1 = new String(encodeBase6410, "UTF-8"); 
         }
   	
   	///////////////////////////
   	case_id=rss.getString("case_id");
	doctor_name=rss.getString("doctor_name");
	patient_name=rss.getString("patient_name");
	clinic_name=rss.getString("clinic_name");
	options=rss.getString("options");
	
	
%> 

            <!-- page content -->
             <!-- <div class="right_col" role="main"> -->
             
     
				
<div class="container" style="margin-top:22px;width:70%;">

<% if (userRights.contains("DPH") != true) {%>
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
         <%if(simple_img!=null){%>
          <div id="image">
      <figure >
   <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal"> 
   <div class="Scriptcontent">
   <img src="data:image/jpeg;base64,<%=simple_img1%>"   id="myImg1" width="250" height="250" class="img-rounded" alt="<%=simple_img %>"/> 
   </div>
   </a>
</figure>
 </div>
    <%} else{%>
      <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
  
   <h2 class="btn btn-primary">Simple</h2></td>
   
      <td  align="center"> 
        <%if(smile_img!=null){%>
     <div id="image">
    <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
    <img src="data:image/jpeg;base64,<%=smile_img1%>"  id="myImg2"  width="250" height="250" class="img-rounded" alt="<%=smile_img1 %>"/>
    </div>
    </a> 
</figure>
</div>
     <%} else{%>
           <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">Smile</h2></td>
    <td width="33%" align="center">  
   <%if(side_img!=null){%>
   <div id="image">
      <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
    <div class="Scriptcontent">
    <img src="data:image/jpeg;base64,<%=side_img1%>"  id="myImg3" width="250" height="250" class="img-rounded" alt="<%=side_img %>"/> 
    </div></a>
</figure>
</div>
    <%} else{%>
            <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>

   <h2 class="btn btn-primary">Side</h2>
   </td>
    </tr>
    
    <tr>

    <td align="center">  
   <%if(right_img!=null){%>
    <div id="image">
    <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
    <div class="Scriptcontent">
    <img src="data:image/jpeg;base64,<%=right_img1%>"   id="myImg4" width="250" height="250" class="img-rounded" alt="<%=right_img %>"/>
    </div>
     </a>
</figure>
</div>
     </div>
     <%} else{%>
       <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
  
  <h2 class="btn btn-primary">Right</h2>
  </td>
         <td  align="center">  
   <%if(front_img!=null){%>
   <div id="image">
    <figure >
    <a class="example-image-link" href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
    <div class="Scriptcontent">
    <img src="data:image/jpeg;base64,<%=front_img1%>"  id="myImg5" width="250" height="250" class="img-rounded" alt="<%=front_img %>"/>
    </div>
     </a>
</figure>
     </div>
     <%} else{%>
           <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">Front</h2>
   </td>
   
      <td  align="center">  
   <%if(left_img!=null){%>
    <div id="image">
      <figure>  
    <a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
    <div class="Scriptcontent">
    <img src="data:image/jpeg;base64,<%=left_img1%>"  width="250"  id="myImg6" height="250" class="img-rounded" alt="<%=left_img %>"/>
    </div>
    </a> 
</figure>
</div>
    <%} else{%>
           <figure  >
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
  <h2 class="btn btn-primary">Left</h2></td>

    </tr>
    

  </tbody>
</table>

<table  align="center" >
		    <tr>
 
  	  <td  align="center">  
      <%if(upper_img!=null){%>
      <div id="image">
    <figure>
    
 		<a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
 		<div class="Scriptcontent">
 		<img src="data:image/jpeg;base64,<%=upper_img1%>" id="myImg7"  width="400" height="300" class="img-rounded" alt="<%=upper_img %>" />
 		</div>
 		 </a>
	</figure>
	</div>
  <%} else{%>
           <figure>
           
      <img src="Images/dummy.png"  alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
     <h2 class="btn btn-primary">Upper</h2>
     
     </td>
      <td align="center">  
   <%if(lower_img!=null){%>
  <div id="image">
      <figure> 
   <a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
   <img src="data:image/jpeg;base64,<%=lower_img1%>"  id="myImg8" width="250" height="250" class="img-rounded" alt="<%=lower_img %>"/> 
   </div>
   </a>	
</figure> 
</div>
      <%} else{%>
           <figure>
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">Lower</h2></td>
  
  
    </tr>
  <tbody>
  </tbody>
  
  </table>
  
  
 <table>
        <tr>
       <td align="center">  
   <%if(case_booking_form!=null && !case_booking_form.trim().isEmpty()){%>
  <div id="image">
      <figure> 
   <a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
   <img src="data:image/jpeg;base64,<%=case_booking_form1%>"  id="imgCBF" width="250" height="250" class="img-rounded" alt="<%=case_booking_form %>"/> 
   </div>
   </a>	
</figure> 
</div>
      <%} else{%>
           <figure>
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">CBF</h2></td>
           
        </tr>
 </table>
  <table>
        <tr>
        
        <td align="center">  
   <%if(sales_approval_docs!=null && !sales_approval_docs.trim().isEmpty()){%>
  <div id="image">
      <figure> 
   <a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
   <img src="data:image/jpeg;base64,<%=sales_approval_docs1%>"  id="imgSAD" width="250" height="250" class="img-rounded" alt="<%=sales_approval_docs %>"/> 
   </div>
   </a>	
</figure> 
</div>
      <%} else{%>
           <figure>
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">SAD</h2></td>
         
        </tr>
 </table>
  <table>
        <tr>
        
          <td align="center">  
   <%if(doc_approval_form!=null && !doc_approval_form.trim().isEmpty()){%>
  <div id="image">
      <figure> 
   <a class="example-image-link"  href="#imagemodal" data-toggle="modal" data-target="#imagemodal">
   <div class="Scriptcontent">
   <img src="data:image/jpeg;base64,<%=doc_approval_form1%>"  id="imgADF" width="250" height="250" class="img-rounded" alt="<%=doc_approval_form %>"/> 
   </div>
   </a>	
</figure> 
</div>
      <%} else{%>
           <figure>
      <img src="Images/dummy.png" alt="dummy" class="img-rounded" width="250" height="250" />
      </figure>
    <%}%>
   <h2 class="btn btn-primary">ADF</h2></td>
          
        </tr>
        
       
    </table>


 </div>

  </div>
 
  <% }%>
  
  
  
 <!-------------------------------------------------------------------------------------------------------------------------->




    <div class="panel panel-primary">	
		<div class="container" style="width:98%;">
		<h5 align=center><b>PDF</b></h5>		
			<table  align="center" >
				<tbody>
					<tr>
						<td  align="center">  
      						<%if(pdf_doc!=null){%>
							 <iframe src="data:application/pdf;base64, <%= pdf_doc%>" width="922" height="500" style="margin-top:10px;margin-bottom:6px;"> </iframe>
						  	<%} %>
       				   </td>
				    </tr>
				 </tbody>
			</table>
		 </div>
	  </div>
  
  
    <div class="panel panel-primary">	
		<div class="container" style="width:98%;">
		<h5 align=center><b>Patient Prescription Form</b></h5>		
			<table  align="center" >
				<tbody>
					<tr>
						<td  align="center">  
      						<%if(ppf!=null){%>
							 <iframe src="data:application/pdf;base64, <%= ppf%>" width="922" height="500" style="margin-top:10px;margin-bottom:6px;"> </iframe>
						  	<%} %>
       				   </td>
				    </tr>
				 </tbody>
			</table>
		 </div>
	  </div>
	  
	      <div class="panel panel-primary">	
		<div class="container" style="width:98%;">		
		<h5 align=center><b>Treatment Planning Report</b></h5>	
			<table  align="center" >
				<tbody>
					<tr>
						<td  align="center">  
      						<%if(tpr!=null){%>
							 <iframe src="data:application/pdf;base64, <%= tpr%>" width="922" height="500" style="margin-top:10px;margin-bottom:6px;"> </iframe>
						  	<%} %>
       				   </td>
				    </tr>
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

<%

}
catch(Exception e){
	e.printStackTrace();
	out.println("<script type=\"text/javascript\">");
	out.println("alert('The system cannot find the path specified!');");
	out.println("location='DispImageGrid?caseId="+case_id+"';");
	out.println("</script>");

}
%>
</html>