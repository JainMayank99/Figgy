
<%--
    Document   : index
    Created on : Sep 14, 2019, 4:30:38 PM
    Author     : saru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    
    <body>
        <%  Integer SessionId=-1;
            try{
               
            if (session.getAttribute("id") != null)
         {
            out.println("<script type=\"text/javascript\">");
             out.println("alert("+session.getAttribute("id")+")");
            
             out.println("</script>");
              SessionId=(Integer)session.getAttribute("id");
             
            
             
             
         }
        else
        {
             out.println("<script type=\"text/javascript\">");
             out.println("alert('You have not signed in.');");
             out.println("location='Login/login.jsp';");
             out.println("</script>");
            
        }
            }catch(Exception e){
                //response.sendRedirect("Login/login.jsp");
            }
        %>

        <div class="wrapper" id="wrapper">
            <header class="htc__header bg--white" style="position:sticky; top:0;z-index: 1001;">
        <!-- Start Mainmenu Area -->
        <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-sm-4 col-md-6 order-1 order-lg-1">
                        <div class="logo">
                            <a href="index.html">
                               <img  src="images/logo/foody.png" alt="logo images" style="position: absolute;width:170px;height:auto;
                                     border-radius: 40px">
                                <div class="shade" style="position:relative;top:0;left:0;width: 300px;height:100%;
                                 background-image:linear-gradient(rgba(0,0,0,0.15),rgba(0,0,0,0.15));
                                 z-index: 2002;
                                 "></div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-sm-4 col-md-2 order-3 order-lg-2">
                        <div class="main__menu__wrap">
                            <nav class="main__menu__nav d-none d-lg-block" style="display: block;">
                                <ul class="mainmenu">
                                    <li class="drop"><a href="index.jsp">Home</a></li>
                                    <li><a href="AboutUs/AboutUs.jsp">About</a></li>
                                    <li class="drop"><a href="Resturant-List/Resturant-List.jsp">Restaurant List</a></li>
                                    <li><a href="OrderHistory/orderhistory.jsp">History</a></li>
                                    <!--<li class="drop"><a href="menu-list.html">Menu</a>
                                        <ul class="dropdown__menu">
                                            <li><a href="menu-item/menu-list.jsp">Menu List</a></li>
                                        </ul>
                                    </li>-->
                                    
                                    
                                    <li class="drop"><a  href="cart/cart.jsp">Cart Page</a>
                                      <!--  <ul class="dropdown__menu">
                                            <li><a href="service/service.jsp">Service</a></li>
                                            <li><a href="cart/cart.jsp">Cart Page</a></li>
                                            <li><a href="contact/contact.jsp">Contact Page</a></li>
                                        </ul>-->
                                    </li>
                                    <li><a href="logout.jsp">Logout</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                    <div class="col-lg-1 col-sm-4 col-md-4 order-2 order-lg-3">
                        <div class="header__right d-flex justify-content-end">
                            <div class="log__in">
                                <a class="accountbox-trigger" href="Login/login.jsp"><i class="zmdi zmdi-account-o"></i></a>
                            </div>
                            <div class="shopping__cart">
                                <a class="minicart-trigger" href="cart/cart.jsp"><i class="zmdi zmdi-shopping-basket"></i></a>
                                <div class="shop__qun">
                                     <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection pon = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                        String strin = "Select Count(*) from customer_cart where Status=1 and Customer_ID=?";

                                    //preparing str called ps
                                        PreparedStatement prea = pon.prepareStatement(strin);
                                        
                                        prea.setInt(1,SessionId);
                                        
                                        ResultSet rse = prea.executeQuery();
                                        
                                        int count1=0;
                                        while(rse.next())
                                        {
                                           count1=Integer.parseInt(rse.getString(1));
                                        

                                        
                                        %>
                                            
                                    <span><%=count1%></span>
                                    
                                    <%
                                        }
                                           %>
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
            </header>
            <div class="slider__area slider--one">
                <div class="slider__activation--1">
                    <!-- Start Single Slide -->
                    <div class="slide fullscreen bg-image--1" style="background-attachment: fixed;">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="slider__content">
                                        <div class="slider__inner">
                                            <h2 style=" -webkit-text-stroke: 1px black;opacity: 1;background-color: transparent;" >--FIGGY--</h2>
                                            <h1 style="color:black; opacity: 1;-webkit-text-stroke: 1px grey;">Online Food Ordering</h1>
                                            <div class="slider__input">
                                                <!--<input type="text" placeholder="Type Place, City.Division">-->
                                               <!--<form action="menu-item/Ajax.jsp" method="get" id="form1">
                                                    <input class="res__search" type="text" name="val" placeholder="Restaurant">
                                                </form> -->
                                                <div class="src__btn">
                                                    <a href="Resturant-List/Resturant-List.jsp" <!--onclick="document.getElementById('form1').submit();" -->Search For Restaurant</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Slide -->
                </div>
            </div>

            <section class="fd__service__area bg-image--2 section-padding--xlg">
                <div class="container">
                    <div class="service__wrapper bg--white">
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="section__title service__align--left">
                                    <p>The process of our service</p>
                                    <h2 class="title__line">How it work</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row mt--30">
                            <!-- Start Single Service -->
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div class="service">
                                    <div class="service__title">
                                        <div class="ser__icon">
                                            <img src="images/icon/color-icon/1.png" alt="icon image">
                                        </div>
                                        <h2><a href="Resturant-List/Resturant-List.jsp">Choose restaurant</a></h2>
                                    </div>
                                    <div class="service__details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Service -->
                            <!-- Start Single Service -->
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div class="service">
                                    <div class="service__title">
                                        <div class="ser__icon">
                                            <img src="images/icon/color-icon/2.png" alt="icon image">
                                        </div>
                                        <h2><a href="cart/cart.jsp">Add Items To Your Cart</a></h2>
                                    </div>
                                    <div class="service__details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Service -->
                            <!-- Start Single Service -->
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div class="service">
                                    <div class="service__title">
                                        <div class="ser__icon">
                                            <img src="images/icon/color-icon/3.png" alt="icon image">
                                        </div>
                                        <h2><a href="">Place Order</a></h2>
                                    </div>
                                    <div class="service__details">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Service -->
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- Start Footer Area -->
        <footer class="footer__area footer--1">
            <div class="footer__wrapper bg__cat--1 section-padding--lg">
                <div class="container">
                    <div class="row">
                        <!-- Start Single Footer -->
                        <div class="col-md-6 col-lg-3 col-sm-12">
                            <div class="footer">
                                <h2 class="ftr__title">About Figgy</h2>
                                <div class="footer__inner">
                                    <div class="ftr__details">
                                        <p>Lorem ipsum dolor sit amconsectetur adipisicing elit,</p>
                                        <div class="ftr__address__inner">
                                            <div class="ftr__address">
                                                <div class="ftr__address__icon">
                                                    <i class="zmdi zmdi-home"></i>
                                                </div>
                                                <div class="frt__address__details">
                                                    <p>Yelahanka-Bangalore-India,560097</p>
                                                </div>
                                            </div>
                                            <div class="ftr__address">
                                                <div class="ftr__address__icon">
                                                    <i class="zmdi zmdi-phone"></i>
                                                </div>
                                                <div class="frt__address__details">
                                                    <p><a href="#">+088 01673-453290</a></p>
                                                    <p><a href="#">+088 01773-458290</a></p>
                                                </div>
                                            </div>
                                            <div class="ftr__address">
                                                <div class="ftr__address__icon">
                                                    <i class="zmdi zmdi-email"></i>
                                                </div>
                                                <div class="frt__address__details">
                                                    <p><a href="#">Figgy@email.com</a></p>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="social__icon">
                                            <li><a href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                            <li><a href="#"><i class="zmdi zmdi-google"></i></a></li>
                                            <li><a href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                            <li><a href="#"><i class="zmdi zmdi-rss"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer -->
                        <!-- Start Single Footer -->
                        <div class="col-md-6 col-lg-3 col-sm-12 sm--mt--40">
                            <div class="footer gallery">
                                <h2 class="ftr__title">Our Gallery</h2>
                                <div class="footer__inner">
                                    <ul class="sm__gallery__list">
                                        <li><a href="#"><img src="images/gallery/sm-img/1.jpg" alt="gallery images"></a></li>
                                        <li><a href="#"><img src="images/gallery/sm-img/2.jpg" alt="gallery images"></a></li>
                                        <li><a href="#"><img src="images/gallery/sm-img/3.jpg" alt="gallery images"></a></li>
                                        <li><a href="#"><img src="images/gallery/sm-img/4.jpg" alt="gallery images"></a></li>
                                        <li><a href="#"><img src="images/gallery/sm-img/5.jpg" alt="gallery images"></a></li>
                                        <li><a href="#"><img src="images/gallery/sm-img/6.jpg" alt="gallery images"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer -->
                        <!-- Start Single Footer -->
                        <div class="col-md-6 col-lg-3 col-sm-12 md--mt--40 sm--mt--40">
                            <div class="footer">
                                <h2 class="ftr__title">Opening Time</h2>
                                <div class="footer__inner">
                                    <ul class="opening__time__list">
                                        <li>Saturday<span>.......</span>9am to 11pm</li>
                                        <li>Sunday<span>.......</span>9am to 11pm</li>
                                        <li>Monday<span>.......</span>9am to 11pm</li>
                                        <li>Tuesday<span>.......</span>9am to 11pm</li>
                                        <li>Wednesday<span>.......</span>9am to 11pm</li>
                                        <li>Thursday<span>.......</span>9am to 11pm</li>
                                        <li>Friday<span>.......</span>9am to 11pm</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer -->
                        <!-- Start Single Footer -->
                        <div class="col-md-6 col-lg-3 col-sm-12 md--mt--40 sm--mt--40">
                            <div class="footer">
                                <h2 class="ftr__title">Latest Post</h2>
                                <div class="footer__inner">
                                    <div class="lst__post__list">
                                        <div class="single__sm__post">
                                            <div class="sin__post__thumb">
                                                <a href="blog-details,html">
                                                    <img src="images/blog/sm-img/1.jpg" alt="blog images">
                                                </a>
                                            </div>
                                            <div class="sin__post__details">
                                                <h6><a href="blog-details.html">Chicken Shawarma </a></h6>
                                                <p>Lordo loram consecte turadip isicing</p>
                                            </div>
                                        </div>
                                        <div class="single__sm__post">
                                            <div class="sin__post__thumb">
                                                <a href="blog-details,html">
                                                    <img src="images/blog/sm-img/2.jpg" alt="blog images">
                                                </a>
                                            </div>
                                            <div class="sin__post__details">
                                                <h6><a href="blog-details.html">Fruits Desert</a></h6>
                                                <p>Lordo loramcon secte turadipi sicing</p>
                                            </div>
                                        </div>
                                        <div class="single__sm__post">
                                            <div class="sin__post__thumb">
                                                <a href="blog-details,html">
                                                    <img src="images/blog/sm-img/3.jpg" alt="blog images">
                                                </a>
                                            </div>
                                            <div class="sin__post__details">
                                                <h6><a href="blog-details.html">Vanilla Pastry</a></h6>
                                                <p>Lordo loramcon secte turadip isicing</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer -->
                    </div>
                </div>
            </div>
            <div class="copyright bg--theme">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="copyright__inner">
                                <div class="cpy__right--left">
                                  
                                </div>
                                <div class="cpy__right--right">
                                    <a href="#">
                                        <img src="images/icon/shape/2.png" alt="payment images">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer Area -->
    </body>
</html>
