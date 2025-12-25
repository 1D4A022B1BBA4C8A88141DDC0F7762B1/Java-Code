package com.college.servlet;

import java.io.IOException;

import com.college.dao.StudentProfileDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int uid = Integer.parseInt(req.getParameter("uid"));
        String status = req.getParameter("status");

        StudentProfileDAO dao = new StudentProfileDAO();
        dao.updateStatus(uid, status);

        resp.sendRedirect("admin-view-profiles.jsp");
    }
}
