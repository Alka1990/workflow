
 //////////////////////////////////////////////////////////// add form validation //////////////////////////////////////////////////////////

function iscaseidExist(){
	var n1=document.getElementById("incase").value;
	var username=document.getElementById("userid").value;
	var result="NewCasesshow1?caseId="+n1;
	window.location.href = result;
	}

$('#starterkit1').on('change', function(){	
	$('#starterkit2').prop('disabled', $(this).prop('checked'));
	$('#starterkit3').prop('disabled', $(this).prop('checked'));
	$('#starterkit4').prop('disabled', $(this).prop('checked'));
	$('#starterkit5').prop('disabled', $(this).prop('checked')); 
	});

	$('#starterkit2').on('change', function(){
		$('#starterkit1').prop('disabled', $(this).prop('checked'));
		$('#starterkit3').prop('disabled', $(this).prop('checked'));
		$('#starterkit4').prop('disabled', $(this).prop('checked'));
		$('#starterkit5').prop('disabled', $(this).prop('checked')); 
	});
	$('#starterkit3').on('change', function(){
		$('#starterkit1').prop('disabled', $(this).prop('checked'));
		$('#starterkit2').prop('disabled', $(this).prop('checked'));
		$('#starterkit4').prop('disabled', $(this).prop('checked'));
		$('#starterkit5').prop('disabled', $(this).prop('checked')); 
	});
	$('#starterkit4').on('change', function(){
		$('#starterkit1').prop('disabled', $(this).prop('checked'));
		$('#starterkit2').prop('disabled', $(this).prop('checked'));
		$('#starterkit3').prop('disabled', $(this).prop('checked'));
		$('#starterkit5').prop('disabled', $(this).prop('checked')); 
	});
	$('#starterkit5').on('change', function(){
		$('#starterkit1').prop('disabled', $(this).prop('checked'));
		$('#starterkit2').prop('disabled', $(this).prop('checked'));
		$('#starterkit3').prop('disabled', $(this).prop('checked'));
		$('#starterkit4').prop('disabled', $(this).prop('checked')); 
	});

	$('#batch1').on('change', function(){
	$('#batch2').prop('disabled', $(this).prop('checked'));
	$('#batch3').prop('disabled', $(this).prop('checked'));
	$('#batch4').prop('disabled', $(this).prop('checked'));
	$('#batch5').prop('disabled', $(this).prop('checked')); 
	});
	$('#batch2').on('change', function(){
		$('#batch1').prop('disabled', $(this).prop('checked'));
		$('#batch3').prop('disabled', $(this).prop('checked'));
		$('#batch4').prop('disabled', $(this).prop('checked'));
		$('#batch5').prop('disabled', $(this).prop('checked')); 
	});
	$('#batch3').on('change', function(){
		$('#batch2').prop('disabled', $(this).prop('checked'));
		$('#batch1').prop('disabled', $(this).prop('checked'));
		$('#batch4').prop('disabled', $(this).prop('checked'));
		$('#batch5').prop('disabled', $(this).prop('checked')); 
	});
	$('#batch4').on('change', function(){
		$('#batch2').prop('disabled', $(this).prop('checked'));
		$('#batch1').prop('disabled', $(this).prop('checked'));
		$('#batch3').prop('disabled', $(this).prop('checked'));
		$('#batch5').prop('disabled', $(this).prop('checked')); 
	});
	$('#batch5').on('change', function(){
		$('#batch2').prop('disabled', $(this).prop('checked'));
		$('#batch3').prop('disabled', $(this).prop('checked'));
		$('#batch4').prop('disabled', $(this).prop('checked'));
		$('#batch1').prop('disabled', $(this).prop('checked')); 
		});


