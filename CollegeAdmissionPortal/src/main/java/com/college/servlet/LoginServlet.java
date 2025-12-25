package com.college.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.college.dao.UserDAO;
import com.college.model.User;
import com.college.utils.DBUtil;
import com.college.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String loginType = req.getParameter("loginType");

        if (loginType == null) loginType = "student";

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            resp.sendRedirect("login.jsp?type=" + loginType + "&error=Please+enter+email+and+password");
            return;
        }

        // ✅ HASH password
        String hashedPassword = PasswordUtil.hashPassword(password);

        try {
            // ✅ USE HASHED PASSWORD
            User u = userDAO.login(email, hashedPassword);

            // ❌ NOT REGISTERED
            if (u == null) {
                resp.sendRedirect("login.jsp?type=" + loginType + "&error=Not+registered");
                return;
            }

            // 🔐 ROLE CHECK
            if (!u.getRole().equalsIgnoreCase(loginType)) {
                resp.sendRedirect("login.jsp?type=" + loginType + "&error=Unauthorized+access");
                return;
            }

            HttpSession session = req.getSession(true);
            session.setAttribute("user", u);
            session.setAttribute("userId", u.getId());

            if ("admin".equalsIgnoreCase(u.getRole())) {
                resp.sendRedirect("dashboard.jsp");
            } else {
                resp.sendRedirect("dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=Server+error");
        }
    }

    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT id FROM users WHERE email=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

}
