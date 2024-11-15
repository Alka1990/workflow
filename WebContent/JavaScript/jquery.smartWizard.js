var Transection_ID;

function set(TransectionID) {
 //alert("hello"+TransectionID);
 Transection_ID=TransectionID;
 if(Transection_ID==null ||Transection_ID=='')
	 {Transection_ID="";
	 //alert("Transection_ID is null "+Transection_ID);
	 }
 //alert("tetstss"+Transection_ID);
}
function SmartWizard(target, options) {
    this.target       = target;
    this.options      = options;
    this.curStepIdx   = options.selected;
    this.steps        = $(target).children("ul").children("li").children("a"); // Get all anchors
    this.contentWidth = 0;
    this.msgBox = $('<div class="msgBox"><div class="content"></div><a href="#" class="close">X</a></div>');
    this.elmStepContainer = $('<div></div>').addClass("stepContainer");
    this.loader = $('<div>Loading</div>').addClass("loader");
    this.buttons = {
        next : $('<a>'+options.labelNext+'</a>').attr("href","#").addClass("btn btn-success"),
        previous : $('<a>'+options.labelPrevious+'</a>').attr("href","#").addClass("btn btn-primary"),
        finish  : $('<a>'+options.labelFinish+'</a>').attr("href","#").addClass("btn btn-default")
    };

    /*
     * Private functions
     */

    var _init = function($this) {
        var elmActionBar = $('<div></div>').addClass("actionBar");
        //elmActionBar.append($this.msgBox);
        $('.close',$this.msgBox).click(function() {
            $this.msgBox.fadeOut("normal");
            return false;
        });

        var allDivs = $this.target.children('div');
        // CHeck if ul with steps has been added by user, if not add them
        if($this.target.children('ul').length == 0 ){
            var ul = $("<ul/>");
            target.prepend(ul)

            // for each div create a li
            allDivs.each(function(i,e){
                var title = $(e).first().children(".StepTitle").text();
                var s = $(e).attr("id")
                // if referenced div has no id, add one.
                if (s==undefined){
                    s = "step-"+(i+1)
                    $(e).attr("id",s);
                }
                var span = $("<span/>").addClass("stepDesc").text(title);
                var li = $("<li></li>").append($("<a></a>").attr("href", "#" + s).append($("<label></label>").addClass("stepNumber").text(i + 1)).append(span));
                ul.append(li);
            });
            // (re)initialise the steps property
            $this.steps = $(target).children("ul").children("li").children("a"); // Get all anchors
        }
        $this.target.children('ul').addClass("anchor");
        allDivs.addClass("wizard_content");

        // highlight steps with errors
        if($this.options.errorSteps && $this.options.errorSteps.length>0){
            $.each($this.options.errorSteps, function(i, n){
                $this.setError({ stepnum: n, iserror:true });
            });
        }

        $this.elmStepContainer.append(allDivs);
        //elmActionBar.append($this.loader);
        $this.target.append($this.elmStepContainer);

    
        elmActionBar.append($this.buttons.previous)
            .append($this.buttons.next);
        if ($this.options.includeFinishButton){
            elmActionBar.append($this.buttons.finish);
        }
        $this.target.append(elmActionBar);
    

        this.contentWidth = $this.elmStepContainer.width();

        $($this.buttons.next).click(function() {
			if($this.curStepIdx==0)
			{if(document.getElementById('hiddenFetchData').value!="FetchData")
			{
				var CompanyName=document.getElementById('Id_Company_name').value;
				var TaxCountry=document.getElementById('Id_Tax_Country').value;
				var Email=document.getElementById('Id_Email').value;
				var LastName=document.getElementById('Id_LastName').value;
				var VendorCode=document.getElementById('ID_VendorCode').value;
				
				var ID_CompanyCode=document.getElementById('ID_CompanyCode').value;
				
				
				var ID_VendorName=document.getElementById('ID_VendorName').value;
				var ID_VendorEmail=document.getElementById('ID_VendorEmail').value;
				var ID_SPOC=document.getElementById('ID_SPOC').value;
				
				var ID_SPOCEmail=document.getElementById('ID_SPOCEmail').value;
				var ID_Currency=document.getElementById('ID_Currency').value;
				var VendorAddr=document.getElementById('ID_VendorAddr').value;
				
				
				if(CompanyName==null ||CompanyName=='')
				{
					alert("Company name Is  mandatory");
					Id_Company_name.focus();
					return false;
				}else if(TaxCountry==null ||TaxCountry=='')
				{
					alert("Tax Country  Is  mandatory");
					Id_Tax_Country.focus();
					return false;
				}
				if(Email==null ||Email=='')
				{
					alert("Email Is  mandatory");
					Id_Email.focus();
					return false;
				}
				if(LastName==null ||LastName=='')
				{
					alert("Last Name Is  mandatory");
					Id_LastName.focus();
					return false;
				}
				
				if(VendorCode==null ||VendorCode=='')
				{
					alert("Vendor Code Is  mandatory");
					VendorCode.focus();
					return false;
				}
				
				if(ID_CompanyCode==null ||ID_CompanyCode=='')
				{
					alert("CompanyCode Is  mandatory");
					ID_CompanyCode.focus();
					return false;
				}
				
				if(ID_VendorName==null ||ID_VendorName=='')
				{
					alert("VendorName Is  mandatory");
					ID_VendorName.focus();
					return false;
				}
				
				if(ID_VendorEmail==null ||ID_VendorEmail=='')
				{
					alert("VendorEmail Is  mandatory");
					ID_VendorEmail.focus();
					return false;
				}
				
				
				if(ID_SPOC==null ||ID_SPOC=='')
				{
					alert("SPOC Is  mandatory");
					ID_SPOC.focus();
					return false;
				}
				
				
				if(ID_SPOCEmail==null ||ID_SPOCEmail=='')
				{
					alert("SPOCEmail Is  mandatory");
					ID_SPOCEmail.focus();
					return false;
				}
				
				
				if(ID_Currency==null ||ID_Currency=='')
				{
					alert("Currency Is  mandatory");
					ID_Currency.focus();
					return false;
				}
				
				if(VendorAddr==null ||VendorAddr=='')
				{
					alert("Vendor Address Is  mandatory");
					ID_Currency.focus();
					return false;
				}
				
				
				FirstScreenWebservice();}
			}
			else if($this.curStepIdx==1)
			{if(document.getElementById('hiddenFetchData').value!="FetchData"){
				var Grid_Table = document.getElementById('ID_GR_AddrsDetail');  
				var Grid_Table1 = document.getElementById('Id_Grid_Contact');  
				if(Grid_Table.rows.length<2)	
				{
					alert("One Entry is required for Address Details");
					return false;
				}else if(Grid_Table1.rows.length<2)	
				{
					alert("One Entry is required for Contact Details");
					return false;
				}					
				   
				SecondScreenWebservice();}
			}
			else if($this.curStepIdx==2) {
				if(document.getElementById('hiddenFetchData').value!="FetchData"){
			ThirdScreenWebservice();}
			}
			else if($this.curStepIdx==3){
				if(document.getElementById('hiddenFetchData').value!="FetchData"){
			FourthScreenWebservice();
				}
				}
			else if($this.curStepIdx==4)
			{
				if(document.getElementById('hiddenFetchData').value!="FetchData"){
				var Grid_Table2 = document.getElementById('Id_Grid_Banking');  
				if(Grid_Table2.rows.length<2)	
				{
					alert("One Entry is required for Banking Details");
					return false;
				}
				FifthScreenWebservice();}
			}
			
			$this.goForward();
            return false;
        });
        $($this.buttons.previous).click(function() {
            $this.goBackward();
            return false;
        });
        $($this.buttons.finish).click(function() {
           // alert("test.......");
            
            DocumentSaveWebservice();

           if(!$(this).hasClass('buttonDisabled')){
           //alert("test.......454646");
                if($.isFunction($this.options.onFinish)) {
                    var context = { fromStep: $this.curStepIdx + 1 };
                                if(!$this.options.onFinish.call(this,$($this.steps), context)){
                        return false;
                    }
                }else{
                	
                	alert("Vendor succesfully created");
                    //Code Start
                    var dlg = $("#dialog-formPopUp").clone();
                    var config = {
                    autoOpen: true,
                    height: 300,
                    width: 350,
                    modal: true,
                    buttons: {

                        "Ok": function () {
                            dlg.dialog("close");
                        }
                    },
                    close: function () {
                        dlg.remove();
                    }
                };

                dlg.dialog(config);
                    //Code End
                    var frm = $this.target.parents('form');
                    if(frm && frm.length){

                    }
                }
            }
            return false;
        });

        $($this.steps).bind("click", function(e){
            if($this.steps.index(this) == $this.curStepIdx){
                return false;
            }
            var nextStepIdx = $this.steps.index(this);
            var isDone = $this.steps.eq(nextStepIdx).attr("isDone") - 0;
            if(isDone == 1){
                _loadContent($this, nextStepIdx);
            }
            return false;
        });

        // Enable keyboard navigation
        if($this.options.keyNavigation){
            $(document).keyup(function(e){
                if(e.which==39){ // Right Arrow
                    $this.goForward();
                }else if(e.which==37){ // Left Arrow
                    $this.goBackward();
                }
            });
        }
        //  Prepare the steps
        _prepareSteps($this);
        // Show the first slected step
        _loadContent($this, $this.curStepIdx);
    };

    var _prepareSteps = function($this) {
        if(! $this.options.enableAllSteps){
            $($this.steps, $this.target).removeClass("selected").removeClass("done").addClass("disabled");
            $($this.steps, $this.target).attr("isDone",0);
        }else{
            $($this.steps, $this.target).removeClass("selected").removeClass("disabled").addClass("done");
            $($this.steps, $this.target).attr("isDone",1);
        }

        $($this.steps, $this.target).each(function(i){
            $($(this).attr("href").replace(/^.+#/, '#'), $this.target).hide();
            $(this).attr("rel",i+1);
        });
    };

    var _step = function ($this, selStep) {
        return $(
            $(selStep, $this.target).attr("href").replace(/^.+#/, '#'),
            $this.target
        );
    };

    var _loadContent = function($this, stepIdx) {
        var selStep = $this.steps.eq(stepIdx);
        var ajaxurl = $this.options.contentURL;
        var ajaxurl_data = $this.options.contentURLData;
        var hasContent = selStep.data('hasContent');
        var stepNum = stepIdx+1;
        if (ajaxurl && ajaxurl.length>0) {
            if ($this.options.contentCache && hasContent) {
                _showStep($this, stepIdx);
            } else {
                var ajax_args = {
                    url: ajaxurl,
                    type: $this.options.ajaxType,
                    data: ({step_number : stepNum}),
                    dataType: "text",
                    beforeSend: function(){
                        $this.loader.show();
                    },
                    error: function(){
                        $this.loader.hide();
                    },
                    success: function(res){
                        $this.loader.hide();
                        if(res && res.length>0){
                            selStep.data('hasContent',true);
                            _step($this, selStep).html(res);
                            _showStep($this, stepIdx);
                        }
                    }
                };
                if (ajaxurl_data) {
                    ajax_args = $.extend(ajax_args, ajaxurl_data(stepNum));
                }
                $.ajax(ajax_args);
            }
        }else{
            _showStep($this,stepIdx);
        }
    };

    var _showStep = function($this, stepIdx) {
        var selStep = $this.steps.eq(stepIdx);
        var curStep = $this.steps.eq($this.curStepIdx);
        if(stepIdx != $this.curStepIdx){
            if($.isFunction($this.options.onLeaveStep)) {
                var context = { fromStep: $this.curStepIdx+1, toStep: stepIdx+1 };
                if (! $this.options.onLeaveStep.call($this,$(curStep), context)){
                    return false;
                }
            }
        }
        //$this.elmStepContainer.height(_step($this, selStep).outerHeight());
        var prevCurStepIdx = $this.curStepIdx;
        $this.curStepIdx =  stepIdx;
        if ($this.options.transitionEffect == 'slide'){
            _step($this, curStep).slideUp("fast",function(e){
                _step($this, selStep).slideDown("fast");
                _setupStep($this,curStep,selStep);
            });
        } else if ($this.options.transitionEffect == 'fade'){
            _step($this, curStep).fadeOut("fast",function(e){
                _step($this, selStep).fadeIn("fast");
                _setupStep($this,curStep,selStep);
            });
        } else if ($this.options.transitionEffect == 'slideleft'){
            var nextElmLeft = 0;
            var nextElmLeft1 = null;
            var nextElmLeft = null;
            var curElementLeft = 0;
            if(stepIdx > prevCurStepIdx){
                nextElmLeft1 = $this.elmStepContainer.width() + 10;
                nextElmLeft2 = 0;
                curElementLeft = 0 - _step($this, curStep).outerWidth();
            } else {
                nextElmLeft1 = 0 - _step($this, selStep).outerWidth() + 20;
                nextElmLeft2 = 0;
                curElementLeft = 10 + _step($this, curStep).outerWidth();
            }
            if (stepIdx == prevCurStepIdx) {
                nextElmLeft1 = $($(selStep, $this.target).attr("href"), $this.target).outerWidth() + 20;
                nextElmLeft2 = 0;
                curElementLeft = 0 - $($(curStep, $this.target).attr("href"), $this.target).outerWidth();
            } else {
                $($(curStep, $this.target).attr("href"), $this.target).animate({left:curElementLeft},"fast",function(e){
                    $($(curStep, $this.target).attr("href"), $this.target).hide();
                });
            }

            _step($this, selStep).css("left",nextElmLeft1).show().animate({left:nextElmLeft2},"fast",function(e){
                _setupStep($this,curStep,selStep);
            });
        } else {
            _step($this, curStep).hide();
            _step($this, selStep).show();
            _setupStep($this,curStep,selStep);
        }
        return true;
    };

    var _setupStep = function($this, curStep, selStep) {
        $(curStep, $this.target).removeClass("selected");
        $(curStep, $this.target).addClass("done");

        $(selStep, $this.target).removeClass("disabled");
        $(selStep, $this.target).removeClass("done");
        $(selStep, $this.target).addClass("selected");

        $(selStep, $this.target).attr("isDone",1);

        _adjustButton($this);

        if($.isFunction($this.options.onShowStep)) {
            var context = { fromStep: parseInt($(curStep).attr('rel')), toStep: parseInt($(selStep).attr('rel')) };
            if(! $this.options.onShowStep.call(this,$(selStep),context)){
                return false;
            }
        }
        if ($this.options.noForwardJumping) {
            // +2 == +1 (for index to step num) +1 (for next step)
            for (var i = $this.curStepIdx + 2; i <= $this.steps.length; i++) {
                $this.disableStep(i);
            }
        }
    };

    var _adjustButton = function($this) {
        if (! $this.options.cycleSteps){
            if (0 >= $this.curStepIdx) {
                $($this.buttons.previous).addClass("buttonDisabled");
                if ($this.options.hideButtonsOnDisabled) {
                    $($this.buttons.previous).hide();
                }
            }else{
                $($this.buttons.previous).removeClass("buttonDisabled");
                if ($this.options.hideButtonsOnDisabled) {
                    $($this.buttons.previous).show();
                }
            }
            if (($this.steps.length-1) <= $this.curStepIdx){
                $($this.buttons.next).addClass("buttonDisabled");
                if ($this.options.hideButtonsOnDisabled) {
                    $($this.buttons.next).hide();
                }
            }else{
                $($this.buttons.next).removeClass("buttonDisabled");
                if ($this.options.hideButtonsOnDisabled) {
                    $($this.buttons.next).show();
                }
            }
        }
        // Finish Button
        $this.enableFinish($this.options.enableFinishButton);
    };

    /*
     * Public methods
     */

    SmartWizard.prototype.goForward = function(){
        var nextStepIdx = this.curStepIdx + 1;
        if (this.steps.length <= nextStepIdx){
            if (! this.options.cycleSteps){
                return false;
            }
            nextStepIdx = 0;
        }
        _loadContent(this, nextStepIdx);
    };

    SmartWizard.prototype.goBackward = function(){
        var nextStepIdx = this.curStepIdx-1;
        if (0 > nextStepIdx){
            if (! this.options.cycleSteps){
                return false;
            }
            nextStepIdx = this.steps.length - 1;
        }
        _loadContent(this, nextStepIdx);
    };

    SmartWizard.prototype.goToStep = function(stepNum){
        var stepIdx = stepNum - 1;
        if (stepIdx >= 0 && stepIdx < this.steps.length) {
            _loadContent(this, stepIdx);
        }
    };
    SmartWizard.prototype.enableStep = function(stepNum) {
        var stepIdx = stepNum - 1;
        if (stepIdx == this.curStepIdx || stepIdx < 0 || stepIdx >= this.steps.length) {
            return false;
        }
        var step = this.steps.eq(stepIdx);
        $(step, this.target).attr("isDone",1);
        $(step, this.target).removeClass("disabled").removeClass("selected").addClass("done");
    }
    SmartWizard.prototype.disableStep = function(stepNum) {
        var stepIdx = stepNum - 1;
        if (stepIdx == this.curStepIdx || stepIdx < 0 || stepIdx >= this.steps.length) {
            return false;
        }
        var step = this.steps.eq(stepIdx);
        $(step, this.target).attr("isDone",0);
        $(step, this.target).removeClass("done").removeClass("selected").addClass("disabled");
    }
    SmartWizard.prototype.currentStep = function() {
        return this.curStepIdx + 1;
    }

    SmartWizard.prototype.showMessage = function (msg) {
        $('.content', this.msgBox).html(msg);
        this.msgBox.show();
    }

    SmartWizard.prototype.enableFinish = function (enable) {
        // Controll status of finish button dynamically
        // just call this with status you want
        this.options.enableFinishButton = enable;
        if (this.options.includeFinishButton){
            if (!this.steps.hasClass('disabled') || this.options.enableFinishButton){
                $(this.buttons.finish).removeClass("buttonDisabled");
                if (this.options.hideButtonsOnDisabled) {
                    $(this.buttons.finish).show();
                }
            }else{
                $(this.buttons.finish).addClass("buttonDisabled");
                if (this.options.hideButtonsOnDisabled) {
                    $(this.buttons.finish).hide();
                }
            }
        }
        return this.options.enableFinishButton;
    }

    SmartWizard.prototype.hideMessage = function () {
        this.msgBox.fadeOut("normal");
    }
    SmartWizard.prototype.showError = function(stepnum) {
        this.setError(stepnum, true);
    }
    SmartWizard.prototype.hideError = function(stepnum) {
        this.setError(stepnum, false);
    }
    SmartWizard.prototype.setError = function(stepnum,iserror) {
        if (typeof stepnum == "object") {
            iserror = stepnum.iserror;
            stepnum = stepnum.stepnum;
        }

        if (iserror){
            $(this.steps.eq(stepnum-1), this.target).addClass('error')
        }else{
            $(this.steps.eq(stepnum-1), this.target).removeClass("error");
        }
    }

    SmartWizard.prototype.fixHeight = function(){
        var height = 0;

        var selStep = this.steps.eq(this.curStepIdx);
        var stepContainer = _step(this, selStep);
        stepContainer.children().each(function() {
            if($(this).is(':visible')) {
                 height += $(this).outerHeight(true);
            }
        });

        // These values (5 and 20) are experimentally chosen.
        stepContainer.height(height + 5);
        this.elmStepContainer.height(height + 20); 
   }

    _init(this);
};



function Vendor_Create_Webservice()
{
	try
	{
		alert("Inside Vendor_Create_Webservice ");
		var VendorCode=document.getElementById('ID_VendorCode').value;
		var VendorName=document.getElementById('ID_VendorName').value;
		var VendorAddr=document.getElementById('ID_VendorAddr').value;
		var VendorEmail=document.getElementById('ID_VendorEmail').value;
		var SPOC=document.getElementById('ID_SPOC').value;
		var SPOCEmail=document.getElementById('ID_SPOCEmail').value;
		var Currency=document.getElementById('ID_Currency').value;
		var CompanyCode=document.getElementById('ID_CompanyCode').value;

		
		var url="JSP/CreateVendorWSCall.jsp"+"?"+"&VendorCode="+VendorCode+"&VendorName="+VendorName+"&VendorAddr="+VendorAddr+"&VendorEmail="+VendorEmail+"&SPOC="+SPOC+"&SPOCEmail="+SPOCEmail+"&Currency="+Currency+"&CompanyCode="+CompanyCode+"&random="+Math.random();
		
		//alert (url);
  	//var abc = window.open(url);
		var ReturnVal=Fun_Ajax(url,"");
		
		
}catch(e)
	{
		//alert("Exception from Vendor_Create_Webservice function"+e);
	}
}


function  FirstScreenWebservice()
{
	try
	{
		//alert("Inside FirstScreenWebservice ");
		var CompanyName=document.getElementById('Id_Company_name').value;
		var TaxCountry=document.getElementById('Id_Tax_Country').value;
		var TaxRegNo=document.getElementById('Id_Tax_RegNo').value;
		var TaxpayerId=document.getElementById('Id_TaxpayerId').value;
		var DUNSNo=document.getElementById('Id_DUNSNo').value;
		var Email=document.getElementById('Id_Email').value;
		var FirstName=document.getElementById('Id_FirstName').value;
		var LastName=document.getElementById('Id_LastName').value;
		var PhoneAreaCode=document.getElementById('Id_PhoneAreaCode').value;
		var PhoneNumber=document.getElementById('Id_PhoneNumber').value;
		var PhoneExtn=document.getElementById('Id_PhoneExtn').value;
		//changes for add new vendor from VP
		var VendorCode= document.getElementById('ID_VendorCode').value;
		var VendorName=document.getElementById('ID_VendorName').value;
		var VendorAddr=document.getElementById('ID_VendorAddr').value;
		var VendorEmail=document.getElementById('ID_VendorEmail').value;
		var SPOC=document.getElementById('ID_SPOC').value;
		var SPOCEmail=document.getElementById('ID_SPOCEmail').value;
		var Currency=document.getElementById('ID_Currency').value;
		var CompanyCode=document.getElementById('ID_CompanyCode').value;
		//alert("Hiii");
		
		
		//var url="JSP/FirstScreenWSCall.jsp"+"?"+"&CompanyName="+CompanyName+"&TaxCountry="+TaxCountry+"&TaxRegNo="+TaxRegNo+"&TaxpayerId="+TaxpayerId+"&DUNSNo="+DUNSNo+"&Email="+Email+"&FirstName="+FirstName+"&LastName="+LastName+"&PhoneAreaCode="+PhoneAreaCode+"&PhoneNumber="+PhoneNumber+"&PhoneExtn="+PhoneExtn+"&random="+Math.random();
		var url="FirstScreenWSCall.jsp"+"?"+"&CompanyName="+CompanyName+"&TaxCountry="+TaxCountry+"&TaxRegNo="+TaxRegNo+"&TaxpayerId="+TaxpayerId+"&DUNSNo="+DUNSNo+"&Email="+Email+"&FirstName="+FirstName+"&LastName="+LastName+"&PhoneAreaCode="+PhoneAreaCode+"&PhoneNumber="+PhoneNumber+"&PhoneExtn="+PhoneExtn+"&VendorCode="+VendorCode+"&VendorName="+VendorName+"&VendorAddr="+VendorAddr+"&VendorEmail="+VendorEmail+"&SPOC="+SPOC+"&SPOCEmail="+SPOCEmail+"&Currency="+Currency+"&CompanyCode="+CompanyCode+"&random="+Math.random();
	//	alert (url);
  	//var abc = window.open(url);
		var ReturnVal=Fun_Ajax(url,"");
		
		
}catch(e)
	{
		alert("Exception from FirstScreenWebservice function"+e);
	}
	
}

function SecondScreenWebservice()
{
	try
	{
		//alert("Inside SecondScreenWebservice ");
		var VendorCode= document.getElementById('ID_VendorCode').value;
		//alert("vendorcode :"+VendorCode);
		var str='';    
		var Transection_ID='1';		
		var Grid_Table = document.getElementById('ID_GR_AddrsDetail');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-2; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}   //str=str+','+Transection_ID;        
				//str=str+'~';            
		}       
			
				//alert(str);
		
		
		var url="SecondScreenWSCall.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&VendorCode="+VendorCode+"&random="+Math.random();
		//var url="JSP/SecondScreenWSCall.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&random="+Math.random();
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		//Second Grid Data Save
		//alert("Inside SecondScreenWebservice 2");
		var str='';    
		var Transection_ID='1';		
		var Grid_Table = document.getElementById('Id_Grid_Contact');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-2; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}   //str=str+','+Transection_ID;           
				//str=str+'~';            
		}       
			
				//alert(str);
		
		
		var url="SecondScreenWSCall2.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&VendorCode="+VendorCode+"&random="+Math.random();
		
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		
		
}catch(e)
	{
		alert("Exception from SecondScreenWebservice function"+e);
	}
}


