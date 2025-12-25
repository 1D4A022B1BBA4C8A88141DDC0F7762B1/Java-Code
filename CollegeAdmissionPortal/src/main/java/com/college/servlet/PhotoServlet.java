
package com.college.servlet;

import java.io.IOException;

import com.college.dao.StudentProfileDAO;
import com.college.model.StudentProfile;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

@WebServlet("/photo")
public class PhotoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));

        StudentProfileDAO dao = new StudentProfileDAO();
        StudentProfile sp = dao.getProfileByUserId(userId);

        if (sp != null && sp.getPassportPhoto() != null) {
            resp.setContentType("image/jpeg");
            resp.getOutputStream().write(sp.getPassportPhoto());
        }
    }
}
