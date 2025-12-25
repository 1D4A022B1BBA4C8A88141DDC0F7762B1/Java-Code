<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.college.model.User" %>

<%
    User v = (User) session.getAttribute("user");
%>
<div class="sidebar p-3">
    <h4>Menu</h4>
    <a href="dashboard.jsp">Dash board</a>
    <% if(v != null && !"student".equals(v.getRole())){ %>
        <a href="apply.jsp">Apply for Course</a>
    <% } %>
    <% if(v != null && "admin".equals(v.getRole())){ %>
        <a href="admin">Admin Panel</a>
    <% } %>
    <% if ("admin".equals(v.getRole())) { %>
    <li class="nav-item">
        <a href="admin-view-profiles.jsp" class="nav-link">
            Student Profiles
        </a>
    </li>
    <% } %>
    
    <a href="logout.jsp">Logout</a>
</div>