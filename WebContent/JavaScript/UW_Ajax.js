
function check()
{
	//alert("Inside check Ajax");
}
function Fun_AjaxWithoutEsc(url,params)				
{	
	try
	{
		var response="";			
		xmlReq = null;
		if(window.XMLHttpRequest) xmlReq = new XMLHttpRequest();
		else if(window.ActiveXObject) xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlReq==null) return; // Failed to create the request
		xmlReq.onreadystatechange = function()
		{
			switch(xmlReq.readyState)
			{
				case 0: // Uninitialized
					//alert("Uninitialized");
					break;
				case 1: // Loading
					//alert("Loading");
					break;
				case 2: // Loaded
					//alert("Loaded");
					break;
				case 3: // Interactive
					//alert("Interactive");
					break;
				case 4: // Done!
					if (xmlReq.status==200) 
					{
						response=xmlReq.responseText;						
					}
					else if (xmlReq.status==404)
					{
					//	alert("URL doesn't exist!");
						response='FAIL';
					}
					else 
					{
						if(xmlReq.status==500)
							alert("Internal Server Error:500 Please RE-LOGIN");							
						else
							//alert("Status is "+xmlReq.status);							
				
							response='FAIL';
					}
					break;
				default:
					alert(xmlReq.status);
					response='FAIL';
					break;
			}
		}	
		xmlReq.open('POST',url,false);		
		xmlReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xmlReq.send(params);	
		return response;
	}
	catch(e)
	{
		alert("Exception from Fun_AjaxWithoutEsc() in UW_Ajax.js : "+e);
	}
}
function Fun_Ajax(url,params)				
{
	try
	{
		params=escape(params);	
		var response="";			
		xmlReq = null;
		if(window.XMLHttpRequest) xmlReq = new XMLHttpRequest();
		else if(window.ActiveXObject) xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlReq==null) return; // Failed to create the request
		xmlReq.onreadystatechange = function()
		{
			switch(xmlReq.readyState)
			{
				case 0: // Uninitialized
					//alert("Uninitialized");
					break;
				case 1: // Loading
					//alert("Loading");
					break;
				case 2: // Loaded
					//alert("Loaded");
					break;
				case 3: // Interactive
					//alert("Interactive");
					break;
				case 4: // Done!
					//alert("StatusCode--"+xmlReq.status+" Status Desc--"+xmlReq.statusText);
					if (xmlReq.status==200) 
					{
						response=xmlReq.responseText;						
					}
					else if (xmlReq.status==404)
					{
						//alert("URL doesn't exist!");
						response='FAIL';
					}
					else 
					{
						if(xmlReq.status==500)
							alert("Internal Server Error:500 Please RE-LOGIN");							
						else
							//alert("Status is "+xmlReq.status);							
				
							response='FAIL';
					}
					break;
				default:
					alert(xmlReq.status);
					response='FAIL';
					break;
			}
		}
		// Make the request	
		xmlReq.open('POST',url,false);		
		xmlReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xmlReq.send(params);	
		return response;
	}
	catch(e)
	{
		//alert("Exception from Fun_Ajax() in UW_Ajax.js : "+e);
	}

}


function Fun_Ajax12(url,params)				
{	
	try
	{
		var response="";			
		xmlReq = null;
		if(window.XMLHttpRequest) xmlReq = new XMLHttpRequest();
		else if(window.ActiveXObject) xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlReq==null) return; // Failed to create the request
		xmlReq.onreadystatechange = function()
		{
			switch(xmlReq.readyState)
			{
				case 0: // Uninitialized
					//alert("Uninitialized");
					break;
				case 1: // Loading
					//alert("Loading");
					break;
				case 2: // Loaded
					//alert("Loaded");
					break;
				case 3: // Interactive
					//alert("Interactive");
					break;
				case 4: // Done!
					if (xmlReq.status==200) 
					{
						response=xmlReq.responseText;						
					}
					else if (xmlReq.status==404)
					{
						alert("URL doesn't exist!");
						response='FAIL';
					}
					else 
					{
						if(xmlReq.status==500)
							alert("Internal Server Error:500 Please RE-LOGIN");							
						else
							//alert("Status is "+xmlReq.status);							
							response='FAIL';
					}
					break;
				default:
					response='FAIL';
					break;
			}
		}
		xmlReq.open('POST',url,false);		
		xmlReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xmlReq.setRequestHeader("Content-length", params.length);
		xmlReq.setRequestHeader("Connection", "close");   
		xmlReq.send(params);	
		return response;
	}
	catch(e)
	{
		//alert("Exception from Fun_Ajax12() in UW_Ajax.js : "+e);
	}
}