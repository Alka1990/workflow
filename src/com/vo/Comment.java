// Source code is decompiled from a .class file using FernFlower decompiler.
package com.vo;

public class Comment {
  private int comment_id;
  private String case_id;
  private String user_name;
  private String stage;
  private String comment;
  private String date;
  private String status;
  private String seen_by;
  private String seen_at;

  public Comment() {
  }

  public String getSeen_at() {
    return this.seen_at;
  }

  public void setSeen_at(String seen_at) {
    this.seen_at = seen_at;
  }

  public String getStatus() {
    return this.status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getSeen_by() {
    return this.seen_by;
  }

  public void setSeen_by(String seen_by) {
    this.seen_by = seen_by;
  }

  public int getComment_id() {
    return this.comment_id;
  }

  public void setComment_id(int comment_id) {
    this.comment_id = comment_id;
  }

  public String getCase_id() {
    return this.case_id;
  }

  public void setCase_id(String case_id) {
    this.case_id = case_id;
  }

  public String getUser_name() {
    return this.user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public String getStage() {
    return this.stage;
  }

  public void setStage(String stage) {
    this.stage = stage;
  }

  public String getComment() {
    return this.comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public String getDate() {
    return this.date;
  }

  public void setDate(String date) {
    this.date = date;
  }
}
