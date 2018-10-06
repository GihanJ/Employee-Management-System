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
                    "bikeNo = ?");
            System.out.print("bikeNo : "+ request.getParameter("bike"));
            ps.setString(1,request.getParameter("bike"));
            ResultSet res = ps.executeQuery();
            
            if(res.first())
            {
                out.print("Bike already assigned");
            }
            else
            {
                out.print("Bike can be assigned");
            }
        }
    	catch (Exception e)
    	{
            System.out.println(e);  
        }
 	
 	%> 