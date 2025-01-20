<%@ page import="static lk.ijse.ecommercewebapp.LoginServlet.user" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Product" %>
<%@ page import="java.util.List" %>
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
    if (user != null) {
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
    <h2 class="mb-4">Products</h2>

    <%--category navi buttons
    <div class="d-grid gap-2 d-md-block">
        <a class="btn btn-primary" href="#cat1">Button1</a>
        <a class="btn btn-primary" href="#cat2" >Button2</a>
        <a class="btn btn-primary" href="#cat3" >Button3</a>
    </div>--%>

    <!-- Search Bar -->
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search by name" id="search-bar">
        <button class="btn btn-primary" type="button">Search</button>
    </div>

    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        if (!productList.isEmpty()) {
    %>
    <h2 class="mb-4">Furniture</h2>
    <div id="category-1" class="row">
        <%
            for (Product product : productList) {
                System.out.println(product);
        %>
        <!-- Product Card -->
        <form class="col-md-4 mb-4" action="cart" method="post">
            <div class="card">
                <img src="../<%=product.getImageUrl()%>" class="card-img-top object-fit-cover" alt="Product Image" style="max-height: 200px">
                <div class="card-body">
                    <h5 class="card-title"><%=product.getName()%></h5>
                    <p class="card-text"><%=product.getDescription()%></p>
                    <p class="card-text"><%=product.getPrice()%></p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1" min="1" max="<%=product.getQuantity()%>">
                        <button type="submit" class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </form>
        <%
                }
            }
        %>
    </div>
</section>

</body>
</html>
