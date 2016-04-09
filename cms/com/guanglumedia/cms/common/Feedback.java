package com.guanglumedia.cms.common;

public final class Feedback
{
  private boolean successful;
  private String message;
  private String type;
  private Object obj;

  public Feedback(boolean successful, String message)
  {
	  this.successful = successful;
	  this.message = message;
  }

  public static Feedback success(String message) {
	  return new Feedback(true, message);
  }

  public static Feedback fail(String message) {
	  return new Feedback(false, message);
  }

  public boolean isSuccessful() {
	  return this.successful;
  }

  public void setSuccessful(boolean successful) {
	  this.successful = successful;
  }

  public String getMessage() {
	  return this.message;
  }

  public void setMessage(String message) {
	  this.message = message;
  }

  public String getType() {
	  return this.type;
  }

  public Feedback setType(String type) {
	  this.type = type;
	  return this;
  }

  public Object getObj() {
	  return this.obj;
  }

  public Feedback setObj(Object obj) {
	  this.obj = obj;
	  return this;
  }
}