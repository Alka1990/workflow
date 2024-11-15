<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%> 
<%@page import="com.vo.PendingVO"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
 <link rel="shortcut icon" href="Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title></head>
<body bgcolor="#E6E6FA">
<div class="wrapper">
<%-- <select name="caseid">
  <c:forEach items="${list}" var="item">
    <option value="${item.value}"><c:out value="${item.value}"/></option>
  </c:forEach>
</select> --%>

<form action="createServlet" method="post"  class="login">
 <p class="title">Task Lists</p>
<table align="center">

<% 
//List<PendingVO> list=LoginDAO.getCaseID(session);
List<PendingVO> list = (List)request.getAttribute("pendingVOList");

%>
<TR>

<TH> CASE_ID</TH>
   <TH> USER_ID</TH>
      <TH> STATUS</TH>
         <TH> DECISION</TH>
             <TH>STAGE</TH>
              <TH>NEXT_STAGE</TH>
          
        </TR>  
<%  
for(PendingVO pendingVO:list){ %>
      
         
      
          <TR>
            <TD><a href="Upload1.jsp?caseId=<%= pendingVO.getCaseid() %>"><%=  pendingVO.getCaseid() %></a></TD>
                <TD> <%=pendingVO.getUserid() %></td>
                <TD> <%= pendingVO.getStatus() %></TD>
                <TD> <%= pendingVO.getDecision() %></TD>
                <TD> <%= pendingVO.getStage() %></TD>
                <TD> <%= pendingVO.getNext_stage() %></TD>
          
           
            </TR>

	

<% }
 
%>


 </table> 
          <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/>
</form> 
</div>
</body>
</html>