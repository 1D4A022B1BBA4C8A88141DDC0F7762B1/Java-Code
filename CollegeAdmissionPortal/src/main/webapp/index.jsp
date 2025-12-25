<!DOCTYPE html>
<html>
<head>
    <title>College Admission Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #1d2671, #c33764);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
        }
        .login-card {
            border-radius: 15px;
            transition: 0.3s;
        }
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="text-center text-white mb-5">
        <h1 class="fw-bold" style="font-family: Gabriola, Poppins; font-weight:bold;">College Admission Portal</h1>
        <p class="fs-5">Choose your login type</p>
    </div>

    <div class="row justify-content-center g-4">

        <div class="col-md-4">
            <div class="card login-card text-center p-4">
                <h4 style="font-family: Gabriola, Poppins; font-weight:bold; font-size: 30px">Student Login</h4>
                <p>Apply courses & track status</p>
                <a href="login.jsp?type=student" class="btn btn-primary w-100">
                    Student Login
                </a>
                <!-- ✅ REGISTER BUTTON -->
                <a href="register.jsp" 
                   class="text-center btn-3">
                    New student? Register
                </a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card login-card text-center p-4">
                <h4 style="font-family: Gabriola, Poppins; font-weight:bold; font-size: 30px">Admin Login</h4>
                <p>Manage applications</p>
                <a href="login.jsp?type=admin" class="btn btn-dark w-100">
                    Admin Login
                </a>
                <a href="register.jsp" 
                   class="text-center btn-3">
                    New student? Register
                </a>
            </div>
        </div>

    </div>
</div>

</body>
</html>
