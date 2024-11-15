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
<%@page import="com.vo.Newcase1"%>
<%@ page import="com.workflow.connection.LoginDAO"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Workflow</title>
<link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
<link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
<link rel="stylesheet" href="script/accordion.min.css">
<script src="JavaScript/bootstrap.js"></script>
<script src="JavaScript/custom.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
<style>
        .form-group {
            margin-bottom: 1rem;
        }
        .form-control {
            font-size: 1.2rem;
            padding: 0.5rem;
        }
        .panel-primary {
            border-color: #FFA500;
        }
        .panel-primary > .panel-heading {
            background-color: #FFA500;
            border-color: #FFA500;
            color: white;
        }
        .btn-primary {
            background-color: #FFA500;
            border-color: #FFA500;
        }
        .control-label {
            text-align: left !important;
        }
    </style>

</head>
<body class="nav-md">

<form name="MyInvoiceForm" id="MyInvoiceForm">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <%@ include file="TopBar.jsp" %>
                    <%@ include file="LeftTopSide.jsp" %>
                    <%@ include file="SideBar.jsp" %>
                </div>
            </div>
            <%@ include file="TopNavigation.jsp" %>
            <div class="row text-center">
                <h1>Impressions List</h1>
            </div>
            <form method="get" id="searchForm" class="form-inline justify-content-end mb-8" style="display: flex; justify-content: flex-end;">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" name="search_term" id="search_term" value="<%= request.getParameter("search_term") != null ? request.getParameter("search_term") : "" %>">
                    <button type="Search" class="btn btn-warning btn-sm" id="Search">Search</button>
                    <button type="button" class="btn btn-warning btn-sm" id="clearSearch">Clear</button>
                </div>
            </form>
            <div class="table-responsive">
                <table role="grid" id="impressions_table" class="table table-bordered table-striped table-hover dataTable">
                    <thead style="background: black; color: white;">
                        <tr>
                            <th class="sorting">Impression ID</th>
                            <th class="sorting">Case Id</th>
                            <th class="sorting">Patient Name</th>
                            <th class="sorting">Doctor Name</th>
                            <th class="sorting">CRM Name</th>
                            <th class="sorting">Case Type</th>
                            <th class="sorting">Impression Received Date</th>
                            <th class="sorting">Impression User</th>
                            <th class="sorting">Updated By</th>
                            <th class="sorting">Remarks</th>
                            <th class="sorting">Decision</th>
                            <th class="sorting">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                       
                         ps = null;
                         rs = null;
                        try {
                            con = LoginDAO.getConnectionDetails();
                            String search_term = request.getParameter("search_term");
                            String sql;

                            if (search_term != null && !search_term.trim().isEmpty()) {
                                sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date, impression_user, Updated_By, remarks, decision FROM impression WHERE (decision = 'Impression_Accept' OR decision = 'Impression_Reject') AND (impression_id LIKE ? OR case_id LIKE ? OR patient_name LIKE ? OR doctor_name LIKE ? OR crm_name LIKE ?)";
                                ps = con.prepareStatement(sql);
                                ps.setString(1, "%" + search_term + "%");
                                ps.setString(2, "%" + search_term + "%");
                                ps.setString(3, "%" + search_term + "%");
                                ps.setString(4, "%" + search_term + "%");
                                ps.setString(5, "%" + search_term + "%");
                            } else {
                                sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date, impression_user, Updated_By, remarks, decision FROM impression WHERE decision = 'Impression_Accept' OR decision = 'Impression_Reject'";
                                ps = con.prepareStatement(sql);
                            }

                            rs = ps.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("impression_id") %></td>
                            <td><%= rs.getString("case_id") %></td>
                            <td><%= rs.getString("patient_name") %></td>
                            <td><%= rs.getString("doctor_name") %></td>
                            <td><%= rs.getString("crm_name") %></td>
                            <td><%= rs.getString("caseType") %></td>
                            <td><%= rs.getString("impression_received_date") %></td>
                            <td><%= rs.getString("impression_user") %></td>
                            <td><%= rs.getString("Updated_By") %></td>
                            <td><%= rs.getString("remarks") %></td>
                            <td><%= rs.getString("decision") %></td>
                            <td>
                                <form action="EditImpressionTable.jsp" method="get">
                                    <input type="hidden" name="impression_id" value="<%= rs.getInt("impression_id") %>">
                                    <button type="submit" class="btn btn-warning">Edit</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                            } 
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (con != null) con.close();
                        } 
                        %>
                    </tbody>
                </table>
            </div>
            <script>
                document.getElementById("clearSearch").addEventListener("click", function() {
                    document.getElementById("search_term").value = "";
                    document.getElementById("searchForm").submit();
                });

                window.addEventListener("load", function() {
                    if (!window.location.search.includes("search_term")) {
                        document.getElementById("search_term").value = "";
                    }
                });
            </script>
        </div>
    </div>
</form>
<script type="text/javascript">
    function submitDecision(decision) {
        document.getElementById('action').value = decision;
        document.forms[0].submit();
    }
</script>
</body>
</html>
 