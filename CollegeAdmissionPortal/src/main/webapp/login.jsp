<%@ include file="header.jsp" %>

<%
    String type = request.getParameter("type");
    if (type == null) type = "student";

    String error = request.getParameter("error");
    String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= "admin".equalsIgnoreCase(type) ? "Admin Login" : "Student Login" %></title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #1d2671, #c33764);
            font-family: 'Segoe UI', sans-serif;
        }
        .login-card {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }
        .login-card h3 {
            font-family: 'Gabriola', Poppins, sans-serif;
            font-weight: bold;
        }
        .alert {
            border-radius: 8px;
            padding: 10px;
        }
        .register-section {
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="login-card">

    <h3 class="text-center mb-4">
        <%= "admin".equalsIgnoreCase(type) ? "Admin Login" : "Student Login" %>
    </h3>

    <% if (msg != null) { %>
        <div class="alert alert-success text-center">
            Registered successfully. Please login.
        </div>
    <% } else if (error != null) { %>
        <div class="alert alert-danger text-center">
            <%= error.replace("+", " ") %>
        </div>
    <% } %>

    <form method="post" action="login" >
        <input type="hidden" name="loginType" value="<%= type %>">

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary w-100">Login</button>

        <% if ("student".equalsIgnoreCase(type)) { %>
            <div class="register-section text-center">
                <p class="mb-1 mt-3">New student?</p>
                <a href="register.jsp" class="btn btn-outline-primary w-100">Register First</a>
            </div>
        <% } %>
        <% if ("admin".equalsIgnoreCase(type)) { %>
            <div class="text-center mt-3">
                <a href="admin-register.jsp">New Admin? Register</a>
            </div>
        <% } %>
        
    </form>
</div>

</body>
</html>

<%@ include file="footer.jsp" %>
