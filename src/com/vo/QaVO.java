package com.vo;

import java.sql.Timestamp;
import java.util.Date;

public class QaVO {
    private int id;
    private long case_id;
    private int planning_id;
    private String case_booking_form;
    private String sales_approval_docs;
    private String doc_approval_form;
    private String stagesheet;
    private String plan_comment;
    private int u_form_6;
    private int u_to;
    private int l_from;
    private int l_to;
    private Date dispatch_eta;
    private Timestamp created_at;
    private int created_by;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getCase_id() {
        return case_id;
    }

    public void setCase_id(long case_id) {
        this.case_id = case_id;
    }

    public int getPlanning_id() {
        return planning_id;
    }

    public void setPlanning_id(int planning_id) {
        this.planning_id = planning_id;
    }

    public String getCase_booking_form() {
        return case_booking_form;
    }

    public void setCase_booking_form(String case_booking_form) {
        this.case_booking_form = case_booking_form;
    }

    public String getSales_approval_docs() {
        return sales_approval_docs;
    }

    public void setSales_approval_docs(String sales_approval_docs) {
        this.sales_approval_docs = sales_approval_docs;
    }

    public String getDoc_approval_form() {
        return doc_approval_form;
    }

    public void setDoc_approval_form(String doc_approval_form) {
        this.doc_approval_form = doc_approval_form;
    }

    public String getStagesheet() {
        return stagesheet;
    }

    public void setStagesheet(String stagesheet) {
        this.stagesheet = stagesheet;
    }

    public String getPlan_comment() {
        return plan_comment;
    }

    public void setPlan_comment(String plan_comment) {
        this.plan_comment = plan_comment;
    }

    public int getU_form() {
        return u_form_6;
    }

    public void setU_form(int u_form) {
        this.u_form_6 = u_form;
    }

    public int getU_to() {
        return u_to;
    }

    public void setU_to(int u_to) {
        this.u_to = u_to;
    }

    public int getL_from() {
        return l_from;
    }

    public void setL_from(int l_from) {
        this.l_from = l_from;
    }

    public int getL_to() {
        return l_to;
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

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }
}
