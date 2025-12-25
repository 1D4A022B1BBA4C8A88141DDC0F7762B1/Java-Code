<%
if (session == null || session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ page import="com.college.dao.StudentProfileDAO" %>
<%@ page import="com.college.model.StudentProfile" %>


<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
int userId = (Integer) session.getAttribute("userId");
StudentProfileDAO dao = new StudentProfileDAO();
StudentProfile sp = dao.getProfileByUserId(userId);
%>

<div class="main-content container-fluid">
    <h3>My Profile</h3>

    <% if (sp != null) { %>
    <table class="table table-bordered">
        <tr><th>Full Name</th><td><%= sp.getFullName() %></td></tr>
        <tr><th>Father's Name</th><td><%= sp.getFatherName() %></td></tr>
        <tr><th>Mother's Name</th><td><%= sp.getMotherName() %></td></tr>
        <tr><th>Mobile</th><td><%= sp.getMobile() %></td></tr>
        <tr><th>DOB</th><td><%= sp.getDob() %></td></tr>
        <tr><th>Gender</th><td><%= sp.getGender() %></td></tr>
        <tr><th>Email</th><td><%= sp.getEmail() %></td></tr>
        <tr><th>10th %</th><td><%= sp.getTenthPercentage() %></td></tr>
        <tr><th>12th %</th><td><%= sp.getTwelfthPercentage() %></td></tr>      
        <tr>
           <th>10th Marksheet</th>
           <td>
              <a href="<%= request.getContextPath() %>/uploads/docs/<%= sp.getTenthMarksheet() %>"
                 target="_blank">
                 View PDF
              </a>
           </td>
        </tr>

        <tr>
           <th>12th Marksheet</th>
           <td>
              <a href="<%= request.getContextPath() %>/uploads/docs/<%= sp.getTwelfthMarksheet() %>"
                 target="_blank">
                 View PDF
              </a>
           </td>
        </tr>
        
        <tr>
           <th>Passport Photo</th>
           <td>
               <img src="<%= request.getContextPath() %>/photo?userId=<%= userId %>"
                    style="width:150px;height:200px;border:1px solid #ccc;">
               </td>
        </tr>
        
        
    </table>
    <% } else { %>
        <div class="alert alert-warning">Profile not found.</div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>
