<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="w-100 min-vh-100 backgroundRandomized">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">E-Commerce WebApp</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="products">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
                    <li class="nav-item"><a class="nav-link" href="orders">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-bg-danger rounded-5 ps-3 pe-3 text-center" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Profile Section -->
<section id="profile" class="container my-5">
    <h2>User Profile</h2>
    <form>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" placeholder="Enter your username">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Enter your password">
        </div>
        <button type="submit" class="btn btn-primary">Update Profile</button>
    </form>
</section>
</body>
</html>