function ThirdScreenWebservice()
{
	try
	{	var VendorCode= document.getElementById('ID_VendorCode').value;
		var FinalStr="";
		var Column2="";
		var Column3="";
		var Column4="";
		var Column5="";
		var Column6="";
		var Column7="";
		var Column8="";
		var Column9="";
		var Column10="";
		var Column11="";
		
		var Transection_ID='1';
		/*var chk_CCorp =document.getElementById("id_CCorp").checked;
		var chk_Federal =document.getElementById("id_Federal").checked;
		var chk_SCorp =document.getElementById("id_SCorp").checked;
		var chk_LaibCorpC =document.getElementById("id_LaibCorpC").checked;
		var chk_Partnship =document.getElementById("id_Partnship").checked;
		var chk_LaibCorpS =document.getElementById("id_LaibCorpS").checked;
		var chk_NonProfit =document.getElementById("id_NonProfit").checked;
		var chk_LaibPartshp =document.getElementById("id_LaibPartshp").checked;
		var chk_Trust =document.getElementById("id_Trust").checked;
		var chk_SoleProp =document.getElementById("id_SoleProp").checked;
		var chk_EducInst =document.getElementById("id_EducInst").checked;
		
		var chk_BussinesDev =document.getElementById("id_BussinesDev").checked;
		var chk_SmallDisBus =document.getElementById("id_SmallDisBus").checked;
		var chk_HubZone =document.getElementById("id_HubZone").checked;
		var chk_ServVeteran =document.getElementById("id_ServVeteran").checked;
		var chk_LGBT =document.getElementById("id_LGBT").checked;
		var chk_VeteranOwned =document.getElementById("id_VeteranOwned").checked;
		var chk_MinBusEnterp =document.getElementById("id_MinBusEnterp").checked;
		var chk_WomenBusin =document.getElementById("id_WomenBusin").checked;
		var chk_SmallBusinEnt =document.getElementById("id_SmallBusinEnt").checked;
		var chk_WomenLargeBusin =document.getElementById("id_WomenLargeBusin").checked;*/
		
		
		if(document.getElementById("id_CCorp").checked)
			FinalStr="id_CCorp";
		else if(document.getElementById("id_Federal").checked)
			FinalStr="id_Federal";
		else if(document.getElementById("id_SCorp").checked)
			FinalStr="id_SCorp";
		else if(document.getElementById("id_LaibCorpC").checked)
			FinalStr="id_LaibCorpC";
		else if(document.getElementById("id_Partnship").checked)
			FinalStr="id_Partnship";
		else if(document.getElementById("id_LaibCorpS").checked)
			FinalStr="id_LaibCorpS";
		else if(document.getElementById("id_NonProfit").checked)
			FinalStr="id_NonProfit";
		else if(document.getElementById("id_LaibPartshp").checked)
			FinalStr="id_LaibPartshp";
		else if(document.getElementById("id_Trust").checked)
			FinalStr="id_Trust";
		else if(document.getElementById("id_SoleProp").checked)
			FinalStr="id_SoleProp";
		else if(document.getElementById("id_EducInst").checked)
			FinalStr="id_EducInst";
			//alert(FinalStr);
			
		if(document.getElementById("id_BussinesDev").checked)
			Column2="id_BussinesDev";	
		if(document.getElementById("id_SmallDisBus").checked)
			Column3="id_SmallDisBus";
		if(document.getElementById("id_HubZone").checked)
			Column4="id_HubZone";
		if(document.getElementById("id_ServVeteran").checked)
			Column5="id_ServVeteran";
		if(document.getElementById("id_LGBT").checked)
			Column6="id_LGBT";
		if(document.getElementById("id_VeteranOwned").checked)
			Column7="id_VeteranOwned";
		if(document.getElementById("id_MinBusEnterp").checked)
			Column8="id_MinBusEnterp";
		if(document.getElementById("id_WomenBusin").checked)
			Column9="id_WomenBusin";
		if(document.getElementById("id_SmallBusinEnt").checked)
			Column10="id_SmallBusinEnt";
		if(document.getElementById("id_WomenLargeBusin").checked)
			Column11="id_WomenLargeBusin";
		
		
		
		var url="ThirdScreenWSCall.jsp"+"?"+"&Transection_ID="+Transection_ID+"&FinalStr="+FinalStr+"&Column2="+Column2+"&Column3="+Column3+"&Column4="+Column4+"&Column5="+Column5+"&Column6="+Column6+"&Column7="+Column7+"&Column8="+Column8+"&Column9="+Column9+"&Column10="+Column10+"&Column11="+Column11+"&VendorCode="+VendorCode+"&random="+Math.random();
		
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		
}catch(e)
	{
		alert("Exception from Vendor_Create_Webservice function"+e);
	}
}
function FourthScreenWebservice()
{
	try
	{	var VendorCode= document.getElementById('ID_VendorCode').value;
		//alert("Inside FourthScreenWebservice ");
		var str='';    
		var Transection_ID='1';		
		var Grid_Table = document.getElementById('Id_Grid_ParentGrp');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-2; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}            
				//str=str+'~';            
		}       
			
				//alert(str);
		
		
		var url="FourthScreenWSCall.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&VendorCode="+VendorCode+"&random="+Math.random();
		
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		//Second Grid Data Save
		//alert("Inside FourthScreenWebservice 2");
		var str='';    
		var Transection_ID='1';		
		var Grid_Table = document.getElementById('Id_Grid_SubGrp');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-2; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}            
				//str=str+'~';            
		}       
			
				//alert(str);
		
		
		var url="FourthScreenWSCall2.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&VendorCode="+VendorCode+"&random="+Math.random();
		
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		
		
}catch(e)
	{
		alert("Exception from SecondScreenWebservice function"+e);
	}
}
function FifthScreenWebservice()
{
	try
	{	var VendorCode= document.getElementById('ID_VendorCode').value;
		//alert("Inside FifthScreenWebservice ");
		var str='';    
		var Transection_ID='1';		
		var Grid_Table = document.getElementById('Id_Grid_Banking');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-2; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}            
				//str=str+'~';            
		}       
			
				//alert(str);
	//	var path=${pageContext.request.contextPath};
		//alert("123");
		var url="FifthScreenWSCall.jsp"+"?"+"&Transection_ID="+Transection_ID+"&str="+str+"&VendorCode="+VendorCode+"&random="+Math.random();
		//alert(url);
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		
		
		
		
}catch(e)
	{
		alert("Exception from SecondScreenWebservice function"+e);
	}
}

