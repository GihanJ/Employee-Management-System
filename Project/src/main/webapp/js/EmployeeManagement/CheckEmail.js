
		function checkEmail()
	{
	    	var xmlhttp = new XMLHttpRequest();
	    	var email = document.forms["reset"]["email"].value;
	    	var url = "/jsp/EmployeeManagement/ResetAuthentication.jsp?email="+email;
	    	     
	    	                
	    	xmlhttp.onreadystatechange = function()
	    	{
	    	     if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
	    	     {
	    	    	
	    	    	 
	    	    	 	if(xmlhttp.responseText.trim() === "Email exists")
	    	            {
	    	                     document.getElementById("checkMail").style.color = "green";
	    	            } else{
	    	                     document.getElementById("checkMail").style.color = "red";
	    	            }
	    	            document.getElementById("checkMail").innerHTML = xmlhttp.responseText;
	    	      }
	    	 };
	    	                
	    	 try
	    	 {
	    	              
	    		 xmlhttp.open("GET",url,true);
	    	     xmlhttp.send();
	    	            
	    	 }
	    	 catch(e)
	    	 {
	    		 alert("unable to connect to server");
	    	 }
	  }	
	    

	
	
	
	    				