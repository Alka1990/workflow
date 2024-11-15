// Source code is decompiled from a .class file using FernFlower decompiler.
package com.vo;

import java.util.Date;

public class Newcase {
  private String caseid;
  private String patientname;
  private String doctorname;
  private String clinicname;
  private String date;

  
  private String case_booking_form;
 	private String sales_approval_docs;
 	private String doc_approval_form;
 	private int u_form;
 	private int u_to;
 	private int l_from;
 	private int l_to;
 	private String plan_comment;
 	private String stagesheet;
 	
 	private Date dispatch_eta;
     private java.sql.Timestamp created_at;
     private String created_by;
 	
  
  public Newcase() {
  }

  public String getCaseid() {
    return this.caseid;
  }

  public void setCaseid(String caseid) {
    this.caseid = caseid;
  }

  public String getPatientname() {
    return this.patientname;
  }

  public void setPatientname(String patientname) {
    this.patientname = patientname;
  }

  public String getDoctorname() {
    return this.doctorname;
  }

  public void setDoctorname(String doctorname) {
    this.doctorname = doctorname;
  }

  public String getClinicname() {
    return this.clinicname;
  }

  public void setClinicname(String clinicname) {
    this.clinicname = clinicname;
  }

  public String getDate() {
    return this.date;
  }

  public void setDate(String date) {
    this.date = date;
  }
  
  
  public String getCase_booking_form() {
	    return case_booking_form;
	}

	public String getSales_approval_docs() {
	    return sales_approval_docs;
	}

	public String getDoc_approval_form() {
	    return doc_approval_form;
	}

	public void setCase_booking_form(String case_booking_form) {
		this.case_booking_form = case_booking_form;
	}
	
	public void setSales_approval_docs(String sales_approval_docs) {
		this.sales_approval_docs = sales_approval_docs;
	}
	
	public void setDoc_approval_form(String doc_approval_form) {
		this.doc_approval_form = doc_approval_form;
	}
	
	public String getStagesheet() {
	    return stagesheet;
	    
	}
	public void setStagesheet( String stagesheet ) {
		this.stagesheet = stagesheet;
	}
	public String getPlan_comment() {
	    return plan_comment;
	}
	public void setPlan_comment(String plan_comment) {
		this.plan_comment =  plan_comment;
	}
	public int getU_form() {
		
	    return u_form;
	}
	
	public void setU_form(int u_form) {
	    this.u_form = u_form;
	}
	
	public int getU_to() {
	    return u_to;
	}
	public void setU_to(int u_to ) {
	    this.u_to = u_to;
	}
	public int getL_from() {
	    return l_from;
	}
	public void setL_from(int l_from) {
	    this.l_from = l_from;
	}
	public int getL_to() {
	     return l_to ;
	}
	public void setL_to(int l_to) {
	    this.l_to = l_to;
	}
	public Date getDispatch_eta() {
      return dispatch_eta;
  }

  public void setDispatch_eta(Date dispatch_eta) {
      this.dispatch_eta = dispatch_eta;
  }

  public java.sql.Timestamp getCreated_at() {
      return created_at;
  }

  public void setCreated_at(java.sql.Timestamp timestamp) {
      this.created_at = timestamp;
  }

  public String getCreated_by() {
      return created_by;
  }

  public void setCreated_by(String created_by) {
      this.created_by = created_by;
  }

}
