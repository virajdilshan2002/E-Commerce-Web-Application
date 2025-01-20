<%@ page import="static lk.ijse.ecommercewebapp.LoginServlet.user" %>
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
            <a class="navbar-brand" href="home">E-Commerce WebApp</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="products">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<%
    if (user == null) {
%>
<div class="container text-center my-5">
    <h1>Welcome to the POS System</h1>
    <h5><%=user.getRole()%> : <%=user.getUsername()%></h5>
    <p>Browse, shop, and manage your orders with ease.</p>
</div>
<%
    }
%>

<!-- Products Section -->
<section id="products" class="container my-5">
    <h2 class="mb-4">Home</h2>
</section>

</body>
</html>
