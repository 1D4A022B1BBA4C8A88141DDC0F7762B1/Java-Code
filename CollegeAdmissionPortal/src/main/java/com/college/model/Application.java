package com.college.model;

import java.sql.Timestamp;

public class Application {
    private int id;
    private int userId;
    private String course;
    private int year;
    private String qualifications;
    private String status;
    private Timestamp appliedOn;
    
 // getters and setters...
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getQualifications() {
		return qualifications;
	}
	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getAppliedOn() {
		return appliedOn;
	}
	public void setAppliedOn(Timestamp appliedOn) {
		this.appliedOn = appliedOn;
	}

    
}
