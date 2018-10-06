
	$(document).ready(function()
	{
		$('#resignation').on('change',function()
		{
	        var fileName = $(this).val();
	   
	         $(this).next('.custom-file-label').html(fileName);
	     });
	}); 
	
    $(document).ready(function()
    {
          	$("#remove").click(function()
          	{
          		if(!confirm("Are you sure you want to delete this Employee?"))
          		{
          				return false;
          		}
        	});
          
     });
    
     $(document).ready(function() 
     {
    		$('#validateRemoveForm').bootstrapValidator
    		({
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
    							notEmpty:
    							{
    								message: 'First Name cannot be Empty'
    							}
    						}
    					},
    					contactNo1: 
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Contact Number cannot be Empty'
    							}
    						}
    					},
    					
    					joinedDate: 
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Registered Date cannot be Empty'
    							}
    						}
    					},	
    					
    					designation: 
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Designation cannot be Empty'
    							}
    						}
    					},	
    					
    					department:
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Department cannot be Empty'
    							}
    						}
    					},	
    					
    					leaveReason: 
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Reason cannot be Empty'
    							}, 
    							
		    					stringLength: 
								{
									min: 6,
									message: 'Reason must be minimum 6 letters in length '
								}
    						}
    					},	
    					
    					leavingDate: 
    					{
    						validators: 
    						{
    							notEmpty: 
    							{
    								message: 'Leaving Date cannot be Empty'
    							}
    						}
    					},	
    				},
    				
    				onSuccess: function(e, data) 
    				{
    	                  
                        alert('Employee Removed Successfully!!!');
                    }
    				
    		});
    });