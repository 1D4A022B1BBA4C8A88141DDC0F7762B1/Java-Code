<%@ page import="com.college.dao.StudentProfileDAO" %>
<%@ page import="com.college.model.StudentProfile" %>

<%@ include file="header.jsp" %>
<!--<%@ include file="navbar.jsp" %>-->
<%
    if (u == null || !"admin".equalsIgnoreCase(u.getRole())) {
        response.sendRedirect("admin-view-profile.jsp");
        return;
    }
%>

<%
    String uidParam = request.getParameter("uid");

    if (uidParam == null) {
        out.println("<h4 style='color:red;'>Invalid request: User ID missing</h4>");
        return;
    }

    int uid = Integer.parseInt(uidParam);

    StudentProfileDAO dao = new StudentProfileDAO();
    StudentProfile sp = dao.getProfileByUserId(uid);

    if (sp == null) {
        out.println("<h4 style='color:red;'>No profile found for this student</h4>");
        return;
    }
%>



<div class="main-content container-fluid">
    <h3>Student Profile Details</h3>

    <% if (sp != null) { %>

    <table class="table table-bordered">
        <tr><th>Full Name</th><td><%= sp.getFullName() %></td></tr>
        <tr><th>Father Name</th><td><%= sp.getFatherName() %></td></tr>
        <tr><th>Mother Name</th><td><%= sp.getMotherName() %></td></tr>
        <tr><th>Email</th><td><%= sp.getEmail() %></td></tr>
        <tr><th>Mobile</th><td><%= sp.getMobile() %></td></tr>
        <tr><th>10th %</th><td><%= sp.getTenthPercentage() %></td></tr>
        <tr><th>12th %</th><td><%= sp.getTwelfthPercentage() %></td></tr>
        <tr><th>10th Marksheet %</th><td><%= sp.getTenthMarksheet() %></td></tr>
        <tr><th>12th Marksheet %</th><td><%= sp.getTwelfthMarksheet() %></td></tr>
        <tr><th>Upload photo %</th><td><%= sp.getPassportPhoto() %></td></tr>
    </table>

    <!-- ✅ ADD BUTTONS HERE -->
    <div class="mt-3">
        <a href="UpdateStatusServlet?uid=<%= uid %>&status=APPROVED"
           class="btn btn-success me-2">
           Approve
        </a>

        <a href="UpdateStatusServlet?uid=<%= uid %>&status=REJECTED"
           class="btn btn-danger">
           Reject
        </a>
    </div>

    <% } else { %>
        //<div class="alert alert-warning">Profile not found</div>
            <% } %>
         </div>

<%@ include file="footer.jsp" %>
