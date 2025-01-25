<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kumudu Furniture</title>
    <link rel="stylesheet" href="assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="d-flex flex-column justify-content-center align-items-center w-100 min-vh-100 backgroundStrips" style="width: 100%">
<%
    String alert = request.getParameter("alert");
    if (alert != null) {
%>
<div class="toast position-absolute end-0 bottom-0" role="alert" aria-live="assertive" aria-atomic="true" >
    <div class="toast-header">
        <img src="assets/images/icon/alert.gif" class="rounded me-2" alt="alert">
        <strong class="me-auto"><%=alert%></strong>
        <small class="text-body-secondary">Just now</small>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
        <%= alert %>
    </div>
</div>
<%
    }
%>

<!-- Heading -->
<h1>Welcome to Kumudu Furniture!</h1>

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

<script src="assets/js/AlertToast.js"></script>
</body>
</html>
