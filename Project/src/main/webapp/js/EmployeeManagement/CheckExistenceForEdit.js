
		function checkExist()
	{
	    	var xmlhttp = new XMLHttpRequest();
	    	var userName = document.forms["editProfile"]["userName"].value;
	    	var url = "/jsp/EmployeeManagement/checkUsername.jsp?userName="+userName;
	    	     
	    	                
	    	xmlhttp.onreadystatechange = function()
	    	{
	    	     if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
	    	     {
	    	    	
	    	    	 
	    	    	 	if(xmlhttp.responseText.trim() === "User already exists")
	    	            {
	    	                     document.getElementById("isE").style.color = "red";
	    	            } else{
	    	                     document.getElementById("isE").style.color = "green";
	    	            }
	    	            document.getElementById("isE").innerHTML = xmlhttp.responseText;
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
	    



	function checkNICExist()
	{
	    	var xmlhttps = new XMLHttpRequest();
	    	var NIC = document.forms["editProfile"]["NIC"].value;
	    	var url2 = "/jsp/EmployeeManagement/checkNIC.jsp?NIC="+NIC;
	    	     
	    	                
	    	xmlhttps.onreadystatechange = function()
	    	{
	    	     if(xmlhttps.readyState == 4 && xmlhttps.status == 200)
	    	     {
	    	    	
	    	    	 
	    	    	 	if(xmlhttps.responseText.trim() === "N.I.C already exists")
	    	            {
	    	                     document.getElementById("nic").style.color = "red";
	    	            } else{
	    	                     document.getElementById("nic").style.color = "green";
	    	            }
	    	            document.getElementById("nic").innerHTML = xmlhttps.responseText;
	    	      }
	    	 };
	    	                
	    	 try
	    	 {
	    	              
	    		 xmlhttps.open("GET",url2,true);
	    		 xmlhttps.send();
	    	            
	    	 }
	    	 catch(e)
	    	 {
	    		 alert("unable to connect to server");
	    	 }
	  }	

	
	
	function checkVehicleExist()
	{
	    	var xmlhttpv = new XMLHttpRequest();
	    	var vehicle = document.forms["editProfile"]["VehicleNo"].value;
	    	var url4 = "/jsp/EmployeeManagement/checkVehicle.jsp?vehicle="+vehicle;
	    	     
	    	                
	    	xmlhttpv.onreadystatechange = function()
	    	{
	    	     if(xmlhttpv.readyState == 4 && xmlhttpv.status == 200)
	    	     {
	    	    	
	    	    	 
	    	    	 	if(xmlhttpv.responseText.trim() === "Vehicle already assigned")
	    	            {
	    	                     document.getElementById("vehicle").style.color = "red";
	    	            } else{
	    	                     document.getElementById("vehicle").style.color = "green";
	    	            }
	    	            document.getElementById("vehicle").innerHTML = xmlhttpv.responseText;
	    	      }
	    	 };
	    	                
	    	 try
	    	 {
	    	              
	    		 xmlhttpv.open("GET",url4,true);
	    		 xmlhttpv.send();
	    	            
	    	 }
	    	 catch(e)
	    	 {
	    		 alert("unable to connect to server");
	    	 }
	  }	
	
	
	
	function checkBikeExist()
	{
	    	var xmlhttpb = new XMLHttpRequest();
	    	var bike = document.forms["editProfile"]["bikeNo"].value;
	    	var url6 = "/jsp/EmployeeManagement/checkBike.jsp?bike="+bike;
	    	     
	    	                
	    	xmlhttpb.onreadystatechange = function()
	    	{
	    	     if(xmlhttpb.readyState == 4 && xmlhttpb.status == 200)
	    	     {
	    	    	
	    	    	 
	    	    	 	if(xmlhttpb.responseText.trim() === "Bike already assigned")
	    	            {
	    	                     document.getElementById("bike").style.color = "red";
	    	            } else{
	    	                     document.getElementById("bike").style.color = "green";
	    	            }
	    	            document.getElementById("bike").innerHTML = xmlhttpb.responseText;
	    	      }
	    	 };
	    	                
	    	 try
	    	 {
	    	              
	    		 xmlhttpb.open("GET",url6,true);
	    		 xmlhttpb.send();
	    	            
	    	 }
	    	 catch(e)
	    	 {
	    		 alert("unable to connect to server");
	    	 }
	  }	
	
	
	
	    				