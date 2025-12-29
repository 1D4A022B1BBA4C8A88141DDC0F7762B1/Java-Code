package com.college.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Application {

    private int id;
    private int userId;

    private String studentName;
    private String fatherName;
    private String contactNo;
    private Date dob;
    private String permanentAddress;
    private String localAddress;
    private String receiptNo;

    private String course;
    private double tenthPercentage;
    private double twelfthPercentage;

    private String studentSignature;

    private String status;
    private Timestamp appliedOn;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getFatherName() { return fatherName; }
    public void setFatherName(String fatherName) { this.fatherName = fatherName; }

    public String getContactNo() { return contactNo; }
    public void setContactNo(String contactNo) { this.contactNo = contactNo; }

    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }

    public String getPermanentAddress() { return permanentAddress; }
    public void setPermanentAddress(String permanentAddress) { this.permanentAddress = permanentAddress; }

    public String getLocalAddress() { return localAddress; }
    public void setLocalAddress(String localAddress) { this.localAddress = localAddress; }

    public String getReceiptNo() { return receiptNo; }
    public void setReceiptNo(String receiptNo) { this.receiptNo = receiptNo; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public double getTenthPercentage() { return tenthPercentage; }
    public void setTenthPercentage(double tenthPercentage) { this.tenthPercentage = tenthPercentage; }

    public double getTwelfthPercentage() { return twelfthPercentage; }
    public void setTwelfthPercentage(double twelfthPercentage) { this.twelfthPercentage = twelfthPercentage; }

    public String getStudentSignature() { return studentSignature; }
    public void setStudentSignature(String studentSignature) { this.studentSignature = studentSignature; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getAppliedOn() { return appliedOn; }
    public void setAppliedOn(Timestamp appliedOn) { this.appliedOn = appliedOn; }
}
