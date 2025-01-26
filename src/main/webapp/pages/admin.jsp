<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Product" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../assets/framework/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/framework/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../assets/framework/jquery/jquery-3.7.1.min.js"></script>
</head>
<body class="w-100 min-vh-100 backgroundRandomized">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="admin">KumuduFurniture</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
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

<%--add category, product, admin buttons--%>
<div class="d-flex flex-row w-100 justify-content-center column-gap-1 p-2 mt-2 mb-2">
    <button type="button" class="btn btn-success" data-bs-toggle="modal"
            data-bs-target="#categoryModal">
        <i class="bi bi-plus-circle"></i> Add Category
    </button>
    <button id="AddProduct" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#productModal">
        <i class="bi bi-plus-circle"></i> Add Product
    </button>
    <button id="AddAdmin" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#adminModal">
        <i class="bi bi-plus-circle"></i> Add Admin
    </button>
</div>

<%--counts of users, products, orders--%>
<div class="container " style="height: 200px">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-primary">
                <div class="card-body">
                    <h5 class="card-title text-primary">Users</h5>
                    <h1 id="userCount" class="display-4 fw-bold text-dark"></h1>
                    <p class="text-muted">Updated: <span class="updateTime"></span></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-primary">
                <div class="card-body">
                    <h5 class="card-title text-primary">Products</h5>
                    <h1 id="productsCount" class="display-4 fw-bold text-dark">0</h1>
                    <p class="text-muted">Updated: <span class="updateTime"></span></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm border-primary">
                <div class="card-body">
                    <h5 class="card-title text-primary">Orders</h5>
                    <h1 id="ordersCount" class="display-4 fw-bold text-dark">0</h1>
                    <p class="text-muted">Updated: <span class="updateTime"></span></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Category Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="categoryModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="categoryForm" action="category" method="post">
                <div class="modal-body">
                    <!-- Category Name -->
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="categoryName"
                               placeholder="Enter category name" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" id="btnSaveCategory" class="btn btn-primary">Save Category</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="productModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="productForm" enctype="multipart/form-data" action="products" method="post">
                <div class="modal-body">
                    <!-- Product Name -->
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="name"
                               placeholder="Enter product name" required>
                    </div>
                    <!-- Description -->
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescription" name="description" rows="3"
                                  placeholder="Enter product description"></textarea>
                    </div>
                    <!-- Price -->
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="price"
                               placeholder="Enter price" step="0.00" required>
                    </div>

                    <div class="d-flex flex-row mb-3 align-items-end">
                        <!-- Qty -->
                        <div class="w-25">
                            <label for="productQty" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="productQty" name="qty"
                                   placeholder="Enter Quantity" value="1" required>
                        </div>

                        <!-- Category -->
                        <div class="w-50 ms-2">
                            <label for="productCategory" class="form-label">Category</label>
                            <select class="form-select" id="productCategory" name="productCategory" required>
                                <option disabled selected>Select Category</option>
                                <%
                                    List<Category> categoryList = (List<Category>) request.getAttribute("catList");
                                    if (categoryList != null) {
                                        for (Category category : categoryList) {
                                %>
                                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Image -->
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Upload Image</label>
                        <input type="file" class="form-control" id="productImage" name="image" accept="image/*"
                               required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button id="btnSaveProduct" type="submit" class="btn btn-primary" name="action" value="post">Save
                        Product
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Admin Modal -->
<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="adminModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="adminForm" action="register" method="post">
                <div class="modal-body">
                    <!-- Admin UserName -->
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username"
                               placeholder="Enter username" required autocomplete="username">
                    </div>
                    <!-- Password Field -->
                    <div class="mb-3">
                        <label for="password" class="form-label">New Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Enter new password" required autocomplete="new-password">
                    </div>
                    <!-- Re-Enter Password Field -->
                    <div class="mb-3">
                        <label for="confirm-password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirm-password"
                               placeholder="Confirm password" required autocomplete="new-password">
                    </div>
                    <!-- Error Message -->
                    <div id="password-error" class="text-danger mb-3" style="display: none;">
                        Passwords do not match!
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="role" value="ADMIN">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" id="btnRegAdmin" class="btn btn-primary">Register Admin</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    if (productList != null) {
%>
<h2 class="mb-4 ms-2">Furniture</h2>
<div id="category-1" class="row m-2">
        <%
            for (Product product : productList) {
        %>
    <!-- Product Card -->
    <div class="col-md-4 mb-4" style="max-height: 500px; max-width: 350px">
        <div class="card">
            <img src="../<%=product.getImageUrl()%>" class="card-img-top object-fit-cover" alt="Product Image"
                 style="max-height: 200px">
            <div class="card-body">
                <h5 class="card-title"><%=product.getName()%>
                </h5>
                <p class="card-text"><%=product.getDescription()%>
                </p>
                <p class="card-text"><%=product.getPrice()%>
                <p class="card-text">Available | <%=product.getQuantity()%></p>
                <form class="input-group input-group-sm mb-3" action="products" method="post">
                    <span class="input-group-text">Qty</span>
                    <input type="hidden" name="productId" value="<%=product.getId()%>">
                    <input type="number" name="qty" class="form-control" aria-label="Sizing example input"
                           aria-describedby="inputGroup-sizing-sm" value="1" min="1">
                    <button type="submit" class="btn btn-success" name="action" value="put">Add Qty</button>
                </form>
            </div>
        </div>
    </div>
        <%
                }
            }
        %>

    <script>
        $(document).ready(function () {
            $('#btnRegAdmin').click(function (e) {
                const password = $('#password').val();
                const confirmPassword = $('#confirm-password').val();

                if (password !== confirmPassword) {
                    e.preventDefault();
                    $('#password-error').show();
                } else {
                    $('#password-error').hide();
                }
            });

            function getUsersCount() {
                $.ajax({
                    url: "user",
                    type: "GET",
                    data: {ajax: "true", type: "count"},
                    success: (res) => {
                        $('#userCount').text(res.count); // Update user count
                        $(".updateTime").text(new Date().toLocaleTimeString()); // Update time
                    },
                    error: (err) => {
                        $('#userCount').text('Error While Fetching Data');
                        $(".updateTime").text(new Date().toLocaleTimeString());
                        console.log(err);
                    }
                });

            }

            function getProductsCount() {
                $.ajax({
                    url: "products",
                    type: "GET",
                    data: {ajax: "true", type: "count"},
                    success: (res) => {
                        $('#productsCount').text(res.count); // Update user count
                        $(".updateTime").text(new Date().toLocaleTimeString()); // Update time
                    },
                    error: (err) => {
                        $('#productsCount').text('Error While Fetching Data');
                        $(".updateTime").text(new Date().toLocaleTimeString());
                        console.log(err);
                    }
                });

            }

            function getOrdersCount() {
                $.ajax({
                    url: "purchase",
                    type: "GET",
                    data: {ajax: "true", type: "count"},
                    success: (res) => {
                        $('#ordersCount').text(res.count); // Update user count
                        $(".updateTime").text(new Date().toLocaleTimeString()); // Update time
                    },
                    error: (err) => {
                        $('#ordersCount').text('Error While Fetching Data');
                        $(".updateTime").text(new Date().toLocaleTimeString());
                        console.log(err);
                    }
                });

            }

            getUsersCount();
            getProductsCount();
            getOrdersCount();

        });
    </script>
    <script>
        $(document).ready(function () {
            function loadCategories() {
                $.ajax({
                    url: "category",
                    type: "GET",
                    dataType: "json",
                    success: (res) => {
                        $('#productCategory').empty()
                        if (res.length === 0) {
                            $('#productCategory').append(`<option disabled selected>No Categories Found</option>`)
                            return;
                        }
                        $('#productCategory').append(`<option disabled selected>Select Category</option>`)

                        res.data.forEach((cat) => {
                            console.log(id, name);
                            $('#productCategory').append(`<option value="${cat.id}">${cat.name}</option>`);
                        });

                    },
                    error: (err) => {
                        $('#productCategory').empty()
                        console.log(err);
                    }
                });
            }

            // loadCategories();
        });
    </script>
    <script src="../assets/js/AlertToast.js"></script>
</body>
</html>
