package com.example.demo.dao.EmployeeManagement;


import java.sql.ResultSet;
import java.sql.SQLException;


import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Service;

import com.example.demo.model.EmployeeManagement.Employee;


@Service
public class EmployeeDao {

	JdbcTemplate template;

	
	public void setTemplate(JdbcTemplate template) 
	{
		
		this.template=template;
	}
	
	@Autowired
	public void setDataSource(DataSource datasource) 
	{
		
		template = new JdbcTemplate(datasource);
		
	}
	
	public void insert(Employee e) 
	{
		
		String sql1="insert into employee(empcode,firstName, lastName, gender, currentAddress,homeAddress,city, postalCode, martialStatus, joinedDate, NIC, dob, bankAccNo, basicSalary, experiencedLevel, cv, designation, deptId, certificate, email,contactNo1, contactNo2, profilePhoto) values ('XYZ','"+e.getFirstName()+"','"+e.getLastName()+"','"+e.getGender()+"','"+e.getCurrentAddress()+"','"+e.getHomeAddress()+"','"+e.getCity()+"','"+e.getPostalCode()+"','"+e.getMaritalStatus()+"','"+e.getJoinedDate()+"','"+e.getNIC()+"','"+e.getBirthDate()+"','"+e.getBankAccountNo()+"','"+e.getBasicSalary()+"','"+e.getExperiencedLevel()+"','"+e.getCv()+"','"+e.getDesignation()+"','"+e.getDepartmentId()+"','"+e.getCertificates()+"','"+e.getEmail()+"','"+e.getContactNo1()+"','"+e.getContactNo2()+"','"+e.getProfilePhoto()+"')";
		String sql2="UPDATE employee SET empcode = concat( empstr, empID )" ;
		String sql3="SET @last_id_in_employee = Last_Insert_ID();";
		String sql4="insert into system_user(empcode,empSUId, username, password)values ('XYZ',@last_id_in_employee,'"+e.getUserName()+"','"+e.getPassword()+"')";
		String sql5="UPDATE system_user SET empcode = concat( empstr, empSUId )" ;
		
		System.out.println(sql1);
		System.out.println(sql3);
		template.batchUpdate(sql1,sql2,sql3,sql4,sql5);
	
	} 
		
	public void delete(Employee e,String id) 
	{
		
		String sql1="insert into removed_emps(employeeId, firstName,contactNo, joinedDate, designation, departmentName, leaveDate,leavingReason, resignation, specialNotes) values ('"+e.getEmployeeCode()+"','"+e.getFirstName()+"','"+e.getContactNo1()+"','"+e.getJoinedDate()+"','"+e.getDesignation()+"','"+e.getDepartmentName()+"','"+e.getLeavingDate()+"','"+e.getLeaveReason()+"','"+e.getResignation()+"','"+e.getSpecialNotes()+"')";
		String sql2="delete from system_user where empcode='"+id+"'";
		String sql3="delete from other_emps where empCode='"+id+"'";
		String sql4="delete from overtime where eeid='"+id+"'";
		String sql5="delete from attendance where eid='"+id+"'";
		String sql6="delete from emp_leave where emID='"+id+"'";
		String sql7="delete from salary_payment where employeeID='"+id+"'";
		String sql8="delete from employee where empcode='"+id+"'";
		
		System.out.println(sql1);
		System.out.println(sql3);
		template.batchUpdate(sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8);

	} 
	
	public void leave(Employee e) 
	{
		
		String sql1="insert into emp_leave(emID, firstName, lastName, departmentName, designation, type, reason, requestedDate, strtDateTime, endDateTime) values ('"+e.getEmployeeCode()+"','"+e.getFirstName()+"','"+e.getLastName()+"','"+e.getDepartmentName()+"','"+e.getDesignation()+"','"+e.getLeaveType()+"','"+e.getLeaveReason()+"','"+e.getLeaveRequestedDate()+"','"+e.getLeaveStartDate()+"','"+e.getLeaveEndDate()+"')";

		System.out.println(sql1);
		
		template.batchUpdate(sql1);

	} 
	
	
	public void insertDriver(Employee e) 
	{
		
		String sql1="insert into employee(empcode,firstName, lastName, gender, currentAddress,homeAddress,city, postalCode, martialStatus, joinedDate, NIC, dob, bankAccNo, basicSalary, experiencedLevel, cv, designation, deptId, certificate, email,contactNo1, contactNo2, profilePhoto) values ('XYZ','"+e.getFirstName()+"','"+e.getLastName()+"','"+e.getGender()+"','"+e.getCurrentAddress()+"','"+e.getHomeAddress()+"','"+e.getCity()+"','"+e.getPostalCode()+"','"+e.getMaritalStatus()+"','"+e.getJoinedDate()+"','"+e.getNIC()+"','"+e.getBirthDate()+"','"+e.getBankAccountNo()+"','"+e.getBasicSalary()+"','"+e.getExperiencedLevel()+"','"+e.getCv()+"','"+e.getDesignation()+"','"+e.getDepartmentId()+"','"+e.getCertificates()+"','"+e.getEmail()+"','"+e.getContactNo1()+"','"+e.getContactNo2()+"','"+e.getProfilePhoto()+"')";
		String sql2="UPDATE employee SET empcode = concat( empstr, empID )" ;
		String sql3="SET @last_id_in_employee = Last_Insert_ID();";
		String sql4="insert into other_emps(empCode,empOTId, drivingLicense, availability, vehicleNo)values ('XYZ',@last_id_in_employee,'"+e.getDrivingLicense()+"','"+e.getAvailability()+"','"+e.getVehicleNo()+"')";
		String sql5="UPDATE other_emps SET empcode = concat( empStr, empOTId )" ;
		System.out.println(sql1);
		System.out.println(sql3);
		template.batchUpdate(sql1,sql2,sql3,sql4,sql5);
	
	} 
	
