
  
	$(document).ready(function()
	{
	  	$("#photo4").change(function()
	  	{
	  			var  fileSelected = document.getElementById("photo4").files;
	  			
	  			if(fileSelected.length>0)
	  			{
					var fileToLoad= fileSelected[0];
	  				var fileReader = new FileReader();
	  				
	  				fileReader.onload = function(fileLoadedEvent)
	  				{
	  					var base64value = fileLoadedEvent.target.result;
						var base64value = base64value.replace("data:image/png;base64,","");
	  					console.log(base64value);
	  					$('#photooo').val(base64value);
					};
					
	  				fileReader.readAsDataURL(fileToLoad);
	  			}
		});
	});
	  	
	
	 $(document).ready(function()
	{
							 		
				var dtToday = new Date();
				var month = dtToday.getMonth() + 1;   
				var day = dtToday.getDate();
				var year = dtToday.getFullYear();
				if(month < 10)
					   month = '0' + month.toString();
				if(day < 10)
					   day = '0' + day.toString();

				var maxDate = year + '-' + month + '-' + day;
				$('#joinedDate,#birthDate').attr('max', maxDate);
						
	});	
	
	
	$(document).ready(function() 
	{
		$('#validateForm3').bootstrapValidator({
				feedbackIcons: {
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
		
					birthDate: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Birth Date is required'
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
		
					gender: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'The gender option is required'
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
					
					experiencedLevel: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Experienced Level  is required'
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
										
					cv: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'CV  is required'
							}
						}
					},
					
					profilePhoto4: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Profile Photo  is required'
							}
						}
					},
					
	
					drivingLicense: 
					{
						validators: 
						{
							
							notEmpty: 
							{
								message: 'License  is required'
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
							notEmpty: 
							{
								message: 'Bike No  is required'
							},
							
						}
					},
					
					
					availability: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Availability  is required'
							},
						}
					},
					
					
					postalCode: 
					{
						validators: 
						{
							
							stringLength: 
							{
								max:5 ,
								message: 'Enter postal code with maximum 5 numbers in length '
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
					
					departmentID: 
					{
						validators: 
						{
							notEmpty: 
							{
								message: 'Department  is required'
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
					
					
				},
				
				onSuccess: function(e, data) 
				{
	                  
					alert('Form validation Successful!!!');
                }
		
		});
	});
		
		