<%-- 
    Document   : header
    Created on : Sep 10, 2019, 4:44:17 PM
    Author     : saru
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicons 
        <link rel="shortcut icon" href="images/favicon.ico">
        <link rel="apple-touch-icon" href="images/icon.png">-->

        <!-- Stylesheets 
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/plugins.css">
        <link rel="stylesheet" href="style.css">-->

        <!-- Cusom css 
        <link rel="stylesheet" href="css/custom.css">-->

        <!-- Modernizer js
        <script src="js/vendor/modernizr-3.5.0.min.js"></script>-->
        <style>
            .main-photo{
                background-color: black;
            }
        </style>
    </head>
</head>
<body>
    
    <header class="htc__header bg--white" style="position:sticky; top:0;z-index: 1001">
        <!-- Start Mainmenu Area -->
        <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-sm-4 col-md-6 order-1 order-lg-1">
                        <div class="logo" >
                            
                            <a href="../index.html">
                               
                               <img  src="../images/logo/foody.png" alt="logo images" style="position: absolute;width:170px;height:auto;
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
                                    <li class="drop"><a href="../index.jsp">Home</a></li>
                                    <li><a href="../AboutUs/AboutUs.jsp">About</a></li>
                                    <li class="drop"><a href="../Resturant-List/Resturant-List.jsp">Restaurant List</a></li>
                                   <!-- <li class="drop"><a href="../menu-list.html">Menu</a>
                                        <ul class="dropdown__menu">
                                            <li><a href="menu-item/menu-list.jsp">Menu List</a></li>
                                        </ul>
                                    </li>-->
                                    
                                    <li><a href="OrderHistory/orderhistory.jsp">History</a></li>
                                    <li class="drop"><a  href="../cart/cart.jsp">Cart Page</a>
                                       <!-- <ul class="dropdown__menu">
                                            <li><a href="../service/service.jsp">Service</a></li>
                                            <li><a href="../cart/cart.jsp">Cart Page</a></li>
                                            <li><a href="../contact/contact.jsp">Contact Page</a></li>
                                        </ul> -->
                                    </li>
                                    <li><a href="../logout.jsp">Logout</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                    <div class="col-lg-1 col-sm-4 col-md-4 order-2 order-lg-3">
                        <div class="header__right d-flex justify-content-end">
                            <div class="log__in">
                                <a  target="_self" href="../Login/login.jsp"><i class="zmdi zmdi-account-o"></i></a>
                            </div>
                            <div class="shopping__cart">
                                <a  target="_self" href="../cart/cart.jsp" ><i class="zmdi zmdi-shopping-basket"></i></a>
                                <div class="shop__qun">
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection pon = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                         String strin = "Select Count(*) from customer_cart where Status=1 and Customer_ID=?";

                                    //preparing str called ps
                                        PreparedStatement prea = pon.prepareStatement(strin);
                                        prea.setInt(1,(Integer)session.getAttribute("id"));
                                        
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
   <!-- <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/active.js"></script>-->
</body>
</html>
