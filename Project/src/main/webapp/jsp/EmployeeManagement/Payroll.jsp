<%@page import="java.util.Random"%>
<%@page import="java.util.UUID"%>
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
	<link rel="stylesheet" href="css/glyphican.css">
	<link rel="stylesheet" href="css/custom.css">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/EmployeeManagement/Payroll.js"></script>
	
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>	
	<title>Payroll</title>
</head>

<body>
	<div class="container-fluid" style="height: 1450px">
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
		
		<form method="GET"  action="getEmployeePayroll" >
		<div class="form-group row my-5">
     					<label for="employeeCode" class="col-md-2 col-form-label" style="margin-left:320px ">Select Employee Id</label>
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
	
		<form:form method="POST" action="enterPayroll" modelAttribute="employee" id="validatePayForm">
			<div class="row">
				<div class="col-md-6">
		
					<div class="form-group row">
						<label for="employeeCode" class="col-md-5 col-form-label ml-4">Employee ID</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" id="employeeCode"  path="employeeCode" name="employeeCode" readonly="true" placeholder="System Generated"/>
      					</div>
      				</div>
		
					<div class="form-group row">
    					<label for="firstName" class="col-md-5 col-form-label ml-4">First Name</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" id="firstName" path="firstName" name="firstName" readonly="true" placeholder="System Generated"/>
    					</div>
    				</div>
		
		
					<div class="form-group row">
    					<label for="lastName" class="col-md-5 col-form-label ml-4">Last Name</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" id="lastName" path="lastName" name="lastName" readonly="true" placeholder="System Generated"/>
    					</div>
    				</div>
    
    				<div class="form-group row mb-5">
						<label for="currentAddress" class="col-md-5 col-form-label ml-4">Address</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" id="currentAddress" path="currentAddress" name="currentAddress" readonly="true" placeholder="System Generated"/>
      					</div>
      				</div>
   
 					<div class="form-group row ">
						<label for="basicSalary" class="col-md-5 col-form-label ml-4">Basic Salary</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" id="basicSalary" path="basicSalary" name="basicSalary" readonly="true" placeholder="Rs."/>
      					</div>
   	 				</div>
   	 				
    				<% 
    
						    String id=(String)session.getAttribute("code");
						    Class.forName("com.mysql.jdbc.Driver");
							Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
							Statement st = con.createStatement();
								
							String query1 = "select substr(timediff(endTime,strtTime),1,2) from overtime where  month(date) = month(curdate()) and eeid='"+id+"'";
							ResultSet rs1 = st.executeQuery(query1);
								
							int dif,sum=0;
								
							while(rs1.next())
							{
								 dif=Integer.parseInt(rs1.getString(1));
								 sum=sum+dif;
									
							}
						
						    int total=sum;
    
    				%>
    
    				<div class="form-group row">
						<label for="overTime" class="col-md-5 col-form-label ml-4">Over Time(Hours)</label>
    					<div class="col-md-6">
      						<input type="number" class="form-control" id="overTime"  name="overTime" readonly="true" placeholder="System Gen" value="<%=total%>">
      					</div>
      				</div>
    
     				<div class="form-group row">
						<label for="hourlyRate" class="col-md-5 col-form-label ml-4">Hourly Rate</label>
    					<div class="col-md-6">
      						<input type="number" class="form-control" id="hourlyRate" step="any" name="hourlyRate" placeholder="Rs.">
      					</div>
      				</div>
    
    				<div class="form-group row mb-5">
						<label for="allowances" class="col-md-5 col-form-label ml-4">Allowances</label>
    					<div class="col-md-6">
      						<input type="number" class="form-control" id="allowances" step="any" name="allowances" placeholder="Rs.">
      					</div>
      				</div>
    
   					<div class="form-group row mb-5 "style="margin-top: 100px">
						<label for="grossSalary" class="col-md-5 col-form-label ml-4">Gross Salary</label>
    					<div class="col-md-6">
      						<input type="number" class="form-control" id="grossSalary" step="any" name="grossSalary" readonly="true" placeholder="Rs.">
      					</div>
      				</div>
    
    				<div class="form-group row">
						<label for="netSal" class="col-md-5 col-form-label ml-4 mb-5">Net Salary</label>
    					<div class="col-md-6">
      						<input type="number" class="form-control" id="total" name="total" step="any" readonly="true" placeholder="Rs.">
      					</div>
      				</div>
    			</div>
		
				<div class="col-md-6">
				
					<%
						Random random = new Random();
						String s=String.format("%04d",random.nextInt(10000)); 
					%>
					
					<div class="form-group row">
						<label for="refId" class="col-md-5 col-form-label ml-4">Reference No</label>
    					<div class="col-md-6">
      						<input type="text" class="form-control" id="refId" name="refId" value="<%=s %>" placeholder="System Gen" readonly="true"/>
    					</div>
    				</div>
    
    				<div class="form-group row">
    					<label for="payDate" class="col-md-5 col-form-label ml-4">Date</label>
    					<div class="col-md-6">
      						<input type="text" class="form-control" id="payDate" name="payDate" placeholder="System Gen" value="<%= new java.sql.Date(new java.util.Date().getTime()) %>" readonly="true"/>
    					</div>
  					</div>
  	
				  	<div class="form-group row">
						<label for="NIC" class="col-md-5 col-form-label ml-4">N.I.C</label>
				    	<div class="col-md-6">
				      		<form:input type="text" class="form-control" id="NIC" path="NIC" name="NIC" readonly="true" placeholder="System Generated"/>
				    	</div>
				    </div>
    
    				<div class="form-group row" style="margin-bottom: 40px">
      					<label for="bankAccountNo" class="col-md-5 col-form-label ml-4">Bank Account</label>
    					<div class="col-md-6">
      						<form:input type="text" class="form-control" path="bankAccountNo" id="bankAccountNo" name="bankAccountNo" readonly="true" placeholder="System Gen"/>
    					</div>
    				</div>
	

    				<div class="form-group row">
    					<div class="col-md-5 col-form-label ml-4">
    					
    						<div class="form-group row">
    							<label for="epf8" class="col-md-6 col-form-label">EPF 8%</label>
    							<div class="col-md-6">
    								<input type="number" class="form-control" step="any" id="epfEmployee" name="epfEmployee" readonly="true" placeholder="Rs.">
    							</div>
    						</div>
    
     						<div class="form-group row">
    							<label for="tax" class="col-md-6 col-form-label">Tax</label>
    							<div class="col-md-6">
    								<input type="number" class="form-control" step="any" id="tax" name="tax" placeholder="Rs.">
    							</div>
    						</div>
    						
						     <div class="form-group row">
						    	<label for="extraLeaves" class="col-md-6 col-form-label">Extra Leaves</label>
						    	<div class="col-md-6">
						    		<input type="number" step="any" class="form-control" id="extraLeaves" name="extraLeaves" placeholder="Rs.">
						    	</div>
						    </div>
    
						     <div class="form-group row ">
						    	<label for="decrements" class="col-md-6 col-form-label">Decrements</label>
						    	<div class="col-md-6">
						    		<input type="number" step="any" class="form-control" id="decrements" name="decrements" placeholder="Rs.">
						    	</div>
						   	</div>
  
    
						    <div class="form-group row" style="margin-top: 100px">
						    	<label for="deductions" class="col-md-6 col-form-label">Deductions</label>
						    	<div class="col-md-6">
						    		<input type="number" class="form-control" step="any" id="deductions" name="deductions"  readonly="true" placeholder="Rs.">
						    	</div>
						    </div>
    					</div>
    					
    					<div class="col-md-5 col-form-label ml-4">
    
    						<div class="form-group row" style="margin-bottom: 30px">
    							<div class="col text-center" style="background-color: #d2d5db;">
    								<Span style="text-decoration: underline;">Contribution</Span>
    							</div>
   							</div>
   							
						    <div class="form-group row">
						    	<label for="epf12" class="col-md-6 col-form-label" style="background-color: #d2d5db">EPF 12%</label>
						    	<div class="col-md-6" style="background-color: #d2d5db">
						    	<input type="number" step="any" class="form-control" readonly="true" id="epfEmployer" name="epfEmployer" placeholder="Rs.">
						    	</div>
						    </div>
    
						    <div class="form-group row">
						      	<label for="etf3" class="col-md-6 col-form-label" style="background-color: #d2d5db">ETF 3%</label>
						    	<div class="col-md-6" style="background-color: #d2d5db">
						    		<input type="number" step="any" class="form-control" id="etf" name="etf" readonly="true" placeholder="Rs.">
						    	</div>
						    </div>
    
    						<div class="form-group row">
     							<label for="bonus" class="col-md-6 col-form-label">Bonus</label>
    							<div class="col-md-6">
    								<input type="number" step="any" class="form-control" id="bonus" name="bonus" placeholder="Rs.">
    							</div>
    						</div>
    
    
    						<div class="form-group row mb-5">
     							<label for="increments" class="col-md-6 col-form-label">Increments</label>
    							<div class="col-md-6">
    								<input type="number" class="form-control" step="any" id="increments" name="increments" placeholder="Rs.">
    							</div>
    						</div>
    
						    <div class="form-group row ">
						     	<label for="additions" class="col-md-6 col-form-label">Additions</label>
						    	<div class="col-md-6">
						    		<input type="number" class="form-control" step="any" id="additions" name="additions" readonly="true" placeholder="Rs.">
						    	</div>
						    </div>
						    
						</div>
   					</div>
   					
    				<div class="form-group row">
					     <label for="remarks" class="col-md-5 col-form-label ml-4">Remarks</label>
					     <textarea rows="5" class="col-md-5 ml-3" id="remarks" name="remarks"></textarea> 
					</div>
    	
    			</div>
			</div>
			
			<div class="row text-center mt-5">
      			<div class="col-md-6 text-right">
      					<button type="submit" class="btn btn-primary" style="width: 210px">Submit</button>
    			</div>
    				
 				<div class="col-md-6 text-left">
      					<button type="reset" class="btn btn-primary" style="width: 210px">Reset</button>
    			</div>
    		</div>	
    		
	
		</form:form>
		<c:set var="pid" value="${employee.employeeCode}" scope="session"/>
		<div class="row text-center mt-5">
				<div class="col-md-12 ">
      					<button type="reset" class="btn btn-primary" style="width: 210px" onclick="window.open('PayrollPdf')">Generate Pay Sheet</button>
    			</div>
      	</div>	
	</div>

  	<footer class="page-footer">
		<div class="footer-copyright text-center py-3">Copyright © 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved </div>
  	</footer>
</body>
</html>