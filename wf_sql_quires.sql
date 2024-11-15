=======================================================================================================
											|| DB workflow ||
=======================================================================================================

==========================================Date:16-03-2023==============================================


update cc_crm set case_stage='MPT' Where case_stage='MTP';
delete  from  cc_Crm where case_stage='null';
delete  from  cc_Crm where case_stage='';
delete  from  cc_Crm where case_stage='0';
delete  from  cc_Crm where case_stage='1';
delete  from  cc_Crm where case_stage='2';
delete  from  cc_Crm where starter_case_stage='';


==========================================Date:06-03-2023==============================================

use wisealign_workflow;
alter table Cc_crm
add Rpt_stage varchar(64);

alter table Cc_crm
add no_of_rpt bigint;

alter table Cc_crm
add wfc_rpt_at datetime;

alter table Cc_crm
add pln_rpt_at datetime;

alter table Cc_crm
add lab_rpt_at datetime;

alter table Cc_crm
add qc_rpt_at datetime;

alter table Cc_crm
add pck_rpt_at datetime;

alter table Cc_crm
add dispatch_rpt_at datetime;


##

CREATE TABLE rpt(
rpt_id bigint primary key auto_increment,
case_id Bigint,
doctor_name Varchar(75),
patient_name Varchar(75),
sheet int,
issue Varchar(100),
created_at timestamp Default current_timestamp,
modified_at timestamp);





CREATE TABLE sheet(
id Bigint primary key auto_increment,
name Varchar(75),
created_at timestamp Default current_timestamp,
modified_at timestamp);




CREATE TABLE issue(
id Bigint primary key auto_increment,
name Varchar(75),
created_at timestamp Default current_timestamp,
modified_at timestamp);



DELIMITER |
CREATE TRIGGER rpt_stage BEFORE UPDATE ON rpt
FOR EACH ROW BEGIN
SET new.modified_at := now();
END;





DELIMITER |
CREATE TRIGGER sheet_stage BEFORE UPDATE ON sheet
FOR EACH ROW BEGIN
SET new.modified_at := now();
END;




DELIMITER |
CREATE TRIGGER issue_stage BEFORE UPDATE ON issue
FOR EACH ROW BEGIN
SET new.modified_at := now();
END;
==========================================Date:28-02-2023==============================================


insert into user_mstr(user_id,First_name,Last_name,password,Phone,Profile_id,Status,Email_ID,Designation) 
values('Shivam.sa','Shivam','Saxena','wWylRg//H4+VCaBjWc/b5g==','9311766118','VO','Y','shivam.s@32watts.com','viewer');
insert into user_right (user_id,user_right) values('Shivam.sa','VO');

==========================================Date:21-02-2023==============================================

alter table account add invoice_no varchar(12) default null;
alter table account add invoice_date date default null;



==========================================Date:09-01-2023 ==============================================

use wisealign_workflow;
insert into user_mstr(user_id,First_name,Last_name,password,Phone,Profile_id,Status,Email_ID,Designation) 
values('Sandeep.p','Sandeep','Pahuja','wWylRg//H4+VCaBjWc/b5g==','9810482502','VO','Y','sandeep.pahuja@renderwise.in','viewer');
insert into user_right (user_id,user_right) values('Sandeep.p','VO');


==========================================Date:31-05-2022==============================================

insert into user_mstr(user_id,First_name,Last_name,password,Phone,Profile_id,Status,Email_ID,Designation) 
values('Pinky','Pinky','','wWylRg//H4+VCaBjWc/b5g==','9318365589','VO','Y','Somyamanoj2@gamil.com','viewer');
insert into user_right (user_id,user_right) values('Pinky','VO');



==================================02-05-2021===========================================================



1.) Created new table : service

SCRIPT : CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(100) NOT NULL,
  `issue` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `upperAligner` varchar(20) DEFAULT NULL,
  `lowerAligner` varchar(20) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `status` varchar(2) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

2.) alter table : patient_details

