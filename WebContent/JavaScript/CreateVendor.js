function myWindow(){
	
	var DocumentTypes = document.getElementById("DocumentType").value;
	
		var win = window.open("Attachment.jsp?DocumentTypes="+DocumentTypes+"&DocumentSize='${requestScope.DocumentSize}'","dataitem","Height=300px,Width=520px, scrollbars=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,alwaysRaised=yes, Left=280, top=300");
		win.onunload =onun; 

	    function onun() {
	        if(win.location != "about:blank") // This is so that the function 
	                                          // doesn't do anything when the 
	                                          // window is first opened.
	        {// alert("closed");}
	    	}
		}	
}
      
