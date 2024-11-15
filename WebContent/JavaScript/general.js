function trim(myString)     
{     
	return myString.replace(/^\s+|\s+$/g, '');    
}

function isValidDate(elementID) {
	 //alert("validDate func");
	 var arr=document.getElementById(elementID).value.split("/");
	    var valid = true;
	    var month = parseInt(arr[0],10);        
	    var  day = parseInt(arr[1],10);
	    var year  = parseInt(arr[2],10);
	    var d = new Date();
	    var y=d.getFullYear();
	    console.log('day:::'+day);
	    console.log('month:::'+month);
	    console.log('year:::'+year);
	    if(year<(d.getFullYear()-20)) valid = false;
	    else if((month < 1) || (month > 12)) valid = false;
	    else if((day < 1) || (day > 31)) valid = false;
	    else if(year==0) valid=false;
	    else if(((month == 4) || (month == 6) || (month == 9) || (month == 11)) && (day > 30)) valid = false;
	    else if((month == 2) && (((year % 400) == 0) || ((year % 4) == 0)) && ((year % 100) != 0) && (day > 29)) valid = false;
	    else if((month == 2) && ((year % 100) == 0) && (day > 29)) valid = false;
	    else if((month == 2) && (day > 28) && ((year%4)!=0)) valid = false;

	    if(valid==false)
	    	{
	    	document.getElementById(elementID).value="";
	    	document.getElementById(elementID).focus();
	    	alert("Date entered is invalid");
	    	}

	}

function callModalGeneric(DocIndex,url,cab){

    console.log("In callModalGeneric:::od_url::"+url);
    console.log("In callModalGeneric:::element::"+DocIndex);
    console.log("In callModalGeneric:::cabinet::"+cab);
    var Docid="";
    if(document.getElementById(DocIndex)!=null){ 
    var e = document.getElementById(DocIndex);
     Docid = e.options[e.selectedIndex].value;
    }
    else {
        Docid=DocIndex;
    }
    console.log("Docid="+Docid);
    console.log(url+" cab "+cab+"doc id"+Docid);
    var isIE = window.ActiveXObject || "ActiveXObject" in window;
    var backdrop='static';
    if (isIE)
            backdrop='';
	$("#customModal").load(contextPath+"/JSP/viewDoc.jsp",function(){
		 console.log("http://"+url+"/omnidocs/integration/foldView/viewDocsMain.jsp?Application=VendorPortal&cabinetName="+cab+"&S=S&sessionIndexSet=false&Docid="+Docid);
		document.getElementById("DocViewInvoice").src ="http://"+url+"/omnidocs/integration/foldView/viewDocsMain.jsp?Application=VendorPortal&cabinetName="+cab+"&S=S&sessionIndexSet=false&Docid="+Docid;
	    $('#viewDocModal').modal({
	        backdrop: backdrop
	    });
	});
}


function CalculateTotalInvoiceAmount(){

	var InvoiceBaseAmount = '0.0';
	var ServiceTax = '0.0';
	var EducationCess = '0.0';
	var HEducationCess = '0.0';
	var VAT = '0.0';
	var AdditionalVatValue = '0.0';
	var AnyOtherTax = '0.0';
	var Freight = '0.0';
	var Discount = '0.0';
	var PenaltyDeduction = '0.0';
	var TotalInvoiceAmount='0.0';
	var GrossAmount='0.0';

	if (null != document.getElementById("InvoiceBaseAmt") && document.getElementById("InvoiceBaseAmt").value != ''){
		InvoiceBaseAmount = document.getElementById("InvoiceBaseAmt").value;
	} 
	if (null != document.getElementById("GrossAmount") && document.getElementById("GrossAmount").value != ''){
		InvoiceBaseAmount = document.getElementById("GrossAmount").value;
	} 
	if (null != document.getElementById("ServiceTax") && document.getElementById("ServiceTax").value != ''){
		ServiceTax = document.getElementById("ServiceTax").value;
	} 
	if (null != document.getElementById("EducationCess") && document.getElementById("EducationCess").value != ''){
		EducationCess = document.getElementById("EducationCess").value;
	} 
	if (null != document.getElementById("HigherEducationCess") && document.getElementById("HigherEducationCess").value != ''){
		HEducationCess = document.getElementById("HigherEducationCess").value;
	} 
	if (null != document.getElementById("Vat") && document.getElementById("Vat").value != ''){
		VAT = document.getElementById("Vat").value;
	} 
	if (null != document.getElementById("AdditionalVat") && document.getElementById("AdditionalVat").value != ''){
		AdditionalVatValue = document.getElementById("AdditionalVat").value;
	} 
	if (null != document.getElementById("AnyOtherTax") && document.getElementById("AnyOtherTax").value != ''){
		AnyOtherTax = document.getElementById("AnyOtherTax").value;
	} 
	if (null != document.getElementById("Freight") && document.getElementById("Freight").value != ''){
		Freight = document.getElementById("Freight").value;
	} 
	if (null != document.getElementById("Discount") && document.getElementById("Discount").value != ''){
		Discount = document.getElementById("Discount").value;
	} 
	if (null != document.getElementById("PenaltyDeduction") && document.getElementById("PenaltyDeduction").value != ''){
		PenaltyDeduction = document.getElementById("PenaltyDeduction").value;
	} 

	TotalInvoiceAmount = ((parseFloat(InvoiceBaseAmount) + parseFloat(ServiceTax) + parseFloat(EducationCess)
			+ parseFloat(HEducationCess) + parseFloat(VAT) + parseFloat(AdditionalVatValue) + parseFloat(AnyOtherTax) + parseFloat(Freight))
			- (parseFloat(Discount) + parseFloat(PenaltyDeduction)));
	TotalInvoiceAmount = parseFloat(TotalInvoiceAmount.toFixed(3));
	document.getElementById("TotalInvAmt").value = TotalInvoiceAmount;//Math.round(TotalInvoiceAmount);

}

