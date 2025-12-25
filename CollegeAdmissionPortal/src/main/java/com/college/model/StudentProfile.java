package com.college.model;

public class StudentProfile {
    private int userId;
    private String fullName;
    private String fatherName;
    private String motherName;
    private String mobile;
    private String dob;
    private String gender;
    private String email;
    private double tenthPercentage;
    private double twelfthPercentage;
    private String tenthMarksheet;
    private String twelfthMarksheet;
    private byte[] passportPhoto;

    
    // getters and setters
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getTenthPercentage() {
		return tenthPercentage;
	}
	public void setTenthPercentage(double tenthPercentage) {
		this.tenthPercentage = tenthPercentage;
	}
	public double getTwelfthPercentage() {
		return twelfthPercentage;
	}
	public void setTwelfthPercentage(double twelfthPercentage) {
		this.twelfthPercentage = twelfthPercentage;
	}
	public String getTenthMarksheet() {
		return tenthMarksheet;
	}
	public void setTenthMarksheet(String tenthMarksheet) {
		this.tenthMarksheet = tenthMarksheet;
	}
	public String getTwelfthMarksheet() {
		return twelfthMarksheet;
	}
	public void setTwelfthMarksheet(String twelfthMarksheet) {
		this.twelfthMarksheet = twelfthMarksheet;
	}
	public byte[] getPassportPhoto() {
		return passportPhoto;
	}
	public void setPassportPhoto(byte[] passportPhoto) {
		this.passportPhoto = passportPhoto;
	}
    
}
