<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.workflow.connection.LoginDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert Impression Data</title>
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
 
    <!-- <script>
    
        function checkFormFields() {
            const fields = [
                'impression_id',                
                'impression_received_date'
                
            ];

            
            return true;
        }

        function handleFormSubmission(event) {
            if (!checkFormFields()) {
                alert('Please fill in all required fields.');
                return false;
            }
            return true;
        }

        function toggleSubmitButton() {
            const submitButton = document.getElementById('submit_button');
            submitButton.disabled = !checkFormFields();
        }

    </script> -->
      <script>
        function checkFormFields() {
            const fields = [
                'impression_id',                
                'impression_received_date'
            ];
            // Add your validation logic here
            return true;
        }

        function handleFormSubmission(event) {
            event.preventDefault(); // Prevent the default form submission

            const impressionId = document.getElementById('impression_id').value;
            if (!checkFormFields()) {
                alert('Please fill in all required fields.');
                return false;
            }

            // AJAX call to check for duplicate impression_id
            $.ajax({
                url: 'CheckImpressionIdServlet', // Create this servlet to handle the AJAX request
                type: 'GET',
                data: { impression_id: impressionId },
                success: function(response) {
                    if (response.exists) {
                        alert('Please enter a new impressionId. The ID you entered is duplicate.');
                    } else {
                        // Display the alert and submit the form
                        alert("Submitted Successfully");
                        document.forms[0].submit();
                    }
                },
                error: function() {
                    alert('An error occurred while checking the impression ID.');
                }
            });
        }

        function toggleSubmitButton() {
            const submitButton = document.getElementById('submit_button');
            submitButton.disabled = !checkFormFields();
        }
    </script>
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
                        <div class="panel-heading"><strong>Insert Impression Data</strong></div>
                        <div class="panel-body">
                           <%
                                String impressionId = request.getParameter("impression_id");
                              
                                String caseId = "";
                                
                                String patientName = "", doctorName = "", remarks = "";

                                try {
                                    con = LoginDAO.getConnectionDetails();
                                    String sql = "SELECT case_id, patient_name, doctor_name, remarks FROM impression WHERE impression_id = ?";
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, impressionId);
                                    rs = ps.executeQuery();

                                    if (rs.next()) {
                                        caseId = rs.getString("case_id");
                                        
                                        patientName = rs.getString("patient_name");
                                        doctorName = rs.getString("doctor_name");
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
                            <form action="InsertImpressionServlet" method="post" onsubmit="return handleFormSubmission(event)" class="form-horizontal">
                                <div class="form-group">
                                    <label for="impression_id" class="col-sm-2 control-label" >
                                    Impression ID: <span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="impression_id" id="impression_id" autofocus
                                            minlength="10" maxlength="10" placeholder="Impression ID"
                                            class="form-control"
                                            oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" required>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="caseId" class="col-sm-2 control-label">Case ID:</label>
                                    <div class="col-sm-10">
                                      
                                        <input type="text" name="case_id" id="case_id"
														minlength="10" maxlength="10" placeholder="Case ID"
														class="form-control" 
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= caseId != null ? caseId : "" %>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="patient_name" class="col-sm-2 control-label">Patient Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="patient_name" name="patient_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="doctor_name" class="col-sm-2 control-label">Doctor's Name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="doctor_name" name="doctor_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="crm_name" class="col-sm-2 control-label">CRM Name:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="crm_name" name="crm_name">
                                            <option value="">Select CRM Name</option>
                                            <% 
                                                PreparedStatement pstmt = null;
                                                 rs = null;
                                                try {
                                                    con = LoginDAO.getConnectionDetails();
                                                    String query = "SELECT DISTINCT crm_name FROM wisealign_workflow.cc_crm";
                                                    pstmt = con.prepareStatement(query);
                                                    rs = pstmt.executeQuery();
                                                    while (rs.next()) {
                                                        String crmName = rs.getString("crm_name");
                                            %>
                                            <option value="<%=crmName%>"><%=crmName%></option>
                                            <% 
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                } finally {
                                                    if (rs != null) rs.close();
                                                    if (pstmt != null) pstmt.close();
                                                    if (con != null) con.close();
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="caseType" class="col-sm-2 control-label">Case Type:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="caseType" name="caseType" >
                                            <option value="">Select Case Type</option>
                                            <option value="Clove">Clove</option>
                                            <option value="Study">Study</option>
                                            <option value="Institutional">Institutional</option>
                                            <option value="Digital">Digital</option>
                                            <option value="Retail">Retail</option>
                                            <option value="Apollo">Apollo</option>
                                            <option value="Dealer">Dealer</option>
                                            <option value="Model Printing">Model Printing</option>
                                        </select>
                                    </div>
                                </div>
                                                            <div class="form-group">
    <label for="impressionReceivedDate" class="col-sm-2 control-label">Impression Received Date:</label>
    <div class="col-sm-10">
        <input type="datetime-local" class="form-control" id="impression_received_date" name="impression_received_date" required>
    </div>
</div>
                               <!--  <div class="form-group">
                                    <label for="impression_user" class="col-sm-2 control-label">Impression User:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="impression_user" name="impression_user">
                                    </div>
                                </div> -->
                                <div class="form-group">
                                    <div class="col-sm-12 text-center">
                                        <button type="submit" class="btn btn-primary" id="submit_button" >SUBMIT</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
        </div>
          <script type="text/javascript">
        function handleFormSubmission(event) {
            event.preventDefault(); // Prevent the default form submission

            // Display the alert
            alert("Data is inserted");

            // Manually submit the form after the alert
            event.target.submit();
        }
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
    </div>
    
</body>

</html>