/*function myWindow(){
	var InvoiceNumberInSystemcrt = document.getElementById("InvoiceNumberInSystem");
	var CompanyCode = document.getElementById("CompanyCode");
	var InvoiceNumberInSystem = document.getElementById("InvoiceNumberInSystem");
	var DocumentTypes = document.getElementById("DocumentType").value;
	if(CompanyCode==null|| trim(CompanyCode.options[CompanyCode.selectedIndex].text)==""){
		alert("First enter Company Code");
		CompanyCode.focus();
	}
	else if(InvoiceNumberInSystem.value==null|| trim(InvoiceNumberInSystem.value)==""){
		alert("First enter Invoice Number");
		InvoiceNumberInSystem.focus();
	}
	else{
		if(!document.getElementById('InvoiceNumberInSystem').readOnly){
			alert("Invoice number cannot be edited once documents are attached.");
		}
		var win = window.open("JSP/Attachment.jsp?InvoiceNumber="+InvoiceNumberInSystem.value+"&DocumentTypes="+DocumentTypes+"&DocumentSize='${requestScope.DocumentSize}'","dataitem","Height=300px,Width=520px, scrollbars=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,alwaysRaised=yes, Left=280, top=300");
		win.onunload =onun; 

	    function onun() {
	        if(win.location != "about:blank") // This is so that the function 
	                                          // doesn't do anything when the 
	                                          // window is first opened.
	        {// alert("closed");}
	    	}
		}	
}
}*/

function ClearFields()
{	
	if(null!=document.getElementById("RequestFor")){
		document.getElementById("RequestFor").value='PO';
	}
	if(null!=document.getElementById("AttentionTo")){
		document.getElementById("AttentionTo").value='';
	}

	if(null!=document.getElementById("InvoiceNumberInSystem")){
		document.getElementById("InvoiceNumberInSystem").value='';
		document.getElementById("InvoiceNumberInSystem").readOnly =false;
	}

	if(null!=document.getElementById("InvoiceDate")){
		document.getElementById("InvoiceDate").value='';
	}

	if(null!=document.getElementById("BillingCurrency")){
		document.getElementById("BillingCurrency").value='INR';
	}

	if(null!=document.getElementById("InvoiceBaseAmount")){
		document.getElementById("InvoiceBaseAmount").value='';
	}
	if(null!=document.getElementById("ServiceTax")){
		document.getElementById("ServiceTax").value='';
	}

	if(null!=document.getElementById("EducationCess")){
		document.getElementById("EducationCess").value='';
	}
	document.getElementById("EducationCess").value='';
	if(null!=document.getElementById("HigherEducationCess")){
		document.getElementById("HigherEducationCess").value='';
	}

	if(null!=document.getElementById("Vat")){
		document.getElementById("Vat").value='';
	}

	if(null!=document.getElementById("AdditionalVatValue")){
		document.getElementById("AdditionalVatValue").value='';
	}

	if(null!=document.getElementById("AnyOtherTax")){
		document.getElementById("AnyOtherTax").value='';
	}

	if(null!=document.getElementById("Freight")){
		document.getElementById("Freight").value='';
	}

	if(null!=document.getElementById("TotalInvoiceAmount")){
		document.getElementById("TotalInvoiceAmount").value='';
	}

	if(null!=document.getElementById("Discount")){
		document.getElementById("Discount").value='';
	}

	if(null!=document.getElementById("PenaltyDeduction")){
		document.getElementById("PenaltyDeduction").value='';
	}

	if(null!=document.getElementById("VoucherNarration")){
		document.getElementById("VoucherNarration").value='';
	}

	if(null!=document.getElementById("FromDate")){
		document.getElementById("FromDate").value='';
	}

	if(null!=document.getElementById("ToDate")){
		document.getElementById("ToDate").value='';
	}

	if(null!=document.getElementById("PoNo")){
		document.getElementById("PoNo").value='';
	}

	if(null!=document.getElementById("AnyOtherTaxType")){
		document.getElementById("AnyOtherTaxType").value='';
	}


}
function SetEditable(){

	fieldEnable("RequestFor");
	fieldEnable("AttentionTo");
	fieldEnable("InvoiceNumberInSystem");
	fieldEnable("InvoiceDate");
	fieldEnable("BillingCurrency");
	fieldEnable("InvoiceBaseAmount");
	fieldEnable("ServiceTax");
	fieldEnable("EducationCess");
	fieldEnable("HigherEducationCess");
	fieldEnable("Vat");
	fieldEnable("AdditionalVatValue");
	fieldEnable("AnyOtherTax");
	fieldEnable("Freight");
	fieldEnable("Discount");
	fieldEnable("PenaltyDeduction");
	fieldEnable("TotalInvoiceAmount");
	fieldEnable("VoucherNarration");
	fieldEnable("FromDate");
	fieldEnable("ToDate");
	fieldEnable("PoNo");
	fieldEnable("AnyOtherTaxType");
	calanderDisable('NonCalander3');
	calanderEnable('calander3');
	calanderDisable('NonCalander19');
	calanderEnable('calander19');
	calanderDisable('NonCalander20');
	calanderEnable('calander20');
}

