package com.college.servlet;

import java.io.IOException;

import com.college.dao.StudentProfileDAO;
import com.college.model.StudentProfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/studentProfile")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024)
public class StudentProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        StudentProfileDAO dao = new StudentProfileDAO();

        StudentProfile sp = new StudentProfile();
        sp.setUserId(userId);
        sp.setFullName(req.getParameter("fullName"));
        sp.setFatherName(req.getParameter("fatherName"));
        sp.setMotherName(req.getParameter("motherName"));
        sp.setMobile(req.getParameter("mobile"));
        sp.setDob(req.getParameter("dob"));
        sp.setGender(req.getParameter("gender"));

        // ===== EMAIL VALIDATION =====
        String email = req.getParameter("email");

        if (email == null || email.trim().isEmpty()) {
            resp.sendRedirect("student-profile.jsp?error=Email is required");
            return;
        }

        email = email.trim().toLowerCase();

        if (!email.matches("^[a-z0-9._%+-]+@gmail\\.com$")) {
            resp.sendRedirect("student-profile.jsp?error=Only Gmail addresses are allowed");
            return;
        }
        
        
        sp.setEmail(email);

        

        sp.setTenthPercentage(Double.parseDouble(req.getParameter("tenthPercentage")));
        sp.setTwelfthPercentage(Double.parseDouble(req.getParameter("twelfthPercentage")));

        // ===== PASSPORT PHOTO =====
        Part photo = req.getPart("passportPhoto");
        if (photo != null && photo.getSize() > 0) {
            sp.setPassportPhoto(photo.getInputStream().readAllBytes());
        } else {
            StudentProfile old = dao.getProfileByUserId(userId);
            if (old != null) sp.setPassportPhoto(old.getPassportPhoto());
        }

        // ===== FILE PATH =====
        String path = getServletContext().getRealPath("/uploads/docs");
        new java.io.File(path).mkdirs();

        // ===== 10th =====
        Part tenth = req.getPart("tenthMarksheet");
        if (tenth != null && tenth.getSize() > 0) {
            String name = System.currentTimeMillis() + "_" + tenth.getSubmittedFileName();
            tenth.write(path + "/" + name);
            sp.setTenthMarksheet(name);
        } else {
            StudentProfile old = dao.getProfileByUserId(userId);
            if (old != null) sp.setTenthMarksheet(old.getTenthMarksheet());
        }

        // ===== 12th =====
        Part twelfth = req.getPart("twelfthMarksheet");
        if (twelfth != null && twelfth.getSize() > 0) {
            String name = System.currentTimeMillis() + "_" + twelfth.getSubmittedFileName();
            twelfth.write(path + "/" + name);
            sp.setTwelfthMarksheet(name);
        } else {
            StudentProfile old = dao.getProfileByUserId(userId);
            if (old != null) sp.setTwelfthMarksheet(old.getTwelfthMarksheet());
        }

        try {
        	StudentProfile existingProfile = dao.getProfileByUserId(userId);
        	boolean isEdit = (existingProfile != null);
        	
        	dao.saveOrUpdate(sp);
        	
        	if (isEdit) {
        		session.setAttribute("flashMsg", "edited");
        	}
        	else {
        		session.setAttribute("flashMsg", "submitted");
        	}
            resp.sendRedirect("dashboard.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("student-profile.jsp?error=Server error");
        }
    }
}
