package com.example.demo.controller.EmployeeManagement;


import java.io.IOException;
import java.io.PrintWriter;


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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dao.EmployeeManagement.EmployeeDao;
import com.example.demo.model.EmployeeManagement.Employee;
import com.example.demo.service.EmployeeManagement.EmailNotificationDeo;
import com.example.demo.service.EmployeeManagement.EmailNotificationDriver;
import com.example.demo.service.EmployeeManagement.EmailNotificationTechnician;


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
	public ReadAttendanceFile rt;
	
	@Autowired
	public ReadOverTimeFile ot;
	
	
	@RequestMapping("signin")
	public String SignIn() 
		{
			return "/EmployeeManagement/SignIn";
		}
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String AddDeo(ModelMap model) 
		{
			Employee employee = new Employee();
			model.addAttribute("employee",employee);
			return "/EmployeeManagement/AddEmployee";
		}
	
	
	@RequestMapping(value="registerdeo",method=RequestMethod.POST)
	public String enterData(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes) 
		{
		
		employeedao.insert(employee);
		
		try {
		emailNotification.sendEmail(employee);
		}
		catch(MailException e){
			e.printStackTrace();
		}
		
		return "redirect:/add";
		}
	
	@RequestMapping(value="registerdriver",method=RequestMethod.POST)
	public String enterDataDriver(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes) 
		{
		
		employeedao.insertDriver(employee);
		
		try {
		emailNotificationDriver.sendEmail(employee);
		}
		catch(MailException e){
			e.printStackTrace();
		}
		
		return "redirect:/add";
		}
	
	
	@RequestMapping(value="registerTechnician",method=RequestMethod.POST)
	public String enterDataTechnician(@Valid Employee employee,BindingResult result,ModelMap model,RedirectAttributes redirectAttributes) 
		{
		
		employeedao.insertTechnician(employee);
		
		try {
			emailNotificationTechnician.sendEmail(employee);
		}
		catch(MailException e){
			e.printStackTrace();
		}
		
		return "redirect:/add";
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
	public String update(@ModelAttribute("employee")Employee s,ModelMap model) 
		{
			employeedao.update(s);
			return "/EmployeeManagement/EmployeeProfile";
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
	public String employeeDashboard() {
	
		return "/EmployeeManagement/EmployeeDashboard";
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
	public String uploadTandA(@RequestParam("filePath") String path) {
		
		System.out.println(path);
		
		path ="C:\\Users\\HP\\Desktop\\Time and Attendance Upload\\"+path;
		System.out.println(path);
		rt.open(path);
		rt.read();
		rt.close();
		
		
		return "/EmployeeManagement/Time&Attend";
	}
	
	@RequestMapping(value="uploadOverTime",method=RequestMethod.POST)
	public String uploadOverTime(@RequestParam("overTime") String path) {
		
		System.out.println(path);
		
		path ="C:\\Users\\HP\\Desktop\\OverTime Upload\\"+path;
		System.out.println(path);
		ot.open(path);
		ot.read();
		ot.close();
		
		
		return "/EmployeeManagement/Time&Attend";
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
