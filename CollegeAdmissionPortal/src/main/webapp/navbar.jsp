<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.college.model.User" %>

<%
    User v = (User) session.getAttribute("user");
%>

<div class="sidebar p-3">
    <h4 class="mb-3">Menu</h4>

    <% if (v != null) { %>

        <!-- DASHBOARD (Both Admin & Student) -->
        <a href="dashboard.jsp" class="d-block mb-2">
            Dashboard
        </a>

        <!-- STUDENT ONLY -->
        <% if ("student".equalsIgnoreCase(v.getRole())) { %>
            <a href="apply.jsp" class="d-block mb-2">
                Apply for Course
            </a>
        <% } %>

        <!-- ADMIN ONLY -->
        <% if ("admin".equalsIgnoreCase(v.getRole())) { %>
            <a href="admin" class="d-block mb-2">
                Admin Panel
            </a>

            <a href="admin-view-profiles.jsp" class="d-block mb-2">
                Student Profiles
            </a>
        <% } %>

        <!-- LOGOUT -->
        <a href="logout.jsp" class="d-block mt-3 text-danger fw-semibold">
            Logout
        </a>

    <% } %>
</div>
