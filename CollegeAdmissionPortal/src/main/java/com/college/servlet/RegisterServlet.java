package com.college.servlet;

import com.college.dao.UserDAO;
import com.college.model.User;
import com.college.utils.PasswordUtil;
import com.college.utils.PasswordValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String confirmPassword = req.getParameter("confirmPassword");

            if (!password.equals(confirmPassword)) {
                resp.sendRedirect("register.jsp?error=password_mismatch");
                return;
            }

            if (!PasswordValidator.isValid(password)) {
                resp.sendRedirect("register.jsp?error=weak_password");
                return;
            }
            
            if (userDAO.emailExists(email)) {
                resp.sendRedirect("register.jsp?error=email_exists");
                return;
            }
            String hashed = PasswordUtil.hashPassword(password);

            User u = new User();
            u.setName(name);
            u.setEmail(email);
            u.setPassword(hashed);
            u.setRole("student");

            boolean ok = userDAO.register(u);

            if (ok) {
                resp.sendRedirect("login.jsp?msg=registered&type=student");
            } else {
                resp.sendRedirect("register.jsp?error=failed");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.sendRedirect("register.jsp"); 
    }
}