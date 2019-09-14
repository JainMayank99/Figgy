
<%-- 
   Document   : Ajax
   Created on : Sep 14, 2019, 6:24:45 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta charset="utf-8">

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicons -->
        <link rel="shortcut icon" href="../images/favicon.ico">
        <link rel="apple-touch-icon" href="../images/icon.png">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/plugins.css">
        <link rel="stylesheet" href="../style.css">

        <!-- Cusom css -->
        <link rel="stylesheet" href="../css/custom.css">

        <!-- Modernizer js -->
        <script src="../js/vendor/modernizr-3.5.0.min.js"></script>
    </head>
    <body>

        <div class="wrapper" id="wrapper">
            <section class="food__menu__grid__area section-padding--lg">
                <div class="container">
                    <div class="row mt--30">
                        <div class="col-lg-12">
                            <div class="fd__tab__content tab-content" id="nav-tabContent">
                                <!-- Start Single Content -->
                                <div class="food__list__tab__content tab-pane fade show active" id="nav-all" role="tabpanel">
                                    <%
                                        String name = "";
                                        name = request.getParameter("val");
                                        System.out.println(name);
                                        if (name == null || name.trim().equals("")) {
                                            out.print("<center><p>Enter Item to be searched</p><br><center>");
                                            out.print("<center><p style='text-decoration: underline;'><b>OR</b></p><br><center>");
                                            out.print("<center><a class='btn btn-primary' target='_blank' href='menu-list.jsp'>Search For ALL</a><center>");
                                        } else {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String str = "";
                                            int rowCount;

                                            name = name.toLowerCase();

                                            str = "Select * from food where Resturant_ID=10 and lower(Food_name) like '" + name + "%'";

                                            PreparedStatement ps = con.prepareStatement(str);

                                            System.out.println(ps);
                                            ResultSet rs = ps.executeQuery();
                                            if (!rs.isBeforeFirst()) {
                                                out.println("<center><p>No Record Found!</p></center>");
                                            } else {
                                                while (rs.next()) {
                                                    rowCount = rs.getRow();
                                                    int F_ID = rs.getInt("Food_ID");
                                                    String Name = rs.getString("Food_name");
                                                    int Price = rs.getInt("Price");
                                                    int R_ID = rs.getInt("Resturant_ID");
                                                    String Image = rs.getString("Image");
                                    %>


                                    <%--
                                    Start food
                                    --%>
                                    <div class="single__food__list d-flex wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                                        <div class="food__list__thumb">
                                            <a href="menu-details.html">
                                                <img src="<%=Image%>" alt="list food images">
                                            </a>
                                        </div>
                                        <div class="food__list__inner d-flex align-items-center justify-content-between">
                                            <div class="food__list__details">
                                                <h2><a href="menu-details.html"><%=Name%></a></h2>
                                                <p>Lorem ipsum dolor sit aLorem ipsum dolor sit amet, consectetu adipis cing elit, sed do eiusmod tempor incididunt ut labore et dolmagna aliqua. enim ad minim veniam, quis nomagni dolores eos qnumquam.</p>
                                                <div class="list__btn">
                                                    <a class="food__btn grey--btn theme--hover" href="menu-details.html">Order Now</a>
                                                </div>
                                            </div>
                                            <div class="food__rating">
                                                <div class="list__food__prize">
                                                    <span>&#x20b9 <%=Price%></span>
                                                </div>
                                                <ul class="rating">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>


                                    <%

                                                }

                                            }//end of else for rs.isBeforeFirst  
                                            con.close();
                                        }

                                        //}catch(Exception e){out.print(e);}

                                    %>

                                </div>
                                <!-- End Single Content -->
                            </div>
                        </div>
                    </div>
                </div>
            </section> 
        </div>
        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/active.js"></script>
    </body>
</html>
