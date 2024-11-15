
var modalInputIds=["#addClinicNameInput","#addClinicAddressInput","#addPhoneNumberInput","#addBuyerClinicNameInput","#addBuyerAddressInput"];
var editModalInputIds=["#cniEdit","#addrEdit","#pnoEdit","#bcnEdit","#baddEdit"];
var editModalIdNames=["#EditClinicNameModal","#EditClinicAddressModal","#EditPhoneNumberModal","#EditBuyerClinicNameModal","#EditBuyerAddressModal"];
var editClassNames=[".linkClinicName",".linkClinicAddress",".linkPhoneNumber",".linkBuyerClinicName",".linkBuyerAddress"];
var defaultClassNames=[".linkForDefault",".linkForDefaultClinicAddress",".linkForDefaultPhoneNumbers",".linkForDefaultBuyerClinicName",".linkForDefaultBuyerAddress"];
var paraClassNames=[".plinkClinicName",".plinkClinicAddress",".plinkPhoneNumbers",".plinkBuyerClinicName",".plinkBuyerAddress"];
var closeModalButtonIds=["#closeClinicNameModal","#closeClinicAddressModal","#closePhoneNumberModal","#closeBuyerClinicNameModal","#closeBuyerAddressModal"];
var closeEditModalButtonIds=["#closeEditClinicNameModal","#closeEditClinicAddressModal","#closeEditPhoneNumberModal","#closeEditBuyerClinicNameModal","#closeEditBuyerAddressModal"];
var inputNames=["cni","addr","pno","bcn","badd"];
var saveEditChangesButtonIds=["#editClinicName","#editClinicAddress","#editPhoneNumberName","#editBuyerClinicName","#editBuyerAddress"];
var saveAddChangesButtonIds=["#addClinicName","#addClinicAddress","#addPhoneNumber","#addBuyerClinicName","#addBuyerAddress"];
var defaultNames=["clinicName","clinicAddress","phoneNumber","buyerClinicName","buyerAddress"];
function addRecords0(){
 addRecords("ClinicNameDiv",0);
 
}
function addRecords1(){
addRecords("ClinicAddressDiv",1);
}
function addRecords2(){
addRecords("PhoneNumberDiv",2);
}
function addRecords3(){
addRecords("BuyerClinicNameDiv",3);
}
function addRecords4(){
addRecords("BuyerAddressDiv",4);
}


function addRecords(id,i){
id="#"+id;
if($(`${id} input`).length>=5){
	alert("At max 5 records are allowed for this field");
	return;
}

var name=$(modalInputIds[i]).val();
var editModalIdName=editModalIdNames[i];
var editClassName=editClassNames[i];
editClassName=editClassName.substring(1);
var defaultClassName=defaultClassNames[i];
defaultClassName=defaultClassName.substring(1);
var paraClassName=paraClassNames[i];
paraClassName=paraClassName.substring(1);
var str="<div class=\"card text-dark  mb-3\"><div class=\"card-header\"> <a href=\""+editModalIdName+"\" data-toggle=\"modal\" class=\""+editClassName+"\">Edit</a>&ensp; <a href=\"#\" class=\""+defaultClassName+"\">Default <i class=\"fas fa-check color-green hide\"></i></a></div><div class=\"card-body\"><p class=\"card-text "+paraClassName+"\">"+name+"</p></div></div>";
//console.log(str);

    $(id).append(str);
    $(modalInputIds[i]).val("");
    $(closeModalButtonIds[i]).click();

    //add event on edit and default links created.
    var links= $(editClassNames[i]);
    var plinks=$(paraClassNames[i]);
  //  console.log(links);
  //  console.log(plinks);
  //  console.log("Add event on newly added link");
  //  console.log(links);
    if(links.length>0 && plinks.length>0){
        //console.log("here");
        var lastlink=links[links.length-1];
        //console.log(lastlink);
        var lastplink=plinks[plinks.length-1];
        var arr1=[];
        var arr2=[];
        arr1.push(lastlink);
        arr2.push(lastplink);
        editContent(arr1,arr2,i);
    }

     //add event on links for default.
     var strQ=defaultClassNames[i]+" i";
    // console.log(strQ);
    var linksForDefault=$(strQ);
   // console.log(linksForDefault);
    if(linksForDefault.length>0){
        var lastLink=linksForDefault[linksForDefault.length-1];
        var arr=[];
        arr.push(lastLink);
        makeDefault(arr,i);
    }
    
}

$(saveAddChangesButtonIds[0]).on("click",addRecords0);
$(saveAddChangesButtonIds[1]).on("click",addRecords1);
$(saveAddChangesButtonIds[2]).on("click",addRecords2);
$(saveAddChangesButtonIds[3]).on("click",addRecords3);
$(saveAddChangesButtonIds[4]).on("click",addRecords4);


