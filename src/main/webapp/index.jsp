<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="assets/framework/bootstrap/bootstrap.min.css">
    <script src="assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
</head>
<body class="d-flex flex-column justify-content-center align-items-center min-vh-100" style="width: 100%">
<!-- Heading -->
<h1>E-Commerce Web App</h1>

<div class="vw-100 p-4 mt-4 bg-body-secondary rounded-2" style="max-width: 400px">
    <h2 class="text-center mb-4">Login</h2>
    <form action="login" method="get">
        <!-- Username Field -->
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <%
            String message = request.getParameter("message");
            if (message != null) {
        %>
        <div class="text-center text-danger"><%= message %></div>
        <%
            }
        %>
        <!-- Remember Me -->
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
            <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
        <!-- Submit Button -->
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>
    </form>
    <!-- Register Link -->
    <div class="text-center mt-3">
        <p>Don't have an account? <a href="pages/register.jsp">Register</a></p>
    </div>
</div>
</body>
</html>
