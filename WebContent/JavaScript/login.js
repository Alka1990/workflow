/*
		Product         :       OmniFlow 7.0
		Application     :       OmniFlow Web Desktop
		Module          :       Document properties
		File            :       login.js
		Purpose         :       Contains the functions related to Login

		Change History  :

           Problem No        Correction Date	Comments
           -----------       ----------------	----------
           3211                                 Launch Client was not working from webdesktop when cookies are disabled
           1905                                 Webdesktop window was opening with black space when launched from processmanager
           3945              14/Mar/2008       CheckBox containing last login username/ cabinet on login page made configurable through ini.
           WCL_8.0_013     24/Apr/2009         SSO using the common application authentication approach
           WCL_8.0_070     28/07/2009          Puneet Pahuja               Time Zone Support
           WCL_8.0_157     07/12/2009          UserName and Cabinet Name need to ask along with Password on login page when workitem opens from mail.
           WCL_8.0_182     25/01/2010          Autocomplete set to off
           Bug 27591       20/07/2011            Resolution support for the webdesktop
*/


function show()
{
    try{
        document.getElementById('loginForm:loginName').setAttribute("autocomplete","off");
        document.getElementById('loginForm:password').setAttribute("autocomplete","off");
    }catch(e){}
    var lastHght = window.screen.height  - 768;
    if(lastHght>0)
        document.getElementById('lastTd').style.height = lastHght + 'px';
    if(!document.getElementById('loginForm:loginName')){
      // document.getElementById('loginForm:password').focus();
       return;
   }
   if(!window.navigator.cookieEnabled || (isCookieBox == 'N'))
   {
       if(strCalledFrom=="M" && strUserName!=null && strUserName!='null' && strUserName!="") 
         document.getElementById('loginForm:password').focus();  
        else   
        document.getElementById('loginForm:loginName').focus();
        return;
    }
    else
    {
        var remCabCheck=  document.getElementById('loginForm:remCab');
        var remLbl =document.getElementById('loginForm:remLbl');
        if(typeof remCabCheck!='undefined' && remCabCheck!=null && typeof remLbl!='undefined')
        {
            remCabCheck.style.visibility="visible";
            remLbl.style.visibility="visible";
        }
 
        if(FindCookies('CWCheck')=="set")
        {   
            if(typeof remCabCheck!='undefined' && remCabCheck!=null && typeof remLbl!='undefined')
            {
                document.getElementById('loginForm:remCab').checked=true;
                var CWUserId = FindCookies('CWUserId');
                if(CWUserId != '')
                {
                    document.getElementById('loginForm:loginName').value=CWUserId;
                    document.getElementById('loginForm:password').focus();
                }
                else
                {
                    document.getElementById('loginForm:loginName').focus();
                }
                if(document.getElementById('loginForm:loginName').value=='undefined')
                    document.getElementById('loginForm:loginName').value="";
                 var len=document.getElementById('loginForm:cabinetMenu').options.length;
                 for(var i=0;i<len;i++)
                 {
                    if(document.getElementById('loginForm:cabinetMenu')[i].value==FindCookies('CWCabinetId'))
                        document.getElementById('loginForm:cabinetMenu').selectedIndex=i;
                }
             }   
        }
        else
            document.getElementById('loginForm:loginName').focus();     
     }     
 }

function FindCookies(name)
{       
	var bites = document.cookie.split(SEPERATOR3);
	for(i=0; i < bites.length; i++)
	{
		nextbite = bites[i].split("=");

		Trim(nextbite[0]);

		if(i == 0)
			nextbite[0] = nextbite[0].substring(0,nextbite[0].length);
		else
			nextbite[0] = nextbite[0].substring(1,nextbite[0].length);

		if(nextbite[0] == name)
			return nextbite[1];
	}
}


function login()
{ 
   var today=new Date();  
   var expiry = new Date(today.getTime() + 28 * 24 * 60 * 60 * 1000); 

   var userId=Trim(document.getElementById('loginForm:loginName').value);
   var upassword=Trim(document.getElementById('loginForm:password').value);

   document.getElementById('loginForm:mratio').value=mratio;
   document.getElementById('loginForm:hratio').value=hratio;
   document.getElementById('loginForm:wratio').value=wratio;
   document.getElementById('loginForm:resol').value=resol;

   if(userId.length>0 && upassword.length>0 && isPwdEncrypt == 'Y' && eToken.length>0)
    {
    var bf = new Blowfish('DES');
    var sPwd = bf.encryptx(upassword,eToken);
    document.getElementById('loginForm:password').value = encode_utf8(sPwd);    
    }

   if(window.navigator.cookieEnabled)
   {   
      if(document.getElementById('loginForm:remCab').checked)
        {
           
         var cookiePath=sContextPath+"/login";
         userId=document.getElementById('loginForm:loginName').value;
         var cabIndex = document.getElementById('loginForm:cabinetMenu').selectedIndex;
         var cabinetId= document.getElementById('loginForm:cabinetMenu').options[cabIndex].value;
         document.cookie= "CWCheck=" + "set" + ";  path="+cookiePath+"; expires=" + expiry.toGMTString() ;
         document.cookie = "CWUserId=" + userId + "; path="+cookiePath+"; expires=" + expiry.toGMTString() ;
         document.cookie = "CWCabinetId=" + cabinetId + "; path="+cookiePath+"; expires=" + expiry.toGMTString();
       }  
       else
       {
          document.cookie = "CWCheck=" + "noset" + ";  path="+cookiePath+"; expires=" + expiry.toGMTString() ;
       }
    }
}
     

