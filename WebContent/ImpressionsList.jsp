<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.workflow.connection.LoginDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Impressions List</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
    <style>
        .mt-1 {
            margin-top: 10px !important;
        }
        .fixTableHead {
            overflow-y: auto;
            height: 110px;
        }
        .scrollable {
            overflow-y: scroll;
            display: block;
            height: 400px;
        }
        .table {
            margin-bottom: 0px;
        }
        th {
            padding: 6px 5px !important;
        }
        .sorting {
            font-size: 1.2rem;
        }
        .panel-heading {
            padding: 5px 5px;
        }
        .left_col {
            width: 100%;
        }
    </style>
</head>
<body class="nav-md" style="background: black;">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view" style="background: black;">
                <!-- Top Bar -->
                <%@ include file="TopBar.jsp" %>
                <!-- /Top Bar -->
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
            <div class="container">
                <!-- Impressions List -->
                <div class="panel panel-primary">
                    <div class="panel-heading"><strong>Impressions List</strong></div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Impression ID</th>
                                    <th>Sender Name</th>
                                    <th>Receiver Name</th>
                                    <th>Tracking ID</th>
                                    <th>Location</th>
                                    <th>Received Date</th>
                                    <th>Decision</th>
                                    <th>Remarks</th>
                                    <th>Case ID</th>
                                    <th>Patient Name</th>
                                    <th>Doctor Name</th>
                                    <th>CRM Name</th>
                                    <th>Case Type</th>
                                    <th>PLN User</th>
                                    <th>Impression User</th>
                                    <th>Lab User</th>
                                    <th>Lab At</th>
                                    <th>UPL User</th>
                                    <th>UPL At</th>
                                    <th>PLN At</th>
                                    <th>Special Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    Connection conn = null;
                                    Statement stmt = null;
                                    ResultSet rss = null;
                                    try {
                                        conn = LoginDAO.getConnectionDetails();
                                        stmt = conn.createStatement();
                                        String sql = "SELECT * FROM impression";
                                        rs = stmt.executeQuery(sql);
                                        while(rs.next()) {
                                            int impression_id = rs.getInt("impression_id");
                                            String sender_name = rs.getString("sender_name");
                                            String receiver_name = rs.getString("receiver_name");
                                            String tracking_id = rs.getString("tracking_id");
                                            String location = rs.getString("location");
                                            Timestamp received_date = rs.getTimestamp("impression_received_date");
                                            String decision = rs.getString("decision");
                                            String remarks = rs.getString("remarks");
                                            String case_Id = rs.getString("case_id");
                                            String patient_name = rs.getString("patient_name");
                                            String doctor_name = rs.getString("doctor_name");
                                            String crm_name = rs.getString("crm_name");
                                            String caseType = rs.getString("caseType");
                                            String pln_user = rs.getString("pln_user");
                                            String impression_user = rs.getString("impression_user");
                                            String lab_user = rs.getString("lab_user");
                                            String lab_at = rs.getString("lab_at");
                                            String upl_user = rs.getString("upl_user");
                                            String upl_at = rs.getString("upl_at");
                                            String pln_at = rs.getString("pln_at");
                                            String special_remarks = rs.getString("Special_Remarks");
                                %>
                                <tr>
                                    <td><%= impression_id %></td>
                                    <td><%= sender_name %></td>
                                    <td><%= receiver_name %></td>
                                    <td><%= tracking_id %></td>
                                    <td><%= location %></td>
                                    <td><%= received_date %></td>
                                    <td><%= decision %></td>
                                    <td><%= remarks %></td>
                                    <td><%= case_Id %></td>
                                    <td><%= patient_name %></td>
                                    <td><%= doctor_name %></td>
                                    <td><%= crm_name %></td>
                                    <td><%= caseType %></td>
                                    <td><%= pln_user %></td>
                                    <td><%= impression_user %></td>
                                    <td><%= lab_user %></td>
                                    <td><%= lab_at %></td>
                                    <td><%= upl_user %></td>
                                    <td><%= upl_at %></td>
                                    <td><%= pln_at %></td>
                                    <td><%= special_remarks %></td>
                                </tr>
                                <%
                                        }
                                    } catch(SQLException e) {
                                        e.printStackTrace();
                                    } finally {
                                        try { if(rs != null) rs.close(); } catch(SQLException e) { e.printStackTrace(); }
                                        try { if(stmt != null) stmt.close(); } catch(SQLException e) { e.printStackTrace(); }
                                        try { if(conn != null) conn.close(); } catch(SQLException e) { e.printStackTrace(); }
                                    }
                                %>
