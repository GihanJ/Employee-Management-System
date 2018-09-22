 
	$(document).ready(function()
	{
		$('#pPhoto').on('change',function()
				{
					var fileName = $(this).val();
					$(this).next('.custom-file-label').html(fileName);
	            });
	});
 
 
	$(document).ready(function()
	{
				
		$("#pPhoto").change(function()
		{
				var  fileSelected = document.getElementById("pPhoto").files;
				if(fileSelected.length>0)
				{
					var fileToLoad= fileSelected[0];
					var fileReader = new FileReader();
					fileReader.onload = function(fileLoadedEvent)
					{
						
						var base64value = fileLoadedEvent.target.result;
						var base64value = base64value.replace("data:image/png;base64,","");
						console.log(base64value);
						$('#photo').val(base64value);
					};
					
					fileReader.readAsDataURL(fileToLoad);
				}
		});
	});
			
 
	$(document).ready(function() 
	{
		$('#validateEditForm').bootstrapValidator
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
				
				firstName: 
				{
					validators: 
					{
						stringLength: 
						{
							min: 5,
							message: 'Enter First Name with minimum 5 letters length'
						},
						notEmpty: 
						{
							message: 'Enter First name'
						}
					}
				},
				
				lastName: 
				{
					validators: 
					{
						stringLength: 
						{
							min: 5,
							message: 'Enter Last Name with minimum 5 letters length'
						},
						notEmpty: 
						{
							message: 'Enter Last name'
						}
					}
				},
	
				
				joinedDate: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Joined Date is required'
						}
					}
				},
	
				
				NIC: {
					validators: 
					{
						notEmpty: 
						{
							message: 'N.I.C field is required'
						}
					}
				},
				
				maritalStatus: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Marital Status field is required'
						}
					}
				},
				
				bankAccountNo: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Bank Account Number  is required'
						}
					}
				},
				
				currentAddress:
				{
					validators: 
					{
						notEmpty:
						{
							message: 'Current Address is required'
						}
					}
				},
				
				
				
				contactNo1: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Contact No 1 field  is required'
						}
					}
				},
				

				email: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Email field  is required'
						}
					}
				},
				
				
				
				basicSalary: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Basic Salary  is required'
						}
					}
				},
				
				
				postalCode: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Postal Code  is required'
						}
					}
				},
				
				},
			
			onSuccess: function(e, data) 
			{
               alert('Update Successful!!!');
			}
			
			});
		});