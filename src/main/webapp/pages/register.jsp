<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="d-flex flex-column justify-content-center align-items-center min-vh-100 w-100 backgroundStrips" style="width: 100%">
<%
    String alert = request.getParameter("alert");
    if (alert != null) {
%>
<div class="toast position-absolute end-0 bottom-0" role="alert" aria-live="assertive" aria-atomic="true" >
    <div class="toast-header">
        <img src="../assets/images/icon/alert.gif" class="rounded me-2" alt="alert">
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
<h1>Register Here!</h1>

<div class="vw-100 p-4 mt-4 bg-body-secondary rounded-2" style="max-width: 400px">
    <h2 class="text-center mb-4">Register</h2>
    <form action="register" method="post">
        <!-- Username Field -->
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required autocomplete="username">
        </div>
        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">New Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password" required autocomplete="new-password">
        </div>
        <!-- Re-Enter Password Field -->
        <div class="mb-3">
            <label for="confirm-password" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirm-password" name="confirm-password" placeholder="Confirm password" required autocomplete="new-password">
        </div>
        <!-- Error Message -->
        <div id="password-error" class="text-danger mb-3" style="display: none;">
            Passwords do not match!
        </div>
        <!-- Submit Button -->
        <div class="d-grid">
            <input type="hidden" name="role" value="USER">
            <button id="register-button" type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
    <!-- Login Link -->
    <div class="text-center mt-3">
        <p>Already have an account? <a href="../index.jsp">Login</a></p>
    </div>

 <%--   <%
        if (alert != null) {
    %>
    <h2 class="text-center text-danger"><%= alert %></h2>
    <%
        }
    %>--%>
</div>

<script>
    $(document).ready(function() {
        $('#register-button').click(function(e) {
            const password = $('#password').val();
            const confirmPassword = $('#confirm-password').val();

            if (password !== confirmPassword) {
                e.preventDefault(); // Prevent form submission
                $('#password-error').show();  // Show error message
            } else {
                $('#password-error').hide();  // Hide error message
            }
        });
    });
</script>
<script src="../assets/js/AlertToast.js"></script>

</body>
</html>
