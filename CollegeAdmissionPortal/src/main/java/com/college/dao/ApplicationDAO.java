package com.college.dao;

import com.college.model.Application;
import com.college.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public boolean submit(Application app) throws SQLException {

        String sql = "INSERT INTO applications "
            + "(user_id, student_name, father_name, contact_no, dob, "
            + "permanent_address, local_address, receipt_no, course, "
            + "tenth_percentage, twelfth_percentage, student_signature) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, app.getUserId());
            ps.setString(2, app.getStudentName());
            ps.setString(3, app.getFatherName());
            ps.setString(4, app.getContactNo());
            ps.setDate(5, app.getDob());
            ps.setString(6, app.getPermanentAddress());
            ps.setString(7, app.getLocalAddress());
            ps.setString(8, app.getReceiptNo());
            ps.setString(9, app.getCourse());
            ps.setDouble(10, app.getTenthPercentage());
            ps.setDouble(11, app.getTwelfthPercentage());
            ps.setString(12, app.getStudentSignature());

            return ps.executeUpdate() == 1;
        }
    }


    public List<Application> getAllApplications() throws SQLException {
        String sql = "SELECT * FROM applications ORDER BY applied_on DESC";
        List<Application> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Application a = new Application();
                a.setId(rs.getInt("id"));
                a.setUserId(rs.getInt("user_id"));
                a.setCourse(rs.getString("course"));
                a.setStatus(rs.getString("status"));
                a.setAppliedOn(rs.getTimestamp("applied_on"));
                list.add(a);
            }
        } catch(Exception e) {
        	e.printStackTrace();        }
        return list;
    }

    public boolean updateStatus(int appId, String status) throws SQLException {
        String sql = "UPDATE applications SET status=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, appId);
            return ps.executeUpdate() == 1;
        }
    }
}
