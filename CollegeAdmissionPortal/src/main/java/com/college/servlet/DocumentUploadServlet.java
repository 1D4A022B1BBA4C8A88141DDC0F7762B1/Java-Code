package com.college.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.college.dao.DocumentDAO;
import com.college.model.Document;
import com.college.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/upload")
@MultipartConfig
public class DocumentUploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User u = (User) req.getSession().getAttribute("user");

        Part filePart = req.getPart("document");
        String docType = req.getParameter("docType");

        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

        String path = getServletContext().getRealPath("") +
                File.separator + UPLOAD_DIR + File.separator + "user_" + u.getId();

        File dir = new File(path);
        if (!dir.exists()) dir.mkdirs();

        filePart.write(path + File.separator + fileName);

        Document d = new Document();
        d.setUserId(u.getId());
        d.setDocumentType(docType);
        d.setFileName(fileName);

        try {
			new DocumentDAO().save(d);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        resp.sendRedirect("dashboard.jsp?msg=uploaded");
    }
}
