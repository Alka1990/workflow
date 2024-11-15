package com.vo;

public class StageMasterVO {
  private String displayName;
  
  private String stageCode;
  
  private String isActive;
  
  private String stage_sequence;
  
  private String category_default;
  
  public String getStage_sequence() {
    return this.stage_sequence;
  }
  
  public void setStage_sequence(String stage_sequence) {
    this.stage_sequence = stage_sequence;
  }
  
  public String getCategory_default() {
    return this.category_default;
  }
  
  public void setCategory_default(String category_default) {
    this.category_default = category_default;
  }
  
  public String getDisplayName() {
    return this.displayName;
  }
  
  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }
  
  public String getStageCode() {
    return this.stageCode;
  }
  
  public void setStageCode(String stageCode) {
    this.stageCode = stageCode;
  }
  
  public String getIsActive() {
    return this.isActive;
  }
  
  public void setIsActive(String isActive) {
    this.isActive = isActive;
  }
}
