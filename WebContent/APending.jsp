<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%> 
<%@page import="com.vo.PendingVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
<title>Pending L2</title>
</head>
<body>
<div class="wrapper">
<form action="createServlet" method="post" class="login">
<p class="title">Task Lists</p>

<table align="center">

<% 
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
            <TD><a href="PApproval.jsp?caseId=<%= pendingVO.getCaseid() %>"><%=  pendingVO.getCaseid() %></a></TD>
                <TD> <%=pendingVO.getUserid() %></td>
                <TD> <%= pendingVO.getStatus() %></TD>
                <TD> <%= pendingVO.getDecision() %></TD>
                <TD> <%= pendingVO.getStage() %></TD>
                <TD> <%= pendingVO.getNext_stage() %></TD>
          
         
            </TR>

	

<% }
 
%>


 </table> 
 </div>
          <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/>
</form> 
</div>
</body>
</html>