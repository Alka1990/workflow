
<!DOCTYPE html>

<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html lang="en">

<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title>
    
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
  <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js">


 <script>	
</script>
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
			 <center> <div class="jumbtron bg-info">
<center><h1 style="font-family: sans-serif; color: darkblue"><b><hr s>Planning Team<hr></b></h1></center></border>
            <p><center style="color: white;"><h3>  </h3></center></p> 
          
</div></center>
    
         <border style="color: black"><center><h2 style="font-family: sans-serif; "><b><hr s>Stage-1<hr></b></h2></center></border>
    
 
        <br>
        <div class="container">
        <form  action="SavePlanning" method="post" >
		<div class="form-row">
            <div class="form-group col-md-6">
                <label> Staging</label>
                <input type="text"  id="Strening" name="Strening"class="form-control" placeholder="Strening">
            </div>
			<div class="form-group col-md-6">
                <label> CRM</label>
                <input type="text"  id="CRM" name="CRM"class="form-control" placeholder="CRM">
            </div>
			
            </div>
            
        
            
            
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2">
					
					<label for="Planningtype"  name="Planningtype" id="Planningtype"class="form-label">Planning Type </label>
				</div>
				<div class="col-lg-10">
					<select class="form-control" name="Planningtype" id="Planningtype" >
           		       <option >----  Select Planning Type----</option>
	  				  <option value="STR">Strenning</option>
					   <option value="Plan">New Plan</option>
					   <option value="MID">Mid Treatment</option>
					   <option value="Refine">Refiniment</option>
					   	</select>		</div>
			</div> 	
			
		
    
    
			 <div class="form-row">
            <div class="form-group col-md-6">
                <label> Doctor Name</label>
                <input type="text"  id="Dname" name="Dname"class="form-control" placeholder="Doctor Name">
            </div>
                
                <div class="form col-md-6">
                <label>Case Id</label>
                    <input type="text"  id="caseid" name="caseid" class="form-control" placeholder="">
                </div>
                </div>
    
            
    
            <div class=" form-row">
            <div class="form-group col-md-6">
                <label> From</label>
                <input type="text"  id="from" name="from" class="form-control" placeholder="">
            </div>
                <div class="form col-md-6">
                <label>To</label>
                    <input type="text" id="to" name="to" class="form-control" placeholder="">
                </div>
            </div> 
            
            
             <div class="form-row">
            <div class="form-group col-md-6">
                <label> Number of Aligner Upper</label>
                <input type="text"  name="Alnupper" id="Alupper" class="form-control" placeholder="">
            </div>
                
                <div class="form col-md-6">
                <label> Number of Aligner Lower</label>
                    <input type="text" id="Alnlower"  name="Allower"class="form-control" placeholder="">
                </div>
                </div>
            
             
                        
            <div class="form-row">    
               
                 
                <div class="form-group col-md-2">
                <label>Thickness Upper</label>
                    <Select  id="thickupper" name="thickupper"class="form-control">
                             <option value="Y">Yes</option>
                             <option value="N">No</option>
                    </Select>
                    
            </div>
                
                 <div class="form-group col-md-2">
                <label>Thickness Lower</label>
                    <Select  id="thicklower" name="thicklower" class="form-control">
                           <option value="Y">Yes</option>
                           <option value="N">No</option>
                    </Select>
                    
                    
                    
            
                    </div>
                
                 
                <div class="form-group col-md-2">
                <label>Margin Upper</label>
                    <Select   id="marginupper" name="marginupper" class="form-control">
                         <option value="Y">Yes</option>
                            <option value="N">No</option>
                    </Select>
                    
            </div>
                
                
                   <div class="form-group col-md-2">
                <label>Margin Lower</label>
                    <Select  id="marginlower" name="marginlower" class="form-control">
                         <option value="Y">Yes</option>
                           <option value="N">No</option>
                    </Select>
                    
            </div>
                
                
                 
                
                         <div class="form-group col-md-2">
                <label>3rd Molor Upper</label>
                    <Select id="molorupper" name="molorupper" class="form-control">
                        <option value="Y">Yes</option>
                         <option value="N">No</option>
                    </Select>
                    
            </div>
                
                
                             <div class="form-group col-md-2">
                <label>3rd Molor Lower</label>
                    <Select  id="molorlower" name="molorlower"   class="form-control">
                           <option value="Y">Yes</option>
                          <option value="N">No</option>
                    </Select>
                    
            </div>
                
                 <div class="form-group col-md-6">
                <label>Sheet Type</label>
                    <Select  id="sheettype" name="sheettype"    class="form-control">
                         <option value="Y">Yes</option>
                          <option value="N">No</option>
                    </Select>
                    
                    
                    
            
                    </div>
                
                            
                
                                 <div class="form-group col-md-6">
                
                    <div class="form-row">
            <div class="form-group col-md-6">
                <label> Date</label>
                <input type="date" class="form-control" placeholder="Current Date">
            </div>
                        
                        
                        
                        
                    
            </div>
                </div>
                
                <div class="form-group col-md-12">
                <div class="form-row">
            <div class="form-group col-md-2">
            
                <label> Review Attachment</label>
                </div>
                 <div class="form-group col-md-2">
                
                Yes&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"  class="form-check-input"  value="Y"  name="Review">
                No &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"   class="form-check-input"  value="N" name="Review">
                
            </div>
                    
                  
            <div class="form-group col-md-1">
                <label>  IPR Sheet</label>
                </div>
                 <div class="form-group col-md-3">
                
             
                Yes &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"  class="form-check-input"  value="Y"  name="IPR">
              No &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"  class="form-check-input"  value="N"  name="IPR">
            </div>
                    
                    
                      <div class="form-group col-md-2">
                <label>   Soft. Tissus Sculpt</label>
                </div>
                 <div class="form-group col-md-2">
                Yes &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"   class="form-check-input"  value="Y" name="Tissus">
                No &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"  class="form-check-input"  value="N"  name="Tissus">
            </div>
                    
                    
                        
                        
                     
                    
            </div>
            <div class="text-center"  style="margin-right:100px">
				
						<button type="submit" value="Save"  class="btn btn-success" >Submit</button>
				
		       </div>
			 </div> 		   
	</form>                         
                    
                                     
                

			
    </div>
            <!-- /page content -->
        </div>
    </div>
     <!-- font awesome link -->
 <script src="JavaScript/jquery-1.10.1" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="JavaScript/5b8969f8ab.js"></script>
</body>
</html>
