package com.example.demo.controller.EmployeeManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DashboardController  
{
	
	public static int chartX() throws SQLException, ClassNotFoundException 
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
		
		String query1 = "Select Count(*) from employee where designation='Technician'";
		ResultSet rs1 = st.executeQuery(query1);
		String Countrow1="";
		while(rs1.next())
		{
			
			Countrow1 = rs1.getString(1);
			
		}
		
		
		return Integer.parseInt(Countrow1);	
	
	}
	
	  
	public static int chartY() throws SQLException, ClassNotFoundException 
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
		
		String query2 = "Select Count(*) from employee where designation='Driver'";
		ResultSet rs2 = st.executeQuery(query2);
		String Countrow2="";
		while(rs2.next())
		{
			
			Countrow2 = rs2.getString(1);
			
		}
		
	  	return Integer.parseInt(Countrow2);	
		
	}	
	
	
	public static int chartZ() throws SQLException, ClassNotFoundException 
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
		String query3 = "Select Count(*) from employee where designation='D.E.O'";
		ResultSet rs3 = st.executeQuery(query3);
		String Countrow3="";
		while(rs3.next())
		{
			
			Countrow3 = rs3.getString(1);
			
		}
		
	  	return Integer.parseInt(Countrow3);
		
	}
  	
  	public static int chartA() throws SQLException, ClassNotFoundException 
  	{
  		
  		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();

		String query4 = "Select Count(*) from employee where gender='male'";
		ResultSet rs4 = st.executeQuery(query4);
		String Countrow4="";
		while(rs4.next())
		{
			
			Countrow4 = rs4.getString(1);
			
		}
		
		
		return Integer.parseInt(Countrow4);	
  		
  		
  	}
  	
	public static int chartB() throws SQLException, ClassNotFoundException 
	{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
			Statement st = (Statement) con.createStatement();
		
			String query5 = "Select Count(*) from employee where gender='female'";
			ResultSet rs5 = st.executeQuery(query5);
			String Countrow5="";
			while(rs5.next())
			{
				
				Countrow5 = rs5.getString(1);
				
			}
			
		  	return Integer.parseInt(Countrow5);	
		
		
	}

  	
	
	public static int chartC() throws SQLException, ClassNotFoundException 
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
		
		String query6 = "select count(*) from(select substring(date,1,4) as year  from attendance) as t where year='2015';";
		ResultSet rs6 = st.executeQuery(query6);
		String Countrow6="";
		while(rs6.next())
		{
			
			Countrow6 = rs6.getString(1);
			
		}
		
	  	return Integer.parseInt(Countrow6);
		
	}
	
  	public static int chartD() throws SQLException, ClassNotFoundException 
  	{
  		
  		
  		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
  		
  		String query7 = "select count(*) from(select substring(date,1,4) as year  from attendance) as t where year='2016';";
  		ResultSet rs7 = st.executeQuery(query7);
  		String Countrow7="";
  		while(rs7.next())
  		{
  			
  			Countrow7 = rs7.getString(1);
  			
  		}
  		
  	  	return Integer.parseInt(Countrow7);
  		
  	}
  	
  	public static int chartE() throws ClassNotFoundException, SQLException 
  	{
  		
  		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
  		
  		String query8 = "select count(*) from(select substring(date,1,4) as year  from attendance) as t where year='2017';";
  		ResultSet rs8 = st.executeQuery(query8);
  		String Countrow8="";
  		while(rs8.next())
  		{
  			
  			Countrow8 = rs8.getString(1);
  			
  		}
  		
  	  	return Integer.parseInt(Countrow8);	
  		
  		
  	}
  		
  	
  	public static int chartF() throws SQLException, ClassNotFoundException 
  	{
  		
  		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/automatedbarcode_database?useSSL=false","root","root");
		Statement st = (Statement) con.createStatement();
  		
  		String query9 = "select count(*) from(select substring(date,1,4) as year  from attendance) as t where year='2018';";
  		ResultSet rs9 = st.executeQuery(query9);
  		String Countrow9="";
  		while(rs9.next())
  		{
  			
  			Countrow9 = rs9.getString(1);
  			
  		}
  		
  	  	return Integer.parseInt(Countrow9);	
  		
  	}
  	
}