function SetDisable(){
	fieldDisable("RequestFor");
	fieldDisable("AttentionTo");
	fieldDisable("InvoiceNumberInSystem");
	fieldDisable("InvoiceDate");
	fieldDisable("BillingCurrency");
	fieldDisable("InvoiceBaseAmount");
	fieldDisable("ServiceTax");
	fieldDisable("EducationCess");
	fieldDisable("HigherEducationCess");
	fieldDisable("Vat");
	fieldDisable("AdditionalVatValue");
	fieldDisable("AnyOtherTax");
	fieldDisable("Freight");
	fieldDisable("Discount");
	fieldDisable("PenaltyDeduction");
	fieldDisable("TotalInvoiceAmount");
	fieldDisable("VoucherNarration");
	fieldDisable("FromDate");
	fieldDisable("ToDate");
	fieldDisable("PoNo");
	fieldDisable("AnyOtherTaxType");
	calanderDisable('calander3');
	calanderEnable('NonCalander3');
	calanderDisable('calander19');
	calanderEnable('NonCalander19');
	calanderDisable('calander20');
	calanderEnable('NonCalander20');
}

function validation(){
	var CompanyCode = document.getElementById("CompanyCode");
	var VendorCode = document.getElementById("VendorCode");
	var CompanyName = document.getElementById("CompanyName");
	var VendorName = document.getElementById("VendorName");
	var InvoiceNumberInSystem = document.getElementById("InvoiceNumberInSystem");
	var InvoiceDate = document.getElementById("InvoiceDate");
	var InvoiceBaseAmount = document.getElementById("InvoiceBaseAmount");
	var RequestFor = document.getElementById("RequestFor");
	var TotalInvoiceAmount = document.getElementById("TotalInvoiceAmount");
	var FromDate = document.getElementById("FromDate");
	var ToDate = document.getElementById("ToDate");
	var PoNo = document.getElementById("PoNo");
	var fileadded =document.getElementById("addedDocumends").value;

	if(CompanyCode.value==null||trim(CompanyCode.options[CompanyCode.selectedIndex].text)==""){
		alert("Company Code must be entered.");
		CompanyCode.focus();
		return false;
	}
	else if(VendorCode.value==null||trim(VendorCode.value)==""){
		alert("Vendor Code must be entered.");
		VendorCode.focus();
		return false;
	}
	else if(CompanyName.value==null||trim(CompanyName.value)==""){
		alert("Company Name must be entered.");
		CompanyName.focus();
		return false;
	}
	else if(VendorName.value==null||trim(VendorName.value)==""){
		alert("Vendor Name must be entered.");
		VendorName.focus();
		return false;
	}
	else if(trim(RequestFor.value)=='PO' && (PoNo.value==null||trim(PoNo.value)==""))
	{
		alert("PO No must be entered if Request For is PO.");
		PoNo.focus();
		return false;
	}
	else if(null != document.getElementById("mandatoryFeildList") && trim(document.getElementById("mandatoryFeildList").value) != "" ){
		var mandatoryfeilds = document.getElementById("mandatoryFeildList").value;
		var mandatoryFeildsList = mandatoryfeilds.split(",");
		for(var i=0;i<mandatoryFeildsList.length-1;i++){
			var feildsdetails = mandatoryFeildsList[i].split("=");
			var feildname = feildsdetails[0];
			var feildDisplayName = feildsdetails[1];
			if(!feildMandatory(feildname, feildDisplayName)){
				return false;
				break;
			}

		}
	}
	if((trim(fileadded)=="" || fileadded==null)||(trim(fileadded)!="" && fileadded.indexOf("Invoice Document") == -1)){
		alert("Invoice Document must be attached");
		return false;
	}
	else if(ToDate.value!=null&&trim(ToDate.value)!=""&&trim(FromDate.value)==""){
		alert("From Date must be entered if To Date is entered.");
		FromDate.focus();
		return false;
	}
	else{
		if(trim(FromDate.value)!=""){
			if(!feildMandatory("ToDate","To Date")){
				return false;
			}
			else{
				var FromDatearr = FromDate.value.split("/");
				var ToDatearr = ToDate.value.split("/");
				if(FromDatearr[2]>ToDatearr[2]){
					alert("From Date cannot be greater than To Date");
					return false;
				}
				else if(FromDatearr[2] == ToDatearr[2] && FromDatearr[1]>ToDatearr[1]){
					alert("From Date cannot be greater than To Date");
					return false;
				}
				else if(FromDatearr[2] == ToDatearr[2] && FromDatearr[1] == ToDatearr[1] && FromDatearr[0]>ToDatearr[0]){
					alert("From Date cannot be greater than To Date");
					return false;
				}	
			}					
		}
		return true;
	}

}

