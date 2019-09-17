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
            function searchInfo(value) {
                name = value;

                var url = "Ajax.jsp?val=" + name;

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('mylocation').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
            request = new XMLHttpRequest();
            function add(value) {
                var food = value;
                //CHange values wfor dynamic
                var cos_id = 1;
                alert(food, cos_id);

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


        <%@include file="../header.jsp" %>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100 myown">
                <div class="searchbar">
                    <span>Search:</span>
                    <input class="search_input" type="text" name="name" placeholder="Enter Text Here"  onfocusin="myFunction()" onkeyup="searchInfo(this.value)">  
                    <a class="search_icon"><i class="fas fa-search"></i></a>
                </div>
            </div>
        </div>
        <div id="mylocation" style="display:none;">
        </div>     
        <%
            String pagemsg = null;
            try {
                pagemsg = request.getParameter("num").toString();

            } catch (Exception ex) {
            }

            /*String myemail = "";
             int resID = -1;
             String msg="";
            
             try {
             resID = (int) session.getAttribute("res");
             myemail = (String) session.getAttribute("email");
             msg=request.getParameter("msg");

             if (myemail == null) {
             response.sendRedirect("../index.jsp");
             }
             } catch (Exception e) {
             response.sendRedirect("../index.jsp");

             }*/%>

        <div class="wrapper" id="wrapper">



            <section class="food__menu__grid__area section-padding--lg">
                <div class="container">
                    <div class="row mt--30">
                        <div class="col-lg-12">
                            <div class="fd__tab__content tab-content" id="nav-tabContent">
                                <!-- Start Single Content -->
                                <div class="food__list__tab__content tab-pane fade show active" id="nav-all" role="tabpanel">
                                    <!-- Start Single Food -->
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                        String str = "";
                                        int Cos_ID = 1;
                                        int Res_ID = 10;

                                        str = "Select * from food where Resturant_ID=? and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=?) order by Food_name limit ? offset ?";
                                        // if (str != "" && str.length() != 0) {
                                        int page_number = 1;
                                        if (pagemsg != null) {
                                            page_number = Integer.parseInt(pagemsg);
                                        }

                                        String strQuery = "select count(*) from food where Resturant_ID=10 and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=1)";
                                        PreparedStatement pas = con.prepareStatement(strQuery);
                                        //pas.setInt(1, Res_ID);
                                        //pas.setInt(2, Cos_ID);
                                        ResultSet ses = pas.executeQuery();
                                        String Countrow = "";

                                        while (ses.next()) {
                                            Countrow = ses.getString(1);

                                        }
                                        ;
                                        int total = Integer.parseInt(Countrow);

                                        int perpage = 3;
                                        int totpage = (int) Math.ceil(total / perpage);
                                        if (!(total % perpage == 0)) {
                                            totpage++;
                                        }

                                        int posit = (page_number - 1) * perpage;
                                        PreparedStatement ps = con.prepareStatement(str);

                                        ps.setInt(1, Res_ID);
                                        ps.setInt(2, Cos_ID);
                                        ps.setInt(4, posit);
                                        ps.setInt(3, perpage);

                                        //ps.setInt(1, resID);
                                        ResultSet rs = ps.executeQuery();

                                        int rowCount = 0;
                                        while (rs.next()) {
                                            rowCount = rs.getRow();
                                            int F_ID = rs.getInt("Food_ID");
                                            String Name = rs.getString("Food_name");
                                            int Price = rs.getInt("Price");
                                            int R_ID = rs.getInt("Resturant_ID");
                                            String Image = rs.getString("Image");
                                    %>

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
                                                <div class="list__btn" >
                                                    <button class="food__btn grey--btn theme--hover" onclick="add(<%=F_ID%>);
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
                                    %>
                                    <!-- End Single Food -->
                                </div>
                                <!-- End Single Content -->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="food__pagination d-flex justify-content-center align-items-center mt--130">
                                <%
                                    if (page_number > 1) {

                                %>
                                <li><a href="menu-list.jsp?num=<%=page_number - 1%>"><i class="zmdi zmdi-chevron-left"></i></a></li>
                                        <%
                                            }
                                            for (int i = 1; i <= totpage; i++) {
                                                if (i == page_number) {
                                        %>   
                                <li class="active"><a href="menu-list.jsp?num=<%=i%>"><%=i%></a></li>
                                    <% } else {


                                    %>
                                <li><a href="menu-list.jsp?num=<%=i%>"><%=i%></a></li>
                                    <%
                                            }
                                        }
                                    %>
                                    <%--    <li><a href="#">...</a></li>
                                        <li><a href="menu_list.jsp?num=<%=totpage%>"><%=(int)totpage%></a></li> --%>

                                <%
                                    if (page_number < totpage) {

                                %>
                                <li><a href="menu-list.jsp?num=<%=page_number + 1%>"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                        <%
                                            }
                                        %>
                            </ul>

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
        <script>
                                                       function myFunction() {
                                                           document.getElementById("wrapper").style.display = "none";
                                                           document.getElementById("mylocation").style.display = "block";
                                                       }

        </script>



    </body>
</html>

