// Source code is decompiled from a .class file using FernFlower decompiler.
package com.vo;

import java.security.Timestamp;
import java.util.Date;

public class PlanningVO {
  private String planning_type;
  private String base_segment;
  private String planned;
  private String ipr_sheet;
  private String treat_report;
  private String upload_digiplan;
  private String plan_review;
  private String from_type;
  private String to_type;
  private String date;
  private String planned_no;
  private String ufrom;
  private String lfrom;
  private String plan_by;
  private String case_id;
  private String crm;
  private String patient_name;
  private String doctor_name;
  private String upper_aligner_from;
  private String upper_aligner_to;
  private String lower_aligner_from;
  private String lower_aligner_to;
  private String remark;
  private String plannId;
  private int planning_id;
  
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
	
	
  public PlanningVO() {
	  System.out.println("u_form = " + u_form);
	  System.out.println("upper_aligner_from = " + upper_aligner_from);
  }

  public String getPlannId() {
    return this.plannId;
  }

  public void setPlannId(String plannId) {
    this.plannId = plannId;
  }

  public int getPlanning_id() {
    return this.planning_id;
  }

  public void setPlanning_id(int planning_id) {
    this.planning_id = planning_id;
  }

  public String getRemark() {
    return this.remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getUpper_aligner_from() {
    return this.upper_aligner_from;
  }

  public void setUpper_aligner_from(String upper_aligner_from) {
    this.upper_aligner_from = upper_aligner_from;
  }

  public String getUpper_aligner_to() {
    return this.upper_aligner_to;
  }

  public void setUpper_aligner_to(String upper_aligner_to) {
    this.upper_aligner_to = upper_aligner_to;
  }

  public String getLower_aligner_from() {
    return this.lower_aligner_from;
  }

  public void setLower_aligner_from(String lower_aligner_from) {
    this.lower_aligner_from = lower_aligner_from;
  }

  public String getLower_aligner_to() {
    return this.lower_aligner_to;
  }

  public void setLower_aligner_to(String lower_aligner_to) {
    this.lower_aligner_to = lower_aligner_to;
  }

  public String getCase_id() {
    return this.case_id;
  }

  public void setCase_id(String case_id) {
    this.case_id = case_id;
  }

  public String getCrm() {
    return this.crm;
  }

  public void setCrm(String crm) {
    this.crm = crm;
  }

  public String getPatient_name() {
    return this.patient_name;
  }

  public void setPatient_name(String patient_name) {
    this.patient_name = patient_name;
  }

  public String getDoctor_name() {
    return this.doctor_name;
  }

  public void setDoctor_name(String doctor_name) {
    this.doctor_name = doctor_name;
  }

  public String getPlanning_type() {
    return this.planning_type;
  }

  public void setPlanning_type(String planning_type) {
    this.planning_type = planning_type;
  }

  public String getBase_segment() {
    return this.base_segment;
  }

  public void setBase_segment(String base_segment) {
    this.base_segment = base_segment;
  }

  public String getPlanned() {
    return this.planned;
  }

  public void setPlanned(String planned) {
    this.planned = planned;
  }

  public String getIpr_sheet() {
    return this.ipr_sheet;
  }

  public void setIpr_sheet(String ipr_sheet) {
    this.ipr_sheet = ipr_sheet;
  }

  public String getTreat_report() {
    return this.treat_report;
  }

  public void setTreat_report(String treat_report) {
    this.treat_report = treat_report;
  }

  public String getUpload_digiplan() {
    return this.upload_digiplan;
  }

  public void setUpload_digiplan(String upload_digiplan) {
    this.upload_digiplan = upload_digiplan;
  }

  public String getPlan_review() {
    return this.plan_review;
  }

  public void setPlan_review(String plan_review) {
    this.plan_review = plan_review;
  }

  public String getFrom_type() {
    return this.from_type;
  }

  public void setFrom_type(String from_type) {
    this.from_type = from_type;
  }

  public String getTo_type() {
    return this.to_type;
  }

  public void setTo_type(String to_type) {
    this.to_type = to_type;
  }

  public String getDate() {
    return this.date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public String getPlanned_no() {
    return this.planned_no;
  }

  public void setPlanned_no(String planned_no) {
    this.planned_no = planned_no;
  }

  public String getUfrom() {
    return this.ufrom;
  }

  public void setUfrom(String ufrom) {
    this.ufrom = ufrom;
  }

  public String getLfrom() {
    return this.lfrom;
  }

  public void setLfrom(String lfrom) {
    this.lfrom = lfrom;
  }

  public String getPlan_by() {
    return this.plan_by;
  }

  public void setPlan_by(String plan_by) {
    this.plan_by = plan_by;
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
