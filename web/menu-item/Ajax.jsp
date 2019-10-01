
<%-- 
   Document   : Ajax
   Created on : Sep 14, 2019, 6:24:45 AM
   Author     : saru
--%>
<%--
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
                                            int Rest_ID=10;
                                            int Cost_ID=1; 

                                            str = "Select * from food where Resturant_ID=? and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=?) and lower(Food_name) like '" + name + "%'";

                                            PreparedStatement ps = con.prepareStatement(str);
                                            ps.setInt(1, Rest_ID);
                                            ps.setInt(2, Cost_ID);

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


                                   
                                    Start food
                                    
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
%-->

<%-- 
    Document   : menu-list
    Created on : Sep 10, 2019, 3:49:31 PM
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
        <link rel="stylesheet" href="menu-list.css">
        <link rel="stylesheet" href="../css/plugins.css">
        <link rel="stylesheet" href="../style.css">

        <!-- Cusom css -->
        <link rel="stylesheet" href="../css/custom.css">

        <!-- Modernizer js -->
        <script src="../js/vendor/modernizr-3.5.0.min.js"></script>
        <script>

            var request = new XMLHttpRequest();
            function add(value) {
                var food = value;
                //CHange values wfor dynamic
                var cos_id = 1;


                var url = "../cart/pushcartAjax.jsp?food=" + food + "&cos=" + cos_id;

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            // var val = request.responseText;
                            //document.getElementById('para').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }





        </script>




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
                                        int res = -1;
                                        res = Integer.parseInt(request.getParameter("resid"));
                                        System.out.println(name);
                                        if (name == null || name.trim().equals("")) {
                                            out.print("<center><p>Enter Item to be searched</p><br><center>");
                                            out.print("<center><p style='text-decoration: underline;'><b>OR</b></p><br><center>");
                                            out.print("<center><a class='btn btn-primary'  href='menu-list.jsp?num=1&res="+res+"'>Search For ALL</a><center>");
                                        } else {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String str = "";
                                            int rowCount;

                                            name = name.toLowerCase();
                                            int Rest_ID = res;
                                            int Cost_ID = (Integer)session.getAttribute("id");

                                            str = "Select * from food where Resturant_ID=? and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=?) and lower(Food_name) like '" + name + "%'";

                                            PreparedStatement ps = con.prepareStatement(str);
                                            ps.setInt(1, Rest_ID);
                                            ps.setInt(2, Cost_ID);

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
                                                    <button class="food__btn grey--btn theme--hover" onclick="add(<%=F_ID%>,<%=Cost_ID%>);
                                                            this.disabled = true;
                                                            this.innerHTML = 'Added To Cart';" id="added" style="border: none;">Order Now</button>
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
            </section></div>









        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/active.js"></script>
        <script>
                                                        function myFunction() {
                                                            document.getElementById("wrapper").style.display = "none";
                                                            document.getElementById("mylocation").style.display = "block";
                                                        }

        </script>



    </body>
</html>

