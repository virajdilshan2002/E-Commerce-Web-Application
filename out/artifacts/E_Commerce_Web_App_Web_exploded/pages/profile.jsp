<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="">E-Commerce WebApp</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a id="link-product" class="nav-link" href="home.jsp">Products</a></li>
                    <li class="nav-item"><a id="link-cart" class="nav-link" href="cart.jsp">Cart</a></li>
                    <li class="nav-item"><a id="link-order" class="nav-link" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a id="link-profile" class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Logout</a></li>
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
