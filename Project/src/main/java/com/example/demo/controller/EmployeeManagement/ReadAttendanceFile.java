package com.example.demo.controller.EmployeeManagement;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.EmployeeManagement.EmployeeDao;

@Service
public class ReadAttendanceFile {
	
	
private Scanner x;

@Autowired
private EmployeeDao employeeDao;

	
	
	public void open(String path) {
		
		 try {
			x= new Scanner(new File(path));
			
		} catch (FileNotFoundException e) {
			System.out.println("File not found");
		}
		
	}
	
	public void read() {
		
		while(x.hasNext()) {
			
			String a =x.next();
			String b =x.next();
			String c =x.next();
			String d =x.next();
			
			System.out.println("");
			employeeDao.uploadTimeAttendance(a,b,c,d);
			
			
	}
		
	}
	
	public void close() {
		x.close();
		
	}
	
	
	

}
