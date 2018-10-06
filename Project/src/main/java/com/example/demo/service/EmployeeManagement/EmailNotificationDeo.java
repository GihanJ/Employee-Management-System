package com.example.demo.service.EmployeeManagement;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.model.EmployeeManagement.Employee;

@Service
public class EmailNotificationDeo {

	private JavaMailSender javaMailSender;
	
	@Autowired
	public EmailNotificationDeo(JavaMailSender javaMailSender) {
		this.javaMailSender=javaMailSender;
		
	}
	
	public void sendEmail(Employee  e) throws MessagingException {
		
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,false,"utf-8");
		String html = "<h3>User Name</h3>"+e.getUserName()+" <h3>Password</h3> : "+e.getPassword();
		helper.setText(html,true);
		helper.setTo(e.getEmail());
		helper.setSubject("Welcome to Automated Barcode Solutions(pvt)Ltd");
		helper.setFrom("springTest123456@gmail.com");
		
		javaMailSender.send(mimeMessage);
		
		
		
	}
	
	
	
}
