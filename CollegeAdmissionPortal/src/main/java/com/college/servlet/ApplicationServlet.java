package com.college.servlet;

import java.io.IOException;
import java.sql.Date;

import com.college.dao.ApplicationDAO;
import com.college.model.Application;
import com.college.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/apply")
@MultipartConfig
public class ApplicationServlet extends HttpServlet {

    private ApplicationDAO appDAO = new ApplicationDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                resp.sendRedirect("login.jsp?error=Please+login");
                return;
            }

            User user = (User) session.getAttribute("user");
            Application a = new Application();

            a.setUserId(user.getId());
            a.setStudentName(req.getParameter("studentName"));
            a.setFatherName(req.getParameter("fatherName"));
            a.setContactNo(req.getParameter("contactNo"));

            // DOB
            String dobStr = req.getParameter("dob");
            if (dobStr != null && !dobStr.isEmpty()) {
                a.setDob(Date.valueOf(dobStr));
            }

            a.setPermanentAddress(req.getParameter("permanentAddress"));
            a.setLocalAddress(req.getParameter("localAddress"));
            a.setReceiptNo(req.getParameter("receiptNo"));
            a.setCourse(req.getParameter("course"));

            // Year
            String yearStr = req.getParameter("year");
            a.setYear((yearStr != null && !yearStr.isEmpty())
                    ? Integer.parseInt(yearStr) : 1);

            // Percentages
            String tenth = req.getParameter("tenthPercentage");
            a.setTenthPercentage((tenth != null && !tenth.isEmpty())
                    ? Double.parseDouble(tenth) : 0);

            String twelfth = req.getParameter("twelfthPercentage");
            a.setTwelfthPercentage((twelfth != null && !twelfth.isEmpty())
                    ? Double.parseDouble(twelfth) : 0);

            // Qualification (TEXT)
            a.setQualifications(req.getParameter("qualifications"));

            // TEMP signature value
            a.setStudentSignature("signature_pending");

            boolean ok = appDAO.submit(a);

            if (ok) {
                resp.sendRedirect("dashboard.jsp?msg=applied");
            } else {
                resp.sendRedirect("apply.jsp?error=Failed+to+apply");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("apply.jsp?error=Server+Error");
        }
    }
}
