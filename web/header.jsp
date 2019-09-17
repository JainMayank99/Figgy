<%-- 
    Document   : header
    Created on : Sep 10, 2019, 4:44:17 PM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicons -->
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="apple-touch-icon" href="images/icon.png">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/plugins.css">
        <link rel="stylesheet" href="style.css">

        <!-- Cusom css -->
        <link rel="stylesheet" href="css/custom.css">

        <!-- Modernizer js -->
        <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    </head>
</head>
<body>
    <header class="htc__header bg--white">
        <!-- Start Mainmenu Area -->
        <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-sm-4 col-md-6 order-1 order-lg-1">
                        <div class="logo">
                            <a href="index.html">
                                <img src="../images/logo/foody.png" alt="logo images" style="width:200px;height:75%;margin:10px 10px 10px 10%;">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-sm-4 col-md-2 order-3 order-lg-2">
                        <div class="main__menu__wrap">
                            <nav class="main__menu__nav d-none d-lg-block" style="display: block;">
                                <ul class="mainmenu">
                                    <li class="drop"><a href="index.html">Home</a></li>
                                    <li><a href="about-us.html">About</a></li>
                                    <li class="drop"><a href="menu-list.html">Menu</a>
                                        <ul class="dropdown__menu">
                                            <li><a href="menu-list.html">Menu List</a></li>
                                            <li><a href="menu-details.html">Menu Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="gallery.html">Gallery</a></li>
                                    <li class="drop"><a href="blog-mesonry.html">Blog</a>
                                        <ul class="dropdown__menu">
                                            <li><a href="blog-mesonry.html">Blog Mesonry</a></li>
                                            <li><a href="blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li class="drop"><a href="#">Pages</a>
                                        <ul class="dropdown__menu">
                                            <li><a href="service.html">Service</a></li>
                                            <li><a href="cart.html">Cart Page</a></li>
                                            <li><a href="checkout.html">Checkout Page</a></li>
                                            <li><a href="contact.html">Contact Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                    <div class="col-lg-1 col-sm-4 col-md-4 order-2 order-lg-3">
                        <div class="header__right d-flex justify-content-end">
                            <div class="log__in">
                                <a class="accountbox-trigger" href="#"><i class="zmdi zmdi-account-o"></i></a>
                            </div>
                            <div class="shopping__cart">
                                <a class="minicart-trigger" href="#"><i class="zmdi zmdi-shopping-basket"></i></a>
                                <div class="shop__qun">
                                    <span>03</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Menu -->
                <div class="mobile-menu d-block d-lg-none"></div>
                <!-- Mobile Menu -->
            </div>
        </div>
        <!-- End Mainmenu Area -->
    </header>
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/active.js"></script>
</body>
</html>
