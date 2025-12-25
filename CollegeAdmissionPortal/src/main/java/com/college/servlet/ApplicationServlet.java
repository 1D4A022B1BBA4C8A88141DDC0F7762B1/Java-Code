package com.college.servlet;

import java.io.IOException;

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
@WebServlet("/apply")
public class ApplicationServlet extends HttpServlet {
    private ApplicationDAO appDAO = new ApplicationDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                resp.sendRedirect("login.jsp?error=Please+login");
                return;
            }
            User user = (User) session.getAttribute("user");

            String course = req.getParameter("course");
            int year = Integer.parseInt(req.getParameter("year"));
            String quals = req.getParameter("qualifications");

            Application a = new Application();
            a.setUserId(user.getId());
            a.setCourse(course);
            a.setYear(year);
            a.setQualifications(quals);

            boolean ok = appDAO.submit(a);
            if (ok) resp.sendRedirect("dashboard.jsp?msg=applied");
            else resp.sendRedirect("apply.jsp?error=Failed+to+apply");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("apply.jsp");
    }
}
