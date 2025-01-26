<%@ page import="static lk.ijse.ecommercewebapp.LoginServlet.user" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="w-100 min-vh-100 backgroundRandomized">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="products">KumuduFurniture</a>
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
<%
    String alert = request.getParameter("alert");
    if (alert != null) {
%>
<div class="toast position-absolute end-0 bottom-0 z-3" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
        <img src="../assets/images/icon/alert.gif" class="rounded me-2" alt="alert">
        <strong class="me-auto"><%=alert%>
        </strong>
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


<%
    if (user != null) {
%>
<div class="container text-center my-5">
    <h5><%=user.getRole()%> : <%=user.getUserName()%>
    </h5>
    <h1>Welcome to the Kumudu Furniture</h1>
    <p>Browse, shop, and manage your orders with ease.</p>
</div>
<%
    }
%>


<!-- Products Section -->
<section id="products" class="container my-5">
    <h2 class="mb-4">Products</h2>

    <!-- Search Bar -->
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search by name" id="search-bar">
        <button class="btn btn-primary" type="button">Search</button>
    </div>

    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        if (productList != null) {
    %>
    <h2 class="mb-4">Furniture Items</h2>
    <div class="row">
        <%
            for (Product product : productList) {
        %>
        <!-- Product Card -->
        <form class="col-md-4 mb-4" action="cart" method="post" style="max-width: 300px">
            <div class="card">
                <img src="../<%=product.getImageUrl()%>" class="card-img-top object-fit-cover" alt="Product Image"
                     style="max-height: 200px">
                <div class="card-body">
                    <h5 class="card-title"><%=product.getName()%>
                    </h5>
                    <p class="card-text"><%=product.getDescription()%>
                    </p>
                    <p class="card-text">Rs | <%=product.getPrice()%>
                    </p>
                    <p class="card-text">Available | <%=product.getQuantity()%></p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <%
                            if (product.getQuantity() == 0) {
                        %>
                        <input type="number" name="qty" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-sm" value="0" min="0" max="0">
                        <button type="button" class="btn btn-warning" disabled>No Stock Available</button>
                        <%
                        } else {
                        %>
                        <input type="number" name="qty" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-sm" value="1" min="1"
                               max="<%=product.getQuantity()%>">
                        <button type="submit" class="btn btn-success" name="action" value="post">Add to Cart</button>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <!-- Hidden inputs to send additional product data -->
            <input type="hidden" name="productId" value="<%=product.getId()%>">
        </form>
        <%
                }
            }
        %>

        <%--<%
            String alert = request.getParameter("alert");
            if (alert != null) {
        %>
        <!-- Bootstrap Modal -->
        <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="alertModalLabel">Alert</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%= alert %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>--%>
    </div>
</section>
<script src="../assets/js/AlertToast.js"></script>
</body>
</html>
