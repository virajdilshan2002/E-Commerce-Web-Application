<%@ page import="lk.ijse.ecommercewebapp.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
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
                    <%--          <li class="nav-item"><a class="nav-link" href="profile">Profile</a></li>--%>
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
<div class="toast position-absolute end-0 bottom-0" role="alert" aria-live="assertive" aria-atomic="true">
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

<!-- Orders Section -->
<section id="orders" class="container my-5">
    <h2>Order History</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Date</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody id="order-history">
            <!-- Dynamic order history -->
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orderList");
                if (orders != null) {
                    for (Order order : orders) {
            %>
            <tr>
                <td><%=order.getId()%></td>
                <td><%=order.getUser().getUserName()%></td>
                <td><%=order.getOrderDateTime()%></td>
                <td><%=order.getTotal()%></td>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>
