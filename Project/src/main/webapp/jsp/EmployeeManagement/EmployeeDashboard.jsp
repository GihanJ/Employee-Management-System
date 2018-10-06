<%@page import="com.example.demo.controller.EmployeeManagement.DashboardController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/Chart.bundle.min.js"></script>
	 	
	<title>EmployeeDashboard</title>
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
	<div class="container-fluid" style="height: 1700px">
		<div class="row" >
			<div class="header">
				<img src="Images/logo.png" style="width:12%;margin-left: 2%">
 				<font style="font-family: Good Times; font-size: 230%"><span style="color: white;margin-left: 2%;marg">Automated Barcode Solutions</span></font>
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
	<div class="row text-center" style="margin-top: 110px">
	<div class="col-md-10">
		<form:form  class="form-horizontal" >
<table border="2" width="100%" cellpadding="2" style="margin-left: 110px">
<tr><th>Employee ID</th><th>Contact Number</th><th>Email</th><th>Availability</th></tr>  

   <c:forEach var="employee" items="${TechnicianList}"> 
   <tr>  
   <td>${employee.employeeCode}</td>  
   <td>${employee.contactNo1}</td> 
   <td>${employee.email}</td>  
   <td>${employee.availability}</td>
    
   <% //<td><a href="/editProfileByID/${employee.employeeCode}">Profile</a></td>  %> 
   </tr>  
   </c:forEach> 
   
   
   </table>  
   <br/>
   
  
   </form:form>
	</div>
	</div>
	
	
	
		<div class="row" style="margin-top: 80px;height: 300px">
			<div class="col-md-5" style="background-color: rgba(255,255,255,0.8);margin-left: 90px;border-radius: 30px">
				<div id="canvas-holder">
					<canvas id="pie-chart"></canvas>
				</div>
			</div>
			<div class="col-md-5 ml-5" style="background-color: rgba(255,255,255,0.8);border-radius: 30px">
				<div id="canvas-holder" >
					<canvas id="pie-chartGender"></canvas>
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top:120px">
			<div class="col text-center">
				<button id="line" class="btn btn-primary" style="width: 200px">Generate Line Chart</button>
	  			<button id="bar" class="btn btn-primary" style="width: 200px">Generate Bar Chart</button>
				<button id="pie" class="btn btn-primary" style="width: 200px">Generate Pie Chart</button>
			</div>
		</div>
	 
		<div class="row" style="margin-top:30px;margin-left:260px;height:400px">
			<div class="col-md-9 " style="background-color: rgba(255,255,255,0.8);border-radius: 30px">
				<div id="canvas-holder" >
					<canvas id="chartAttendance"></canvas>
				</div>
			</div>
		</div>
	
	
		<script type="text/javascript">

			new Chart(document.getElementById("pie-chart"), 
			{
    			type: 'doughnut',
    			data: 
    			{
      				labels: ["Technician", "Driver", "D.E.O"],
      				datasets: 
      				[
        			{
          				label: "Total",
				        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
				        data: [<%=DashboardController.chartX()%>,<%=DashboardController.chartY()%>,<%=DashboardController.chartZ()%>]
        			}
      				]
    			},
    			
    			options: 
    			{
      				legend: 
      				{ 
      					display: true,
    	  				position:'bottom'
    	  			},
      				title: 
      				{
        				display: true,
        				text: 'Employee Count by Designation',
        				fontSize:20,
        				fontStyle:'italic'
      				}
    			}
			})

		</script>


		<script type="text/javascript">

		new Chart(document.getElementById("pie-chartGender"), 
		{
    		type: 'doughnut',
    		data: 
    		{
      			labels: ["Male","Female"],
      			datasets: 
      			[
        		{
		          label: "Total",
		          backgroundColor: ["#008B8B", "#DA70D6"],
		          data: [<%=DashboardController.chartA()%>,<%=DashboardController.chartB()%>]
        		}
      			]
    		},
    		options: 
    		{
      			legend: 
      			{ 
      				display: true,
      				position:'bottom' 
      			},
      			title: 
      			{
			        display: true,
			        text: 'Gender Distribution',
			        fontSize:20,
			        fontStyle:'italic'
      			}
    		}
    	})

		</script>
	
		<script type="text/javascript">

		var chartData = {
			labels: ["2015","2016","2017","2018"],
	      	datasets: 
	      	[
	        {
	          	label: "Total",
	          	backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#4286f4"],
	          	data: [<%=DashboardController.chartC()%>,<%=DashboardController.chartD()%>,<%=DashboardController.chartE()%>,<%=DashboardController.chartF()%>]
	        }
	      ]		
		};
	
		var ctx = document.getElementById("chartAttendance");	

		var chartAttendance = new Chart(ctx, 
		{
	  		type: 'bar',
	  		data: chartData,
	    	options: 
	    	{
			    legend: 
			    { 
			    	display: false 
			    },
			    
			    scales: 
			    {
					yAxes: 
					[
					{
	                  display: true,
	                  ticks: 
	                  {
	                      beginAtZero: true,
	                      stepSize: 10,
	                      max:50
	                  }
	              	}
					]
	      		},
	      
	      		title: 
	      		{
			        display: true,
			        text: 'Employee Attendance',
			        fontSize:20,
			        fontStyle:'italic'
	      		}
	    	}
	  	}); 

		document.getElementById('line').onclick = function() 
		{
			chartAttendance.destroy();
			chartAttendance = new Chart(ctx, 
			{
			    type: 'line',
			    data: chartData,
			    options: 
			    {
			      legend: 
			      { 
			    	  display: false 
			      },
			      scales: 
			      {
					  yAxes: 
					  [
					  {
		                  display: true,
		                  ticks: 
		                  {
		                      beginAtZero: true,
		                      stepSize: 10,
		                      max:50
		                  }
		              }
					  ]
		      	  },
		      
		      	  title: 
		      	  {
				       display: true,
				       text: 'Employee Attendance',
				       fontSize:20,
				       fontStyle:'italic'
		      	  }
		    	}
	  		});
		};
	
		document.getElementById('bar').onclick = function() 
		{
			chartAttendance.destroy();
			chartAttendance = new Chart(ctx, 
			{
			    type: 'bar',
			    data: chartData,
			    options: 
			    {
			      legend: 
			      { 
			    	  display: false 
			      },
			      scales: 
			      {
					  yAxes: 
					  [
					  {
			          	  display: true,
			              ticks: 
			              {
			                   beginAtZero: true,
			                   stepSize: 10,
			                   max:50
			              }
			           }]
			      },
			      
			      title: 
			      {
			        display: true,
			        text: 'Employee Attendance',
			        fontSize:20,
			        fontStyle:'italic'
			      }
			    }
		  });
		};	
	
		document.getElementById('pie').onclick = function() 
		{
			chartAttendance.destroy();
			chartAttendance = new Chart(ctx, 
			{
			    type: 'pie',
			    data: chartData,
			    options: 
			    {
				      legend: 
				      { 
				    	  display: true 
				      },
				      scales: 
				      {

				          yAxes: 
				          [
				          {
				               display: true,
				               ticks: 
				               {
				                      beginAtZero: true,
				                      stepSize: 10,
				                      max:50
				               }
				           }
				           ]
				      },
				      
				      title: 
				      {
					        display: true,
					        text: 'Employee Attendance',
					        fontSize:20,
					        fontStyle:'italic'
				      }
				}
			 });
		};

		</script>
	</div>
 
 	<footer class="page-footer" style="background-color:#5c5d60;">
		<div class="footer-copyright text-center py-3">Copyright © 2018  Automated Barcode Solutions (Pvt) Ltd . All rights reserved</div>
  	</footer>
  	
</body>
</html>