<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
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
                    <li class="nav-item"><a class="nav-link" href="#products">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="#cart">Cart</a></li>
                    <li class="nav-item"><a class="nav-link" href="#orders">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="#profile">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<%
    String username = request.getParameter("username");
    String role = request.getParameter("role");

    if (role != null && username != null) {
%>
<%--<h4><%=message%> Welcome <%=username%>!</h4>--%>
<div class="container text-center my-5">
    <h1>Welcome to the POS System</h1>
    <h5><%=role%> : <%=username%></h5>
    <p>Browse, shop, and manage your orders with ease.</p>
</div>
<%
    }
%>

<!-- Products Section -->
<section id="products" class="container my-5">
    <h2>Products</h2>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search by name" id="search-bar">
        <button class="btn btn-primary" onclick="searchProduct()">Search</button>
    </div>
    <div class="row">
        <!-- Dynamic product cards -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $100</p>
                    <button class="btn btn-success" onclick="addToCart()">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Cart Section -->
<section id="cart" class="container my-5">
    <h2>Shopping Cart</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="cart-items">
            <!-- Dynamic cart items -->
            </tbody>
        </table>
    </div>
</section>

<!-- Orders Section -->
<section id="orders" class="container my-5">
    <h2>Order History</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Total</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody id="order-history">
            <!-- Dynamic order history -->
            </tbody>
        </table>
    </div>
</section>

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
