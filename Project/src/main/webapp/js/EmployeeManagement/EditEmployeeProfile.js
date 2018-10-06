 
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
				$('#validateEditForm').bootstrapValidator({
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
									min: 4,
									message: 'Enter First Name with minimum 4 letters length'
								},
								notEmpty: 
								{
									message: 'Enter First name'
								},
								
								regexp: 
								{
		                          regexp: /^[a-zA-Z]+$/,
		                          message: 'The first name can only consist of alphabetical'
								}
							}
			
						},
						
						lastName: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 4,
									message: 'Enter Last Name with minimum 4 letters length'
								},
								notEmpty: 
								{
									message: 'Enter Last name'
								},
								
								regexp: 
								{
		                          regexp: /^[a-zA-Z]+$/,
		                          message: 'The last name can only consist of alphabetical'
		                        }
								
							}
						},

						
						NIC: 
						{
							validators: 
							{
								stringLength: 
								{
									min:10,
									max: 10,
									message: 'Enter N.I.C Number with 10 letters in length'
								},
								notEmpty: 
								{
									message: 'N.I.C field is required'
								},
								
								regexp: 
								{
			                      	regexp: /^([0-9]{9})(v|V)$/,
			                      	message: 'N.I.C should consists of 9 numeric values and a following V/v'
								}
								
							}
						},
						
						
						
						bank: 
						{
							validators: 
							{
								notEmpty: 
								{
									message: 'The Bank field is required'
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
								},
								
								
								regexp: 
								{
		                          regexp: /^[0-9]{10,18}$/,
		                          message: 'Bank Account number can only consist of numerical with a min digits of 10 & max 18'
								}
							}	
								
						},
						
						currentAddress: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 8,
									message: 'Enter Current address with minimum 8 letters in length'
								},
								
								notEmpty: 
								{
									message: 'Current Address is required'
								},
								
								regexp: 
								{
								  regexp: /^[a-zA-Z0-9\/\, ]{8,}$/,
		                          message: 'The current address can only consist of alphabetical,numerical , / and , '
								}
							}
						},
						
						homeAddress: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 8,
									message: 'Enter home address with minimum 8 letters of length '
								},
								
								regexp: 
								{
								  regexp: /^[a-zA-Z0-9\/\, ]{8,}$/,
		                          message: 'The Home address can only consist of alphabetical,numerical , / and , '
								}
							}
						},
						
						city: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 4,
									message: 'Enter city field with minimum 4 letters of length '
								},
								
								regexp: 
								{
		                          regexp: /^[a-zA-Z]+$/,
		                          message: 'The city can only consist of alphabetical'
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
								},
								
								regexp: 
								{
		                          regexp: /^[0-9]{9}$/gm,
		                          message: 'The Contact no can only consist of numerical 9 values in length(Exclude leading zero)'
								}
								
								
							}
						},
						
						
						contactNo2: 
						{
							validators: 
							{
								regexp: 
								{
			                      regexp: /^[0-9]{9}$/gm,
			                      message: 'The Contact no can only consist of numerical 9 values in length(Exclude leading zero)'
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
								},
								
								regexp: 
								{
		                          regexp: /^[0-9]+(\.\d{0,2})?$/,
		                          message: 'The basic salary can only consist of  numerical with two decimal places'
								}
							}
						},
											
						
						userName: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 5,
									message: 'Enter user name with minimum 5 letters in length '
								},
								
								regexp: 
								{
		                          regexp: /^[a-zA-Z0-9]+$/,
		                          message: 'The username can only consist of alphabetical and numerical'
								}
								
							}
						},
						
						password: 
						{
							validators: 
							{
								
								stringLength: 
								{
									min: 8,
									message: 'Enter password with minimum 8 letters in length '
								},

								regexp: 
								{
		                          regexp: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*\}\{\(\)\+\-])/,
		                          message: 'The password can only  consists with uppercase,lowercase,numeric characters and a special character'
								}
								
							}
						},
						
						postalCode: 
						{
							validators: 
							{
								
								stringLength: 
								{
									max:5 ,
									message: 'Enter postal code with  5 numbers in length '
								},
								
								
								notEmpty: 
								{
									message: 'Postal Code  is required'
								},
								
								regexp: 
								{
		                          regexp: /^[0-9][0-9][0-9][0-9][0-9]+$/,
		                          message: 'The postal can only consist of 5 numbers'
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
						
						
						VehicleNo: 
						{
							validators: 
							{
								
								stringLength: 
								{
									min: 6,
									message: 'Enter Vehicle Number field with minimum 6 letters of length '
								},
																
							}
						},
						
						bikeNo: 
						{
							validators: 
							{
								stringLength: 
								{
									min: 6,
									message: 'Enter Bike Number field with minimum 6 letters of length '
								},
																
							}
						},
						
						
						},
					
					onSuccess: function(e, data) {
		                
		              alert('Form validation Successful!!!');
		          }
					
					
			   });
			});
