<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Category" %>
<%@ page import="lk.ijse.ecommercewebapp.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
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
                    <button type="button" class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#categoryModal">
                        <i class="bi bi-plus-circle"></i> Add Category
                    </button>
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#productModal">
                        <i class="bi bi-plus-circle"></i> Add Product
                    </button>
                    <li class="nav-item"><a class="nav-link" href="users.jsp">Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<%
    String alert = request.getParameter("alert");
    if (alert != null) {
        String status = request.getParameter("status");
        String alertClass = status.equals("success") ? "alert-success" : "alert-warning";
%>
<div class="alert <%=alertClass%> alert-dismissible fade show position-absolute start-50 translate-middle-x" role="alert" style="top: 60px">
    <%= alert %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
    }
%>

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
                        <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter category name" required>
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
                        <input type="text" class="form-control" id="productName" name="name" placeholder="Enter product name" required>
                    </div>
                    <!-- Description -->
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescription" name="description" rows="3" placeholder="Enter product description"></textarea>
                    </div>
                    <!-- Price -->
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="price" placeholder="Enter price" step="0.00" required>
                    </div>

                    <div class="d-flex flex-row mb-3 align-items-end">
                        <!-- Qty -->
                        <div class="w-25">
                            <label for="productQty" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="productQty" name="qty" placeholder="Enter Quantity" value="1" required>
                        </div>

                        <!-- Category -->
                        <div class="w-50">
                            <label for="productCategory" class="form-label">Category</label>
                            <select class="form-select" id="productCategory" name="productCategory" required>
                                <option selected disabled>Select category</option>
                                <option value="1">Chairs</option>
                                <option value="2">Beds</option>
                                <option value="3">Dining Tables</option>
                                <%
                                    List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
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
                        <input type="file" class="form-control" id="productImage" name="image" accept="image/*" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button id="btnSaveProduct" type="submit" class="btn btn-primary">Save Product</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
