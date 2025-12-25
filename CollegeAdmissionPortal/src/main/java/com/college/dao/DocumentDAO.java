package com.college.dao;

import com.college.model.Document;
import com.college.utils.DBUtil;

import java.sql.*;

public class DocumentDAO {

    public boolean save(Document d) throws SQLException {
        String sql = "INSERT INTO documents (user_id, document_type, file_name) VALUES (?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, d.getUserId());
            ps.setString(2, d.getDocumentType());
            ps.setString(3, d.getFileName());
            return ps.executeUpdate() == 1;
        }
    }
}
