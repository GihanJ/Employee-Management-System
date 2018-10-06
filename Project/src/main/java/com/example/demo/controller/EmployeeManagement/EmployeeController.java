package com.example.demo.controller.EmployeeManagement;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.MessagingException;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dao.EmployeeManagement.EmployeeDao;
import com.example.demo.model.EmployeeManagement.Employee;
import com.example.demo.service.EmployeeManagement.EmailNotificationDeo;
import com.example.demo.service.EmployeeManagement.EmailNotificationDriver;
import com.example.demo.service.EmployeeManagement.EmailNotificationTechnician;
import com.example.demo.service.EmployeeManagement.ResetPassword;

//Controller for all employee related activities

@Controller
public class EmployeeController {

	@Autowired
	public EmployeeDao employeedao;

	@Autowired
	public EmailNotificationDeo emailNotification;
	
	@Autowired
	public EmailNotificationTechnician emailNotificationTechnician;
	
	@Autowired
	public EmailNotificationDriver emailNotificationDriver;
	
	@Autowired
	public ResetPassword resetPassword;
	
	@Autowired
	public ReadAttendanceFile rt;
	
	@Autowired
	public ReadOverTimeFile ot;
	
	
	@RequestMapping("signin")
	public String SignIn() 
		{
			return "/EmployeeManagement/SignIn";
		}
	
	@RequestMapping(value="signCheck",method=RequestMethod.GET)
	public void SignCheck(@RequestParam("userName") String userName,@RequestParam("password") String password,ModelMap model,HttpServletResponse response,HttpServletRequest request) throws IOException 
		{
			PrintWriter pw = response.getWriter();
			if(employeedao.checkCredentials(userName, password)) {
				
					request.getSession().setAttribute("USER",userName);
				
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert(\"Sign in successfull!\")");
					pw.println("location='add';");
					pw.println("</script>");
				
			}
			
			else {
				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert(\"Sign in Failed!Invalid Credentials\")");
				pw.println("location='signin';");
				pw.println("</script>");
				
				
			}
		}
	
	
	
	@RequestMapping("signout")
	public void SignOut(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
				request.getSession().removeAttribute("USER");
				request.getSession().invalidate();
				PrintWriter pw = response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert(\"Sign Out Successful!!!\")");
				pw.println("location='signin';");
				pw.println("</script>");
		}
	
	
	@RequestMapping("reset")
	public String Reset() 
		{
			return "/EmployeeManagement/ResetPassword";
		}
	
	
	