function upperChangeEvent(){
    var upperFrom=$("input[name='upperFrom']").val();
    var upperTo=$("input[name='upperTo']").val();
    var upperATT=$("input[name='UpperATT']").prop("checked");
    
    var upperAligner=$("input[name='ua']");
   
   
    var str1="U";
   

    str1+=upperFrom+"-"+upperTo;
    if(upperATT){
        str1+="+ATT";
    }
    
    $(upperAligner).val(str1);
    
}
function lowerChangeEvent(){
  
    var lowerFrom=$("input[name='lowerFrom']").val();
    var lowerTo=$("input[name='lowerTo']").val();
    var lowerATT=$("input[name='LowerATT']").prop("checked");
    
    var lowerAligner=$("input[name='la']");
   
   
    var str2="L";

    
    str2+=lowerFrom+"-"+lowerTo;
    
    if(lowerATT){
        str2+="+ATT";
    }
   
    $(lowerAligner).val(str2);
}


$(document).ready(function(){
    
    
    for(var count=0;count<5;count++){
        //add event for edit
        var links=$(editClassNames[count]);
        var plinks=$(paraClassNames[count]);
        editContent(links,plinks,count);

        //make first link as default on page load.
        var strQu=defaultClassNames[count]+" i";
        var linksForDefault=$(strQu);
        if(linksForDefault.length>0){
            var firstLink=linksForDefault[0];
          //  console.log(firstLink);
            $(firstLink).removeClass("hide");
            $(firstLink).addClass("show");
        }

        //add event on links for default.
        makeDefault(linksForDefault,count);
    }
    

//on change events
var upperFrom=$("input[name='upperFrom']");
var upperTo=$("input[name='upperTo']")
var upperATT=$("input[name='UpperATT']");
var lowerFrom=$("input[name='lowerFrom']");
var lowerTo=$("input[name='lowerTo']");
var lowerATT=$("input[name='LowerATT']");

$(upperFrom).change(function() {
   upperChangeEvent();
  });
  $(upperTo).change(function() {
    upperChangeEvent();
   });
  $(upperATT).change(function() {
    upperChangeEvent();
  });
  $(lowerFrom).change(function() {
    lowerChangeEvent();
   });
   $(lowerTo).change(function() {
     lowerChangeEvent();
    });
   $(lowerATT).change(function() {
     lowerChangeEvent();
   });

    //event before form submission.
    $("#myForm").submit(function(e){
        for(var iCount=0;iCount<5;iCount++){
            var clinicNames=$(paraClassNames[iCount]);
            var defaultText="";
            for(let i=0;i<clinicNames.length;i++){
                var p=$(clinicNames[i]).parent();
                var text=$(p).text();
                text=text.trim();
             // alert(i+" "+text);
                var name=inputNames[iCount];
                var str="<input type=\"text\" name=\""+name+i+"\" value=\""+text+"\">";
                $("#hiddenInputs").append(str);
               var q=$(p).parent();
               if(q!=undefined){
                  var r=$(q).find(".card-header a i");
                  if($(r).hasClass("show")){
                    defaultText=text;
                    defaultText=defaultText.trim();
             //       console.log(defaultText);
                   }
                }
            }
             var dName=defaultNames[iCount];
             var defaultStr="<input type=\"text\" name=\""+dName+"\" value=\""+defaultText+"\">";
             $("#hiddenInputs").append(defaultStr);
        
        } 
      
     
    });  
 });

 function editContent(links,plinks,k){
    for(let i=0;i<links.length;i++){
    	$(links[i]).on("click",function(e1){
           // console.log(`${i} link is clicked`);
    		var text=$(plinks[i])[0].innerText;

            $(editModalInputIds[k]).val(text);
            var button="";
            button=$(saveEditChangesButtonIds[k]);
            $(button).off("click");
            $(button).on("click",function(e2){
             //   console.log(`${i} edit event link is clicked`);
                var newVal=$(editModalInputIds[k]).val();
                $(plinks[i])[0].innerText=newVal;
                $(editModalInputIds[k]).val("");
                
                $(closeEditModalButtonIds[k]).click();
             //   console.log(e2.target);
                //console.log(i);
            });
    	});
    }  
 }

 function makeDefault(linksForDefault,k){
     //console.log(linksForDefault);
    for(let i=0;i<linksForDefault.length;i++){
       // console.log( $(linksForDefault[i]).parent()[0]);
        var parentLink=$(linksForDefault[i]).parent();
        $(parentLink).on("click",function(e){
            e.preventDefault();
            var strQ=defaultClassNames[k]+" i";
            var alllinksForDefault=$(strQ);
            for(var j=0;j<alllinksForDefault.length;j++){
                if($(alllinksForDefault[j]).hasClass("show")){
                    $(alllinksForDefault[j]).removeClass("show");
                    $(alllinksForDefault[j]).addClass("hide");
                }
            }
            $(linksForDefault[i]).removeClass("hide");
            $(linksForDefault[i]).addClass("show");
        });
    }
 }

 



