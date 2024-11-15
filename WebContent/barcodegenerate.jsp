
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.MathContext"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="com.vo.ViewVO"%> 
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
      <!-- Meta, title, CSS, favicons, etc. -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>WorkFlow</title>
      <!-- Bootstrap core CSS -->
      <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
      <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
      <!-- Custom styling plus plugins -->
      <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
      <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
      <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
      <script src="JavaScript/bootstrap.js"></script>
      <script src="JavaScript/jquery-1.10.1.js"></script>
   </head>
   <body class="nav-md" >
      <form method="post" action="${pageContext.request.contextPath}/GererateBarCode" >
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
         <div class="container" style="padding-top:20px;">
            <div class="panel panel-primary">
               <div class="panel-heading"><strong>Bar Code</strong> </div>
               <div class="table-responsive" style="margin-left:20px;margin-right:20px">
                  <div style="padding:10px 0px 0px 0px;" >
                     <div class="form-group" id="D">
                        <label>Case Id</label></label>
                        <span style="padding-left:129px; margin-top:5px;">	
                        <input class="form-control" id="case_id"  name="case_id" required pattern="[0-9.]+"  minlength="10" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"  ></span>
                     </div>
                  </div>
                  <div class="table-responsive">
                     <table class="table table-no-bordered" >
                        <tr>
                           <td width="50%">
                           </td>
                           <td  width="50%">
                           </td>
                           <td width="50%">
                              <button class="btn btn-success" type="submit" id="searchScreen" name="searchScreen"  value='searchScreen'>GenerateBarcode</button>
                           </td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         </div>
      </form>
   </body>
</html>