	@RequestMapping(value="resetEmail",method=RequestMethod.POST)
	public void updateReset(@RequestParam("email") String email,HttpServletResponse response) throws IOException 
		{
			

			PrintWriter pw = response.getWriter();
			try 
			{
				employeedao.reset(email);
				resetPassword.sendEmail(email);
				
			}
			
			catch(Exception e) 
			{
				 e.printStackTrace();
				 pw.println("<script type=\"text/javascript\">");
				 pw.println("alert(\"Incorrect Email !\")");
				 pw.println("location='signin';");
				 pw.println("</script>");
			
			}
		
		
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Password has been Reset Successfully!Please Check your email\")");
			 pw.println("location='signin';");
			 pw.println("</script>");
			
	}
	
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String AddDeo(ModelMap model) 
		{
				Employee employee = new Employee();
				model.addAttribute("employee",employee);
				return "/EmployeeManagement/AddEmployee";
		}
	
	@RequestMapping(value="registerdeo",method=RequestMethod.POST)
	public void enterData(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes,HttpServletResponse response) throws IOException 
		{
		
			PrintWriter pw = response.getWriter();
			try 
			{
				employeedao.insert(employee);
			}
			
			catch(Exception e) 
			{
				 e.printStackTrace();
				 pw.println("<script type=\"text/javascript\">");
				 pw.println("alert(\"User Name or N.I.C already exists !\")");
				 pw.println("location='add';");
				 pw.println("</script>");
			
			}
		
			try 
			{
		
				emailNotification.sendEmail(employee);
	
			}
			
			catch (MailException | MessagingException e) 
			{	
				
				 e.printStackTrace();
				 pw.println("<script type=\"text/javascript\">");
				 pw.println("alert(\"Registration successful! Failed to send the email due to a Network error !\")");
				 pw.println("location='add';");
				 pw.println("</script>");
			
			}
		
		
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Registration Successful! Email has been sent successfully !\")");
			 pw.println("location='add';");
			 pw.println("</script>");
		
		}
	
	@RequestMapping(value="registerdriver",method=RequestMethod.POST)
	public void enterDataDriver(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes,HttpServletResponse response) throws IOException 
		{
		
		PrintWriter pw = response.getWriter();
		try 
		{
			employeedao.insertDriver(employee);;
		}
		
		catch(Exception e) 
		{
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Vehicle Number or N.I.C already exists !\")");
			 pw.println("location='add';");
			 pw.println("</script>");
		
		}
	
		try 
		{
	
			emailNotificationDriver.sendEmail(employee);

		}
		
		catch (MailException | MessagingException e) 
		{	
			
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Registration successful! Failed to send the email due to a Network error !\")");
			 pw.println("location='add';");
			 pw.println("</script>");
		
		}
	
	
		 pw.println("<script type=\"text/javascript\">");
		 pw.println("alert(\"Registration Successful! Email has been sent successfully !\")");
		 pw.println("location='add';");
		 pw.println("</script>");
		 
		}
	
	
	@RequestMapping(value="registerTechnician",method=RequestMethod.POST)
	public void enterDataTechnician(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes,HttpServletResponse response) throws IOException 
		{
		
		PrintWriter pw = response.getWriter();
		try 
		{
			employeedao.insertTechnician(employee);
		}
		
		catch(Exception e) 
		{
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Bike Number or N.I.C already exists !\")");
			 pw.println("location='add';");
			 pw.println("</script>");
		
		}
	
		try 
		{
	
			emailNotificationTechnician.sendEmail(employee);

		}
		
		catch (MailException | MessagingException e) 
		{	
			
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Registration successful! Failed to send the email due to a Network error !\")");
			 pw.println("location='add';");
			 pw.println("</script>");
		
		}
	
	
		 pw.println("<script type=\"text/javascript\">");
		 pw.println("alert(\"Registration Successful! Email has been sent successfully !\")");
		 pw.println("location='add';");
		 pw.println("</script>");
		}
	
	
	@RequestMapping("remove")
	public String RemoveEmp(ModelMap model) 
		{
			
			model.addAttribute("remployee",new Employee());
			return "/EmployeeManagement/RemoveEmployee";
		}
	

	@RequestMapping(value="getEmployee",method=RequestMethod.GET)
	public String editProfile(@RequestParam("employeeCode") String employeeCode,ModelMap model) 
		{
			Employee employee= employeedao.getEmployeeById(employeeCode);
			model.addAttribute("employee", employee);
			return "/EmployeeManagement/EmployeeProfile";
		}
	
	
	 @RequestMapping(value="/editProfileByID/{id}",method=RequestMethod.GET)
		public String editProfilebyID(@PathVariable ("id") String employeeCode,ModelMap model) 
			{
				Employee employee= employeedao.getEmployeeById(employeeCode);
				model.addAttribute("employee", employee);
				return "/EmployeeManagement/EmployeeProfile";
			}
	 
	 
	
	@RequestMapping(value="getEmployeePayroll",method=RequestMethod.GET)
	public String getEmployeePayroll(HttpServletRequest request,@RequestParam("employeeCode") String employeeCode,ModelMap model) 
		{
			Employee employee= employeedao.getEmployeeById(employeeCode);
			model.addAttribute("employee", employee);
			request.getSession().setAttribute("code", employee.getEmployeeCode());
			return "/EmployeeManagement/Payroll";
		}
	
	
	
	
	
	@RequestMapping(value="getEditEmployee",method=RequestMethod.POST)
	public String editEmpProfile(@RequestParam("employeeCode") String employeeCode,ModelMap model) 
		{
			Employee employee= employeedao.getEmployeeById(employeeCode);
			model.addAttribute("employee", employee);
			return "/EmployeeManagement/EditEmployeeProfile";
		}
	
	
	@RequestMapping(value="removeEmployee",method=RequestMethod.GET)
	public String empRemove(@RequestParam("employeeCode") String employeeCode,ModelMap model) 
		{
			Employee remployee= employeedao.getRemovedById(employeeCode);
			model.addAttribute("remployee", remployee);
			return "/EmployeeManagement/RemoveEmployee";
		}
	
	@RequestMapping(value="empRemove",method=RequestMethod.POST)
	public String empremove(@ModelAttribute("employee")Employee s,@RequestParam("employeeCode") String employeeCode,ModelMap model,RedirectAttributes redirectAttributes) 
		{
			 employeedao.delete(s,employeeCode);
			 return "redirect:/remove";
		}
	
	@RequestMapping(value="getLeaveEmployee",method=RequestMethod.GET)
	public String empGetLeave(@RequestParam("employeeCode") String employeeCode,ModelMap model) 
		{
			Employee lemployee= employeedao.getRemovedById(employeeCode);
			model.addAttribute("lemployee", lemployee);
			return "/EmployeeManagement/Leave";
		}
	
	@RequestMapping(value="leaveEmployee",method=RequestMethod.POST)
	public String empleave(@ModelAttribute("employee")Employee s,RedirectAttributes redirectAttributes) 
		{
			 employeedao.leave(s);
			 return "redirect:/leave";
		}
	
	
	@RequestMapping("profile")
	public String pro(ModelMap model) 
		{
			model.addAttribute("employee",new Employee());
			return "/EmployeeManagement/EmployeeProfile";
		}
	
	
	@RequestMapping("editprofile")
	public String editPro(ModelMap model) 
		{
			model.addAttribute("employee",new Employee());
			return "/EmployeeManagement/EditEmployeeProfile";
		}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public void update(@ModelAttribute("employee")Employee s,BindingResult bindingResult,ModelMap model,HttpServletResponse response) throws IOException 
		{
			

			PrintWriter pw = response.getWriter();
			try 
			{
				employeedao.update(s);
			}
			
			catch(Exception e) 
			{
				 e.printStackTrace();
				 pw.println("<script type=\"text/javascript\">");
				 pw.println("alert(\"User Name/N.I.C/Bike Number or Vehicle Number already exists !\")");
				 pw.println("location='profile';");
				 pw.println("</script>");
			
			}
		
		
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Update Successful!\")");
			 pw.println("location='profile';");
			 pw.println("</script>");
			
	}

	
	@RequestMapping("t&a")
	public String TimeAttend() 
		{
			return "/EmployeeManagement/Time&Attend";
		}

	
	@RequestMapping("leave")
	public String Leave(ModelMap model) 
		{
			model.addAttribute("lemployee",new Employee());
			return "/EmployeeManagement/Leave";
		}
	
	@RequestMapping("payroll")
	public String Pay(ModelMap model) 
		{
			model.addAttribute("employee",new Employee());
			return "/EmployeeManagement/Payroll";
		}
	

	
	@RequestMapping(value="/dash",method=RequestMethod.GET)
	public ModelAndView employeeDashboard() {
		
		List <Employee> TechnicianList = employeedao.getAllTechnicians();
		return new ModelAndView("/EmployeeManagement/EmployeeDashboard","TechnicianList",TechnicianList); 

	}
	
	@RequestMapping(value="/ProfilePdf")
	public String profilePdf() {
	
		return "/EmployeeManagement/ProfilePDF";
	}
	
	@RequestMapping(value="/PayrollPdf")
	public String payrollPdf() {
	
		return "/EmployeeManagement/PayrollPDF";
	}
	
	
	@RequestMapping(value="uploadt&a",method=RequestMethod.POST)
	public void uploadTandA(@RequestParam("filePath") String path,HttpServletResponse response) throws IOException {
		
		
		
		PrintWriter pw = response.getWriter();
		try 
		{
			System.out.println(path);
			
			path ="C:\\Users\\HP\\Desktop\\Time and Attendance Upload\\"+path;
			System.out.println(path);
			rt.open(path);
			rt.read();
			rt.close();
			
		}
		
		catch(Exception e) 
		{
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Select the correct file to upload Attendance Records!\")");
			 pw.println("location='t&a';");
			 pw.println("</script>");
		
		}
	
	
		 pw.println("<script type=\"text/javascript\">");
		 pw.println("alert(\"Update Successful!\")");
		 pw.println("location='t&a';");
		 pw.println("</script>");
		
	
	}
	
	@RequestMapping(value="uploadOverTime",method=RequestMethod.POST)
	public void uploadOverTime(@RequestParam("overTime") String path,HttpServletResponse response) throws IOException {
		
		
		PrintWriter pw = response.getWriter();
		try 
		{
			System.out.println(path);
			
			path ="C:\\Users\\HP\\Desktop\\OverTime Upload\\"+path;
			System.out.println(path);
			ot.open(path);
			ot.read();
			ot.close();
			
		}
		
		catch(Exception e) 
		{
			 e.printStackTrace();
			 pw.println("<script type=\"text/javascript\">");
			 pw.println("alert(\"Select the correct file to upload Over Time Records!\")");
			 pw.println("location='t&a';");
			 pw.println("</script>");
		
		}
	
	
		 pw.println("<script type=\"text/javascript\">");
		 pw.println("alert(\"Update Successful!\")");
		 pw.println("location='t&a';");
		 pw.println("</script>");
		
		
	}
	
	@RequestMapping(value="enterPayroll",method=RequestMethod.POST)
	public void enterPayrollData(HttpServletResponse response,@Valid Employee employee,BindingResult result,@RequestParam("employeeCode") String employeeCode,ModelMap model,RedirectAttributes redirectAttributes) throws ScriptException, IOException 
		{
		
		PrintWriter out = response.getWriter();
		if(employeedao.insertPayCheck(employeeCode)==0) 
			{
			
				employeedao.insertPay(employee);
				out.println("<script type=\"text/javascript\">");
			       out.println("alert('Payroll Data Insertion Successfull!!!');");
			       out.println("location='payroll';");
			       out.println("</script>");
			}
		else 
		{
			
			 out.println("<script type=\"text/javascript\">");
		       out.println("alert('Employee have already been paid for this month');");
		       out.println("location='payroll';");
		       out.println("</script>");

		}

	
		}
	
	

}
