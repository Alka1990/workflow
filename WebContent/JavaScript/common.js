
/*	var queryString;
	var XmlHttp;
	function XMLHttprequest()
	{
		if(window.AciveXObject)
		{
		   XmlHttp=new ActiveXObject("Microsoft.XMLHTTP");	
		}
		else if(window.XMLHttpRequest)
		{
		   XmlHttp=new XMLHttpRequest();	
		}
		else
		{
		   alert("Ajax is not supported by your browser");
		}
	}

	
	function userForget()
	{
		XMLHttprequest();
		
		 var username=document.getElementById("username").value;
		 var phoneNumber=document.getElementById("phoneNumber").value;
		 var newpassword=document.getElementById("newpassword").value;
		 var confirmnewpassword=document.getElementById("confirmnewpassword").value;
		 
		 queryString="ForgotPassword?username="+username+"&phoneNumber="+phoneNumber+"&newpassword="+newpassword+"&confirmnewpassword="+confirmnewpassword;  

		XmlHttp.onreadystatechange =function()
		{
			if(XmlHttp.readyState==4)
			{
				if(XmlHttp.status == 200)
				{ 
					alert("Password change")
		        }
			}
		}
		XmlHttp.open("POST", queryString, true);
		XmlHttp.send(null);
	}*/
	
	$(function(){
		//on keypress 
		$('#confirmnewpassword').keyup(function(e){
			var pass = $('#newpassword').val();
			var confpass = $(this).val();
			
			//check the strings
			if(pass == confpass){
				//if both are same remove the error and allow to submit
				$('.error').text('');
			}else{
				//if not matching show error 
				$('.error').text('Password not matching');
				
			}
		});
		

	});
/*	
	document.querySelector(".numonly").addEventListener("keypress", function (evt) {
	    if (evt.which != 8 && evt.which != 0 && evt.which < 48 || evt.which > 57)
	    {
	        evt.preventDefault();
	    }
	});*/

	// 0 for null values
	// 8 for backspace 
	// 48-57 for 0-9 numbers
	
	
		 function CopyAdd(f)
		 {
			  if(f.optchk.checked == true) 
			  {
				    f.dispatch_to.value=f.clinic_name.value;
			  }
			  else
			   {
			     f.dispatch_to.value = "";
			     }
     }
		 