/* 	$(function () {
	$("#btnSubmit").change(function () {
	    var checked = $(".strb_default input[type=checkbox]:checked").length;
	    var isValid = checked == 0;
	    alert(isValid)
	    $("#spnError")[0].style.display = isValid ? "none" : "block";
	});
	}); */
	
	


 function Addvalidate()
	{
	valid = true;

	if($('input[type=checkbox]:checked').length == 0)
	{
	    alert ("Please select at least one checkbox to make Address Default");
	    valid = false;
	}
	return valid;
	
	if($('#starterkit1').prop( "checked", true) || $('#batch1').prop( "checked", true )){
		 $("#address1").prop('required',true);
		 $("#pincode1").prop('required',true);
		 $("#phone1").prop('required',true);
		 $("#city1").prop('required',true);
		 $("#location1").prop('required',true);
		 return false;
	}
	if($('#starterkit2').prop( "checked", true) || $('#batch2').prop( "checked", true )){
		 $("#address2").prop('required',true);
		 $("#pincode2").prop('required',true);
		 $("#phone2").prop('required',true);
		 $("#city2").prop('required',true);
		 $("#location2").prop('required',true);
		 return false;
	}
	if($('#starterkit3').prop( "checked", true) || $('#batch3').prop( "checked", true )){
		 $("#address3").prop('required',true);
		 $("#pincode3").prop('required',true);
		 $("#phone3").prop('required',true);
		 $("#city3").prop('required',true);
		 $("#location3").prop('required',true);
		 return false;
	}
	if($('#starterkit4').prop( "checked", true) || $('#batch4').prop( "checked", true )){
		 $("#address4").prop('required',true);
		 $("#pincode4").prop('required',true);
		 $("#phone4").prop('required',true);
		 $("#city4").prop('required',true);
		 $("#location4").prop('required',true);
		 return false;
	}
	if($('#starterkit5').prop( "checked", true) || $('#batch5').prop( "checked", true )){
		 $("#address5").prop('required',true);
		 $("#pincode5").prop('required',true);
		 $("#phone5").prop('required',true);
		 $("#city5").prop('required',true);
		 $("#location5").prop('required',true);
		 return false;
	}
	
	
	}
 
 //////////////////////////////////////////////////////////// edit form validation //////////////////////////////////////////////////////////
 
 /*
	   $('#starterkit1').on('change', function(){
		    $('#starterkit2').prop('checked',false);
		    $('#starterkit3').prop('checked',false);
		    $('#starterkit4').prop('checked',false);
		    $('#starterkit5').prop('checked',false);
		 });


	   $('#starterkit2').on('change', function(){
		    $('#starterkit1').prop('checked',false);
		    $('#starterkit3').prop('checked',false);
		    $('#starterkit4').prop('checked',false);
		    $('#starterkit5').prop('checked',false);	
	   });
	   
	   $('#starterkit3').on('change', function(){
		    $('#starterkit1').prop('checked',false);
		    $('#starterkit2').prop('checked',false);
		    $('#starterkit4').prop('checked',false);
		    $('#starterkit5').prop('checked',false);
	   });
	   
	   $('#starterkit4').on('change', function(){
		    $('#starterkit1').prop('checked',false);
		    $('#starterkit2').prop('checked',false);
		    $('#starterkit3').prop('checked',false);
		    $('#starterkit5').prop('checked',false);
	   });
	   $('#starterkit5').on('change', function(){
		    $('#starterkit1').prop('checked',false);
		    $('#starterkit2').prop('checked',false);
		    $('#starterkit3').prop('checked',false);
		    $('#starterkit4').prop('checked',false);
	   });

	   $('#batch1').on('change', function(){
		    $('#batch2').prop('checked',false);
		    $('#batch3').prop('checked',false);
		    $('#batch4').prop('checked',false);
		    $('#batch5').prop('checked',false);

	   });
	   $('#batch2').on('change', function(){
		    $('#batch1').prop('checked',false);
		    $('#batch3').prop('checked',false);
		    $('#batch4').prop('checked',false);
		    $('#batch5').prop('checked',false);

	   });
	   $('#batch3').on('change', function(){
		    $('#batch1').prop('checked',false);
		    $('#batch2').prop('checked',false);
		    $('#batch4').prop('checked',false);
		    $('#batch5').prop('checked',false);

	   });
	   $('#batch4').on('change', function(){
		    $('#batch1').prop('checked',false);
		    $('#batch2').prop('checked',false);
		    $('#batch3').prop('checked',false);
		    $('#batch5').prop('checked',false);

	   });
	   $('#batch5').on('change', function(){
		    $('#batch1').prop('checked',false);
		    $('#batch2').prop('checked',false);
		    $('#batch3').prop('checked',false);
		    $('#batch4').prop('checked',false);

	   	});

	   function Editfrmvalidate()
	   {
		   
		   	var stage=document.getElementById("stage").value;
		   	var remark=document.getElementById("remark").value;
		   	
		   	if($('#starterkit1').prop( "checked", true) || $('#batch1').prop( "checked", true )){
				 $("#address1").prop('required',true);
				 $("#pincode1").prop('required',true);
				 $("#phone1").prop('required',true);
				 $("#city1").prop('required',true);
				 $("#location1").prop('required',true);
				 return false;
			}
			if($('#starterkit2').prop( "checked", true) || $('#batch2').prop( "checked", true )){
				 $("#address2").prop('required',true);
				 $("#pincode2").prop('required',true);
				 $("#phone2").prop('required',true);
				 $("#city2").prop('required',true);
				 $("#location2").prop('required',true);
				 return false;
			}
			if($('#starterkit3').prop( "checked", true) || $('#batch3').prop( "checked", true )){
				 $("#address3").prop('required',true);
				 $("#pincode3").prop('required',true);
				 $("#phone3").prop('required',true);
				 $("#city3").prop('required',true);
				 $("#location3").prop('required',true);
				 return false;
			}
			if($('#starterkit4').prop( "checked", true) || $('#batch4').prop( "checked", true )){
				 $("#address4").prop('required',true);
				 $("#pincode4").prop('required',true);
				 $("#phone4").prop('required',true);
				 $("#city4").prop('required',true);
				 $("#location4").prop('required',true);
				 return false;
			}
			if($('#starterkit5').prop( "checked", true) || $('#batch5').prop( "checked", true )){
				 $("#address5").prop('required',true);
				 $("#pincode5").prop('required',true);
				 $("#phone5").prop('required',true);
				 $("#city5").prop('required',true);
				 $("#location5").prop('required',true);
				 return false;
			}
		   	
		    if( stage=='REJ' || stage=='WFCCOR' || stage=='PRECOR' || stage=='INICOR' || stage=='Y'){
				   if(remark==''){
				   alert("Reason required");
				   //document.getElementById("remark").focus()
				    document.getElementById("remark").style.borderColor = "#E34234";
					return false;
			   }
			   }	
		   	   valid = true;
			   if($('input[type=checkbox]:checked').length == 0)
			   {
				   var errName = $("#addError"); 
				   errName.html(" Please check either starter kit or batch check box!");
				   errName.addClass('error-msg alert alert-danger col-lg-12 text-center');
				   valid = false;   
			   }
			   return valid;	   
	   }*/