package com.example.demo.service.EmployeeManagement;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

//Service class to notify new password via  email

@Service
public class ResetPassword {
	
	
	
private JavaMailSender javaMailSender;
	
	@Autowired
	public ResetPassword(JavaMailSender javaMailSender) {
		
		this.javaMailSender=javaMailSender;
		
	}
	
	public void sendEmail(String mail) throws MessagingException {
		
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,false,"utf-8");
		String html = "<h3>New Password</h3><h2>45r65GT@DF</h2> ";
		helper.setText(html,true);
		helper.setTo(mail);
		helper.setSubject("Password Reset");
		helper.setFrom("springTest123456@gmail.com");
		
		javaMailSender.send(mimeMessage);
		
	}
	
	

}