function feildMandatory(feildName, feildDisplayName){
	if(document.getElementById(feildName).value==null||trim(document.getElementById(feildName).value)==""){
		alert(feildDisplayName+" must be entered.");
		document.getElementById(feildName).focus();
		return false;
	}
	else{
		return true;
	}
}
function numberCheck(feild,key){
	var keycode = (key.which) ? key.which : key.keyCode;
	var feild = document.getElementById(feild);
	if(feild.value.length==0 && keycode==46 ){
		return false;
	}
	if (keycode == 08 || keycode == 127 || keycode==09){
		return true;
	}
	if (!(keycode==08 || keycode==46 || keycode == 127)&&(keycode < 48 || keycode > 57)){
		return false;
	}
	else{
		if (feild.value.length <17 && feild.value.length!=13 ){
			if(feild.value.indexOf('.')>=0 && keycode==46){
				return false;
			}
			else{
				if(feild.value.indexOf('.')>=0){
					var valuesplit = feild.value.split('.');
					if(valuesplit[1].length<3){
						return true;
					}
					else{
						return false;
					}
				}
				else{
					return true;
				}
				return true;
			}
		}
		else if(feild.value.length==13){
			if(feild.value.indexOf('.')<0 && keycode==46){
				return true;
			}
			else if(feild.value.indexOf('.')>=0 && keycode!=46){
				var valuesplit = feild.value.split('.');
				if(valuesplit[1].length<3){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
}
function setReadonlyFalse(){
	fieldReadWrite("AttentionTo");
	fieldReadWrite("RequestFor");
	fieldReadWrite("InvoiceNumberInSystem");
	fieldReadWrite("BillingCurrency");
	fieldReadWrite("InvoiceBaseAmount");
	fieldReadWrite("ServiceTax");
	fieldReadWrite("EducationCess");
	fieldReadWrite("HigherEducationCess");
	fieldReadWrite("Vat");
	fieldReadWrite("AdditionalVatValue");
	fieldReadWrite("AnyOtherTax");
	fieldReadWrite("Freight");
	fieldReadWrite("TotalInvoiceAmount");
	fieldReadWrite("Discount");
	fieldReadWrite("PenaltyDeduction");
	fieldReadWrite("VoucherNarration");
	fieldReadWrite("PoNo");
	fieldReadWrite("AnyOtherTaxType");

	calanderDisable('calander3');
	calanderEnable('NonCalander3');
	calanderDisable('calander19');
	calanderEnable('NonCalander19');
	calanderDisable('calander20');
	calanderEnable('NonCalander20');
}

function back(){
	window.history.back();
}

function setDateEditable(){
	calanderDisable('NonCalander3');
	calanderEnable('calander3');
	calanderDisable('NonCalander19');
	calanderEnable('calander19');
	calanderDisable('NonCalander20');
	calanderEnable('calander20');
}
function ResetTable(){
	if( null != document.getElementById('InvoiceNumberInSystem') && document.getElementById('InvoiceNumberInSystem').readOnly){
		var name = document.getElementById('InvoiceNumberInSystem').value+",R";
		xmlhttpPost(name);
		element = document.getElementById('divfiles');
		element.parentNode.removeChild(element);
	}
	ClearFields();

}


function checkInvoice(key){
	var keycode = (key.which) ? key.which : key.keyCode;
	if(null != document.getElementById('InvoiceNumberInSystem') && document.getElementById('InvoiceNumberInSystem').readOnly && keycode == 08){
		return false;
	}

}
function CheckCompanyCodeandVendorCode(){

	if(document.getElementById("CompanyCode").value==null||trim(document.getElementById("CompanyCode").options[document.getElementById("CompanyCode").selectedIndex].text)==''){
		SetDisable();
		//alert("Please Enter Company Code");
	}
	else if(document.getElementById("VendorCode").value==null||trim(document.getElementById("VendorCode").value)==''){
		SetDisable();
		//alert("Please Enter Vendor Code");
	}
	else{
		SetEditable();
	}

}


function keycheck(id, event){

	if(event.keyCode==27||event.keyCode==122){
		return false;
	}
	if ((event.keyCode==08)&&(event.srcElement.type!='text'&& event.srcElement.type!='textarea'&& event.srcElement.type!='password'))
	{
		return false;
	}
	else if((event.srcElement.readOnly==true)){
		return false;
	}
}

function disableFieldsOnCheck(fieldToBeCompared,valueToBeCompared, fieldToBeDisabled ){
	if (fieldToBeCompared == null || document.getElementById(fieldToBeCompared).value == ''){
		document.getElementById(fieldToBeDisabled).value='';
		document.getElementById(fieldToBeDisabled).disabled=false;
		return false;
	}
	else{
		if (trim(document.getElementById(fieldToBeCompared).value) == valueToBeCompared){
			document.getElementById(fieldToBeDisabled).value='';
			document.getElementById(fieldToBeDisabled).disabled=true;
			document.getElementById(fieldToBeDisabled).style.backgroundColor="#a0a0a0";
			return true;
		}
		else{
			//document.getElementById(fieldToBeDisabled).value='';
			document.getElementById(fieldToBeDisabled).disabled=false;
			return false;
		}
	}
}
function ltrimString(str) { 
	for(var k = 0; k < str.length && isWhitespace(str.charAt(k)); k++);
	return str.substring(k, str.length);
}
function rtrimString(str) {
	for(var j=str.length-1; j>=0 && isWhitespace(str.charAt(j)) ; j--) ;
	return str.substring(0,j+1);
}
function trimString(str) {
	return ltrimString(rtrimString(str));
}

function ShowCompanyData(){
	var CompanyName =  document.getElementById("CompanyName").value;		
}
function customOnBlur(id, event){

	if(id=="InvoiceBaseAmt"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="GrossAmount"){
		CalculateTotalInvoiceAmount();
	}

	if(id=="ServiceTax"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="EducationCess"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="HigherEducationCess"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="Vat"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="AdditionalVatValue"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="AnyOtherTax"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="Freight"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="Discount"){
		CalculateTotalInvoiceAmount();
	}
	if(id=="PenaltyDeduction"){
		CalculateTotalInvoiceAmount();
	}
	
	if(id=="RequestFor"){
		disableFieldsOnCheck(id, 'Non PO', 'PoNo')
	}
	/*if(id=="VendorCode"){
		CheckCompanyCodeandVendorCode();
	}
	//Code changes on 2013-04-24 by Abhishek S
	if(id=="InvoiceNumberInSystem"){
		//checkInvoiceNumber(id,event);
	}*/
	//Code changed end here - 2013-04-24
}
function customOnClick(id, event){
	if(id=="Reset"){
		ResetTable();
	}
	if(id=="Attachments"){
		myWindow();
	}
	if(id=="hrefBack"){
		back();
	}
}
function customOnKeyPress(id, event){
	if(id=="InvoiceBaseAmt"){
		return numberCheck(id, event);
	}
	else if(id=="ServiceTax"){
		return numberCheck(id, event);
	}
	else if(id=="GrossAmount"){
		return numberCheck(id, event);
	}
	else if(id=="TotalTax"){
		return numberCheck(id, event);
	}

	else if(id=="EducationCess"){
		return numberCheck(id, event);
	}
	else if(id=="HigherEducationCess"){
		return numberCheck(id, event);
	}
	else if(id=="VAT"){
		return numberCheck(id, event);
	}
	else if(id=="AdditionalVAT"){
		return numberCheck(id, event);
	}
	else if(id=="AnyOtherTax"){
		return numberCheck(id, event);
	}
	else if(id=="Freight"){
		return numberCheck(id, event);
	}
	else if(id=="Discount"){
		return numberCheck(id, event);
	}
	else if(id=="PenaltyDeduction"){
		return numberCheck(id, event);
	}
	else if(id=="TotalInvAmt"){
		return numberCheck(id, event);
	}
	else if(id=="RequestFor"&& event.keyCode==08){
		return false;
	}
	else if(id=="VoucherNarration" && document.getElementById("VoucherNarration").value.length > 999){
		return false;
	}
}
function customOnSubmit(id, event){
	if(id=="InvoiceDetails"){
		return validation();
	}

}
function customOnKeydown(id, event){
	if(id=="InvoiceformBody"){
		return keycheck(id, event);
	}
	if(id="loginpage"){
		return keycheck(id, event);
	}
}
function customOnChange(id, event){
	if(id=="CompanyName"){
		ShowCompanyData();
	}

}
function fieldDisable(id){
	if(null != document.getElementById(id)){
		document.getElementById(id).disabled=true;
		if(id != "RequestFor" && id != "BillingCurrency")
			document.getElementById(id).value='';
	}
}
function fieldEnable(id){
	if(null != document.getElementById(id)){
		document.getElementById(id).disabled=false;
	}
}
function fieldReadWrite(id){
	if(null != document.getElementById(id)){
		document.getElementById(id).readOnly="readOnly";
	}
}
function calanderEnable(id){
	if(null != document.getElementById(id)){
		document.getElementById(id).style.display='';
	}
}
function calanderDisable(id){
	if(null != document.getElementById(id)){
		document.getElementById(id).style.display='none';
	}
}

function PasswordValidation(id){
	if(id.value != ''){
		var passwordRegEx1 = /[a-z]/g;
		var passwordRegEx2 = /[A-Z]/g;
		var passwordRegEx3 = /[0-9]/g;
		if(id.value.length < 8){
			alert("Please enter a valid Password.Password should be atleast of 8 characters.Password should contain atleast 1 numeral, 1 lower case letter and 1 upper case letter");
			id.focus(true);
		}else{
			var matching = passwordRegEx1.test(id.value);
			if(!matching){
				alert("Please enter a valid Password.Password should be atleast of 8 characters.Password should contain atleast 1 numeral, 1 lower case letter and 1 upper case letter");
				id.focus(true);
			}else{
				matching = passwordRegEx2.test(id.value);
				if(!matching){
					alert("Please enter a valid Password.Password should be atleast of 8 characters.Password should contain atleast 1 numeral, 1 lower case letter and 1 upper case letter");
					id.focus(true);
				}else{
					matching = passwordRegEx3.test(id.value);
					if(!matching){
						alert("Please enter a valid Password.Password should be atleast of 8 characters.Password should contain atleast 1 numeral, 1 lower case letter and 1 upper case letter");
						id.focus(true);
					}
				}
			}
		}
	}
}

function verifyEmail(id){

	var status = true;     
	if(trim(id.value)!=''){
		var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;

		if (id.value.search(emailRegEx) == -1) {

			alert("Please enter a valid email address.");
			status = false;
			id.focus(true);
		}    
	}
	return status;	
}

function phoneCheck(feild,key){

	var keycode = (key.which) ? key.which : key.keyCode;
	if(keycode == 08 || keycode == 127 || (keycode >= 48 && keycode <= 57)){
		return true;
	}else{
		return false;
	}
}



function trim(str)
{
	return str.replace(/^\s+|\s+$/g, '');
}


function doPostAjax(url,sParams)
{

	var retval="-1";
	var req = getACTObj();
	req.onreadystatechange = processRequest;
	req.open("POST",url, false);
	req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	req.send(sParams);
	function processRequest()
	{
		if (req.readyState == 4)
		{

			if (req.status == 200)
				parseMessages();
			else
				retval='-1';
		}
	}
	function parseMessages()
	{
		retval=trim(req.responseText);
		//alert("Barcode Generated Successfully");
	}
	//document.getElementById('err').style.display = 'block';

	
	return retval;
}

function getACTObj()
{
	if(window.XMLHttpRequest)
		return new XMLHttpRequest

		var a=["Microsoft.XMLHTTP","MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP"];
	for(var c=0;c<a.length;c++)
	{
		try
		{
			return new ActiveXObject(a[c])
		}
		catch(b)
		{
			alert('Exception-'+b);
		}
	}
	return null;
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
						alert("Please RE-LOGIN");							
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
		document.getElementById('err').style.display = 'block';
	
		return response;
	}
	catch(e)
	{
		alert("Exception from Fun_Ajax() in UW_Ajax.js : "+e);
	}

}
function GetDocList(InvNo)
{
		//alert("Inside SecondScreenWebservice ");
		var str='';    
		var Transection_ID=InvNo;		
		
		var Grid_Table = document.getElementById('docDetails');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{     
			for(var col=0; col<Grid_Table.rows[row].cells.length-1; col++)           
			{       
				if(col==0)                   
				if(document.all)
				{		
					str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent; 
			}            
				str=str+'~';            
		}       
		return str;
		}

function  saveInvoiceData()
{

	try
	{	
		
		
		var VendorCode=document.getElementById('VendorCode').value;
		var CompanyName=document.getElementById('CompanyName').value;
		var VendorName=document.getElementById('VendorName').value;
		var AttentionTo=document.getElementById('AttentionTo').value;
		var InvoiceType=document.getElementById('RequestFor').value.trim();
		var VendorAddress=document.getElementById('VendorAddress').value;
		var CompanyAddress1=document.getElementById('CompanyAddress1').value;
		var InvoiceNumberInSystem=document.getElementById('InvoiceNumberInSystem').value;
		var InvoiceDate=document.getElementById('InvoiceDate').value;
		var VAT=document.getElementById('VAT').value;
		var OtherTax=document.getElementById('OtherTax').value;
		var OtherTaxType = document.getElementById("OtherTaxType").value;
		var Freight=document.getElementById('Freight').value;
		var Discount=document.getElementById('Discount').value;
		var AdditionalVAT=document.getElementById('AdditionalVAT').value;
		var PenaltyDeduction=document.getElementById('PenaltyDeduction').value;
		var TotalInvAmt=document.getElementById('TotalInvAmt').value;
		var VoucherNarration=document.getElementById('VoucherNarration').value;
		var FromDate=document.getElementById('FromDate').value;
		var ToDate=document.getElementById('ToDate').value;
		var CompanyCode=document.getElementById('CompanyCode').value;
		var InvoiceBaseAmt=document.getElementById('InvoiceBaseAmt').value;
		var PoNo=document.getElementById("PoNo").value;
		var BillingCurrency=document.getElementById("BillingCurrency").value.trim();
		var HigherEducationCess=document.getElementById("HigherEducationCess").value;
		var EducationCess=document.getElementById("EducationCess").value;
		var ServiceTax=document.getElementById("ServiceTax").value;
		if(InvoiceNumberInSystem==null ||InvoiceNumberInSystem=='')
		{
			alert("Invoice Number Is  mandatory");
			document.getElementById('InvoiceNumberInSystem').focus();
			return false;
		}
		if(CompanyCode==null ||CompanyCode=='')
		{
			alert("Company Code Is  mandatory");
			document.getElementById('CompanyCode').focus();
			return false;
		}

		if(VendorCode==null ||VendorCode=='')
		{
			alert("Vendor Code Is  mandatory");
			document.getElementById('VendorCode').focus();
			return false;
		}

		if(AttentionTo==null ||AttentionTo=='')
		{
			alert("AttentionTo Is  mandatory");
			document.getElementById('AttentionTo').focus();
			return false;
		} 

		if(InvoiceType==null ||InvoiceType=='' || InvoiceType=="-- Select --")
		{
			alert("Invoice Type Is  mandatory");
			document.getElementById('RequestFor').focus();
			return false;	    
		}
		if(InvoiceBaseAmt==null ||InvoiceBaseAmt=='')
		{
			alert("Invoice Base Amount Is  mandatory");
			document.getElementById('InvoiceBaseAmt').focus();
			return false;
		}
		if(TotalInvAmt==null ||TotalInvAmt=='')
		{
			alert("Total Invoice Amount Is  mandatory");
			document.getElementById('TotalInvAmt').focus();
			return false;
		}
		if(InvoiceDate==null ||InvoiceDate=='')
		{
			alert("InvoiceDate Is  mandatory, Please enter in dd/MM/yyyy Format");
			document.getElementById('InvoiceDate').focus();
			return false;
		}
		if(BillingCurrency==null ||BillingCurrency=='' || BillingCurrency=="-- Select --")
		{
			alert("Billing Currency Is  mandatory");
			document.getElementById('BillingCurrency').focus();
			return false;	    
		}
		
		
        var table=document.getElementById("FinListing");
		var radioValue = $('input[name="imgsel"]:checked').val();


         if(radioValue==undefined)
         {
        	 alert('First select Bank Details',"Message");
         return false;
         }

		var BankAccountNo=table.rows[radioValue].cells[1].textContent;
		var Currency=table.rows[radioValue].cells[2].textContent;
		var BankAccName=table.rows[radioValue].cells[3].textContent;
		
		var BankName=table.rows[radioValue].cells[4].textContent;
		var BankNumber=table.rows[radioValue].cells[5].textContent;
		var BranchName=table.rows[radioValue].cells[6].textContent;
		var BranchNumber=table.rows[radioValue].cells[7].textContent;
		
		
		
		//Validation to checked toDate & FromDate i.e to check whether From Date cannot be greater than To Date
		if(FromDate!=null && FromDate!='' && FromDate!='null' && ToDate!=null && ToDate!='' && ToDate!='null'){
			var FromDatearr = FromDate.split("/");
			var ToDatearr = ToDate.split("/");

			if(FromDatearr[2]>ToDatearr[2]){
				alert("From Date cannot be greater than To Date");

				return false;
			}
			else if(FromDatearr[2] == ToDatearr[2] && FromDatearr[1]>ToDatearr[1]){
				alert("From Date cannot be greater than To Date");


				return false;
			}
			else if(FromDatearr[2] == ToDatearr[2] && FromDatearr[1] == ToDatearr[1] && FromDatearr[0]>ToDatearr[0]){
				alert("From Date cannot be greater than To Date");

				return false;
			} 
		}
		var table = document.getElementById("docDetails");
		//alert("saveInvoiceData :: table :: "+table);
        var len = table.rows.length;
       // alert("No of rows in grid::"+len);
        if(len<2){  
			alert("Document is mandatory");
			document.getElementById('adddoc').focus();
			return false;
		}
        $(".loader").fadeIn("slow");
		var str_doclist=GetDocList(InvoiceNumberInSystem);
		
	   
		var url="JSP/SubmitInvoiceDetails.jsp"+"?"+"&VendorCode="+VendorCode+"&CompanyName="+CompanyName+"&VendorName="+VendorName+"&AttentionTo="+AttentionTo+"&RequestFor="+InvoiceType+"&VendorAddress="+VendorAddress+"&CompanyAddress1="+CompanyAddress1+"&InvoiceNumberInSystem="+InvoiceNumberInSystem+"&InvoiceDate="+InvoiceDate+"&VAT="+VAT+"&OtherTax="+OtherTax+"&Freight="+Freight+"&Discount="+Discount+"&AdditionalVAT="+AdditionalVAT+"&PenaltyDeduction="+PenaltyDeduction+"&TotalInvAmt="+TotalInvAmt+"&VoucherNarration="+VoucherNarration+"&FromDate="+FromDate+"&ToDate="+ToDate+"&CompanyCode="+CompanyCode+"&InvoiceBaseAmt="+InvoiceBaseAmt+"&PoNo="+PoNo+"&BillingCurrency="+BillingCurrency+"&HigherEducationCess="+HigherEducationCess+"&EducationCess="+EducationCess+"&ServiceTax="+ServiceTax+"&OtherTaxType="+OtherTaxType+"&DocList="+str_doclist
		+"&BankAccountNo="+BankAccountNo+"&Currency="+Currency+"&BankAccName="+BankAccName+"&BankNumber="+BankNumber+"&BranchName="+BranchName+"&BranchNumber="+BranchNumber+"&BankName="+BankName;	
		
		
		alert("url::"+url);
		var ReturnVal=Fun_Ajax(url,"");
		var array=ReturnVal.split("~");
		//var array=ReturnVal.split("-");
		var barcodeno=array[1];
		alert("barcode no"+barcodeno);
		document.getElementById("hiddenNextInvNo").value=barcodeno;
		$(".loader").fadeOut("slow");
		document.getElementById("err").innerHTML=ReturnVal;
		document.getElementById("error").style.display='';
		if(document.getElementById('BtnSubmit')!=null || (document.getElementById('BtnSubmit')!="null")){
            document.getElementById('BtnSubmit').disabled = true;
        } 
		if(document.getElementById('btnbarcode')==null || (document.getElementById('btnbarcode')=="null")){

		}
		else
		{
			document.getElementById('btnbarcode').style.display="block";
		}
		window.scrollTo(0, 0);

	}catch(e)
	{
		alert("Exception from saveInvoiceData function"+e);
	}

}


//Method to show mandatory fields
function setMandatoryFocus( Mfield)
{
	var MfieldFocus=null;
	MfieldFocus=new Array();
	var NOTMfieldFocus=null;
	NOTMfieldFocus=new Array();
	for(var i=0;i<Mfield.length;i++)
	{
		var fvalue=document.getElementById(Mfield[i]).value;
		if(!fvalue)
			MfieldFocus.push(Mfield[i]);
		else NOTMfieldFocus.push(Mfield[i]);


	}

	for(var i=0;i<MfieldFocus.length;i++)
	{
		document.getElementById(MfieldFocus[i]).style.border="2px solid red";
		document.getElementById(MfieldFocus[i]).focus();
	}
	for(var i=0;i<NOTMfieldFocus.length;i++)
		document.getElementById(NOTMfieldFocus[i]).style.border="1px solid #ccc";
	return  MfieldFocus;

}

function submitForm(){

	var vendorCode=document.getElementById('vendorCode').value;

	var vendorName=document.getElementById('vendorName').value;
	var companyCode=document.getElementById('companyCode').value;
	var ButtonType=document.getElementById('ButtonType').value;
	var hiddenLink=document.getElementById('hiddenLink').value;


	var	vendorAdd = document.getElementById('vendorAdd').value;
	var vendorEmailId = document.getElementById('vendorEmailId').value;
	var sPOC = document.getElementById('sPOC').value;
	var sPOCEmailId = document.getElementById('sPOCEmailId').value;
	var currency = document.getElementById('currency').value ;
	var url="";

	if(trim(document.getElementById('vendorCode').value) == ''){
		alert("Enter Vendor Code");
		document.getElementById('vendorCode').focus();
	}else if(document.getElementById('vendorName').value == ''){
		alert("Enter Vendor Name");
		document.getElementById('vendorName').focus();
	}else if(trim(document.getElementById('companyCode').value) == ''){
		alert("Enter Company Code");
		document.getElementById('companyCode').focus();
	}else{
		if(document.getElementById('hiddenLink').value != null && document.getElementById('hiddenLink').value != 'null' && document.getElementById('hiddenLink').value == 'VendorDetails'){
			ButtonType = 'Update';
			url="JSP/SubmitNewVendor.jsp"+"?"+"&vendorCode="+vendorCode+"&vendorName="+vendorName+"&companyCode="+companyCode+"&ButtonType="+ButtonType+"&hiddenLink="+hiddenLink+"&vendorAdd="+vendorAdd+"&vendorEmailId="+vendorEmailId+"&sPOC="+sPOC+"&sPOCEmailId="+sPOCEmailId+"&currency="+currency;

		}else{
			ButtonType = 'Insert';
			url="SubmitNewVendor.jsp"+"?"+"&vendorCode="+vendorCode+"&vendorName="+vendorName+"&companyCode="+companyCode+"&ButtonType="+ButtonType+"&hiddenLink="+hiddenLink+"&vendorAdd="+vendorAdd+"&vendorEmailId="+vendorEmailId+"&sPOC="+sPOC+"&sPOCEmailId="+sPOCEmailId+"&currency="+currency;

		}

		var ReturnVal=Fun_Ajax(url,"");
//		alert(trim(ReturnVal));
	}
}


/* This method is used to check whether Company name is null, 
 * If we select company address field, First we have select Company Name.
 */

function checkCompanyName()
{
	var CompanyName=document.getElementById('CompanyName').value;
	if(CompanyName==null ||CompanyName=='')
	{
		alert("Select Company Name");
		document.getElementById('CompanyName').focus();
		return false;
	}
}

function getHttpObject(){
	var xmlhttp;
	if (window.XMLHttpRequest)   
	{
		xmlhttp=new XMLHttpRequest();   
	} else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
		
	}
	return xmlhttp;	
}


/* This function is used for User name validation */
function UserNameValidation(id){   
	if(id.value != ''){
		var userNameRegEx = /^[A-Za-z0-9.-@_]*$/;
		var matching = id.value.match(userNameRegEx);
		if(matching == null){
			alert("Please enter a valid User Name.\n Allowed Characters are [a-z], [A-Z], [0-9], @, -, _, .");
			id.focus(true);
		}
	}
}




   	
