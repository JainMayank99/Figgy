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
        <!-- Page Description -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu-List</title>
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
            // Ajax call to Asynchronously searching of element from search bar 
            function searchInfo(value, res) {

                //value = The value to be searched , res = The resturant ID
                name = value;
                resid = res;

                //Call to Ajax.jsp
                var url = "Ajax.jsp?val=" + name + "&resid=" + resid;
                

                //Returns the output of Ajax.jsp to 'mylocation' 
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
            // Ajax call to Asynchronously ADD element to cart
            function add(value, cos) {

                var food = value;
                var cos_id = cos;
                //food = menu-item-id , cos_id = Costumer_id
                alert(food +" " + cos); 


                //Call to pushcartAjax.jsp
                var url = "../cart/pushcartAjax.jsp?food=" + food + "&cos=" + cos_id;

                //Returns the output of pushcartAjax.jsp  
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
        <%
            /*
             if the user is in not in session 
             alert you have not loged in and 
             redirect to login page
             else
             set SessionID= user session ID and 
             display session id
            
             */
            Integer SessionId=(Integer)session.getAttribute("id");
            try {
                if (session.getAttribute("id") != null) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(" + session.getAttribute("id") + ")");
                    out.println("</script>");

                    

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have not signed in.');");
                    out.println("location='../Login/login.jsp';");
                    out.println("</script>");

                }
            } catch (Exception e) {
            }

            /*
            
             pagemsg= gets the page number of current page ...  Used for pagination
             resID= resturantID used to identify the respective menu list
             Both parameters are got from the URL
            
             if resid == -1 then rediredcted to Resturant-List.jsp
            
             */
            int pagemsg = 0;
            int resID = -1;

            try {
                pagemsg = Integer.parseInt(request.getParameter("num"));
                resID = Integer.parseInt(request.getParameter("res"));
                if (resID == -1) {
                    response.sendRedirect("../Resturant-List/Resturant-List.jsp");
                }
            } catch (Exception ex) {
            }

        %>

        <!--
            Navigation bar Configured at header.jsp
        -->
        <%@include file="../header.jsp" %>


        <!--
            Search Input Field For Ajax call to myFunction() and searchInfo()
            myFunction() expands the search bar when in focus
            searchInfo(this.value,<Res_ID>) Asynchronous call to search for menu items 
            
            <Res_ID>= Resturant_ID
            this.value= the value being typed in the search input field
        -->
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100 myown">
                <div class="searchbar">
                    <span>Search:</span>
                    <input class="search_input" type="text" name="name" placeholder="Enter Text Here"  onfocusin="myFunction()" onkeyup="searchInfo(this.value,<%=resID%>)">  
                    <a class="search_icon"><i class="fas fa-search"></i></a>
                </div>
            </div>
        </div>


        <!--
            Output of Ajax call to  Ajax.jsp is Asynchronously displayed here 
        -->
        <div id="mylocation" style="display:none;">
        </div>     



        <!--
           Start of Wrapper Class
        -->
        <div class="wrapper" id="wrapper">

            <!-- Start section -->   
            <section class="food__menu__grid__area section-padding--lg">

                <!--Start Wraping All the elements inside a container--> 
                <div class="container">
                    <div class="row mt--30">
                        <div class="col-lg-12">
                            <div class="fd__tab__content tab-content" id="nav-tabContent">
                                <!-- Start Single Content -->
                                <div class="food__list__tab__content tab-pane fade show active" id="nav-all" role="tabpanel">
                                    <!-- Start Single Food -->
                                    <%
                                        //Establishing a connection with the database figgy
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");

                                        //Initizization
                                        String str = "";
                                        int Cos_ID = SessionId;
                                        int Res_ID = resID;
                                        int page_number = pagemsg;
                                        String Countrow = "";
                                        int rowCount = 0;

                                        //Query to list all the food items in a particular Resturant where the food item must not be in coustomer cart having limit and offset
                                        str = "Select * from food where Resturant_ID=? and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=?) order by Food_name limit ? offset ?";
                                        // if (str != "" && str.length() != 0) {

                                        //Query to count all the food items in a particular Resturant where the food item must not be in coustomer cart
                                        String strQuery = "select count(*) from food where Resturant_ID=? and Food_ID NOT IN (Select Food_ID from customer_cart where Status=1 and Customer_ID=?)";

                                        //preparing strQuery called pas by passing Resturant_ID at 1 and Cosutermer_ID at 2 
                                        PreparedStatement pas = con.prepareStatement(strQuery);
                                        pas.setInt(1, Res_ID);
                                        pas.setInt(2, Cos_ID);

                                        //Excecuting the prepared statement=pas of query=strQuery
                                        ResultSet ses = pas.executeQuery();

                                        while (ses.next()) {
                                            //count of food items in a particular Resturant where the food item must not be in coustomer cart 
                                            Countrow = ses.getString(1);

                                        }

                                        //converting String to Integer
                                        int total = Integer.parseInt(Countrow);

                                        //Formula for pagination starts here
                                        /*
                                         perpage=the number of items per page
                                         totpage=calculates the total number of pages
                                         posit=number of items to skip before starting to count 
                                        
                                         */
                                        int perpage = 3;
                                        int totpage = (int) Math.ceil(total / perpage);
                                        if (!(total % perpage == 0)) {
                                            totpage++;
                                        }
                                        int posit = (page_number - 1) * perpage;

                                        //preparing str called ps by passing Resturant_ID at 1 and Cosutermer_ID at 2 Limit at 3 and Offset at 4
                                        PreparedStatement ps = con.prepareStatement(str);
                                        ps.setInt(1, Res_ID);
                                        ps.setInt(2, Cos_ID);
                                        ps.setInt(4, posit);
                                        ps.setInt(3, perpage);

                                        //Excecuting the prepared statement=ps of query=str
                                        ResultSet rs = ps.executeQuery();

                                        while (rs.next()) {
                                            //Food_ID,Food_name,Price,Resturant_ID,Image are selected from database figgy of query=str
                                            rowCount = rs.getRow();
                                            int F_ID = rs.getInt("Food_ID");
                                            String Name = rs.getString("Food_name");
                                            int Price = rs.getInt("Price");
                                            int R_ID = rs.getInt("Resturant_ID");
                                            String Image = rs.getString("Image");


                                    %>

                                    <!-- Start of Menu-Item -->
                                    <div class="single__food__list d-flex wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">  
                                        <!--
                                            The start of left part which cantains
                                            Image Component
                                            src=Image url                                         
                                        -->
                                        <div class="food__list__thumb">
                                            <a>
                                                <img src="<%=Image%>" alt="list food images">
                                            </a>
                                        </div>
                                        <!--
                                            The end of left part which contains
                                            Image Component  
                                        -->

                                        <!-- 
                                            The start Right part which contains
                                            Price
                                            Ratings
                                            Food_name
                                            Small Content 
                                            Add to cart button
                                        -->
                                        <div class="food__list__inner d-flex align-items-center justify-content-between">
                                            <div class="food__list__details">
                                                <!-- 
                                                    Menu-Item Name
                                                -->                                               
                                                <h2><a ><%=Name%></a></h2>

                                                <!--
                                                   Content For Menu-Item 
                                                -->
                                                <p>Lorem ipsum dolor sit aLorem ipsum dolor sit amet, consectetu adipis cing elit, sed do eiusmod tempor incididunt ut labore et dolmagna aliqua. enim ad minim veniam, quis nomagni dolores eos qnumquam.</p>

                                                <!--
                                                    Add to cart button
                                                    Button is disabled on click and 
                                                    Its innerHTML is changed to 'ADDED TO CART'
                                                    add(<F_ID,Cos_ID) is called on clicked
                                                    add() is an Ajax function which adds to cart asynchronously
                                                    F_ID= menu-list-food ID 
                                                    Cos_ID=Coustomer ID
                                                -->
                                                <div class="list__btn" >
                                                    <button class="food__btn grey--btn theme--hover" onclick="add(<%=F_ID%>,<%=session.getAttribute("id")%>);
                                                            this.disabled = true;
                                                            this.innerHTML = 'Added To Cart';" id="added" style="border: none;">Order Now</button>
                                                </div>
                                            </div>
                                            <!-- End of content, image , add to cart button -->               

                                            <!--Start of Price and Rating -->
                                            <div class="food__rating">
                                                <!--
                                                    Price of Food
                                                -->
                                                <div class="list__food__prize">
                                                    <span>&#x20b9 <%=Price%></span>
                                                </div>

                                                <!--
                                                    Rating of Food Item
                                                    <i class="zmdi zmdi-star"></i> gives out of a colored star
                                                    <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li> gives greyed out star     
                                                -->
                                                <ul class="rating">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                                </ul>

                                            </div>
                                            <!--End of Price and Rating -->
                                        </div>
                                        <!-- 
                                            The end of Right part which contains
                                            Price
                                            Ratings
                                            Food_name
                                            Small Content 
                                            Add to cart button
                                        -->
                                    </div>
                                    <!--End of menu Item -->
                                    <%
                                        }
                                    %>
                                    <!-- End Single Food -->
                                </div>
                                <!-- End Single Content -->
                            </div>
                        </div>
                    </div>
                    <!--
                    Start Pagination
                    -->
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="food__pagination d-flex justify-content-center align-items-center mt--130">
                                <%
                                    //Check if page number is greater than if it is display back Sign so that coustomer can visit previous page
                                    if (page_number > 1) {

                                %>
                                <li><a href="menu-list.jsp?num=<%=page_number - 1%>&res=<%=resID%>"><i class="zmdi zmdi-chevron-left"></i></a></li>
                                        <%
                                            }

                                            //A for loop to display all the pages present which is clickable and coustomer is redirected to that page
                                            for (int i = 1; i <= totpage; i++) {

                                                //if current page number matches with i a black circle encloses the ith page number 
                                                if (i == page_number) {
                                        %>   
                                <li class="active"><a href="menu-list.jsp?num=<%=i%>&res=<%=resID%>"><%=i%></a></li>
                                    <% } else {
                                        //else it is displayed normally
%>
                                <li><a href="menu-list.jsp?num=<%=i%>&res=<%=resID%>"><%=i%></a></li>
                                    <%
                                            }
                                        }
                                    %>


                                <%
                                    //Check if page number is less than total pages if it is display forward Sign so that coustomer can visit next page
                                    if (page_number < totpage) {

                                %>
                                <li><a href="menu-list.jsp?num=<%=page_number + 1%>&res=<%=resID%>"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                        <%
                                            }
                                        %>
                            </ul>
                        </div>
                    </div> 
                    <!--
                        End Pagination
                    -->
                </div>
                <!--End Wraping All the elements inside a container-->
            </section>
            <!-- End section -->                
        </div>
        <!--
           End of Wrapper Class
        -->
        
        <%@include file="../footer.jsp" %>

        <!--
           Linking the script tags
        -->
        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/active.js"></script>
        <script>
                                                        // myFunction() displays 'mylocation' and hides 'wrapper' when triggered
                                                        function myFunction() {
                                                            document.getElementById("wrapper").style.display = "none";
                                                            document.getElementById("mylocation").style.display = "block";
                                                        }
        </script>
        
    </body>
</html>

