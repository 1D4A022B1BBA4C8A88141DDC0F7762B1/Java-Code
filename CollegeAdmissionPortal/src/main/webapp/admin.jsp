<%@ page import="java.util.List, com.college.model.Application, com.college.model.User" %>
<%@ page session="true" %>

<%
User u = (User) session.getAttribute("user");
if (u == null || !"admin".equalsIgnoreCase(u.getRole())) {
    response.sendRedirect("login.jsp?error=Unauthorized");
    return;
}

List<Application> apps = (List<Application>) request.getAttribute("apps");
if (apps == null) {
    apps = new java.util.ArrayList<>();
}
%>
<% 
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);
    if (session == null || session.getAttribute("user") == null){
    	response.sendRedirect("login.jsp");
    	return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Panel</title>
</head>
<body>

<h2>Applications</h2>

<table border="1" cellpadding="8">
<tr>
  <th>ID</th>
  <th>User ID</th>
  <th>Course</th>
  <th>Year</th>
  <th>Status</th>
  <th>Action</th>
</tr>

<% for (Application a : apps) { %>
<tr>
  <td><%= a.getId() %></td>
  <td><%= a.getUserId() %></td>
  <td><%= a.getCourse() %></td>
  <td><%= a.getYear() %></td>

  <!-- STATUS COLUMN -->
  <td>
  <% if ("accepted".equalsIgnoreCase(a.getStatus())) { %>
      <span style="color:green;font-weight:bold;">Accepted</span>
  <% } else if ("rejected".equalsIgnoreCase(a.getStatus())) { %>
      <span style="color:red;font-weight:bold;">Rejected</span>
  <% } else { %>
      <span style="color:orange;font-weight:bold;">Pending</span>
  <% } %>
  </td>

  <!-- ACTION COLUMN -->
  <td>
    <form method="post" action="admin" style="display:inline">
      <input type="hidden" name="appId" value="<%= a.getId() %>"/>

      <select name="status">
        <option value="pending" <%= "pending".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>Pending</option>
        <option value="accepted" <%= "accepted".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>Accept</option>
        <option value="rejected" <%= "rejected".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>Reject</option>
      </select>

      <button type="submit">Update</button>
    </form>

    <a href="admin-view-profile.jsp?uid=<%= a.getUserId() %>">View Profile</a>
  </td>
</tr>
<% } %>

</table>
</body>
</html>
