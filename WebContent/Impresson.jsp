<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.workflow.connection.LoginDAO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Impression History Form</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    
    <!-- jQuery and Bootstrap scripts -->
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
</head>
<body class="nav-md" style="background: black;">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view" style="background: black;">
                <!-- Top Bar -->
                <%@ include file="TopBar.jsp" %>
                <!-- /Top Bar -->
                
                <!-- menu profile quick info -->
                <%@ include file="LeftTopSide.jsp" %>
                <!-- /menu profile quick info -->

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
                <div class="panel panel-primary">
                    <div class="panel-heading"><strong>Enter Impression History Details</strong></div>
                    <div class="panel-body">
                        <form id="impressionForm" method="post" action="${pageContext.request.contextPath}/Impressionn" class="form-horizontal">
                            <div class="form-group">
                                <label for="impression_id" class="col-sm-2 control-label">Impression ID:</label>
                                <div class="col-sm-10">
                                    <input type="number" id="impression_id" name="impression_id" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="stage" class="col-sm-2 control-label">Stage:</label>
                                <div class="col-sm-10">
                                    <input type="text" id="stage" name="stage" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="decision" class="col-sm-2 control-label">Decision:</label>
                                <div class="col-sm-10">
                                    <input type="text" id="decision" name="decision" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">User Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" id="username" name="username" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="decision_at" class="col-sm-2 control-label">Decision At (yyyy-MM-dd HH:mm:ss):</label>
                                <div class="col-sm-10">
                                    <input type="text" id="decision_at" name="decision_at" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <!-- /footer content -->
    </div>
</div>

<script>
$(document).ready(function() {
    // Function to handle form submission
    $('#impressionForm').submit(function(e) {
        e.preventDefault(); // Prevent default form submission

        console.log("Form submission started");

        // Log form data to the console
        var formData = $(this).serialize();
        console.log("Form data: " + formData);

        // AJAX call to submit form data
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Impressionn", // Adjust URL to match servlet mapping
            data: formData, // Serialize form data
            success: function(response) {
                console.log("Form submission successful");
                console.log("Response: " + response);
                alert(response); // Show response message
            },
            error: function(xhr, status, error) {
                console.log("Form submission failed");
                console.log("Error: " + error);
            }
        });
    });
});
</script>
</body>
</html>
