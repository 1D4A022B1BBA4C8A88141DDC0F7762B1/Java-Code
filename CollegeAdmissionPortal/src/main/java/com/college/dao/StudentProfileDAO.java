package com.college.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.college.model.StudentProfile;
import com.college.utils.DBUtil;

public class StudentProfileDAO {

    public StudentProfile getProfileByUserId(int userId) {
        String sql = "SELECT * FROM student_profile WHERE user_id = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                StudentProfile sp = new StudentProfile();
                sp.setUserId(userId);
                sp.setFullName(rs.getString("full_name"));
                sp.setFatherName(rs.getString("father_name"));
                sp.setMotherName(rs.getString("mother_name"));
                sp.setMobile(rs.getString("mobile"));
                sp.setDob(rs.getString("dob"));
                sp.setGender(rs.getString("gender"));
                sp.setEmail(rs.getString("email"));
                sp.setTenthPercentage(rs.getDouble("tenth_percentage"));
                sp.setTwelfthPercentage(rs.getDouble("twelfth_percentage"));
                sp.setTenthMarksheet(rs.getString("tenth_marksheet"));
                sp.setTwelfthMarksheet(rs.getString("twelfth_marksheet"));
                sp.setPassportPhoto(rs.getBytes("passport_photo"));
                return sp;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean isProfileCompleted(int userId) {
        String sql = """
                SELECT 1 FROM student_profile
                WHERE user_id = ?
                AND full_name IS NOT NULL
                AND father_name IS NOT NULL
                AND mother_name IS NOT NULL
                AND mobile IS NOT NULL
                AND dob IS NOT NULL
                AND gender IS NOT NULL
                AND email IS NOT NULL
                AND tenth_percentage IS NOT NULL
                AND twelfth_percentage IS NOT NULL
                AND tenth_marksheet IS NOT NULL
                AND twelfth_marksheet IS NOT NULL
                AND passport_photo IS NOT NULL
            """;
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // true if profile exists
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<StudentProfile> getAllProfiles() {
        List<StudentProfile> list = new ArrayList<>();
        String sql = "SELECT * FROM student_profile";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                StudentProfile sp = new StudentProfile();
                sp.setUserId(rs.getInt("user_id"));
                sp.setFullName(rs.getString("full_name"));
                sp.setEmail(rs.getString("email"));
                sp.setMobile(rs.getString("mobile"));
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void updateStatus(int userId, String status) {
        String sql = "UPDATE student_profile SET status=? WHERE user_id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
    
    public boolean saveOrUpdate(StudentProfile sp) throws SQLException {

        boolean exists = getProfileByUserId(sp.getUserId()) != null;

        String sql;

        if (exists) {
            sql = "UPDATE student_profile SET full_name=?, father_name=?, mother_name=?, " +
                  "mobile=?, dob=?, gender=?, email=?, tenth_percentage=?, twelfth_percentage=?, " +
                  "tenth_marksheet=?, twelfth_marksheet=?, passport_photo=? WHERE user_id=?";
        } else {
            sql = "INSERT INTO student_profile " +
                  "(user_id, full_name, father_name, mother_name, mobile, dob, gender, email, " +
                  "tenth_percentage, twelfth_percentage, tenth_marksheet, twelfth_marksheet, passport_photo) " +
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        }

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            int index = 1;

            if (!exists) {
                ps.setInt(index++, sp.getUserId());
            }

            ps.setString(index++, sp.getFullName());
            ps.setString(index++, sp.getFatherName());
            ps.setString(index++, sp.getMotherName());
            ps.setString(index++, sp.getMobile());
            ps.setString(index++, sp.getDob());
            ps.setString(index++, sp.getGender());
            ps.setString(index++, sp.getEmail());
            ps.setDouble(index++, sp.getTenthPercentage());
            ps.setDouble(index++, sp.getTwelfthPercentage());
            ps.setString(index++, sp.getTenthMarksheet());
            ps.setString(index++, sp.getTwelfthMarksheet());
            ps.setBytes(index++, sp.getPassportPhoto());

            if (exists) {
                ps.setInt(index, sp.getUserId());
            }

            return ps.executeUpdate() > 0;
        }
    }
    @SuppressWarnings("unused")
	private boolean profileExists(int userId) throws SQLException {
        String sql = "SELECT id FROM student_profile WHERE user_id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }



}
