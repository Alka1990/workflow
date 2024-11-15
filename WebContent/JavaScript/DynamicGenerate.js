

var FormFields = [];
function FormVariables(FieldId, FieldName, FieldType, MaxLength,IsVisible,IsMandatory,readonly, sDropDown,validation){

	alert('FormVariables');
	FormFields["FIELDID"]= FieldId;//Field Name mapped with database column name and 
	FormFields["FIELDNAME"]= FieldName;
	FormFields["FIELDTYPE"]= FieldType; //Text , button, Number, Date, AlphaNumeric, Float, DropDown
	FormFields["MAXLENGTH"]= MaxLength;
	FormFields["ISVISIBLE"] =IsVisible;
	FormFields["ISMANDATORY"]= IsMandatory;
	FormFields["READONLY"]=readonly;
	FormFields["DROPDOWNVALUES"]=sDropDown; 
	FormFields["VALIDATION"]=validation;
	  
}

function print_Form(){
var sFieldDefn=[];
	//FieldName, FieldCaption, FieldType, MaxLength,IsVisible,IsMandatory,readonly, sDropDown,validation)
sFieldDefn["VENDORCODE"] = FormVariables('VENDORCODE','Vendor Code','TEXT','10','Y','Y','','','');
sFieldDefn["TABLEHEADING"] = FormVariables('TABLEHEADING','Invoice Details','HEADING','','','','','','');

	alert('print_Form');
	var formVariable = [];
	var fieldId;
	var FieldName;
	var FieldType;
	var MaxLength;
	var IsVisible;
	var IsMandatory;
	var readonly;
	var sDropDown;
	var validation;
	var dynamicHTML="";
	
for ( var i = 0; i< sFieldDefn.length; i++) {
	alert('Insiide sFieldDefn loop');
	formVariable = sFieldDefn[i];
	fieldId = formVariable[0];
	FieldName = formVariable[1];
	FieldType = formVariable[2];
	MaxLength = formVariable[3];
	IsVisible = formVariable[4];
	IsMandatory = formVariable[5];
	readonly = formVariable[6];
	sDropDown = formVariable[7];
	validation = formVariable[8];

	dynamicHTML +="This is Submit Invoice";
		document.write(dynamicHTML);

							
	
	
}	
	
} 

