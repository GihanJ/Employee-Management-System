<%@page import="com.example.demo.service.EmployeeManagement.ResetPassword"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    <%
    	
    try{
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("SELECT  email FROM employee WHERE " +
                    "email = ?");
            System.out.print("email : "+ request.getParameter("email"));
            ps.setString(1,request.getParameter("email"));
            ResultSet res = ps.executeQuery();
            
            if(res.first())
            {
                out.print("Email exists");
            }
            else
            {
                out.print("Not Registered");
            }
        }
    	catch (Exception e)
    	{
            System.out.println(e);  
        }
	%> 