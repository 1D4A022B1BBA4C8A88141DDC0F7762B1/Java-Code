<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-5">

<div class="card shadow p-4">
<h3 class="text-center mb-3">Admin Registration</h3>

<form method="post" action="admin-register">
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
    </div>

    <button class="btn btn-dark w-100">Register Admin</button>
</form>

</div>
</div>
</div>
</div>

</body>
</html>
