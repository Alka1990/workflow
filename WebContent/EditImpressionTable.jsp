<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.workflow.connection.LoginDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Impression</title>
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
    <script type="text/javascript">
        function handleFormSubmission(event) {
            event.preventDefault(); // Prevent the default form submission

            // Display the alert
            alert("Submitted Successfully");

            // Manually submit the form after the alert
            event.target.submit();
        }
    </script>
    
</head>

<body class="nav-md" style="background: black;" >
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
                        <div class="panel-heading"><strong>Edit Impression Data</strong></div>
                        <div class="panel-body">
                            <%
                                String impressionId = request.getParameter("impression_id");
                              
                            String caseId = "", patientName = "", doctorName = "", crmName = "", caseType = "", impressionReceivedDate = "", remarks = "";

                                try {
                                    con = LoginDAO.getConnectionDetails();
                                    String sql = "SELECT case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date, remarks FROM impression WHERE impression_id = ?";
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, impressionId);
                                    rs = ps.executeQuery();

                                    if (rs.next()) {
                                        caseId = rs.getString("case_id");
                                        patientName = rs.getString("patient_name");
                                        doctorName = rs.getString("doctor_name");
                                        crmName = rs.getString("crm_name");
                                        caseType = rs.getString("caseType");
                                        impressionReceivedDate = rs.getString("impression_received_date");
                                        remarks = rs.getString("remarks");
                                    }
                                } catch (SQLException | ClassNotFoundException e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) rs.close();
                                    if (ps != null) ps.close();
                                    if (con != null) con.close();
                                }

                       
                            %>
                             <form action="UpdateImpression" method="post" onsubmit="return handleFormSubmission(event)" class="form-horizontal">
                                <div class="form-group">
                                    <label for="impression_id" class="col-sm-2 control-label">Impression ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="impression_id" id="impression_id" class="form-control" value="<%= impressionId %>" readonly>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="caseId" class="col-sm-2 control-label">Case ID:</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="case_id" id="case_id" minlength="10" maxlength="10" placeholder="Case ID" class="form-control" required oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= caseId != null ? caseId : "" %>"">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="patientName" class="col-sm-2 control-label">Patient Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="patient_name" name="patient_name" class="form-control" value="<%= patientName %>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="doctorName" class="col-sm-2 control-label">Doctor Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="doctor_name" name="doctor_name" class="form-control" value="<%= doctorName %>">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2" for="crm_name">CRM Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="crm_name" name="crm_name" value="<%= crmName %>" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="caseType">Case Type:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="caseType" name="caseType" value="<%= caseType %>" >
                                    </div>
                                </div>

                               <div class="form-group">
    <label for="impressionReceivedDate" class="col-sm-2 control-label">Impression Received Date:</label>
    <div class="col-sm-10">
        <input type="datetime-local" class="form-control" id="impression_received_date" name="impression_received_date" required 
            value="<%= impressionReceivedDate != null ? impressionReceivedDate.replace(' ', 'T') : "" %>">
    </div>
</div>

                                <div class="form-group">
                                    <label for="remarks" class="col-sm-2 control-label">Remarks:</label>
                                    <div class="col-sm-10">
                                        <textarea id="remarks" name="remarks" class="form-control"><%= remarks %></textarea>
                                    </div>
                                </div>
                                
                                <input type="hidden" name="impression_id" value="<%= impressionId %>">
                                <div class="form-group">
                                    <div class="col-sm-12 text-center">
                                        <button id="submitButton" type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
        </div>
    </div>
<script>
        function checkFormFields() {
            const caseId = document.getElementById('caseId').value.trim();
            const impressionReceivedDate = document.getElementById('impression_received_date').value.trim();
            return caseId !== '' && impressionReceivedDate !== '';
        }

        function handleFormSubmission(event) {
            if (!checkFormFields()) {
                alert('Please fill in all required fields.');
                event.preventDefault(); // Prevent the form from submitting
                return false;
            } else {
                alert('Updated Successfully');
            }
            return true;
        }

        function toggleSubmitButton() {
            const submitButton = document.getElementById('submitButton');
            submitButton.disabled = !checkFormFields();
        }

        document.getElementById('caseId').addEventListener('input', toggleSubmitButton);
        document.getElementById('impression_received_date').addEventListener('input', toggleSubmitButton);

        document.addEventListener('DOMContentLoaded', toggleSubmitButton);
    </script>
    <script>
    // Function to set the min and max attributes for the date input
    function setDateLimits() {
        const dateInput = document.getElementById('impression_received_date');
        const today = new Date();
        
        // Get the first and last day of the current month
        const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        const lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        // Format dates to YYYY-MM-DD
        const minDate = firstDayOfMonth.toISOString().split('T')[0];
        const maxDate = lastDayOfMonth.toISOString().split('T')[0];

        // Set the min and max attributes
        dateInput.setAttribute('min', minDate + 'T00:00'); // Start of the day
        dateInput.setAttribute('max', maxDate + 'T23:59'); // End of the day
    }

    // Call the function to set the date limits when the document is loaded
    document.addEventListener('DOMContentLoaded', setDateLimits);
</script>
</body>

</html>
