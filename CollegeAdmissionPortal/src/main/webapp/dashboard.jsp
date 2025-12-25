<%@ page import="com.college.model.User" %>
<%@ page import="com.college.dao.StudentProfileDAO" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    StudentProfileDAO profileDao = new StudentProfileDAO();

    int uid = u.getId();
    boolean profileCompleted = profileDao.isProfileCompleted(uid);

%>

<div class="main-content container-fluid mt-4">
    <h2 class="fw-bold text-primary mb-4">Dashboard</h2>

    <% if ("admin".equals(u.getRole())) { %>

        <div class="alert alert-info">
            <h5>Welcome, Admin</h5>
            <p>Use the sidebar to manage student applications and profiles.</p>
        </div>

        <div class="row g-3">
            <div class="col-md-6">
                <div class="card shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="card-title text-primary">Manage Applications</h5>
                        <p class="card-text">View and update student applications.</p>
                        <a href="admin" class="btn btn-outline-primary">Go to Admin Panel</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
               <div class="card shadow-sm border-0">
                  <div class="card-body">
                     <h5 class="card-title text-success">Student Profiles</h5>
                     <p class="card-text">Review and verify student details.</p>
                     <a href="admin-view-profiles.jsp" class="btn btn-outline-success">
                         View Profiles
                     </a>
                  </div>
               </div>
           </div>
            
        </div>

    <% } else { %>

        <% if (profileCompleted) { %>
            <span class="badge bg-success mb-3">Profile Completed</span>
        <% } else { %>
            <span class="badge bg-warning text-dark mb-3">Profile Not Completed</span>
        <% } %>

        <div class="row g-3">
            <div class="col-md-6">
                <div class="card bg-primary text-light shadow">
                    <div class="card-body">
                        <h5 class="card-title">Apply for a Course</h5>
                        <p class="card-text">Submit your course application easily.</p>
                        <% if(profileCompleted) { %>
                            <a href="apply.jsp" class="btn btn-light">Apply Now</a>
                        <% } else { %>
                            <button class="btn btn-light" disabled>Complete Profile First</button>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card bg-success text-light shadow">
                    <div class="card-body">
                        <h5 class="card-title">Student Profile</h5>
                        <p class="card-text">Manage your details and marksheets.</p>
                        <%
                           String msg = request.getParameter("msg");
                        %>
                        <% 
                            if (msg != null && msg.equals("edited")) {
                         %>
                            <div class="alert alert-success text-center">
                                 ✅ Profile edited successfully
                            </div>
                         <% } %>
                        <a href="student-profile.jsp" class="btn btn-light">
                            <%= profileCompleted ? "Edit Profile" : "Fill Profile" %>
                        </a>
                        <% if(profileCompleted) { %>
                            <a href="view-profile.jsp" class="btn btn-outline-light ms-2">View Profile</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

    <% } %>
</div>

<%@ include file="footer.jsp" %>
