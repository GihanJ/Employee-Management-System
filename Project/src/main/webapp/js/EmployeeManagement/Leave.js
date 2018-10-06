	

	$(document).ready(function() 
	{
		$('#leaveEmp').bootstrapValidator
		(
		{
			feedbackIcons: 
			{
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
			fields:
			{
				employeeCode: 
				{
					validators: 
					{
						
						notEmpty: 
						{
							message: 'Employee ID is required'
						},
	
					}
				},
				
				firstName: 
				{
					validators: 
					{
						
						notEmpty: 
						{
							message: 'Enter First name'
						},
	
					}
				},
				
				lastName: 
				{
					validators:
					{
						
						notEmpty: 
						{
							message: 'Enter Last name'
						},
					}
				},
	
				departmentName: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Department Name  is required'
						}
					}
				},
				
				designation: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Designation  is required'
						}
					}
				},
				
				leaveType: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Leave Type  is required'
						}
					}
				},
				
				leaveRequestedDate: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Requested Date  is required'
						}
					}
				},
				
				leaveStartDate: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Start Date and Time  is required'
						}
					}
				},
				
				leaveEndDate: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'End Date and Time  is required'
						}
					}
				},
				
				
				},
			
			onSuccess: function(e, data) 
			{
	              
	            alert('Leaving form uploaded Successfully !!!');
	        }
			
			
		});
	});
	
	
	
				
	

	