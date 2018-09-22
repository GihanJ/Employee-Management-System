 
	$(document).ready(function() 
	{
		$('#filePath,#overTime').on('change',function()
		{
		       var fileName = $(this).val();
		       $(this).next('.custom-file-label').html(fileName);
		});
	            
	});         
            
    $(document).ready(function() 
    {
			$('#otForm').bootstrapValidator
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
					overTime: 
					{
						validators: 
						{
							notEmpty: 
							{
									message: 'Choose a file to Upload'
							}
						}
					},
				},
				
				onSuccess: function(e, data) 
				{
	                  
                    alert('Over Time Records Update Successful!!!');
                }
				
			});
	});    
      
     $(document).ready(function() 
    {
			$('#attendanceForm').bootstrapValidator
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
					
					filePath: 
					{
						validators: 
						{
							notEmpty: 
							{
									message: 'Choose a file to Upload'
							}
						}
					},
				},
				
				onSuccess: function(e, data) 
				{
	                  
                  alert('Attendance Records Update Successful!!!');
				}
				
			});
	});