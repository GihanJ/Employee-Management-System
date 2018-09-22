
	 $(document).ready(function()
	 {
		 		
		 $('#certificate,#cv,#photo2,#photo3,#photo4,#drivingLicense').on('change',function()
		 {
			 	var fileName = $(this).val();
	   
			 	$(this).next('.custom-file-label').html(fileName);
	      });
	 });   
     
 
 
	 $(document).ready(function()
	 {
  			
		 $("#photo2").change(function()
  		 {
  				var  fileSelected = document.getElementById("photo2").files;
  				
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
		$('#validateForm1').bootstrapValidator({
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
							min: 5,
							message: 'Enter Last Name with minimum 5 letters length'
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
							regexp: /^[0-9]+$/,
							message: 'Bank account no can only consist of numeric'
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
                          regexp: /^[a-zA-Z0-9]+$/,
                          message: 'The current address can only consist of alphabetical and numeric'
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
                          regexp: /^[a-zA-Z0-9]+$/,
                          message: 'The home address can only consist of alphabetical and numeric'
						}
					}
				},
				
				city: 
				{
					validators: 
					{
						stringLength: 
						{
							min: 5,
							message: 'Enter city field with minimum 5 letters of length '
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
                          regexp: /^([0-9])+$/,
                          message: 'The contact number can only consist of numerical'
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
                          regexp: /^[0-9]+$/,
                          message: 'The basic salary can only consist of alphabetical and numerical'
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
				
				profilePhoto2: 
				{
					validators: 
					{
						notEmpty: 
						{
							message: 'Profile Photo  is required'
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
							message: 'Enter user name with minimum 8 letters in length '
						},
						
						notEmpty: 
						{
							message: 'Username  is required'
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
						
						notEmpty: 
						{
							message: 'Password  is required'
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
			
			onSuccess: function(e, data) {
                
              alert('Employee Registration Successful!!!');
          }
			
			
	   });
	});
  

	$(document).ready(function() 
	{
		$('#validateForm2').bootstrapValidator({
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
						min: 5,
						message: 'Enter First Name with minimum 5 letters length'
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
						min: 5,
						message: 'Enter Last Name with minimum 5 letters length'
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
	                	regexp: /^[0-9]+$/,
	                	message: 'Bank account no can only consist of numeric'
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
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The current address can only consist of alphabetical and numeric'
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
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'The home address can only consist of alphabetical and numeric'
                    }
					
					
				}
			},
			
			city: 
			{
				validators: 
				{
					stringLength: 
					{
						min: 5,
						message: 'Enter city field with minimum 5 letters of length '
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
                        regexp: /^([0-9])+$/,
                        message: 'The contact number can only consist of numerical'
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
                        regexp: /^[0-9]+$/,
                        message: 'The basic salary can only consist of alphabetical and numerical'
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
			
			profilePhoto3: 
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
			
			VehicleNo: 
			{
				validators: 
				{
					notEmpty: 
					{
						message: 'Vehicle No  is required'
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
              
            alert('Employee Registration Successful!!!');
        }
		
		
		});
	});
		
	$(document).ready(function()
	{
	  	$("#photo3").change(function()
	  	{
	  			var  fileSelected = document.getElementById("photo3").files;
	  			
	  			if(fileSelected.length>0)
	  			{
					var fileToLoad= fileSelected[0];
	  				var fileReader = new FileReader();
	  				
	  				fileReader.onload = function(fileLoadedEvent)
	  				{
	  					var base64value = fileLoadedEvent.target.result;
						var base64value = base64value.replace("data:image/png;base64,","");
	  					console.log(base64value);
	  					$('#photoo').val(base64value);
					};
					
	  					fileReader.readAsDataURL(fileToLoad);
	  			}
		});
	});
  
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
								min: 5,
								message: 'Enter First Name with minimum 5 letters length'
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
								min: 5,
								message: 'Enter Last Name with minimum 5 letters length'
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
	                        	regexp: /^[0-9]+$/,
	                        	message: 'Bank account no can only consist of numeric'
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
	                            regexp: /^[a-zA-Z0-9]+$/,
	                            message: 'The current address can only consist of alphabetical and numeric'
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
	                            regexp: /^[a-zA-Z0-9]+$/,
	                            message: 'The home address can only consist of alphabetical and numeric'
	                        }
		
						}
					},
					
					city: 
					{
						validators: 
						{
							stringLength: 
							{
								min: 5,
								message: 'Enter city field with minimum 5 letters of length '
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
	                            regexp: /^([0-9])+$/,
	                            message: 'The contact number can only consist of numerical'
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
	                            regexp: /^[0-9]+$/,
	                            message: 'The basic salary can only consist of alphabetical and numerical'
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
	                  
                    alert('Employee Registration Successful!!!');
                }
		
		});
	});
		
		