function getSessionVal()
{
    document.getElementById('loginForm:clientwidth').value = window.screen.availWidth;
    document.getElementById('loginForm:clientheight').value = document.body.clientHeight;

    var clientGMTOffset = 0-(new Date).getTimezoneOffset();

    document.getElementById('loginForm:ClientGMTOffset').value = clientGMTOffset;
    
    if(!window.navigator.cookieEnabled)
        cookieFlag = 'N';
    else
        cookieFlag = 'Y';
    document.getElementById('loginForm:cookieFlag').value = cookieFlag;
    var frmAction = document.getElementById("loginForm").action;
    if(frmAction.indexOf(";")!="-1")
        sessionVal = frmAction.substring(frmAction.indexOf(";"));
    document.getElementById('loginForm:sessionVal').value = sessionVal;
    if(strCalledFrom=="M"){ 
      if(strUserName!=null && strUserName!='null' && strUserName!='')
          document.getElementById("loginForm:loginName").value=strUserName; 
 
      if(strEngineName!=null && strEngineName!='null' && strEngineName!=''){  
            var strCabinet = document.getElementById('loginForm:cabinetMenu').options;
            for(var i=0;i<strCabinet.length;i++)
            { 
            if(strCabinet[i].value==strEngineName)
                {
                 strCabinet.selectedIndex=i;
                 break;
                }       
            } 
          }
      }
        document.getElementById('loginForm:mratio').value=mratio;
        document.getElementById('loginForm:hratio').value=hratio;
        document.getElementById('loginForm:wratio').value=wratio;
        document.getElementById('loginForm:resol').value=resol;
}

function handleEnter(e, calledFrom)
{if(calledFrom == 'M'){
            if(navigator.appName=="Netscape")
            {
                    if(e.which == 13){
                        mailLogin();
                    }
            }
            else
            {      
               e=window.event;			
               if(e.keyCode == 13){
                   mailLogin();
               }
            }               
        }
}
function sub(calledFrom){
    if(calledFrom=='M')
        return false;
}
function getSessionValExt(callFrm)
{

    if(!window.navigator.cookieEnabled)
        cookieFlag = 'N';
    else
        cookieFlag = 'Y';

    var clientGMTOffset = 0-(new Date).getTimezoneOffset();    

    var frmAction = document.getElementById("loginForm").action;
    
    if(frmAction.indexOf(";")!="-1")
        sessionVal = frmAction.substring(frmAction.indexOf(";"),frmAction.length);
    var loc=window.location+"";
    loc=loc.substring(0,loc.indexOf("/login"));
    
    var listParam=new Array();
    
    if(extLoginResult=='cabNotFound' && callFrm == 'SSOContext')
    {
        loc=loc+"/faces/login/SSOLoginFailed.jsp"+sessionVal;
        listParam.push(new Array("engineName",encode_ParamValue(SSOCabName)));
    }
    else if(extLoginResult=="connectFailed"){
        loc=loc+"/faces/login/SSOLoginFailed.jsp"+sessionVal;
        listParam.push(new Array("errorDesc",encode_ParamValue(errDesc)));
   }
   else{
        if((callFrm == 'EXT'  || callFrm == 'SSOContext')){
            loc=loc+"/faces/main/main.jsp"+sessionVal;
            listParam.push(new Array("cookieFlag",encode_ParamValue(cookieFlag)));
            listParam.push(new Array("jsessionid",encode_ParamValue(sessionVal)));
            listParam.push(new Array("calledFrom",encode_ParamValue('PM')));
            listParam.push(new Array("callFrm",encode_ParamValue('ext')));
            listParam.push(new Array("ClientGMTOffset",encode_ParamValue(clientGMTOffset)));
        }
        else if(callFrm == 'RD'){
            loc=loc+"/faces/main/main.jsp"+sessionVal;
            listParam.push(new Array("ProcessDefId",encode_ParamValue(processDefId)));
            listParam.push(new Array("WorkStageId",encode_ParamValue(workStageId)));
            listParam.push(new Array("cookieFlag",encode_ParamValue(cookieFlag)));
            listParam.push(new Array("jsessionid",encode_ParamValue(sessionVal)));
            listParam.push(new Array("calledFrom",encode_ParamValue('RD')));
            listParam.push(new Array("callFrm",encode_ParamValue('ext')));
            listParam.push(new Array("ClientGMTOffset",encode_ParamValue(clientGMTOffset)));
        }
   }    
   
   generatePostRequest(window,loc,listParam);
   //window.location=loc;
}
