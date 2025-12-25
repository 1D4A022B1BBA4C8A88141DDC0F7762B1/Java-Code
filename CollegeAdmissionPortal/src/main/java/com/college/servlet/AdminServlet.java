package com.college.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.college.dao.ApplicationDAO;
import com.college.model.Application;
import com.college.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private ApplicationDAO dao = new ApplicationDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                resp.sendRedirect("login.jsp?error=Please+login");
                return;
            }
            User u = (User) session.getAttribute("user");
            if (u.getRole() == null || !"admin".equalsIgnoreCase(u.getRole())) {
                resp.sendRedirect("login.jsp?error=Unauthorized+access");
                return;
            }
            List<Application> list = dao.getAllApplications();
            req.setAttribute("apps", list);
            req.getRequestDispatcher("admin.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User u = (User) session.getAttribute("user");
        if (!"admin".equalsIgnoreCase(u.getRole())) {
            resp.sendRedirect("dashboard.jsp");
            return;
        }

        int appId = Integer.parseInt(req.getParameter("appId"));
        String status = req.getParameter("status");

        try {
			dao.updateStatus(appId, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        resp.sendRedirect("admin");
    }
    
}