	public void insertTechnician(Employee e) 
	{
		
		String sql1="insert into employee(empcode,firstName, lastName, gender, currentAddress,homeAddress,city, postalCode, martialStatus, joinedDate, NIC, dob, bankAccNo, basicSalary, experiencedLevel, cv, designation, deptId, certificate, email,contactNo1, contactNo2, profilePhoto) values ('XYZ','"+e.getFirstName()+"','"+e.getLastName()+"','"+e.getGender()+"','"+e.getCurrentAddress()+"','"+e.getHomeAddress()+"','"+e.getCity()+"','"+e.getPostalCode()+"','"+e.getMaritalStatus()+"','"+e.getJoinedDate()+"','"+e.getNIC()+"','"+e.getBirthDate()+"','"+e.getBankAccountNo()+"','"+e.getBasicSalary()+"','"+e.getExperiencedLevel()+"','"+e.getCv()+"','"+e.getDesignation()+"','"+e.getDepartmentId()+"','"+e.getCertificates()+"','"+e.getEmail()+"','"+e.getContactNo1()+"','"+e.getContactNo2()+"','"+e.getProfilePhoto()+"')";
		String sql2="UPDATE employee SET empcode = concat( empstr, empID )" ;
		String sql3="SET @last_id_in_employee = Last_Insert_ID();";
		String sql4="insert into other_emps(empCode,empOTId, drivingLicense, availability,bikeNo)values ('XYZ',@last_id_in_employee,'"+e.getDrivingLicense()+"','"+e.getAvailability()+"','"+e.getBikeNo()+"')";
		String sql5="UPDATE other_emps SET empcode = concat( empStr, empOTId )" ;
		System.out.println(sql1);
		System.out.println(sql3);
		template.batchUpdate(sql1,sql2,sql3,sql4,sql5);
	
	} 
	
	
	public void uploadTimeAttendance(String a,String b,String c,String d) 
	{	
		
		String sql1="insert into attendance(date, startTime, endTime, eid) values ('"+a+"','"+b+"','"+c+"','"+d+"')";
		System.out.println(sql1);
		template.update(sql1);
	
	}
	