SCRIPT : CREATE TABLE `patient_details` (
  `Case_Id` int(25) NOT NULL DEFAULT '0',
  `Patient_Name` varchar(35) DEFAULT NULL,
  `Doctor_Name` varchar(35) DEFAULT NULL,
  `clinic_Name` text,
  `address` text,
  `phone` text,
  `plan_date` date DEFAULT NULL,
  `plan_time` time DEFAULT NULL,
  `crm_name` varchar(35) DEFAULT NULL,
  `delivery_note_no` varchar(40) DEFAULT NULL,
  `bclinic` text,
  `badd` text,
  `bgst_no` varchar(30) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `upper_aligner` varchar(20) DEFAULT NULL,
  `lower_aligner` varchar(20) DEFAULT NULL,
  `others` varchar(40) DEFAULT NULL,
  `USER_ID` varchar(22) DEFAULT NULL,
  `initiated_by` varchar(100) DEFAULT NULL,
  `initiated_Date` datetime DEFAULT NULL,
  `DECISION` varchar(100) DEFAULT NULL,
  `STAGE` varchar(100) DEFAULT NULL,
  `NEXT_STAGE` varchar(20) DEFAULT NULL,
  `draftflag` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `HoldFlag` varchar(10) DEFAULT 'N',
  `decline_reason` varchar(100) DEFAULT '',
  `decline_status` varchar(5) DEFAULT '',
  `delete_reason` varchar(255) DEFAULT NULL,
  `delete_status` varchar(2) DEFAULT 'N',
  `status` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `registered_doctor` varchar(100) DEFAULT NULL,
  `prerequisite` varchar(20) DEFAULT NULL,
  `case_number` varchar(100) DEFAULT NULL,
  `gp` varchar(100) DEFAULT NULL,
  `patient_age` varchar(100) DEFAULT NULL,
  `referred_by` varchar(100) DEFAULT NULL,
  `type_of_account` varchar(100) DEFAULT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `corporate_account` varchar(100) DEFAULT NULL,
  `KOL` varchar(100) DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `no_of_aligners` varchar(100) DEFAULT NULL,
  `starter_kit` varchar(100) DEFAULT NULL,
  `scanning` varchar(100) DEFAULT NULL,
  `pickup` varchar(100) DEFAULT NULL,
  `dispatch` varchar(100) DEFAULT NULL,
  `dispatch_to` varchar(100) DEFAULT NULL,
  `Dispatch_to_address` varchar(150) DEFAULT NULL,
  `advance_starter` varchar(100) DEFAULT NULL,
  `advance_scanning` varchar(100) DEFAULT NULL,
  `scanning_service` varchar(100) DEFAULT NULL,
  `dispatch_date` varchar(200) DEFAULT NULL,
  `person_dispatch` varchar(100) DEFAULT NULL,
  `person_scan` varchar(100) DEFAULT NULL,
  `bill_to` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `wo_number` varchar(100) DEFAULT NULL,
  `wo_date` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `no_of_stages` varchar(100) DEFAULT NULL,
  `current_stage` varchar(100) DEFAULT NULL,
  `no_of_aligners_u_a` varchar(100) DEFAULT NULL,
  `no_of_aligners_u_p` varchar(100) DEFAULT NULL,
  `no_of_aligners_l_a` varchar(100) DEFAULT NULL,
  `no_of_aligners_l_p` varchar(100) DEFAULT NULL,
  `attachment_applicable` varchar(100) DEFAULT NULL,
  `dispatch_grid` varchar(100) DEFAULT NULL,
  `data_grid` varchar(100) DEFAULT NULL,
  `dispatch_date2` varchar(100) DEFAULT NULL,
  `final_amount` varchar(100) DEFAULT NULL,
  `status_grid` varchar(100) DEFAULT NULL,
  `payment_grid` varchar(100) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `work_date` varchar(100) DEFAULT NULL,
  `next_work` varchar(100) DEFAULT NULL,
  `next_work_date` varchar(100) DEFAULT NULL,
  `case_review` varchar(100) DEFAULT NULL,
  `refinement_package` varchar(100) DEFAULT NULL,
  `work_description` varchar(100) DEFAULT NULL,
  `Tax_rate` int(11) DEFAULT NULL,
  `Tax_amount` double DEFAULT NULL,
  `Grand_total` double DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


==================================================== 14/06/2021 ==========================================================


alter table cc_crm change   new_Cid case_type   VARCHAR(20) ;
alter table cc_crm change   old_id  case_id   VARCHAR(20) ;
alter table cc_crm add  case_stage  VARCHAR(70) ;

////
====================16/06/2021=========
alter table cc_crm add  priority int ;
<<<<<<< HEAD
=======================

=====================================================  17/06/2021  =============================================================

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(12) DEFAULT '',
  `user_name` varchar(50) DEFAULT '',
  `stage` varchar(50) DEFAULT '',
  `comment` varchar(255) DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
=======
===========================

=================17/06/2021===================
alter table cc_crm add  phone text  ;
alter table cc_crm add Patient_Name varchar(35) ;
alter table cc_crm add delivery_note_no varchar(40);
alter table cc_crm add bclinic text;
alter table cc_crm add badd text ;
alter table cc_crm add bgst_no varchar(30);
alter table cc_crm add category varchar(20);
alter table cc_crm add upper_aligner varchar(20);
alter table cc_crm add lower_aligner varchar(20);
alter table cc_crm add others varchar(40);
==================================================
>>>>>>> branch 'master' of https://github.com/eleservsoftdeveloper/Workflow.git



======================================================== 12:48 ===============================================================

alter table cc_crm add address text after clinic_name;



alter table cc_crm change   new_Cid case_type   VARCHAR(20) ;
alter table cc_crm change   old_id  case_id   VARCHAR(20) ;
alter table cc_crm add  case_stage  VARCHAR(70) ;

////
====================16/06/2021=========
alter table cc_crm add  priority int ;
<<<<<<< HEAD
=======================

=====================================================  17/06/2021  =============================================================

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(12) DEFAULT '',
  `user_name` varchar(50) DEFAULT '',
  `stage` varchar(50) DEFAULT '',
  `comment` varchar(255) DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
=======
===========================

=================17/06/2021===================
alter table cc_crm add  phone text  ;
alter table cc_crm add Patient_Name varchar(35) ;
alter table cc_crm add delivery_note_no varchar(40);
alter table cc_crm add bclinic text;
alter table cc_crm add badd text ;
alter table cc_crm add bgst_no varchar(30);
alter table cc_crm add category varchar(20);
alter table cc_crm add upper_aligner varchar(20);
alter table cc_crm add lower_aligner varchar(20);
alter table cc_crm add others varchar(40);
==================================================
>>>>>>> branch 'master' of https://github.com/eleservsoftdeveloper/Workflow.git
===================abha17/06/2021===========
alter table comment add status varchar(4);
 alter table comment add seen_by varchar(50);
 alter table comment add seen_at datetime ;

  create table add_comment (comment_id  int auto_increment not null Primary key,
 case_id varchar(20) ,  comment varchar(255),comment_by varchar(50), comment_at  datetime);
 
===============================================18/06/2021=============================
ALTER TABLE  cc_crm ADD UNIQUE (`case_id`)




==============================19/06/2021===============================================

insert into profile_master value('INI','Request Initiator','Y','INI','I','N');
insert into profile_master value('WFC','WOCheck','Y','WFC','I','Y');
insert into profile_master value('PRE','Planning Pre-requisite','Y','PRE','N','Y');

insert into user_mstr value('Bhawna','Bhawna','','','PRE','Y',now(),'render123#','','','','Case Coordination','Delhi','Delhi','India');
insert into user_mstr value('Pradyuman','Pradyuman','','','INI','Y',now(),'render123#','','','','Case Coordination','Delhi','Delhi','India');
insert into user_mstr value('Mohit','Mohit','','','WFC','Y',now(),'render123#','','','','Case Coordination','Delhi','Delhi','India');

insert into profile_stage_map value('INI','INI');
insert into profile_stage_map value('WFC','WFC');
insert into profile_stage_map value('PRE','PRE');

CREATE TABLE user_right (
    user_id varchar(255) NOT NULL,
    user_right varchar(255) NOT NULL
);
insert into user_right value('Pradyuman','INI');
insert into user_right value('Bhawna','PRE');
insert into user_right value('Mohit','INI');
insert into user_right value('Mohit','WFC');


insert into stage_decision_map value('WFC','APP');
insert into stage_decision_map value('WFC','COR');
insert into stage_decision_map value('WFC','REJ');
insert into stage_decision_map value('WFC','WIP');
insert into stage_decision_map value('PRE','APP');
insert into stage_decision_map value('PRE','COR');
insert into stage_decision_map value('PRE','REJ');
insert into stage_decision_map value('PRE','WIP');
=======================================21/06/2021=======================================================

alter table cc_crm add holdflag varchar(2) default 'N';
insert into profile_stage_map values ('INI','INICOR');
insert into profile_stage_map values ('WFC','WFCCOR');
alter table cc_crm add user_id varchar(255);
=========================================23/06/2021===================================
insert into user_mstr value('rakesh.k','Rakesh','Kumar','','CADBS','Y',now(),'render123#','','','','CAD TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('CADBS','CADBS');
insert into profile_master value('CADBS','CAD','Y','CADBS','N','Y');
insert into user_right value('rakesh.k','CADBS');

insert into user_mstr value('akshita','akshita','','','OTPLN','Y',now(),'render123#','','','','Planning TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('OTPLN','OTPLN');
insert into profile_master value('OTPLN','Planning Team','Y','OTPLN','N','N');
insert into user_right value('akshita','OTPLN');

=========================================24/06/2021=============================================================

use render_workflow;
CREATE TABLE stagging (
		planning_id int(11) NOT NULL AUTO_INCREMENT,
        staging varchar(12) ,
		crm varchar(50) ,
		planning_type varchar(100) ,
		d_name  varchar(100) ,
		caseid  varchar(15) ,
		from_type varchar(50) ,
		to_type varchar(50) ,
		  aln_upper varchar(50) ,
		  aln_lower varchar(50) ,
		  thick_upper varchar(50) ,
		  thick_lower varchar(50) ,
		  margin_upper varchar(50) ,
		  margin_lower varchar(50) ,
		  molor_upper varchar(50) ,
		  molor_lower varchar(50) ,
		  sheet_type varchar(50) ,
		  review_attach  varchar(50) ,
		 ipr_sheet_ varchar(50) ,
		soft_tissus varchar(50) ,
		decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (planning_id)
);

alter table cc_crm change Patient_Name patient_Name VARCHAR(25);

CREATE TABLE packing (
		packing_id int(11) NOT NULL AUTO_INCREMENT,
        
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		caseid  varchar(15) ,
		ultra_sonic varchar(10) ,
		air varchar(10) ,
		  pouch_scan varchar(20) ,
		 decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (packing_id)
);


CREATE TABLE threeDPrinting (
		printing_id int(11) NOT NULL AUTO_INCREMENT,
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		caseid  varchar(15) ,
		from_type varchar(10) ,
		to_type varchar(10) ,
		from_done varchar(10) ,
		to_done varchar(10) ,
	     mode varchar(12) ,
		  print varchar(20) ,
		 decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (printing_id)
);


CREATE TABLE lab (
		lab_id int(11) NOT NULL AUTO_INCREMENT,
         making varchar(12) ,
		 waxing varchar(12) ,
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		caseid  varchar(15) ,
		from_type varchar(10) ,
		to_type varchar(10) ,
		  name_cat varchar(20) ,
		 decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (lab_id)
);

CREATE TABLE packing (
		packing_id int(11) NOT NULL AUTO_INCREMENT,
        case_id varchar(12) ,
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		caseid  varchar(15) ,
		ultra_sonic varchar(10) ,
		air varchar(10) ,
		  pouch_scan varchar(20) ,
		 decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (packing_id)
);

CREATE TABLE hollow_tagging (
		hollow_id int(11) NOT NULL AUTO_INCREMENT,
        crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		caseid  varchar(15) ,
		from_type varchar(10) ,
		to_type varchar(10) ,
		from_done varchar(10) ,
		to_done varchar(10) ,
	   decesion varchar(50) ,
		remark varchar(250) ,
	   date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (hollow_id)
);


CREATE TABLE upload (
		upload_id int(11) NOT NULL AUTO_INCREMENT,
        pre_post varchar(12) ,
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		gif varchar(10) ,
		case_id  varchar(15) ,
	    report  varchar(20) ,
		ipr_sheet  varchar(15) ,
        treat_report  varchar(15) ,
		ipr_filled  varchar(15) ,
        decesion varchar(50) ,
		remark varchar(250) ,  
	 date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (upload_id)
);


CREATE TABLE planning (
		planning_id int(11) NOT NULL AUTO_INCREMENT,
		crm varchar(50) ,
		doctor_name varchar(50) ,
		patient_name  varchar(50) ,
		case_id  varchar(15) ,
		planning_type varchar(50) ,
		base_segment varchar(100) ,
		planned varchar(100) ,
		 ipr_sheet varchar(50) ,
		 treat_report varchar(50) ,
		 upload_digiplan varchar(50) ,
		 plan_review varchar(50) ,
        decesion varchar(50) ,
		remark varchar(250) ,
		from_type varchar(50) ,
		to_type varchar(50) ,
	 date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (planning_id)
);

==================================================== 25-06/2021 ==============================================================

use render_workflow;
alter table planning add planned_no varchar(20) default null;
alter table lab add thermoform varchar(50) default null after waxing;
alter table lab add hand_tooling varchar(50) default null after name_cat;
alter table lab add thermoform varchar(50) default null after waxing;
alter table packing change pouch_scan pouch_seal VARCHAR(20);
alter table packing drop caseid;

CREATE TABLE `dispatched_scan` (
  `dispatched_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(15) DEFAULT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `crm` varchar(50) DEFAULT NULL,
  `Sr_no` varchar(20) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `dispatch` varchar(50) DEFAULT NULL,
  `dispatch_no`  varchar(20) DEFAULT NULL,
  `tracking_id`  varchar(20) DEFAULT NULL,
  `delivery_nn`  varchar(20) DEFAULT NULL,
  `Type_of_dispatch`  varchar(20) DEFAULT NULL,
  `decesion` varchar(50) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dispatched_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
===================================================26-06-2021==========================
insert into user_mstr value('gaurav','gaurav','','','UPL','Y',now(),'render123#','','','','CAD TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('UPL','UPL');
insert into profile_master value('UPL','CAD Team','Y','UPL','N','N');
insert into user_right value('gaurav','UPL');


insert into user_mstr value('prabhat','prabhat','','','REV','Y',now(),'render123#','','','','Planning Team','Delhi','Delhi','India');
insert into profile_stage_map value('REV','REV');
insert into profile_master value('REV','Planning Team','Y','REV','N','N');
insert into user_right value('prabhat','REV');
insert into user_right value('Mohit','QA');
insert into user_right value('akshita','STG');

insert into user_mstr value('vijay','vijay','','','MPT','Y',now(),'render123#','','','','CAD TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('MPT','MPT');
insert into profile_master value('MPT','CAD Team','Y','MPT','N','N');
insert into user_right value('vijay','MPT');


insert into user_mstr value('alam','alam','','','3DP','Y',now(),'render123#','','','','CAD TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('3DP','3DP');
insert into profile_master value('3DP','CAD Team','Y','3DP','N','N');
insert into user_right value('alam','3DP');

insert into user_mstr value('sonu','sonu','','','Lab','Y',now(),'render123#','','','','Lab TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('Lab','Lab');
insert into profile_master value('Lab','Lab Team','Y','Lab','N','N');
insert into user_right value('sonu','Lab');


insert into user_right value('Mohit','FQC');

insert into user_mstr value('sonali','sonali','','','PCK','Y',now(),'render123#','','','','Lab TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('Lab','Lab');
insert into profile_master value('PCK','Lab Team','Y','PCK','N','N');
insert into user_right value('sonali','PCK');

insert into user_mstr value('rajesh.c','rajesh.c','','','DPH','Y',now(),'render123#','','','','Lab TEAM','Delhi','Delhi','India');
insert into profile_stage_map value('DPH','DPH');
insert into profile_master value('DPH','Lab Team','Y','DPH','N','N');
insert into user_right value('rajesh.c','DPH');

alter table Stagging  add patient_name varchar(50);
alter table Stagging  add remark varchar(250);
alter table Stagging  add decision varchar(50);

alter table cc_crm add starter_case_stage varchar(250);
alter table cc_crm add starter_satus varchar(25);


========================================== 15/07/2021 =====================================================

alter table cc_crm add total_amount double DEFAULT NULL;
alter table cc_crm add payment_processing varchar(50) default null;
alter table cc_crm add payment_mode varchar(50) default null;


===================================================20-07-2021================================================
ALTER TABLE CC_CRM 
MODIFY dispatch_address VARCHAR(255)
=================================================== Date : 22-07-2021 ============================================
use render_workflow;

alter table planning add upper_aligner_from varchar(10) default null;
alter table planning add upper_aligner_to varchar(10) default null;
alter table planning add lower_aligner_from varchar(10) default null;
alter table planning add lower_aligner_to varchar(10) default null;

alter table stagging add upper_aligner_from varchar(10) default null;
alter table stagging add upper_aligner_to varchar(10) default null;
alter table stagging add lower_aligner_from varchar(10) default null;
alter table stagging add lower_aligner_to varchar(10) default null;

========================== Date : 23-07-2021 ==============================
use render_workflow;

alter table hollow_tagging add upper_aligner_from varchar(10) default null;
alter table hollow_tagging add upper_aligner_to varchar(10) default null;
alter table hollow_tagging add lower_aligner_from varchar(10) default null;
alter table hollow_tagging add lower_aligner_to varchar(10) default null;

alter table threedprinting add upper_aligner_from varchar(10) default null;
alter table threedprinting add upper_aligner_to varchar(10) default null;
alter table threedprinting add lower_aligner_from varchar(10) default null;
alter table threedprinting add lower_aligner_to varchar(10) default null;

alter table lab add upper_aligner_from varchar(10) default null;
alter table lab add upper_aligner_to varchar(10) default null;
alter table lab add lower_aligner_from varchar(10) default null;
alter table lab add lower_aligner_to varchar(10) default null;

======================================27-07-2021==========================

use render_workflow;
alter table dispatched_scan add no_of_aligners varchar(50) default null;
alter table dispatched_scan add mode_of_dispatch varchar(50) default null;

============================28-07-2021========================================

insert into user_mstr value('Abhay','Abhay','','','WFC','Y',now(),'render123#','','','','Case Coordination','Delhi','Delhi','India');
insert into user_right value('Abhay','INI');
insert into user_right value('Abhay','WFC');
====================29-07-2021==================================================
alter table  cc_crm add  inicor_at datetime;
  alter table  cc_crm add  wfc_at datetime;
 alter table  cc_crm add  precor_at datetime;
 alter table  cc_crm add  pre_at datetime;
 alter table  cc_crm add  plncor_at datetime;
 alter table  cc_crm add  pln_at datetime;
 alter table  cc_crm add  uplcor_at datetime;
 alter table  cc_crm add  upl_at datetime;
 alter table  cc_crm add  qa_at datetime;
 alter table  cc_crm add  stg_at datetime;
 alter table  cc_crm add  mpt_at datetime;
 alter table  cc_crm add  3dpcor_at datetime;
 alter table  cc_crm add  3dp_at datetime;
 alter table  cc_crm add  labcor_at datetime;
 alter table  cc_crm add  lab_at datetime;
 alter table  cc_crm add  fqc_at datetime;
 alter table  cc_crm add  pckcor_at datetime;
 alter table  cc_crm add  pck_at datetime;
 alter table  cc_crm add  inistrkit_at datetime;
 alter table  cc_crm add  mtpstrkit_at datetime;
 alter table  cc_crm add  3dpstrkit_at datetime;
 alter table  cc_crm add  labstrkit_at datetime;
 alter table  cc_crm add  fqcstrkit_at datetime;
 alter table  cc_crm add  pckstrkit_at datetime;
 =====================================================================



============================Date: 20-08-2021========================================================================================================
use render_workflow;
alter table cc_crm add dispatch datetime after pck_at;
alter table cc_crm add dispatchstrkit datetime;
alter table cc_crm add labstrkitcor_at datetime after labstrkit_at;
alter table cc_crm add pckstrkitcor_at datetime after pckstrkit_at;

============================Date: 21-08-2021========================================================================================================
use render_workflow;
alter table cc_crm add cadbs_at datetime after plncor_at;

============================Date: 27-08-2021========================================================================================================

alter table cc_crm add planning_id varchar(20) default null;

============================================  27-11-2021  ================================================================================

 alter table  cc_crm add  rev_at datetime;
 
 
 
 
 
 
 //////////////////////////////////////////// 14-02-2022  ////////////////////////////////////////////////////////////
  
  
alter table account modify case_id bigint(25) default 0;
alter table account_change modify case_id bigint(25) default 0;



////////////////01-04-2022

alter table decision_history add decision_id int auto_increment primary key FIRST;

 

  ====================================================================== Date : 02-04-2022 ===========================================================================
  
#  alter table decision_history add decision_id int auto_increment primary key FIRST;

======================================================================= Date : 15-04-2022 =============================================================================


alter table dispatched_scan add phone varchar(14) default null after address;
alter table dispatched_scan add location varchar(100) default null after phone;
alter table dispatched_scan add city varchar(100) default null after location;
alter table dispatched_scan add pincode varchar(8) default null after city;
alter table dispatched_scan add default_starterkit varchar(10) default null after pincode;

alter table cc_crm add phone1 varchar(14) default '' after phone;
alter table cc_crm add phone2 varchar(14) default '' after phone1;
alter table cc_crm add phone3 varchar(14) default '' after phone2;
alter table cc_crm add phone4 varchar(14) default '' after phone3;
alter table cc_crm add phone5 varchar(14) default '' after phone4;

alter table cc_crm add pincode1 varchar(8) default '' after default_address;
alter table cc_crm add pincode2 varchar(8) default '' after pincode1;
alter table cc_crm add pincode3 varchar(8) default '' after pincode2;
alter table cc_crm add pincode4 varchar(8) default '' after pincode3;
alter table cc_crm add pincode5 varchar(8) default '' after pincode4;

alter table cc_crm add default_starterkit varchar(30) default null after default_address;

alter table cc_crm add city2 varchar(100) default '' after city;
alter table cc_crm add city3 varchar(100) default '' after city2;
alter table cc_crm add city4 varchar(100) default '' after city3;
alter table cc_crm add city5 varchar(100) default '' after city4;


alter table cc_crm add location2 varchar(100) default '' after location;
alter table cc_crm add location3 varchar(100) default '' after location2;
alter table cc_crm add location4 varchar(100) default '' after location3;
alter table cc_crm add location5 varchar(100) default '' after location4;
======================================================================== Date : 21-04-2022 ============================================================================
 


alter table account_change add column user varchar(100);
alter table account add column user varchar(100);



======================================================= Date :27-04-2022 =========================================================

alter table dispatched_scan add phone varchar(14) default null after address;
alter table dispatched_scan add location varchar(100) default null after phone;
alter table dispatched_scan add city varchar(100) default null after location;
alter table dispatched_scan add pincode varchar(8) default null after city;
alter table dispatched_scan add default_starterkit varchar(10) default null after pincode;



alter table  cc_crm  add   `ntcnt_at` datetime DEFAULT NULL after qa_at, add  cnl_at datetime DEFAULT NULL after ntcnt_at;




================================================== Date : 05-09-2022 =================================================================

Case forwared in Production db

use wisealign_workflow;
update  cc_crm set starter_case_stage='DPHSTRKIT' where case_id in('2208071804','2206065291','2208335757','2204335251','2208245948','2208075761','2206295314','2206295102','2207365544','2206365118','2206295020','2206295943',
'1357913579','2202097669','2206237200','2207065619','2208275733','2207365401','2201207326','2207075627','2207065654','2203067968','2202295625','2206087263',
'2204335463','2208075880','2109065832','2206065259','2110075246','2205037679','2112367730','2208295812','2203077783','2208367012','2110295217','2208065720',
'2208065724','2109075902','2208335823','2208075747','2208075750','2204077289','2208335856','2206075894','2206075898','1000000000','1000000001','2205365532',
'1000000007');

update  cc_crm set starter_case_stage='DPHSTRKIT' where case_id in('2112065045','2203075782','2207365367','2208095743',
'2208295935','2209075057');


==================================================