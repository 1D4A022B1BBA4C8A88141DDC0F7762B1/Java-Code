<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.college.model.User" %>
<%@ page session="true" %>
<%
    User u = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>College Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { min-height: 100vh; display: flex; flex-direction: column; }
.sidebar { min-width: 200px; max-width: 200px; background-color: #343a40; color: #fff; min-height: 100vh; }
.sidebar a { color: #fff; text-decoration: none; display: block; padding: 10px 20px; }
.sidebar a:hover { background-color: #495057; }
.main-content { flex-grow: 1; padding: 20px; }
.card { margin-bottom: 20px; }
</style>
</head>
<body>
  <nav>
    <% if(u != null){ %>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
           <span class="navbar-brand">College Portal</span>

           <span class="btn btn-primary" style="font-family:gabriola; font-size: 22px;">
               Welcome, <%= u.getName() %>
           </span>
        </div>
      </nav>
    <% } %>
</nav>
<div class="d-flex">