	public void uploadOverTime(String a,String b,String c,String d) 
	{	
		
		String sql1="insert into overtime(eeid, strtTime, endTime, date) values ('"+a+"','"+b+"','"+c+"','"+d+"')";
		System.out.println(sql1);
		template.update(sql1);
	
	}
	

	
	public Employee getEmployeeById(String id) {
		
		return template.query("select * from employee left outer join system_user on employee.empcode=system_user.empcode left outer join other_emps on other_emps.empCode=employee.empcode where employee.empcode='"+id+"'",new ResultSetExtractor<Employee>() {
			
			public Employee extractData(ResultSet rs) throws SQLException 
			{
				
				
				Employee e= new Employee();
				while(rs.next()) 
				{
					
					e.setEmployeeId(rs.getInt(2));
					e.setEmployeeCode(rs.getString(3));
					e.setFirstName(rs.getString(4));
					e.setLastName(rs.getString(5));
					e.setCurrentAddress(rs.getString(7));
					e.setCity(rs.getString(8));
					e.setPostalCode(rs.getInt(9));
					e.setMaritalStatus(rs.getString(10));
					e.setJoinedDate(rs.getDate(11));
					e.setNIC(rs.getString(12));
					e.setBankAccountNo(rs.getInt(14));
					e.setBasicSalary(rs.getDouble(15));
					e.setDesignation(rs.getString(18));
					e.setEmail(rs.getString(21));
					e.setHomeAddress(rs.getString(22));
					e.setContactNo1(rs.getInt(23));
					e.setContactNo2(rs.getInt(24));
					e.setProfilePhoto(rs.getString(25));
					e.setUserName(rs.getString(29));
					e.setPassword(rs.getString(30));
					e.setDrivingLicense(rs.getString(34));
					e.setAvailability(rs.getString(35));
					e.setVehicleNo(rs.getString(36));
					e.setBikeNo(rs.getString(37));
					
				}
			
			return e;
		}
				
			
	});
		
	}
		
	
	public void update(Employee e)
	{
		String sql1="update system_user	set username='"+e.getUserName()+"',password='"+e.getPassword()+"' where empcode='"+e.getEmployeeCode()+"';";
		String sql2="update other_emps	set drivingLicense='"+e.getDrivingLicense()+"',availability='"+e.getAvailability()+"',vehicleNo='"+e.getVehicleNo()+"',bikeNo='"+e.getBikeNo()+"' where empCode='"+e.getEmployeeCode()+"';";
		String sql3="update employee set firstName='"+e.getFirstName()+"',lastName='"+e.getLastName()+"',currentAddress='"+e.getCurrentAddress()+"',homeAddress='"+e.getHomeAddress()+"',city='"+e.getCity()+"',postalCode='"+e.getPostalCode()+"',martialStatus='"+e.getMaritalStatus()+"',NIC='"+e.getNIC()+"',bankAccNo='"+e.getBankAccountNo()+"',basicSalary='"+e.getBasicSalary()+"',email='"+e.getEmail()+"',contactNo1='"+e.getContactNo1()+"',contactNo2='"+e.getContactNo2()+"',profilePhoto='"+e.getProfilePhoto()+"' where empcode='"+e.getEmployeeCode()+"';";

		System.out.println(sql1);
		System.out.println(sql2);
		System.out.println(sql3);
		template.batchUpdate(sql1,sql2,sql3);
	} 
		
	
	
	public Employee getRemovedById(String id) 
	{

		return template.query("select * from employee left join department on employee.deptId=department.deptmID where employee.empcode='"+id+"'",new ResultSetExtractor<Employee>() {
			
			public Employee extractData(ResultSet rs) throws SQLException {
				
				
				Employee e= new Employee();
				while(rs.next()) 
				{
					e.setEmployeeCode(rs.getString(3));
					e.setFirstName(rs.getString(4));
					
					e.setLastName(rs.getString(5));
				
					e.setCurrentAddress(rs.getString(7));
					e.setCity(rs.getString(8));
					e.setPostalCode(rs.getInt(9));
					e.setMaritalStatus(rs.getString(10));
					e.setJoinedDate(rs.getDate(11));
					e.setDesignation(rs.getString(18));
					e.setContactNo1(rs.getInt(23));
					e.setDepartmentName(rs.getString(27));
					
				}
				return e;
		}
				
			
		});
		
	}

	public void insertPay(Employee e) 
	{	
		
		String sql1="insert into salary_payment(salarycode, employeeID, bonus, allowances, deductions, total, etf, epfEmployee, payDate, remarks, additions, epfEmployer, overTime, hourlyRate, grossSalary, tax, extraLeaves, decrements, increments) values ('XYZ','"+e.getEmployeeCode()+"','"+e.getBonus()+"','"+e.getAllowances()+"','"+e.getDeductions()+"','"+e.getTotal()+"','"+e.getEtf()+"','"+e.getEpfEmployee()+"','"+e.getPayDate()+"','"+e.getRemarks()+"','"+e.getAdditions()+"','"+e.getEpfEmployer()+"','"+e.getOverTime()+"','"+e.getHourlyRate()+"','"+e.getGrossSalary()+"','"+e.getTax()+"','"+e.getExtraLeaves()+"','"+e.getDecrements()+"','"+e.getIncrements()+"')";
		String sql2="UPDATE salary_payment SET salarycode = concat( salaryStr, salaryID )" ;

		System.out.println(sql1);
		template.batchUpdate(sql1,sql2);
	
	}
	
	
	public Integer insertPayCheck(String id) 
	{

		return template.query("select count(*) from salary_payment where  year(payDate)=year(curdate()) and month(payDate)= month(curdate()) and employeeID='"+id+"'",new ResultSetExtractor<Integer>() {
			
			public Integer extractData(ResultSet rs) throws SQLException {
				
				int total=0;
				
				while(rs.next()) 
				{
					 total=rs.getInt(1);
					
				}
				return (Integer)total;
		}
				
			
		});
		
	}
	
	
	
	
}
