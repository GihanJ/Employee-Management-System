<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    <%
    	try
    	{
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM other_emps WHERE " +
                    "vehicleNo = ?");
            System.out.print("vehicle : "+ request.getParameter("vehicle"));
            ps.setString(1,request.getParameter("vehicle"));
            ResultSet res = ps.executeQuery();
            if(res.first())
            {
                out.print("Vehicle already assigned");
            }else
            {
                out.print("Vehicle can be assigned");
            }
        }
    	catch (Exception e)
    	{
            System.out.println(e);  
        }
	%> 