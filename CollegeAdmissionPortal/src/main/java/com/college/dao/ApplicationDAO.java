package com.college.dao;

import com.college.model.Application;
import com.college.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public boolean submit(Application app) throws SQLException {
        String sql = "INSERT INTO applications (user_id, course, year, qualifications) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, app.getUserId());
            ps.setString(2, app.getCourse());
            ps.setInt(3, app.getYear());
            ps.setString(4, app.getQualifications());
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
                a.setYear(rs.getInt("year"));
                a.setQualifications(rs.getString("qualifications"));
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