function DocumentSaveWebservice()
{
	try
	{	var VendorCode= document.getElementById('ID_VendorCode').value;
		//alert("Inside FifthScreenWebservice ");
	
	var table = document.getElementById("docDetails");
	//alert("saveInvoiceData :: table :: "+table);
    var len = table.rows.length;
   // alert("No of rows in grid::"+len);
    if(len<2){  
		alert("Document is mandatory");
		document.getElementById('adddoc').focus();
		return false;
	}

		var str='';    
		var Transection_ID=VendorCode;		
		var Grid_Table = document.getElementById('docDetails');   
	
		for(var row=1; row<Grid_Table.rows.length; row++)        
		{             
			for(var col=0; col<Grid_Table.rows[row].cells.length-1; col++)           
			{                 
				if(col==0)                   
				if(document.all)
				{		
					//str=str+Transection_ID+','				
					str=str+Grid_Table.rows[row].cells[col].innerText;      
				}				
				else 
				{
					//str=str+Transection_ID+','
					str=str+Grid_Table.rows[row].cells[col].textContent;      
				}				
				else   
				if(document.all)                         
				str=str+','+Grid_Table.rows[row].cells[col].innerText;                     
				else                         
				str=str+','+Grid_Table.rows[row].cells[col].textContent;            
			}            
				//str=str+'~';            
		}       
			
				//alert(str);
	//	var path=${pageContext.request.contextPath};
		//alert("123");
		var url="SixthScreenWSCall.jsp"+"?"+"&VendorCode="+VendorCode+"&str="+str;
		//alert(url);
		//alert (url);
		var ReturnVal=Fun_Ajax(url,"");
		//alert("ReturnVal&&&&&---"+ReturnVal);
		
		
		
		
		
}catch(e)
	{
		alert("Exception from SecondScreenWebservice function"+e);
	}
}



