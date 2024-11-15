package com.vo;

import java.sql.Timestamp;

public class Impression {
    private int impressionId;
    private String senderName;
    private String receiverName;
    private String trackingId;
    private String location;
    private Timestamp impressionReceivedDate;
    private String impressionUser;
    private Timestamp impressionAt;
    private String labUser;
    private Timestamp labAt;
    private String uplUser;
    private Timestamp uplAt;
    private String plnUser;
    private Timestamp plnAt;
    private String decision;
    private String remarks;
    private long caseId;
    private String patientName;
    private String doctorName;
    private String crmName;
    private String caseType;
    private String specialRemarks;

    // Getters and Setters
    public int getImpressionId() {
        return impressionId;
    }

    public void setImpressionId(int impressionId) {
        this.impressionId = impressionId;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getTrackingId() {
        return trackingId;
    }

    public void setTrackingId(String trackingId) {
        this.trackingId = trackingId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Timestamp getImpressionReceivedDate() {
        return impressionReceivedDate;
    }

    public void setImpressionReceivedDate(Timestamp impressionReceivedDate) {
        this.impressionReceivedDate = impressionReceivedDate;
    }

    public String getImpressionUser() {
        return impressionUser;
    }

    public void setImpressionUser(String impressionUser) {
        this.impressionUser = impressionUser;
    }

    public Timestamp getImpressionAt() {
        return impressionAt;
    }

    public void setImpressionAt(Timestamp impressionAt) {
        this.impressionAt = impressionAt;
    }

    public String getLabUser() {
        return labUser;
    }

    public void setLabUser(String labUser) {
        this.labUser = labUser;
    }

    public Timestamp getLabAt() {
        return labAt;
    }

    public void setLabAt(Timestamp labAt) {
        this.labAt = labAt;
    }

    public String getUplUser() {
        return uplUser;
    }

    public void setUplUser(String uplUser) {
        this.uplUser = uplUser;
    }

    public Timestamp getUplAt() {
        return uplAt;
    }

    public void setUplAt(Timestamp uplAt) {
        this.uplAt = uplAt;
    }

    public String getPlnUser() {
        return plnUser;
    }

    public void setPlnUser(String plnUser) {
        this.plnUser = plnUser;
    }

    public Timestamp getPlnAt() {
        return plnAt;
    }

    public void setPlnAt(Timestamp plnAt) {
        this.plnAt = plnAt;
    }

    public String getDecision() {
        return decision;
    }

    public void setDecision(String decision) {
        this.decision = decision;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public long getCaseId() {
        return caseId;
    }

    public void setCaseId(long caseId) {
        this.caseId = caseId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getCrmName() {
        return crmName;
    }

    public void setCrmName(String crmName) {
        this.crmName = crmName;
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getSpecialRemarks() {
        return specialRemarks;
    }

    public void setSpecialRemarks(String specialRemarks) {
        this.specialRemarks = specialRemarks;
    }
}
