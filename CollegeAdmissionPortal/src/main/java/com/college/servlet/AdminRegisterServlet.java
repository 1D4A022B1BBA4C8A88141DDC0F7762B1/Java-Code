package com.college.servlet;

import java.io.IOException;

import com.college.dao.UserDAO;
import com.college.model.User;
import com.college.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/admin-register")
public class AdminRegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            if (userDAO.emailExists(email)) {
                resp.sendRedirect("admin-register.jsp?error=Email already exists");
                return;
            }

            User u = new User();
            u.setName(name);
            u.setEmail(email);
            u.setPassword(PasswordUtil.hashPassword(password));
            u.setRole("admin");   // 🔥 IMPORTANT

            userDAO.register(u);

            resp.sendRedirect("login.jsp?type=admin&msg=Registered successfully");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-register.jsp?error=Server error");
        }
    }
}
