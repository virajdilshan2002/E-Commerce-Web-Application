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
<%
    String username = request.getParameter("username");
    String role = request.getParameter("role");

    if (role != null && username != null) {
%>
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
    <h2 class="mb-4">Products</h2>
    <%--category buttons--%>
    <div class="d-grid gap-2 d-md-block">
        <a class="btn btn-primary" href="#cat1">Button1</a>
        <a class="btn btn-primary" href="#cat2" >Button2</a>
        <a class="btn btn-primary" href="#cat3" >Button3</a>
    </div>

    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search by name" id="search-bar">
        <button class="btn btn-primary" type="button">Search</button>
    </div>

    <h2 class="mb-4">Cat1</h2>
    <div id="cat1" class="row">
        <!-- Product Card 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Card 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <h2 class="mb-4">Cat2</h2>
    <div id="cat2" class="row">
        <!-- Product Card 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Card 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <h2 class="mb-4">Cat3</h2>
    <div id="cat3" class="row">
        <!-- Product Card 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Card 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="../assets/images/img.png" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Smartphone</h5>
                    <p class="card-text">Category: Electronics</p>
                    <p class="card-text">Price: $699</p>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" >Quantity</span>
                        <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="1">
                        <button class="btn btn-success">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
