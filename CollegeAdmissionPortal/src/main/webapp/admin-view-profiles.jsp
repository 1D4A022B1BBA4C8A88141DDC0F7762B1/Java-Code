<%@ page import="java.util.*" %>
<%@ page import="com.college.dao.StudentProfileDAO" %>
<%@ page import="com.college.model.StudentProfile" %>

<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
StudentProfileDAO dao = new StudentProfileDAO();
List<StudentProfile> profiles = dao.getAllProfiles();
%>
<%
if (u == null || !"admin".equalsIgnoreCase(u.getRole())) {
    response.sendRedirect("login.jsp?error=Unauthorized");
    return;
}
%>

<div class="main-content container-fluid">
<h3>Student Profiles</h3>

<table class="table table-bordered">
<tr>
    <th>User ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Action</th>
</tr>

<% for(StudentProfile sp : profiles) { %>
<tr>
    <td><%= sp.getUserId() %></td>
    <td><%= sp.getFullName() %></td>
    <td><%= sp.getEmail() %></td>
    <td><%= sp.getMobile() %></td>
    <td>
        <a href="admin-view-profile.jsp?uid=<%= sp.getUserId() %>"
           class="btn btn-sm btn-primary">View</a>
    </td>
</tr>
<% } %>
</table>
</div>

<%@ include file="footer.jsp" %>
