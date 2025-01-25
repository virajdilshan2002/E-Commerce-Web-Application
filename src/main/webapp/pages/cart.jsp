<%@ page import="lk.ijse.ecommercewebapp.tablemodal.CartTableModal" %>
<%@ page import="java.util.List" %>
<%@ page import="static lk.ijse.ecommercewebapp.LoginServlet.user" %>
<%@ page import="java.math.BigDecimal" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="w-100 min-vh-100 backgroundRandomized">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">KumuduFurniture</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="products">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
                    <li class="nav-item"><a class="nav-link" href="orders">Orders</a></li>
<%--                    <li class="nav-item"><a class="nav-link" href="profile">Profile</a></li>--%>
                    <li class="nav-item"><a class="nav-link text-bg-danger rounded" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

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

<!-- Cart Section -->
<section id="cart" class="container my-5">
    <h2>Shopping Cart</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="cart-items">
            <%
                List<CartTableModal> cartList = (List<CartTableModal>) request.getAttribute("cartList");
                if (cartList != null) {
                    BigDecimal netTot = BigDecimal.ZERO;
                    for (CartTableModal cart : cartList) {
                        netTot = netTot.add(cart.getTotal());
            %>
            <tr>
                <td><%= cart.getProduct().getName() %>
                </td>
                <td><%= cart.getProduct().getPrice() %>
                </td>
                <td><%= cart.getQty() %>
                </td>
                <td><%= cart.getTotal() %>
                </td>
                <td>
                    <form action="cart" method="post">
                        <input type="hidden" name="cartId" value="<%= cart.getId() %>">
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <form action="purchase" method="post">
                <input type="hidden" name="netTotal" value="<%=netTot%>">
                <button type="submit" class="btn btn-primary btn-lg position-absolute" style="top: 70px; right: 20px">
                    Purchase
                </button>
            </form>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>
