<%@ page import="java.util.List, com.college.model.Application, com.college.model.User" %>
<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%  
    if (u == null || !"admin".equalsIgnoreCase(u.getRole())) {
        response.sendRedirect("login.jsp?error=Unauthorized");
        return;
    }

    List<Application> apps = (List<Application>) request.getAttribute("apps");
    if (apps == null) {
        apps = new java.util.ArrayList<>();
    }

    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Applications</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f7fa;
        }
        .table th {
            white-space: nowrap;
        }
    </style>
</head>

<body>

<div class="container-fluid mt-4">

    <!-- Header -->
    <div class="card shadow-sm mb-4">
        <div class="card-body d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Student Admission Applications</h4>
            <!-- <a href="logout.jsp" class="btn btn-danger btn-sm">Logout</a> -->
        </div>
    </div>

    <!-- Applications Table -->
    <div class="card shadow-sm">
        <div class="card-body table-responsive">

            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Student Name</th>
                        <th>Father Name</th>
                        <th>Contact</th>
                        <th>DOB</th>
                        <th>Course</th>
                        <th>Year</th>
                        <th>10th %</th>
                        <th>12th %</th>
                        <th>Qualification</th>
                        <th>Receipt No</th>
                        <th>Status</th>
                        <th>Signature</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                <% if (apps.isEmpty()) { %>
                    <tr>
                        <td colspan="14" class="text-muted fw-semibold">
                            No applications found
                        </td>
                    </tr>
                <% } %>

                <% for (Application a : apps) { %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td class="fw-semibold"><%= a.getStudentName() %></td>
                        <td><%= a.getFatherName() %></td>
                        <td><%= a.getContactNo() %></td>
                        <td><%= a.getDob() %></td>
                        <td><%= a.getCourse() %></td>
                        <td><%= a.getYear() %></td>
                        <td><%= a.getTenthPercentage() %></td>
                        <td><%= a.getTwelfthPercentage() %></td>
                        <td><%= a.getQualifications() %></td>
                        <td><%= a.getReceiptNo() %></td>

                        <!-- Status Badge -->
                        <td>
                            <% if ("accepted".equalsIgnoreCase(a.getStatus())) { %>
                                <span class="badge bg-success">Accepted</span>
                            <% } else if ("rejected".equalsIgnoreCase(a.getStatus())) { %>
                                <span class="badge bg-danger">Rejected</span>
                            <% } else { %>
                                <span class="badge bg-warning text-dark">Pending</span>
                            <% } %>
                        </td>

                        <!-- Signature -->
                        <td>
                            <a href="uploads/<%= a.getStudentSignature() %>" 
                               target="_blank" 
                               class="btn btn-outline-primary btn-sm">
                                View
                            </a>
                        </td>

                        <!-- Action -->
                        <td>
                            <form method="post" action="admin" class="d-flex gap-2">
                                <input type="hidden" name="appId" value="<%= a.getId() %>">

                                <select name="status" class="form-select form-select-sm">
                                    <option value="pending" <%= "pending".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>
                                        Pending
                                    </option>
                                    <option value="accepted" <%= "accepted".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>
                                        Accept
                                    </option>
                                    <option value="rejected" <%= "rejected".equalsIgnoreCase(a.getStatus()) ? "selected" : "" %>>
                                        Reject
                                    </option>
                                </select>

                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                            </form>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
