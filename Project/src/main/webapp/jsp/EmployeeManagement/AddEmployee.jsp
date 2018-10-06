

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="Content-Type"  name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/glyphican.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/jquery.datetimepicker.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/proper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/EmployeeManagement/AddDeo.js"></script>
	<script src="js/EmployeeManagement/AddDriver.js"></script>
	<script src="js/EmployeeManagement/AddTechnician.js"></script>
	<script src="js/EmployeeManagement/CheckExistence.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<script src="js/jquery.datetimepicker.full.js"></script>	
		
	<title>AddEmployee</title>
</head>

<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0");  //Proxies

		if(session.getAttribute("USER")== null)
		{
			response.sendRedirect("signin");
		}
		
	%>
	<div class="container-fluid" style="height: 2000px">
		<div class="row" >
			<div class="header">
				<img src="Images/logo.png" style="width:12%;margin-left: 2%">
 				<font style="font-family: Good Times; font-size: 230%"><span style="color: white;margin-left: 2%;">Automated Barcode Solutions</span></font>
 				<a href="signout"><font style="font-family: Good Times; font-size: 100%"><span style="color: white;margin-left: 90%;">Sign Out</span></font></a>
 					<div class="navbar">
						<div class="dropdown">
  							<button class="dropbtn dropdown-toggle"><a href="dash" style="color: black;text-decoration: none;">Employee Management</a></button>
  							<div class="dropdown-content">
    							<a href="add">Add Employee</a>
							    <a href="remove">Remove Employee</a>
							    <a href="profile">Employee Profile</a>
      							<div class="dropdown-divider"></div>
							    <a href="payroll">Payroll System</a>
							    <a href="t&a">Time and Attendance System</a>
							    <a href="leave">Leaving System</a>
  							</div> 
  						</div>
						<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Client Management</a></button>
  							<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
      							<div class="dropdown-divider"></div>
							    <a href="#"> a System</a>
							    <a href="#"> b System</a>
							    <a href="#"> c System</a>
 							</div>
 						</div>
					 	<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Sales Management</a></button>
 							<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
							    <div class="dropdown-divider"></div>
							    <a href="#"> a System</a>
							    <a href="#"> b System</a>
							    <a href="#"> c System</a>
  							</div>
  						</div>
						<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Order Management</a></button>
						  	<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
							    <div class="dropdown-divider"></div>
						       	<a href="#"> a System</a>
						       	<a href="#"> b System</a>
						       	<a href="#"> c System</a>
						  	</div>
						</div>
						<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Inventory Management</a></button>
							<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
							    <div class="dropdown-divider"></div>
							    <a href="#"> a System</a>
							    <a href="#"> b System</a>
							    <a href="#"> c System</a>
							</div>
						</div>
						<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Payment Management</a></button>
						  	<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
						      	<div class="dropdown-divider"></div>
						       	<a href="#"> a System</a>
						       	<a href="#"> b System</a>
						       	<a href="#"> c System</a>
						  	</div>
						</div>
						<div class="dropdown">
  				 			<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Fault Management</a></button>
  							<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
      							<div class="dropdown-divider"></div>
							    <a href="#"> a System</a>
							    <a href="#"> b System</a>
							    <a href="#"> c System</a>
  							</div>
  						</div>
						<div class="dropdown">
   							<button class="dropbtn dropdown-toggle"><a href="#" style="color: black;text-decoration: none;">Visitor Management</a></button>
  							<div class="dropdown-content">
							    <a href="#">Add Client</a>
							    <a href="#">Remove Client</a>
							    <a href="#">Client Profile</a>
      							<div class="dropdown-divider"></div>
							    <a href="#"> a System</a>
							    <a href="#"> b System</a>
							    <a href="#"> c System</a>
  							</div>
  						</div>
				</div>
			</div>
		</div>

		<div class=row>
			<div class="col-md-2 offset-3 my-5">Select Employee Type</div>
			<div class="col-md-4 my-5">
					<select class="custom-select" id="genContent">
					<option value="1" selected>D.E.O</option>
					<option value="2">Driver</option>
					<option value="3">Technician</option>
				</select>
			</div>
		</div>
		<noscript>Enable JavaScript in your browser</noscript>
		<script>
			$(function() {
				$('.form').hide();
				$('.f1').show();

				$('#genContent').on("change", function() {
					$('.form').hide();
					$('.f' + $(this).val()).show();
				}).val("1");
			});
		</script>

	
		<div class="form f1">
			<div class="form-container">
				<form:form method="POST"  action="registerdeo"  modelAttribute="employee"  id="validateForm1" name="form1">
				
				<div class="row">
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Personal Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Company Information</h4></Span></div>
				</div>
	
				<div class="row">
					<div class="col-md-5 offset-1">
				
						<div class="form-group row">
							<label for="firstName" class="col-md-5 col-form-label ml-3">First Name<span class="glyphicon glyphicon-star"></span></label>
							<div class="col-md-6 ml-4">
								<form:input type="text" name="firstName" path="firstName" class="form-control" id="firstName" placeholder="First Name" />
								<div class="has-error">
									<font color="red"><form:errors path="firstName" class="help-inline"/></font>
								</div>	
							</div>
						</div>

						<div class="form-group row">
    						<label for="lastName" class="col-md-5 col-form-label ml-3">Last Name<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="text"  name="lastName" path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>
								<div class="has-error">
									<font color="red"><form:errors path="lastName" class="help-inline"/></font>
								</div>	
							
							</div>
						</div>
   
   						<div class="form-group row">
    						<label for="datetime1" class="col-md-5 col-form-label ml-3">Birth Date<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="date" name="birthDate" id="birthDate" path="birthDate" class="form-control" placeholder="Date Of Birth"/>
    					 	</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="gender" class="col-md-5 col-form-label ml-3">Gender<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
  								<div class="input-group">
	   								<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline1" value="male" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline1">Male</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline2" value="female" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline2">Female</label>
									</div>
    							</div>
    						</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="NIC" class="col-md-5 col-form-label ml-3">N.I.C NO<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<input type="text" name="NIC" class="form-control" id="NIC" onblur="checkNICExist()" placeholder="960662770V"/><span id="nic"></span>
				 			</div>
				 		</div>
      
      					<div class="form-group row">
							<label for="status" class="col-md-5 col-form-label ml-3">Marital Status</label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="status" name="maritalStatus" >
								    	<option value="Married" selected>Married</option>
									    <option value="Single">Single</option>
									    <option value="Divorced">Divorced</option>
									    <option value="Widowed">Widowed</option>
								  	</select>
    							</div>
    						</div>
    					</div>
    					
    					<div class="form-group row">
							<label for="bank" class="col-md-5 col-form-label ml-3">Bank<span class="glyphicon glyphicon-star"></span></label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="bank" name="bank" >
								    	<option value="Commercial Bank" selected>Commercial Bank</option>
										<option value="Bank of Ceylon">Bank of Ceylon</option>
									    <option value="Cargills Bank">Cargills Bank</option>
									    <option value="CDB">CDB</option>
									    <option value="Central Finance">Central Finance</option>
									    <option value="DFCC Bank">DFCC Bank</option>
									    <option value="Hatton National Bank">Hatton National Bank</option>
									    <option value="HSBC">HSBC</option>
									  	<option value="Nations Trust Bank">Nations Trust Bank</option>
									  	<option value="NDB Bank">NDB Bank</option>
									  	<option value="NSB">NSB</option>
									  	<option value="People's Bank">People's Bank</option>
									  	<option value="Sampath Bank">Sampath Bank</option>
									  	<option value="Seylan Bank">Seylan Bank</option>
								
								  	</select>
    							</div>
    						</div>
    					</div>
    
						 <div class="form-group row">
							<label for="bankAccountNo" class="col-md-5 col-form-label ml-3">Bank Account Number<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
      							<form:input type="number" name="bankAccountNo" path="bankAccountNo" class="form-control" id="bankAccountNo" />
							</div>
						</div>
					</div>
  	
  					<div class="col-md-5">
  				
    
	  					<div class="form-group row">
	  						<label for="departmentId" class="col-md-5 col-form-label ml-3">Department<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
							  		<select class="custom-select" id="departmentId" name="departmentId" >
								    	<option value="1" selected>IT</option>
								    	<option disabled>SE</option>
								    	<option disabled>Transport</option>
							  		</select>
	    						</div>
	    					</div>
						</div>

						<div class="form-group row">
	     					<label for="designation" class="col-md-5 col-form-label ml-3">Designation<span class="glyphicon glyphicon-star"></span></label>
	   						<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select form-control" name="designation" id="designation">
								    	<option selected>D.E.O</option>
								    	<option disabled>Technician</option>
								    	<option disabled>Driver</option>
							  		</select>
							  	</div>
	    					</div>
	  					</div>
  					
						<div class="form-group row">
	     					<label for="exlevel" class="col-md-5 col-form-label ml-3">Experienced Level<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select" name="experiencedLevel" id="exlevel">
								    	<option selected>1</option>
									    <option value="1">2</option>
									    <option value="2">3</option>
							  		</select>
	    						</div>
	    					</div>
	  					</div>

						<div class="form-group row">
	      					<label for="basicSalary" class="col-md-5 col-form-label ml-3">Basic Salary<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="number" step="0.01" min="1000" name="basicSalary" class="form-control" id="basicSalary"/>
							</div>
	    				</div>
    
	    				<div class="form-group row">
	      					<label for="certificate" class="col-md-5 col-form-label ml-3">Certificates</label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="certificates" class="custom-file-input" id="certificate" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="certificate">Choose file</label>
	  								</div>
								</div>
							</div>
	    				</div>
	    
						<div class="form-group row">
	      					<label for="cv" class="col-md-5 col-form-label ml-3">Curriculum Vitae<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="cv" class="custom-file-input" id="cv" aria-describedby="inputGroupFileAddon04"/>
										<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	    				</div>
    
						<div class="form-group row">
	    					<label for="photo2" class="col-md-5 col-form-label ml-3">Profile Photo<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	        					<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="profilePhoto2" class="custom-file-input" id="photo2" accept="image/png" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	   	 				
	   	 					<div class="col">
		      						<input  type="hidden" name="profilePhoto" class="form-control" id="photo" >
		      				</div>
		      			</div>
   	 	   
						<div class="form-group row">
	    					<label for="datetime2" class="col-md-5 col-form-label ml-3">Joined Date<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="date" class="form-control" id="joinedDate" name="joinedDate" />
	    					</div>
	    				</div>
    				</div>
    			</div>
  
				<div class="row">
	  				<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Contact Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>System Login Information</h4></Span></div>
    			</div>
    		
    
   		 		<div class="row">
						
					<div class="col-md-5 offset-1"> 

						<div class="form-group row">
							<label for="cAddress" class="col-md-5 col-form-label ml-3">Current Address<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="currentAddress" class="form-control" id="caAddress" />
		      				</div>
		      			</div>
	      			
						<div class="form-group row">
							<label for="hAddress" class="col-md-5 col-form-label ml-3">Home Address</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="homeAddress" class="form-control" id="hAddress"/>
		      				</div>
		      			</div>
		
						<div class="form-group row">
							<label for="city" class="col-md-5 col-form-label ml-3">City</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="city" class="form-control" id="city" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="pcode" class="col-md-5 col-form-label ml-3">Postal Code<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="postalCode" class="form-control" id="pcode" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="cn1" class="col-md-5 col-form-label ml-3">Contact No 1<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo1" class="form-control" id="cn1" />
		      				</div>
		  				</div>
	  
		  				<div class="form-group row">
							<label for="cn2" class="col-md-5 col-form-label ml-3">Contact No 2</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo2" class="form-control" id="cn2" />
		      				</div>
						</div>
					
		  				<div class="form-group row">
							<label for="email" class="col-md-5 col-form-label ml-3">Email<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="email" name="email" class="form-control" id="email" />
		      				</div>
		      			</div>
		 			</div>
	
					<div class="col-md-5">
				
						<div class="form-group row">
	      					<label for="uName" class="col-md-5 col-form-label ml-3">User Name<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="text"  name="userName" class="form-control" id="userName" onblur = "checkExist()" /> <span id="isE"></span>
	    					</div>
	    				</div>
	    				
	    				<div class="form-group row">
	      					<label for="pass" class="col-md-5 col-form-label ml-3">Password<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="text" name="password" class="form-control" id="pass"/>
	    					</div>
	    				</div>
					</div>
				</div>

  				<div class="row">
	      			<div class="col md-5 offset-3 mt-5 ">
	      				<div class="form-actions ">
	      					<Input type="submit" id="btnSubmit" value="Submit" class="btn btn-primary">
	    				</div>
	    			</div>

					<div class="col md-5 mt-5 ">
	      					<button type="reset" class="btn btn-primary">Reset</button>
	    			</div>
      			</div>
				</form:form>
			</div>
  		</div>
  		
  		<div class="form f2">
			<div class="form-container">
				<form:form method="POST"  action="registerdriver"  modelAttribute="employee"  id="validateForm2" name="form2">
				
				<div class="row">
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Personal Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Company Information</h4></Span></div>
				</div>
	
				<div class="row">
					<div class="col-md-5 offset-1">
				
						<div class="form-group row">
							<label for="firstName" class="col-md-5 col-form-label ml-3">First Name<span class="glyphicon glyphicon-star"></span></label>
							<div class="col-md-6 ml-4">
								<form:input type="text" name="firstName" path="firstName" class="form-control" id="firstName" placeholder="First Name" />
								<div class="has-error">
									<font color="red"><form:errors path="firstName" class="help-inline"/></font>
								</div>	
							</div>
						</div>

						<div class="form-group row">
    						<label for="lastName" class="col-md-5 col-form-label ml-3">Last Name<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="text"  name="lastName" path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>
								<div class="has-error">
									<font color="red"><form:errors path="lastName" class="help-inline"/></font>
								</div>	
							
							</div>
						</div>
   
   						<div class="form-group row">
    						<label for="datetime1" class="col-md-5 col-form-label ml-3">Birth Date<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="date" name="birthDate" path="birthDate" class="form-control" placeholder="Date Of Birth"/>
    					 	</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="gender" class="col-md-5 col-form-label ml-3">Gender<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
  								<div class="input-group">
	   								<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline3" value="male" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline3">Male</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline4" value="female" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline4">Female</label>
									</div>
    							</div>
    						</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="NIC" class="col-md-5 col-form-label ml-3">N.I.C NO<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<input type="text" name="NIC" class="form-control" id="NIC" onblur="checkNICDriverExist()" placeholder="960662770V"/> <span id="nicd"></span>
				 			</div>
				 		</div>
      
      					<div class="form-group row">
							<label for="status" class="col-md-5 col-form-label ml-3">Marital Status</label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="status" name="maritalStatus" >
								    	<option value="Married" selected>Married</option>
									    <option value="Single">Single</option>
									    <option value="Divorced">Divorced</option>
									    <option value="Widowed">Widowed</option>
								  	</select>
    							</div>
    						</div>
    					</div>
    
    					<div class="form-group row">
							<label for="bank" class="col-md-5 col-form-label ml-3">Bank<span class="glyphicon glyphicon-star"></span></label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="bank" name="bank" >
								    	<option value="Commercial Bank" selected>Commercial Bank</option>
										<option value="Bank of Ceylon">Bank of Ceylon</option>
									    <option value="Cargills Bank">Cargills Bank</option>
									    <option value="CDB">CDB</option>
									    <option value="Central Finance">Central Finance</option>
									    <option value="DFCC Bank">DFCC Bank</option>
									    <option value="Hatton National Bank">Hatton National Bank</option>
									    <option value="HSBC">HSBC</option>
									  	<option value="Nations Trust Bank">Nations Trust Bank</option>
									  	<option value="NDB Bank">NDB Bank</option>
									  	<option value="NSB">NSB</option>
									  	<option value="People's Bank">People's Bank</option>
									  	<option value="Sampath Bank">Sampath Bank</option>
									  	<option value="Seylan Bank">Seylan Bank</option>
								
								  	</select>
    							</div>
    						</div>
    					</div>
    					
    					
						<div class="form-group row">
							<label for="bankAccountNo" class="col-md-5 col-form-label ml-3">Bank Account Number<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
      							<input type="number" name="bankAccountNo" class="form-control" id="bankAccountNo" />
							</div>
						</div>
					</div>
  	
  					<div class="col-md-5">
  				
    
	  					<div class="form-group row">
	  						<label for="departmentId" class="col-md-5 col-form-label ml-3">Department<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
							  		<select class="custom-select" id="departmentId" name="departmentId" >
								    	<option value="3" selected>Transport</option>
								    	<option disabled>SE</option>
								    	<option disabled>IT</option>
							  		</select>
	    						</div>
	    					</div>
						</div>

						<div class="form-group row">
	     					<label for="designation" class="col-md-5 col-form-label ml-3">Designation<span class="glyphicon glyphicon-star"></span></label>
	   						<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select form-control" name="designation" id="designation">
								    	<option selected>Driver</option>
								    	<option disabled>Technician</option>
								    	<option disabled>D.E.O</option>
							  		</select>
							  	</div>
	    					</div>
	  					</div>
  					
						<div class="form-group row">
	     					<label for="exlevel" class="col-md-5 col-form-label ml-3">Experienced Level<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select" name="experiencedLevel" id="exlevel">
								    	<option selected>1</option>
									    <option value="1">2</option>
									    <option value="2">3</option>
							  		</select>
	    						</div>
	    					</div>
	  					</div>

						<div class="form-group row">
	      					<label for="basicSalary" class="col-md-5 col-form-label ml-3">Basic Salary<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="number" step="0.01" min="1000" name="basicSalary" class="form-control" id="basicSalary"/>
							</div>
	    				</div>
    
	    				<div class="form-group row">
	      					<label for="certificate" class="col-md-5 col-form-label ml-3">Certificates</label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="certificates" class="custom-file-input" id="certificate" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="certificate">Choose file</label>
	  								</div>
								</div>
							</div>
	    				</div>
    
						<div class="form-group row">
	      					<label for="cv" class="col-md-5 col-form-label ml-3">Curriculum Vitae<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="cv" class="custom-file-input" id="cv" aria-describedby="inputGroupFileAddon04"/>
										<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	    				</div>
    
						<div class="form-group row">
	    					<label for="photo3" class="col-md-5 col-form-label ml-3">Profile Photo<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	        					<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="profilePhoto3" class="custom-file-input" id="photo3" accept="image/png" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
   	 				
   	 			   
	    					<div class="col">
	      							<input  type="hidden" name="profilePhoto" class="form-control" id="photoo" >
	      					</div>
	      				</div>
   	 	   
						<div class="form-group row">
	    					<label for="datetime2" class="col-md-5 col-form-label ml-3">Joined Date<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="date" class="form-control" name="joinedDate" id="joinedDate"/>
	    					</div>
	    				</div>
    				</div>
    			</div>
  
				<div class="row">
	  				<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Contact Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Other Information</h4></Span></div>
    			</div>
    			
    			<div class="row">
   		 	
					<div class="col-md-5 offset-1"> 

						<div class="form-group row">
							<label for="cAddress" class="col-md-5 col-form-label ml-3">Current Address<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="currentAddress" class="form-control" id="caAddress" />
		      				</div>
		      			</div>
	      			
						<div class="form-group row">
							<label for="hAddress" class="col-md-5 col-form-label ml-3">Home Address</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="homeAddress" class="form-control" id="hAddress"/>
		      				</div>
		      			</div>
		
						<div class="form-group row">
							<label for="city" class="col-md-5 col-form-label ml-3">City</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="city" class="form-control" id="city" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="pcode" class="col-md-5 col-form-label ml-3">Postal Code<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="postalCode" class="form-control" id="pcode" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="cn1" class="col-md-5 col-form-label ml-3">Contact No 1<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo1" class="form-control" id="cn1" />
		      				</div>
		  				</div>
	  
		  				<div class="form-group row">
							<label for="cn2" class="col-md-5 col-form-label ml-3">Contact No 2</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo2" class="form-control" id="cn2" />
		      				</div>
						</div>
					
		  				<div class="form-group row">
							<label for="email" class="col-md-5 col-form-label ml-3">Email<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="email" name="email" class="form-control" id="email" />
		      				</div>
		      			</div>
		 			</div>
	
					<div class="col-md-5">
				
						<div class="form-group row">
	    					<label for="drivingLicense" class="col-md-5 col-form-label ml-3">Driving License<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	        					<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" class="custom-file-input" name="drivingLicense" id="drivingLicense" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	   	 				</div>
    
	    				<div class="form-group row">
	      					<label for="VehicleNo" class="col-md-5 col-form-label ml-3">Vehicle Reg No<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="text" class="form-control" name="VehicleNo" id="VehicleNo" onblur="checkVehicleExist()"/><span id="vehicle"></span>
	    					</div>
	    				</div>
    				
	    				<div class="form-group row">
								<label for="availability" class="col-md-5 col-form-label ml-3">Availability<span class="glyphicon glyphicon-star"></span></label>
	  							<div class="col-md-6 ml-4">
	  								<div class="input-group">
		   								<div class="custom-control custom-radio custom-control-inline mt-2">
											<input type="radio" id="customRadioInline5" value="1" name="availability" class="custom-control-input"/>
		  									<label class="custom-control-label " for="customRadioInline5">In</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline mt-2">
											<input type="radio" id="customRadioInline6" value="0" name="availability" class="custom-control-input"/>
		  									<label class="custom-control-label " for="customRadioInline6">Out</label>
										</div>
	    							</div>
	    						</div>
	    				</div>
					</div>
				</div>

  				<div class="row">
      				<div class="col md-5 offset-3 mt-5 ">
      					<div class="form-actions ">
      						<Input type="submit" id="btnSubmit" value="Submit" class="btn btn-primary">
    					</div>
    				</div>

					<div class="col md-5 mt-5 ">
      					<button type="reset" class="btn btn-primary">Reset</button>
    				</div>
      			</div>
				</form:form>
			</div>
  		</div>
 
  
	  	<div class="form f3">
			<div class="form-container">
				<form:form method="POST"  action="registerTechnician"  modelAttribute="employee"  id="validateForm3" name="form3">
			
				<div class="row">
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Personal Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Company Information</h4></Span></div>
				</div>
	
				<div class="row">
					<div class="col-md-5 offset-1">
				
						<div class="form-group row">
							<label for="firstName" class="col-md-5 col-form-label ml-3">First Name<span class="glyphicon glyphicon-star"></span></label>
							<div class="col-md-6 ml-4">
								<form:input type="text" name="firstName" path="firstName" class="form-control" id="firstName" placeholder="First Name" />
								<div class="has-error">
									<font color="red"><form:errors path="firstName" class="help-inline"/></font>
								</div>	
							</div>
						</div>

						<div class="form-group row">
    						<label for="lastName" class="col-md-5 col-form-label ml-3">Last Name<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="text"  name="lastName" path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>
								<div class="has-error">
									<font color="red"><form:errors path="lastName" class="help-inline"/></font>
								</div>	
							
							</div>
						</div>
   
   						<div class="form-group row">
    						<label for="datetime1" class="col-md-5 col-form-label ml-3">Birth Date<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<form:input type="date" name="birthDate" path="birthDate" id="birthDate" class="form-control" placeholder="Date Of Birth"/>
    					 	</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="gender" class="col-md-5 col-form-label ml-3">Gender<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
  								<div class="input-group">
	   								<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline7" value="male" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline7">Male</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline mt-2">
										<input type="radio" id="customRadioInline8" value="female" name="gender" class="custom-control-input"/>
	  									<label class="custom-control-label " for="customRadioInline8">Female</label>
									</div>
    							</div>
    						</div>
    					</div>
    					
   						<div class="form-group row">
							<label for="NIC" class="col-md-5 col-form-label ml-3">N.I.C NO<span class="glyphicon glyphicon-star"></span></label>
    						<div class="col-md-6 ml-4">
      							<input type="text" name="NIC" class="form-control" id="NIC" placeholder="960662770V" onblur="checkNICTechnicianExist()"/><span id ="nict"></span>
				 			</div>
				 		</div>
      
      					<div class="form-group row">
							<label for="status" class="col-md-5 col-form-label ml-3">Marital Status</label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="status" name="maritalStatus" >
								    	<option value="Married" selected>Married</option>
									    <option value="Single">Single</option>
									    <option value="Divorced">Divorced</option>
									    <option value="Widowed">Widowed</option>
								  	</select>
    							</div>
    						</div>
    					</div>
    
    					<div class="form-group row">
							<label for="bank" class="col-md-5 col-form-label ml-3">Bank<span class="glyphicon glyphicon-star"></span></label>
      						<div class="col-md-6 ml-4">
      							<div class="input-group">
  									<select class="custom-select" id="bank" name="bank" >
								    	<option value="Commercial Bank" selected>Commercial Bank</option>
										<option value="Bank of Ceylon">Bank of Ceylon</option>
									    <option value="Cargills Bank">Cargills Bank</option>
									    <option value="CDB">CDB</option>
									    <option value="Central Finance">Central Finance</option>
									    <option value="DFCC Bank">DFCC Bank</option>
									    <option value="Hatton National Bank">Hatton National Bank</option>
									    <option value="HSBC">HSBC</option>
									  	<option value="Nations Trust Bank">Nations Trust Bank</option>
									  	<option value="NDB Bank">NDB Bank</option>
									  	<option value="NSB">NSB</option>
									  	<option value="People's Bank">People's Bank</option>
									  	<option value="Sampath Bank">Sampath Bank</option>
									  	<option value="Seylan Bank">Seylan Bank</option>
								
								  	</select>
    							</div>
    						</div>
    					</div>
    
    
    
						 <div class="form-group row">
							<label for="bankAccountNo" class="col-md-5 col-form-label ml-3">Bank Account Number<span class="glyphicon glyphicon-star"></span></label>
  							<div class="col-md-6 ml-4">
      							<input type="number" name="bankAccountNo" class="form-control" id="bankAccountNo" />
							</div>
						</div>
					</div>
  	
  					<div class="col-md-5">
  				
    
	  					<div class="form-group row">
	  						<label for="departmentId" class="col-md-5 col-form-label ml-3">Department<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
							  		<select class="custom-select" id="departmentId" name="departmentId" >
								    	<option value="1" selected>IT</option>
								    	<option disabled>SE</option>
								    	<option disabled>Transport</option>
							  		</select>
	    						</div>
	    					</div>
						</div>

						<div class="form-group row">
	     					<label for="designation" class="col-md-5 col-form-label ml-3">Designation<span class="glyphicon glyphicon-star"></span></label>
	   						<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select form-control" name="designation" id="designation">
								    	<option selected>Technician</option>
								    	<option disabled>Driver</option>
								    	<option disabled>D.E.O</option>
							  		</select>
							  	</div>
	    					</div>
	  					</div>
  					
						<div class="form-group row">
	     					<label for="exlevel" class="col-md-5 col-form-label ml-3">Experienced Level<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
							  		<select class="custom-select" name="experiencedLevel" id="exlevel">
								    	<option selected>1</option>
									    <option value="1">2</option>
									    <option value="2">3</option>
							  		</select>
	    						</div>
	    					</div>
	  					</div>

						<div class="form-group row">
	      					<label for="basicSalary" class="col-md-5 col-form-label ml-3">Basic Salary<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="number" step="0.01" min="1000"  name="basicSalary" class="form-control" id="basicSalary"/>
							</div>
	    				</div>
    
	    				<div class="form-group row">
	      					<label for="certificate" class="col-md-5 col-form-label ml-3">Certificates</label>
	    					<div class="col-md-6 ml-4">
	    						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="certificates" class="custom-file-input" id="certificate" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="certificate">Choose file</label>
	  								</div>
								</div>
							</div>
	    				</div>
    
						<div class="form-group row">
	      					<label for="cv" class="col-md-5 col-form-label ml-3">Curriculum Vitae<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="cv" class="custom-file-input" id="cv" aria-describedby="inputGroupFileAddon04"/>
										<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	    				</div>
    
						<div class="form-group row">
	    					<label for="photo4" class="col-md-5 col-form-label ml-3">Profile Photo<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	        					<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" name="profilePhoto4" class="custom-file-input" id="photo4" accept="image/png" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
   	 				
   	 			   
	    					<div class="col">
	      							<input  type="hidden" name="profilePhoto" class="form-control" id="photooo" >
	      					</div>
	      				</div>
   	 	   
						<div class="form-group row">
	    					<label for="datetime2" class="col-md-5 col-form-label ml-3">Joined Date<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="date" class="form-control" name="joinedDate" id="joinedDate" />
	    					</div>
	    				</div>
    				</div>
    			</div>
  
				<div class="row">
	  				<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Contact Information</h4></Span></div>
					<div class="col-md-6  my-5 text-center"><Span style="text-decoration: underline;"><h4>Other Information</h4></Span></div>
	    		</div>
    		
    
   		 		<div class="row">
   		 	
   		 			<div class="col-md-5 offset-1"> 

						<div class="form-group row">
							<label for="cAddress" class="col-md-5 col-form-label ml-3">Current Address<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="currentAddress" class="form-control" id="caAddress" />
		      				</div>
		      			</div>
	      			
						<div class="form-group row">
							<label for="hAddress" class="col-md-5 col-form-label ml-3">Home Address</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="homeAddress" class="form-control" id="hAddress"/>
		      				</div>
		      			</div>
		
						<div class="form-group row">
							<label for="city" class="col-md-5 col-form-label ml-3">City</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="text" name="city" class="form-control" id="city" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="pcode" class="col-md-5 col-form-label ml-3">Postal Code<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="postalCode" class="form-control" id="pcode" />
		      				</div>
						</div>
	  	
		  				<div class="form-group row">
							<label for="cn1" class="col-md-5 col-form-label ml-3">Contact No 1<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo1" class="form-control" id="cn1" />
		      				</div>
		  				</div>
	  
		  				<div class="form-group row">
							<label for="cn2" class="col-md-5 col-form-label ml-3">Contact No 2</label>
		    				<div class="col-md-6 ml-4">
		      					<input type="number" name="contactNo2" class="form-control" id="cn2" />
		      				</div>
						</div>
					
		  				<div class="form-group row">
							<label for="email" class="col-md-5 col-form-label ml-3">Email<span class="glyphicon glyphicon-star"></span></label>
		    				<div class="col-md-6 ml-4">
		      					<input type="email" name="email" class="form-control" id="email" />
		      				</div>
		      			</div>
		 			</div>
	
					<div class="col-md-5">
				
						<div class="form-group row">
	    					<label for="drivingLicense" class="col-md-5 col-form-label ml-3">Driving License<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	        					<div class="input-group">
	  								<div class="custom-file">
	    								<input type="file" class="custom-file-input" name="drivingLicense" id="drivingLicense" aria-describedby="inputGroupFileAddon04"/>
	    								<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	  								</div>
								</div>
	    					</div>
	   	 				</div>
    
	    				<div class="form-group row">
	      					<label for="bikeNo" class="col-md-5 col-form-label ml-3">Assigned Bike No<span class="glyphicon glyphicon-star"></span></label>
	    					<div class="col-md-6 ml-4">
	      						<input type="text" class="form-control" name="bikeNo" id="bikeNo" onblur="checkBikeExist()"/><span id="bike"></span>
	    					</div>
	    				</div>
    				
	    				<div class="form-group row">
								<label for="availability" class="col-md-5 col-form-label ml-3">Availability<span class="glyphicon glyphicon-star"></span></label>
	  							<div class="col-md-6 ml-4">
	  								<div class="input-group">
		   								<div class="custom-control custom-radio custom-control-inline mt-2">
											<input type="radio" id="customRadioInline9" value="1" name="availability" class="custom-control-input"/>
		  									<label class="custom-control-label " for="customRadioInline9">In</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline mt-2">
											<input type="radio" id="customRadioInline10" value="0" name="availability" class="custom-control-input"/>
		  									<label class="custom-control-label " for="customRadioInline10">Out</label>
										</div>
	    							</div>
	    						</div>
	    				</div>
					</div>
				</div>

	  			<div class="row">
	      			<div class="col md-5 offset-3 mt-5 ">
	      				<div class="form-actions ">
	      					<Input type="submit" id="btnSubmit" value="Submit" class="btn btn-primary">
	    				</div>
	    			</div>
	
					<div class="col md-5 mt-5 ">
	      					<button type="reset" class="btn btn-primary">Reset</button>
	    			</div>
	      		</div>
				</form:form>
			</div>
  		</div>
	 </div>
	 
	  <footer class="page-footer">
		<div class="footer-copyright text-center py-3">Copyright © 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved</div>
	  </footer>
 </body>
</html>