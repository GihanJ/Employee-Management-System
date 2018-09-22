<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>  
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/glyphican.css">
    <script src="js/jquery.js"></script>
    <script src="js/proper.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/EmployeeManagement/RemoveEmployee.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<title>Remove Employee</title>
</head>

<body>
	<div class="container-fluid" style="height: 1350px">
		<div class="row" >
			<div class="header">
				<img src="Images/logo.png" style="width:12%;margin-left: 2%">
 				<font style="font-family: Good Times; font-size: 230%"><span style="color: white;margin-left: 2%;marg">Automated Barcode Solutions</span></font>
 
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
	
		<form method="GET"  action="removeEmployee" >
		<div class="form-group row my-5">
     					<label for="employeeId" class="col-md-2 col-form-label" style="margin-left:320px ">Select Employee Id</label>
   						<div class="col-md-5">
      						<div class="input-group">
						  		<select class="custom-select form-control" name="employeeCode" id="employeeCode">
							    	<option value=-1>Choose Id</option>
							    	<%
							    		try
							    		{
							    			String query ="select empcode from employee";
							    			Class.forName("com.mysql.jdbc.Driver").newInstance();
							    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
							    			Statement stm = con.createStatement();
							    			ResultSet rs = stm.executeQuery(query);
							    			while(rs.next()){
							    				
							    				%><option value="<%=rs.getString("empcode")%>"><%=rs.getString("empcode") %></option>
							    				<% 	    				
							    			}
							    			
							    		}
							    		catch(Exception ex){
							    			
							    			ex.printStackTrace();
							    			
							    		}
							    								    	
							    	%>
						  		</select>
						  		<button type="submit"  class="col-md-4 btn btn-primary ml-3">Generate Content</button>
						  	</div>
						  	
    					</div>
    					
  					</div>
		
		
	</form>
	
	

	<form:form method="POST" action="empRemove"  modelAttribute="remployee" id="validateRemoveForm">
	
		<div class="form-group row mt-5">
			<label for="employeeCode" class="col-md-3 col-form-label offset-3">Employee ID<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      		<form:input type="text" class="form-control" path="employeeCode" name="employeeCode" readonly="true" placeholder="System Generated"/>
      		</div>
  		</div>
  			
  		<div class="form-group row">
			<label for="firstName" class="col-md-3 col-form-label offset-3">First Name<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="text" class="form-control" name="firstName" path="firstName" readonly="true" id="firstName" placeholder="System Generated"/>
      		</div>
	 	</div>
  	
  		<div class="form-group row">
			<label for="contactNo1" class="col-md-3 col-form-label offset-3">Contact No<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="text" class="form-control" path="contactNo1" readonly="true" name="contactNo1" id="contactNo1" placeholder="System Generated"/>
      		</div>
	 	</div>
  	
  	
		<div class="form-group row">
    		<label for="joinedDate" class="col-md-3 col-form-label  offset-3">Registered Date<span class="glyphicon glyphicon-star"></span></label>
   			 <div class="col-md-3">
      				<form:input type="text" class="form-control" readonly="true" path="joinedDate" name="joinedDate" id="joinedDate" placeholder="System Generated"/>
    		</div>
		</div>
		
	 	<div class="form-group row">
   		 	<label for="designation" class="col-md-3 col-form-label  offset-3">Designation<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="text" class="form-control" path="designation" readonly="true" name="designation" id="inputLname" placeholder="System Generated"/>
    		</div>
	 	</div>
	 	
	 	<div class="form-group row">
    		<label for="departmentName" class="col-md-3 col-form-label  offset-3">Department<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="text" class="form-control" path= "departmentName" readonly="true" name="departmentName" id="departmentName" placeholder="System Generated"/>
    		</div>
	 	</div>
	 
	 	<div class="form-group row">
    		<label for="leaveDate" class="col-md-3 col-form-label  offset-3">Leaving Date<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="date"  path="leavingDate" class="form-control"  id="leaveDate" />
    		</div>
	 	</div>
	 
	 	<div class="form-group row">
    		<label for="leaveReason" class="col-md-3 col-form-label  offset-3">Leaving Reason<span class="glyphicon glyphicon-star"></span></label>
    		<div class="col-md-3">
      			<form:input type="text" class="form-control"  path="leaveReason" id="leaveReason"/>
    		</div>
	 	</div>
	 
	 	<div class="form-group row">
	 		<label for="resignation" class="col-md-3 col-form-label  offset-3">Resignation Letter</label>
	  		<div class="col-md-3">
      			<div class="input-group">
  					<div class="custom-file">
    					<form:input type="file" class="custom-file-input" path="resignation"  id="resignation" aria-describedby="inputGroupFileAddon04"/>
    					<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
  					</div>

				</div>
    		</div>
    	</div>
    
    
     	<div class="form-group row">
    		<label for="specialNotes" class="col-md-3 col-form-label  offset-3">Special Notes</label>
    		<div class="col-md-3">
      			<textarea class="form-control" id="specialNotes" name="specialNotes" rows=5></textarea>
    		</div>
	 	</div>

		<div class="row">
      		<div class="col-md-4 offset-2 my-5 text-center">
				<button type="submit" id="remove" class="btn btn-primary">Submit</button>
    		</div>
    			
 			<div class="col-md-4  my-5 text-center">
      			<button type="reset" class="btn btn-primary">Reset</button>
    		</div>
      	</div>
  	
	</form:form>
  
    
  	</div>
  	
  	<footer class="page-footer" style="background-color:#5c5d60;">
		<div class="footer-copyright text-center py-3">Copyright © 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved </div>
  	</footer>

</body>
</html>
