package com.example.demo.service.EmployeeManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.demo.model.EmployeeManagement.Employee;

@Service
public class EmailNotificationTechnician {
	
	
private JavaMailSender javaMailSender;
	
	@Autowired
	public EmailNotificationTechnician(JavaMailSender javaMailSender) {
		this.javaMailSender=javaMailSender;
		
	}
	
	public void sendEmail(Employee  e) {
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setTo(e.getEmail());
		simpleMailMessage.setFrom("springTest123456@gmail.com");
		simpleMailMessage.setSubject("Welcome to Automated Barcode Solutions(pvt)Ltd");
		simpleMailMessage.setText(e.getBikeNo());
		
		javaMailSender.send(simpleMailMessage);
		
	}
	
	

}
