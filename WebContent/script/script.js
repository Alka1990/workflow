$("#AddNew1").on("click",addRecords1);
$("#AddNew2").on("click",addRecords2);
$("#AddNew3").on("click",addRecords3);
$("#AddNew4").on("click",addRecords4);
$("#AddNew5").on("click",addRecords5);

function addRecords1(){
addRecords("AddressDiv");
}

function addRecords2(){
addRecords("PhoneNumberDiv");
}
function addRecords3(){
addRecords("ClinicNameDiv");
}
function addRecords4(){
addRecords("buyerClinicNameDiv");
}
function addRecords5(){
addRecords("buyerAddressDiv");
}


function addRecords(id){
id="#"+id;
//if($(`${id} input`).length>=5){
//	alert("At max 5 records are allowed for this field");
//	return;
//}
var i=$(`${id} input`).length+1;
var str1="<input type=\"text\" name=\"pno"+i+"\" placeholder=\"Enter Phone number\"class=\"form-control\" style=\"margin:5px 0px;\">";
var str2="<input type=\"text\" name=\"addr"+i+"\" placeholder=\"Enter Address\" class=\"form-control\" style=\"margin:5px 0px;\">";
var str3="<input type=\"text\" name=\"cni"+i+"\" placeholder=\"Enter Clinic Name\" class=\"form-control\" style=\"margin:5px 0px;\">";
var str4="<input type=\"text\" name=\"bcn"+i+"\" placeholder=\"Enter buyer's Clinic Name\" class=\"form-control\" style=\"margin:5px 0px;\">";
var str5="<input type=\"text\" name=\"badd"+i+"\" placeholder=\"Enter buyer's Address\" class=\"form-control\" style=\"margin:5px 0px;\">";
if(id==="#AddressDiv"){
	console.log("here1");
    $(id).append(str2);
}else if(id==="#PhoneNumberDiv"){
console.log("here2");
    $(id).append(str1);
}else if(id==="#ClinicNameDiv"){
    $(id).append(str3);
}else if(id==="#buyerClinicNameDiv"){
 	$(id).append(str4);
}else{
 	$(id).append(str5);
}

}