(function($){

    $.fn.smartWizard = function(method) {
        var args = arguments;
        var rv = undefined;
        var allObjs = this.each(function() {
            var wiz = $(this).data('smartWizard');
            if (typeof method == 'object' || ! method || ! wiz) {
                var options = $.extend({}, $.fn.smartWizard.defaults, method || {});
                if (! wiz) {
                    wiz = new SmartWizard($(this), options);
                    $(this).data('smartWizard', wiz);
                }
            } else {
                if (typeof SmartWizard.prototype[method] == "function") {
                    rv = SmartWizard.prototype[method].apply(wiz, Array.prototype.slice.call(args, 1));
                    return rv;
                } else {
                    $.error('Method ' + method + ' does not exist on jQuery.smartWizard');
                }
            }
        });
        if (rv === undefined) {
            return allObjs;
        } else {
            return rv;
        }
    };
    


// Default Properties and Events
    $.fn.smartWizard.defaults = {
        selected: 0,  // Selected Step, 0 = first step
        keyNavigation: true, // Enable/Disable key navigation(left and right keys are used if enabled)
        enableAllSteps: false,
        transitionEffect: 'fade', // Effect on navigation, none/fade/slide/slideleft
        contentURL:null, // content url, Enables Ajax content loading
        contentCache:true, // cache step contents, if false content is fetched always from ajax url
        cycleSteps: false, // cycle step navigation
        enableFinishButton: false, // make finish button enabled always
        hideButtonsOnDisabled: false, // when the previous/next/finish buttons are disabled, hide them instead?
        errorSteps:[],    // Array Steps with errors
        labelNext:'Next',
        labelPrevious:'Previous',
        labelFinish:'Finish',
        noForwardJumping: false,
        ajaxType: "POST",
        onLeaveStep: null, // triggers when leaving a step
        onShowStep: null,  // triggers when showing a step
        onFinish: null,  // triggers when Finish button is clicked
        includeFinishButton : true   // Add the finish button
    };

})(jQuery);
