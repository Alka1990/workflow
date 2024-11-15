<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.workflow.connection.LoginDAO" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"> -->
<title>Edit Draft Details</title>
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet"
	href="CSS1/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="CSS1/bootstrap.min.css">
<link rel="stylesheet" type="" href="./css/editMainDetails.css">

</head>
<body>

	<% 
	
	String Case_Id=request.getParameter("caseId");

	Connection  con=null;
    PreparedStatement ps=null;
    ResultSet rs =null;
    PreparedStatement ps1=null;
    ResultSet rs1 =null;
	int dnno=0;
	int  dno=0;
	String sql =null;
	
	String Patient_Name="";
	String Doctor_Name="";
	String clinic_Name="";
	String address="";
	String phone="";
	String crm_name="";
	
	String delivery_note_no="";
	String bclinic="";
	String badd="";
	String bgst_no="";
	String category="";
	String upper_aligner="";
	String lower_aligner="";
	String others="";
	
	String delimiters = "\\#";
	String[] address1={""};
	String[] phoneNumbers1={""};
	String[] clinicNames1={""};
	String[] buyerClinicNames1={""};
	String[] buyerAddress1={""};

	
	try{        
		     LoginDAO loginDAO = new LoginDAO();
        	 con=LoginDAO.getConnectionDetails();
 		 sql=" SELECT * FROM patient_details  WHERE Case_Id='"+Case_Id+"' ";
 		 ps=con.prepareStatement(sql);
		 rs= ps.executeQuery();
		 if(rs.next())
		 {
			
			  Patient_Name=rs.getString("Patient_Name");
			  Doctor_Name=rs.getString("Doctor_Name");
			  clinic_Name=rs.getString("clinic_Name");
			  address=rs.getString("address");
			  phone=rs.getString("phone");
			  crm_name=rs.getString("crm_name");
				
			  delivery_note_no=rs.getString("delivery_note_no");
			  bclinic=rs.getString("bclinic");;
			  badd=rs.getString("badd");
			  bgst_no=rs.getString("bgst_no");
			  category=rs.getString("category");
			  upper_aligner=rs.getString("upper_aligner");
			  lower_aligner=rs.getString("lower_aligner");
			  others=rs.getString("others");
			 
				
				if(clinic_Name!=null){
					clinicNames1=clinic_Name.split(delimiters);
				}
				if(address!=null){
					 address1 = address.split(delimiters); //if n5 is empty will still return one entry i.e ""
							 //System.out.println("address1=="+address1);
				}
				if(phone!=null){
					phoneNumbers1=phone.split(delimiters);
				}
				if(bclinic!=null){
					buyerClinicNames1=bclinic.split(delimiters);
				}
				if(badd!=null){
					buyerAddress1=badd.split(delimiters);
				}

    %>
    
    <div class="container">
    
        <div class="row ">
  <br>
	<form action="Showdrafts" method="post" id="myForm">
		<div class="container">

			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 header-styles">
					<h3>Case Details</h3>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Case id:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="cid" required pattern="[0-9]{10,10}"
						value="<%=Case_Id %>" placeholder="Enter Case Id"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px" readonly>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Patient name:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="pn" required value="<%=Patient_Name %>"
						placeholder="Enter Patient Name"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Doctor name:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="dn" required
						placeholder="Enter Doctor Name" value="<%=Doctor_Name %>"  
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			
			<!--1.Add clinic name Modal -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">

					

					<!-- Modal -->
					<div class="modal fade" id="clinicNameModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Clinic name</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text"  id="addClinicNameInput"
												placeholder="Enter Clinic Name"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeClinicNameModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="addClinicName">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>


			<!--Edit clinic Name modal  -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">



					<!-- Modal -->
					<div class="modal fade" id="EditClinicNameModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Clinic name</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text" id="cniEdit"
												placeholder="Enter Clinic Name"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeEditClinicNameModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="editClinicName">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>


			<!--2. Add address modals starts  -->
			<!--Add  Modal -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">

					

					<!-- Modal -->
					<div class="modal fade" id="ClinicAddressModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Address</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text"  id="addClinicAddressInput"
												placeholder="Enter Address"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeClinicAddressModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="addClinicAddress">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>


			<!--Edit modal  -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">



					<!-- Modal -->
					<div class="modal fade" id="EditClinicAddressModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Address</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text"  id="addrEdit"
												placeholder="Enter Address"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeEditClinicAddressModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="editClinicAddress">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--2. Add address modals ends -->

			<!--3. Add phone modals starts  -->
				<!--Add  Modal -->

				<div class="row" style="height: auto;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
	
						
	
						<!-- Modal -->
						<div class="modal fade" id="PhoneNumberModal" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title">Phone number</h6>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row" style="margin-top: 5px;">
	
	
											<div class="col-lg-12"
												style="padding-left: 10px; padding-right: 10px;">
												<input type="text" id="addPhoneNumberInput"
													placeholder="Enter Phone Number"
													style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
											</div>
	
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" id="closePhoneNumberModal">Close</button>
										<button type="button" class="btn btn-primary"
											id="addPhoneNumber">Save changes</button>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<div class="col-lg-2"></div>
				</div>
	
	
				<!--Edit modal  -->
	
				<div class="row" style="height: auto;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
	
	
	
						<!-- Modal -->
						<div class="modal fade" id="EditPhoneNumberModal" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title">Phone Number</h6>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row" style="margin-top: 5px;">
	
	
											<div class="col-lg-12"
												style="padding-left: 10px; padding-right: 10px;">
												<input type="text"  id="pnoEdit"
													placeholder="Enter Phone Number"
													style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
											</div>
	
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" id="closeEditPhoneNumberModal">Close</button>
										<button type="button" class="btn btn-primary"
											id="editPhoneNumberName">Save changes</button>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<div class="col-lg-2"></div>
				</div>
			<!--3. Add phone modals ends -->

			<!--4. Add buyer clinic name modals starts  -->
					<!--Add  Modal -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">

					

					<!-- Modal -->
					<div class="modal fade" id="BuyerClinicNameModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Buyer's Clinic name</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text" id="addBuyerClinicNameInput"
												placeholder="Enter Buyer's Clinic Name"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeBuyerClinicNameModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="addBuyerClinicName">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>


			<!--Edit modal  -->

			<div class="row" style="height: auto;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">



					<!-- Modal -->
					<div class="modal fade" id="EditBuyerClinicNameModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title">Buyer's Clinic name</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row" style="margin-top: 5px;">


										<div class="col-lg-12"
											style="padding-left: 10px; padding-right: 10px;">
											<input type="text"  id="bcnEdit"
												placeholder="Enter Buyer's Clinic Name"
												style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" id="closeEditBuyerClinicNameModal">Close</button>
									<button type="button" class="btn btn-primary"
										id="editBuyerClinicName">Save changes</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--4. Add buyer clinic name modals ends -->

			<!--5. Add buyer's address modals starts  -->
				<!--Add  Modal -->

				<div class="row" style="height: auto;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
	
						
	
						<!-- Modal -->
						<div class="modal fade" id="BuyerAddressModal" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title">Buyer's Address</h6>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row" style="margin-top: 5px;">
	
	
											<div class="col-lg-12"
												style="padding-left: 10px; padding-right: 10px;">
												<input type="text"  id="addBuyerAddressInput"
													placeholder="Enter Buyer's Address"
													style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
											</div>
	
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" id="closeBuyerAddressModal">Close</button>
										<button type="button" class="btn btn-primary"
											id="addBuyerAddress">Save changes</button>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<div class="col-lg-2"></div>
				</div>
	
	
				<!--Edit modal  -->
	
				<div class="row" style="height: auto;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
	
	
	
						<!-- Modal -->
						<div class="modal fade" id="EditBuyerAddressModal" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title">Buyer's Address</h6>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row" style="margin-top: 5px;">
	
	
											<div class="col-lg-12"
												style="padding-left: 10px; padding-right: 10px;">
												<input type="text"  id="baddEdit"
													placeholder="Enter Buyer's Clinic Address"
													style="outline: none; height: 100px; width: 100%; padding-left: 10px; padding-top: 0px !important; word-wrap: break-word">
											</div>
	
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" id="closeEditBuyerAddressModal">Close</button>
										<button type="button" class="btn btn-primary"
											id="editBuyerAddress">Save changes</button>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<div class="col-lg-2"></div>
				</div>
			<!--5. Add buyer's address modals ends -->


			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Clinic name:</h6>
				</div>
				<div class="col-lg-8"></div>


			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-3 addCursor">
					<div class="addSection" id="Addsection1" data-toggle="modal"
						data-target="#clinicNameModal">Add clinic +</div>
				</div>

				<div class="col-lg-5 makeScroll padding-ten" id="ClinicNameDiv">

			 		<%
					for(int i=0;i<clinicNames1.length;i++){
						int count=i+1;
						String name="cni"+count;
						
				%>
					<div class="card text-dark  mb-3">
						<div class="card-header">
							<a href="#EditClinicNameModal" data-toggle="modal"
								class="linkClinicName">Edit</a>&ensp; <a href="#"
								class="linkForDefault">Default <i
								class="fas fa-check color-green hide"></i></a>
							<%-- <input type="radio" name="clinicName" value="<%=name%>" style="margin-left:50%;"> --%>
						</div>
						<div class="card-body">

							<p class="card-text plinkClinicName"><%=clinicNames1[i]%></p>
						</div>
					</div>				
					 <%} %> 
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!--2.Address-->
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Address:</h6>
				</div>
				<div class="col-lg-8"></div>


			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-3 addCursor">
					<div class="addSection"  data-toggle="modal"
						data-target="#ClinicAddressModal">Add Address +</div>
				</div>

				<div class="col-lg-5 makeScroll padding-ten" id="ClinicAddressDiv">

					 <%
					for(int i=0;i<address1.length;i++){
						int count=i+1;
						String name="addr"+count;
						
				%> 
					<div class="card text-dark  mb-3">
						<div class="card-header">
							<a href="#EditClinicAddressModal" data-toggle="modal"
								class="linkClinicAddress">Edit</a>&ensp; <a href="#"
								class="linkForDefaultClinicAddress">Default <i
								class="fas fa-check color-green hide"></i></a>
							
						</div>
						<div class="card-body"> 
							<p class="card-text plinkClinicAddress"><%=address1[i]%></p>
						</div>
					</div>				
				 <%} %>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--2.Address finish-->

			<!--3. Phone Number-->
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Phone number:</h6>
				</div>
				<div class="col-lg-8"></div>


			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-3 addCursor">
					<div class="addSection"  data-toggle="modal"
						data-target="#PhoneNumberModal">Add Phone +</div>
				</div>

				<div class="col-lg-5 makeScroll padding-ten" id="PhoneNumberDiv">

					<%
					for(int i=0;i<phoneNumbers1.length;i++){
						int count=i+1;
						String name="pno"+count;
						
				%> 
					<div class="card text-dark  mb-3">
						<div class="card-header">
							<a href="#EditPhoneNumberModal" data-toggle="modal"
								class="linkPhoneNumber">Edit</a>&ensp; <a href="#"
								class="linkForDefaultPhoneNumbers">Default <i
								class="fas fa-check color-green hide"></i></a>
							
						</div>
						<div class="card-body">  
							<p class="card-text plinkPhoneNumbers"><%=phoneNumbers1[i]%></p>
						</div>
					</div>				
					 <%} %> 
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--3. Phone number finish-->

			

		

			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Crm Name:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="crm" placeholder="Enter CRM Name"
						value="<%=crm_name%>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row" style="margin-top: 50px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 header-styles">
					<h3>Delivery Note Details:</h3>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Delivery note no:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="dno" value="<%=delivery_note_no %>"
						placeholder="Enter Delivery note No."
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>
			

			<!--4. Buyer clinic name-->
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Buyer's clinic name:</h6>
				</div>
				<div class="col-lg-8"></div>


			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-3 addCursor">
					<div class="addSection"  data-toggle="modal"
						data-target="#BuyerClinicNameModal">Add Clinic +</div>
				</div>

				<div class="col-lg-5 makeScroll padding-ten" id="BuyerClinicNameDiv">

					<%
					for(int i=0;i<buyerClinicNames1.length;i++){
						int count=i+1;
						String name="bcn"+count;
						
				%> 
					<div class="card text-dark  mb-3">
						<div class="card-header">
							<a href="#EditBuyerClinicNameModal" data-toggle="modal"
								class="linkBuyerClinicName">Edit</a>&ensp; <a href="#"
								class="linkForDefaultBuyerClinicName">Default <i
								class="fas fa-check color-green hide"></i></a>
							
						</div>
						<div class="card-body">
							<p class="card-text plinkBuyerClinicName"> <%=buyerClinicNames1[i]%> </p>
						</div>
					</div>				
					<%} %> 
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--4. Buyer clinic name finish-->

			<!--5. Buyer address-->
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Buyer's address:</h6>
				</div>
				<div class="col-lg-8"></div>


			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-3 addCursor">
					<div class="addSection"  data-toggle="modal"
						data-target="#BuyerAddressModal">Add Address +</div>
				</div>

				<div class="col-lg-5 makeScroll padding-ten" id="BuyerAddressDiv">

					 <%
					for(int i=0;i<buyerAddress1.length;i++){
						int count=i+1;
						String name="badd"+count;
						
				%> 
					<div class="card text-dark  mb-3">
						<div class="card-header">
							<a href="#EditBuyerAddressModal" data-toggle="modal"
								class="linkBuyerAddress">Edit</a>&ensp; <a href="#"
								class="linkForDefaultBuyerAddress">Default <i
								class="fas fa-check color-green hide"></i></a>
							
						</div>
						<div class="card-body">
							<p class="card-text plinkBuyerAddress"> <%=buyerAddress1[i]%></p>
						</div>
					</div>				
				<%} %> 
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!--5. Buyer address finish-->

			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Buyer gst no:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="bgn" placeholder="Enter buyer GST No."
						value="<%=bgst_no %>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Category:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="cat" placeholder="Enter Category"
						value="<%=category %>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Upper aligner:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="ua" placeholder="Enter upper Aligner"
						value="<%=upper_aligner %>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>
			</div>

			

			

			

			<!-- <div class="row" style="margin-top:5px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					ATT:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input  type="checkbox"  name='upperATT' placeholder="ATT" value="1" style="outline:none; height:30px; width:30px; padding-left:10px">
				</div>
				<div class="col-lg-2" ></div>
			</div> -->


			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Lower aligner:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="la" placeholder="Enter lower Aligner"
						value="<%=lower_aligner %>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>

			</div>

			<div class="row" style="margin-top: 5px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-2">
					<h6>Others:</h6>
				</div>
				<div class="col-lg-6"
					style="padding-left: 10px; padding-right: 10px;">
					<input type="text" name="oth" placeholder="Enter others"
						value="<%=others %>"
						style="outline: none; height: 30px; width: 100%; padding-left: 10px">
				</div>
				<div class="col-lg-2"></div>

			</div>
	
			<div class="row" style="display: none;" >
				<div class="col-lg-12">
					<div id="hiddenInputs">
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: 20px; margin-bottom: 50px;">
				<div class="col-lg-5"></div>
				<div class="col-lg-2">
					<button type="submit" value="Save" id="SaveButton"
						><span>Proceed </span><i class="fas fa-arrow-circle-right"></i>
					</button>
				</div>
				
				<div class="col-lg-5"></div>
			</div>

		</div>
	</form>

</div><!-- end row -->
</div><!-- end container -->

<%   } 

}catch (Exception e) {

	e.printStackTrace();
}

%>
	<!-- font awesome link -->
	<script src="JavaScript/jquery-1.10.1.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script src="JavaScript/5b8969f8ab.js"></script>



	<!-- jQuery library -->
	<script
		src="JavaScript/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="JavaScript/bootstrap.min.js"></script>

	<script src="script/script1.js"></script>

</body>
</html>