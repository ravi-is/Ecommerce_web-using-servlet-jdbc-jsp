<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="pack1.Product" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:400,400i,700,700i">
<style>
    body {
        font-family: 'Muli', sans-serif;
        background: #ddd;
    }
    .shell {
        padding: 80px 0;
    }
    .wsk-cp-product {
        background: #fff;
        padding: 15px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        position: relative;
        margin: 20px auto;
    }
    .wsk-cp-img {
        position: absolute;
        top: 5px;
        left: 50%;
        transform: translate(-50%);
        width: 100%;
        padding: 15px;
        transition: all 0.2s ease-in-out;
    }
    .wsk-cp-img img {
        width: 100%;
        transition: all 0.2s ease-in-out;
        border-radius: 6px;
    }
    .wsk-cp-product:hover .wsk-cp-img {
        top: -40px;
    }
    .wsk-cp-product:hover .wsk-cp-img img {
        box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
    }
    .wsk-cp-text {
        padding-top: 150%;
    }
    .wsk-cp-text .category {
        text-align: center;
        font-size: 12px;
        font-weight: bold;
        padding: 5px;
        margin-bottom: 45px;
        position: relative;
        transition: all 0.2s ease-in-out;
    }
    .wsk-cp-text .category > * {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .wsk-cp-text .category > span {
        padding: 12px 30px;
        border: 1px solid #313131;
        background: #212121;
        color: #fff;
        box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
        border-radius: 27px;
        transition: all 0.05s ease-in-out;
    }
    .wsk-cp-product:hover .wsk-cp-text .category > span {
        border-color: #ddd;
        box-shadow: none;
        padding: 11px 28px;
    }
    .wsk-cp-product:hover .wsk-cp-text .category {
        margin-top: 0px;
    }
    .wsk-cp-text .title-product {
        text-align: center;
    }
    .wsk-cp-text .title-product h3 {
        font-size: 20px;
        font-weight: bold;
        margin: 15px auto;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        width: 100%;
    }
    .wsk-cp-text .description-prod p {
        margin: 0;
    }
    .wsk-cp-text .description-prod {
        text-align: center;
        width: 100%;
        height: 20px;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        margin-bottom: 15px;
        color: #388e3c;
    font-size: 16px;
    letter-spacing: -.2px;
    font-weight: 500;
    }
    .card-footer {
        padding: 25px 0 5px;
        border-top: 1px solid #ddd;
    }
    .card-footer:after, .card-footer:before {
        content: '';
        display: table;
    }
    .card-footer:after {
        clear: both;
    }
    .card-footer .wcf-left {
        float: left;
    }
    .card-footer .wcf-right {
        float: right;
    }
    .price {
        font-size: 18px;
        font-weight: bold;
    }
    a.buy-btn {
        display: block;
        color: #212121;
        text-align: center;
        font-size: 18px;
        width: 35px;
        height: 35px;
        line-height: 35px;
        border-radius: 50%;
        border: 1px solid #212121;
        transition: all 0.2s ease-in-out;
    }
    a.buy-btn:hover, a.buy-btn:active, a.buy-btn:focus {
        border-color: #FF9800;
        background: #FF9800;
        color: #fff;
        text-decoration: none;
    }
    .wsk-btn {
        display: inline-block;
        color: #212121;
        text-align: center;
        font-size: 18px;
        transition: all 0.2s ease-in-out;
        border-color: #FF9800;
        background: #FF9800;
        padding: 12px 30px;
        border-radius: 27px;
        margin: 0 5px;
    }
    .wsk-btn:hover, .wsk-btn:focus, .wsk-btn:active {
        text-decoration: none;
        color: #fff;
    }
    .red {
        color: #F44336;
        font-size: 22px;
        display: inline-block;
        margin: 0 5px;
    }
    @media screen and (max-width: 991px) {
        .wsk-cp-product {
            margin: 40px auto;
        }
        .wsk-cp-product .wsk-cp-img {
            top: -40px;
        }
        .wsk-cp-product .wsk-cp-img img {
            box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
        }
        .wsk-cp-product .wsk-cp-text .category > span {
            border-color: #ddd;
            box-shadow: none;
            padding: 11px 28px;
        }
        .wsk-cp-product .wsk-cp-text .category {
            margin-top: 0px;
        }
        a.buy-btn {
            border-color: #FF9800;
            background: #FF9800;
            color: #fff;
        }
    }
    
</style>
</head>
<body>
<%@ include file="top.jsp" %>

<main>
       <%
            HttpSession s1 = request.getSession(false);
            String username = null;
            if (s1 != null) {
                username = (String) s1.getAttribute("username");
            }
        %>
        <% if (username != null) { %>
            <p class="welcome-message">
               😊 Welcome <%= username %>!
            </p>
             
        <% } %>
        
    </main>
<div class="container text-center">
<p class="welcome-message">
                🛒Products
        </p>
   
</div>
<div class="shell">
    <div class="container">
        <div class="row">
            <%
                // Retrieve the product list from the session
                List<Product> productList = (List<Product>) session.getAttribute("productList");
                if (productList != null) {
                    for (Product product : productList) {
            %>
               <div class="col-md-3">
    <div class="wsk-cp-product">
        <div class="wsk-cp-img">
            <img src="<%= product.getImage() %>" alt="<%= product.getTitle() %>" class="img-responsive" />
        </div>
        <div class="wsk-cp-text">
            
    
            <div class="category">
                <span><%= product.getTitle() %></span>
            </div>
            <div class="description-prod">
                <span class="green"><%= product.getDiscount() %>% off</span>
                 
            </div>
            <div class="card-footer">
                <div class="wcf-left"><span class="price">Rs <%= product.getPrice() %></span></div>
                <div class="wcf-right"><a href="#" class="buy-btn"><i class="zmdi zmdi-shopping-basket"></i></a></div>
            </div>
        </div>
    </div>
</div>
            <%
                    }
                } else {

        %>
            <p class="no-products">No products available.</p>
        <%
            }
        %>
    </div>
</div>
<%@ include file="bottom.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 --%>
 
 
 
 
 
 
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="pack1.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:400,400i,700,700i">

<link rel="stylesheet" type="text/css" href="images_stored/css/bootstrap.css" />
      <!-- font awesome style -->
      <link href="images_stored/css/font-awesome.min.css" rel="stylesheet" />
      <!-- Custom styles for this template -->
      <link href="images_stored/css/style.css" rel="stylesheet" />
      <!-- responsive style -->
      <link href="images_stored/css/responsive.css" rel="stylesheet" />
<style>
    body {
        font-family: 'Muli', sans-serif;
        background: #ddd;
    }
    .shell {
        padding: 80px 0;
    }
    .wsk-cp-product {
        background: #fff;
        padding: 15px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        position: relative;
        margin: 20px auto;
    }
    .wsk-cp-img {
        position: absolute;
        top: 5px;
        left: 50%;
        transform: translate(-50%);
        width: 100%;
        padding: 15px;
        transition: all 0.2s ease-in-out;
    }
    .wsk-cp-img img {
        width: 100%;
        transition: all 0.2s ease-in-out;
        border-radius: 6px;
    }
    .wsk-cp-product:hover .wsk-cp-img {
        top: -40px;
    }
    .wsk-cp-product:hover .wsk-cp-img img {
        box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
    }
    .wsk-cp-text {
        padding-top: 150%;
    }
    .wsk-cp-text .category {
        text-align: center;
        font-size: 12px;
        font-weight: bold;
        padding: 5px;
        margin-bottom: 45px;
        position: relative;
        transition: all 0.2s ease-in-out;
    }
    .wsk-cp-text .category > * {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .wsk-cp-text .category > span {
        padding: 12px 30px;
        border: 1px solid #313131;
        background: #212121;
        color: #fff;
        box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
        border-radius: 27px;
        transition: all 0.05s ease-in-out;
    }
    .wsk-cp-product:hover .wsk-cp-text .category > span {
        border-color: #ddd;
        box-shadow: none;
        padding: 11px 28px;
    }
    .wsk-cp-product:hover .wsk-cp-text .category {
        margin-top: 0px;
    }
    .wsk-cp-text .title-product {
        text-align: center;
    }
    .wsk-cp-text .title-product h3 {
        font-size: 20px;
        font-weight: bold;
        margin: 15px auto;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        width: 100%;
    }
    .wsk-cp-text .description-prod p {
        margin: 0;
    }
    .wsk-cp-text .description-prod {
        text-align: center;
        width: 100%;
        height: 20px;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        margin-bottom: 15px;
        color: #388e3c;
        font-size: 16px;
        letter-spacing: -.2px;
        font-weight: 500;
    }
    .card-footer {
        padding: 25px 0 5px;
        border-top: 1px solid #ddd;
    }
    .card-footer:after, .card-footer:before {
        content: '';
        display: table;
    }
    .card-footer:after {
        clear: both;
    }
    .card-footer .wcf-left {
        float: left;
    }
    .card-footer .wcf-right {
        float: right;
    }
    .price {
        font-size: 18px;
        font-weight: bold;
    }
    a.buy-btn {
        display: block;
        color: #212121;
        text-align: center;
        font-size: 18px;
        width: 35px;
        height: 35px;
        line-height: 35px;
        border-radius: 50%;
        border: 1px solid #212121;
        transition: all 0.2s ease-in-out;
    }
    a.buy-btn:hover, a.buy-btn:active, a.buy-btn:focus {
        border-color: #FF9800;
        background: #FF9800;
        color: #fff;
        text-decoration: none;
    }
    .wsk-btn {
        display: inline-block;
        color: #212121;
        text-align: center;
        font-size: 18px;
        transition: all 0.2s ease-in-out;
        border-color: #FF9800;
        background: #FF9800;
        padding: 12px 30px;
        border-radius: 27px;
        margin: 0 5px;
    }
    .wsk-btn:hover, .wsk-btn:focus, .wsk-btn:active {
        text-decoration: none;
        color: #fff;
    }
    .red {
        color: #F44336;
        font-size: 22px;
        display: inline-block;
        margin: 0 5px;
    }
    @media screen and (max-width: 991px) {
        .wsk-cp-product {
            margin: 40px auto;
        }
        .wsk-cp-product .wsk-cp-img {
            top: -40px;
        }
        .wsk-cp-product .wsk-cp-img img {
            box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
        }
        .wsk-cp-product .wsk-cp-text .category > span {
            border-color: #ddd;
            box-shadow: none;
            padding: 11px 28px;
        }
        .wsk-cp-product .wsk-cp-text .category {
            margin-top: 0px;
        }
        a.buy-btn {
            border-color: #FF9800;
            background: #FF9800;
            color: #fff;
        }
    }
</style>
</head>
<body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg custom_nav-container" class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
          
            <%
            HttpSession s1 = request.getSession(false);
            String username = null;
            if (s1 != null) {
                username = (String) s1.getAttribute("username");
            }
        %>
        <% if (username != null) { %>
            <p class="navbar-brand" class="welcome-message">😊 Welcome <%= username %>!</p>
        <% } %>
        
            <button
                class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
                Menu <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Slider Section -->
    <section class="slider_section ">
        <div class="slider_bg_box">
            <img src="images_stored/images/slider-bg.jpg" alt="">
        </div>
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7 col-lg-6">
                                <div class="detail-box">
                                    <h1>
                                        <span>Sale 20% Off</span><br>On Everything
                                    </h1>
                                    <p>Explicabo esse amet tempora quibusdam laudantium, laborum eaque magnam fugiat hic? Esse dicta aliquid error repudiandae earum suscipit fugiat molestias, veniam, vel architecto veritatis delectus repellat modi impedit sequi.</p>
                                    <div class="btn-box">
                                        <a href="" class="btn1">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7 col-lg-6">
                                <div class="detail-box">
                                    <h1>
                                        <span>Sale 20% Off</span><br>On Everything
                                    </h1>
                                    <p>Explicabo esse amet tempora quibusdam laudantium, laborum eaque magnam fugiat hic? Esse dicta aliquid error repudiandae earum suscipit fugiat molestias, veniam, vel architecto veritatis delectus repellat modi impedit sequi.</p>
                                    <div class="btn-box">
                                        <a href="" class="btn1">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7 col-lg-6">
                                <div class="detail-box">
                                    <h1>
                                        <span>Sale 20% Off</span><br>On Everything
                                    </h1>
                                    <p>Explicabo esse amet tempora quibusdam laudantium, laborum eaque magnam fugiat hic? Esse dicta aliquid error repudiandae earum suscipit fugiat molestias, veniam, vel architecto veritatis delectus repellat modi impedit sequi.</p>
                                    <div class="btn-box">
                                        <a href="" class="btn1">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <ol class="carousel-indicators">
                    <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                    <li data-target="#customCarousel1" data-slide-to="1"></li>
                    <li data-target="#customCarousel1" data-slide-to="2"></li>
                </ol>
            </div>
        </div>
    </section>
    <!-- End Slider Section -->

    <!-- Main Content -->
    <main>
     
        
        <div class="container text-center">
            <p class="welcome-message">🛒Products</p>
        </div>
        <div class="shell">
            <div class="container">
                <div class="row">
                    <%
                        // Retrieve the product list from the session
                        List<Product> productList = (List<Product>) session.getAttribute("productList");
                        if (productList != null) {
                            for (Product product : productList) {
                    %>
                        <div class="col-md-3">
                            <div class="wsk-cp-product">
                                <div class="wsk-cp-img">
                                    <img src="<%= product.getImage() %>" alt="<%= product.getTitle() %>" class="img-responsive" />
                                </div>
                                <div class="wsk-cp-text">
                                    <div class="category">
                                        <span><%= product.getTitle() %></span>
                                    </div>
                                    <div class="description-prod">
                                        <span class="green"><%= product.getDiscount() %>% off</span>
                                    </div>
                                    <div class="card-footer">
                                        <div class="wcf-left"><span class="price">Rs <%= product.getPrice() %></span></div>
                                        <div class="wcf-right"><a href="#" class="buy-btn"><i class="zmdi zmdi-shopping-basket"></i></a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p class="no-products">No products available.</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="bottom.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
     <script src="images_stored/js/scripts.js"></script>
</body>
</html>
