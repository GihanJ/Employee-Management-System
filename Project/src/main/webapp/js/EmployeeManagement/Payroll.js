

$(document).ready(function() 
{
$('input').keyup(function(){
	
	var Basic = Number($('#basicSalary').val());
	var OverTime = Number($('#overTime').val());
	var Rate = Number($('#hourlyRate').val());
	var Allowances = Number($('#allowances').val());
	var Bonus = Number($('#bonus').val());
	
	
	document.getElementById('grossSalary').value=Basic+OverTime*Rate+Allowances;
	document.getElementById('epfEmployee').value=(Basic)*0.08;
	document.getElementById('epfEmployer').value=(Basic)*0.12;
	document.getElementById('etf').value=(Basic)*0.03;
	
	
	
	var Tax = Number($('#tax').val());
	var ExtraLeaves = Number($('#extraLeaves').val());
	var Decrements = Number($('#decrements').val());
	var epf8 = Number($('#epfEmployee').val());
	var Increments = Number($('#increments').val());
	
	
	
	
	
	document.getElementById('deductions').value=epf8+Tax+ExtraLeaves+Decrements;
	document.getElementById('additions').value=Bonus+Increments;
	
	var GrossSal = Number($('#grossSalary').val());
	var Deductions = Number($('#deductions').val());
	var Additions = Number($('#additions').val());
	
		
	document.getElementById('total').value=(GrossSal+Additions-Deductions);	
	
	
});

});




$(document).ready(function() 
{
	$('#validatePayForm').bootstrapValidator
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
							}
							
						}
	
					},
					
					payDate: 
					{
						notEmpty: 
						{
								message: 'Date field is required'
						}
							
		
					},
					
					epfEmployee: 
					{
							notEmpty: 
							{
								message: 'ETF 8% field is required'
							}
					
					},
						
					epfEmployer: 
					{
							notEmpty: 
							{
								message: 'ETF 12% field is required'
							}
					
					},
					
					etf: 
					{
							notEmpty: 
							{
								message: 'ETF field is required'
							}
							
					},
						
						
					allowances: 
					{
							notEmpty: 
							{
								message: 'Allowances field is required'
							}
							
					},
						
						
					deductions: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Deduction  is required'
							}
						}
					},
					
					grossSal: 
					{
						validators: 
						{
				
							notEmpty: 
							{
								message: 'Gross Salary is required'
							}

						}
					},
					
	
					total: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Net Salary  is required'
							}

						}
					},
					
			},
				
	});
});





