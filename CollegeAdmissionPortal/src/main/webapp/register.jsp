<%@ include file="header.jsp" %>

<div class="main-content container-fluid">
<h2>Student Registration</h2>


<%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");

    if ("registered".equals(msg)) {
%>
    <div style="color:green; font-weight:bold;">
        Registered successfully!
    </div>
<%
    } else if ("password_mismatch".equals(error)) {
%>
    <div style="color:red; font-weight:bold;">
        Password and Confirm Password do not match
    </div>
<%
    } else if ("weak_password".equals(error)) {
%>
    <div style="color:red; font-weight:bold;">
        Please provide a stronger password
    </div>
<%
    } else if ("failed".equals(error)) {
%>
    <p style="color:red; font-weight:bold;">
        Registration failed. Try again.
    </p>
<%
    }
%>

<form method="post" action="register" class="mt-3">
    <div class="mb-3">
        <label>Name</label>
        <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Password</label>
        <input type="password" name="password" class="form-control" required>

        <label>Confirm Password</label>
        <input type="password" name="confirmPassword" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary">Register</button>
    <a href="login.jsp" class="btn btn-link">Login</a>
</form>
</div>

<%@ include file="footer.jsp" %>
