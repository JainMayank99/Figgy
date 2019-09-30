<%-- 
    Document   : Resturant-List
    Created on : Sep 17, 2019, 11:24:15 AM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        
       

       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Resturant-List.css">
        <link rel="stylesheet" href="../css/plugins.css">
        <script>
            var request = new XMLHttpRequest();
            function func(Dir, SortID, id) {

                alert(Dir);

                var url = "Resturant-List.jsp?SortID=" + SortID + "&Dir=" + Dir;

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('myloca').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
        </script>
        <style>
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -1px;
            }
        </style>
    </head>
    <body>
        <!-- <div class="container h-100">
            <div class="d-flex justify-content-center h-100 myown">
                <div class="searchbar">
                    <span>Search:</span>
                    <input class="search_input" type="text" name="name" placeholder="Enter Text Here"  onfocusin="myFunction()" onkeyup="searchInfo(this.value)">  
                    <a class="search_icon"><i class="fas fa-search"></i></a>
                </div>
            </div>
        </div>-->
        
        <div id="myloca" style="display:none;"></div>
        <%          String SortID = "";
            String Dir = "";
            try {
                SortID = request.getParameter("SortID").toString();
                Dir = request.getParameter("Dir").toString();
                System.out.println(SortID + " " + Dir);
            } catch (Exception e) {

            }
        %>
        <div></div>
        <div class="_29kDH" id="wrap">
            <div class="_1LV_f undefined" id="all_restaurants">
                <div class="_3LhmH"></div>
                <div class="_10p2">
                   <div class="k4axS">
                        <div class="_19Aso">
                            <div class="_2LB31">
                                <div class="_3IrNP">
                                    <div class="_1H8qJ">
                                        <%
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String strQuery = "select count(*) from resturant";
                                            PreparedStatement pas = con.prepareStatement(strQuery);
                                        //pas.setInt(1, Res_ID);
                                            //pas.setInt(2, Cos_ID);
                                            ResultSet ses = pas.executeQuery();
                                            String Countrow = "";

                                            while (ses.next()) {
                                                Countrow = ses.getString(1);

                                            }
                                            int total = Integer.parseInt(Countrow);

                                        %>    

                                    </div>
                                    <div class="BZR3j"><%=total%> restaurants</div>
                                   
                                    <div class="_3Ynv-">
                                        

                                        <div class="dropdown">
                                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Asecding order
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><button class="_2-ofZ" value="ASC" id="AvgPrice2" onclick="func(this.value, 'AvgPrice2'), change();">Cost For Two</button></li>
                                                <li><button class="_2-ofZ" value="ASC" id="AvgDelTime" onclick="func(this.value, 'AvgDelTime'), change();">Delivery Time</button></li>
                                                <li><button class="_2-ofZ" value="ASC" id="Rating" onclick="func(this.value, 'Rating'), change();">Rating</button></li>
                                            </ul>
                                        </div>
                                        <div class="dropdown">
                                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Desending order
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><button class="_2-ofZ" value="DESC" id="AvgPrice2" onclick="func(this.value, 'AvgPrice2'), change();">Cost For Two</button></li>
                                                <li><button class="_2-ofZ" value="DESC" id="AvgDelTime" onclick="func(this.value, 'AvgDelTime'), change();">Delivery Time</button></li>
                                                <li><button class="_2-ofZ" value="DESC" id="Rating" onclick="func(this.value, 'Rating'), change();">Rating</button></li>
                                            </ul>
                                        </div>
                                        



                                        <div class="_2-ofZ">
                                            <span class="h0xOG">Filters</span>
                                            <div class="_3eFQ-">
                                                <span class="icon-filter _1PoQ7"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                       
            


                    <div class="_2GhU5" >

                        <div>
                            <div> 
                                <%

                                    String str = "Select * from resturant";
                                    PreparedStatement ps = con.prepareStatement(str);;
                                    int ref = 0;

                                    if ((SortID.equalsIgnoreCase("AvgPrice2") || SortID.equalsIgnoreCase("AvgDelTime") || SortID.equalsIgnoreCase("Rating")) && (Dir.equalsIgnoreCase("ASC") || Dir.equalsIgnoreCase("DESC"))) {
                                        if (SortID.equalsIgnoreCase("AvgPrice2")) {
                                                            //System.out.println("AvgPrice2 Touching");

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                str = "Select * from resturant ORDER BY AvgPrice2 ASC ";
                                            } else {
                                                str = "Select * from resturant ORDER BY AvgPrice2 DESC ";

                                            }
                                            ps = con.prepareStatement(str);

                                        } else if (SortID.equalsIgnoreCase("AvgDelTime")) {
                                            //System.out.println("AvgDElTime Touching");

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                str = "Select * from resturant ORDER BY AvgDelTime ASC ";
                                            } else {
                                                str = "Select * from resturant ORDER BY AvgDelTime DESC ";

                                            }
                                            ps = con.prepareStatement(str);
                                        } else if (SortID.equalsIgnoreCase("Rating")) {
                                            // System.out.println("Rating Touching");

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                str = "Select * from resturant ORDER BY Rating ASC ";
                                            } else {
                                                str = "Select * from resturant ORDER BY Rating DESC ";
                                            }
                                            ps = con.prepareStatement(str);

                                        } else {

                                        }

                                    }

                                                    // if (str != "" && str.length() != 0) {
                                    //
                                    ResultSet rs = ps.executeQuery();
                                    int count = 0;
                                    int rowCount = 0;
                                    while (rs.next()) {
                                        rowCount = rs.getRow();
                                        int Resturant_ID = rs.getInt("Resturant_ID");
                                        String Resturant_name = rs.getString("Resturant_name");
                                        int AvgPrice2 = rs.getInt("AvgPrice2");
                                        int AvgDelTime = rs.getInt("AvgDelTime");
                                        float Rating = rs.getFloat("Rating");
                                        String Description = rs.getString("Description");
                                        String Offers = rs.getString("Offers");

                                        if (count % 4 == 0) {


                                %>                

                                <div class="MZy1T">
                                    <%                                             }


                                    %>

                                    <div class="_3XX_A ">
                                        <a href="/restaurants/nutty-squirrel-ice-creams-brigade-road-central-bangalore-bangalore-86985" class="_1j_Yo">
                                            <div class="_1HEuF">
                                                <div class="_3FR5S">
                                                    <div class="efp8s">
                                                        <img class="_2tuBw _12_oN" alt="<%=Resturant_name%>" width="254" height="160" src="https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/nmi2u87nk1zrvnumznzx">
                                                    </div>
                                                    <div class="IJsqo" style="background: rgb(58, 60, 65); color: rgb(255, 255, 255); border-color: rgb(30, 32, 35) transparent;">
                                                        <div class="_1kXWW">Promoted</div>

                                                    </div>
                                                    <div class="IJsqo" style="background: rgb(250, 74, 91); color: rgb(255, 255, 255); border-color: rgb(209, 42, 59) transparent;"><div class="_1kXWW">Exclusive</div></div>
                                                    <div class="_3Ztcd">
                                                        <div class="nA6kb"><%=Resturant_name%></div>
                                                        <div class="_1gURR" title="<%=Description%>"><%=Description%></div>

                                                    </div>
                                                    <div class="_3Mn31">
                                                        <div class="_9uwBC wY0my">
                                                            <span class="icon-star _537e4"></span>
                                                            <span><i class="zmdi zmdi-star"></i>          <%=Rating%></span>
                                                        </div>
                                                        <div>•</div><div><%=AvgDelTime%> MIN</div><div>•</div><div class="nVWSi">₹<%=AvgPrice2%> FOR TWO</div>        
                                                    </div>
                                                    <div class="Zlfdx">
                                                        <span class="icon-offer-filled _2fujs"></span>
                                                        <span class="sNAfh"><%=Offers%></span>
                                                    </div>
                                                </div>
                                                <div class="_3B2qG">
                                                    <Button role="button" aria-label="Open" class="_2ECk4 _24tlh">Quick View</Button>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <%
                                        ref = 4 - (total % 4);
                                        if (count % 4 == 3) {
                                    %>
                                </div>

                                <%
                                        }
                                        count++;
                                    }

                                    if (ref % 4 == 0) {

                                %>
                                <div class="MZy1T">
                                    <%                                            }
                                        for (int i = 0; i < ref; i++) {
                                    %>         
                                    <div class="_3XX_A a _1HEuF _3FR5S efp8s _3Ztcd _3Mn31 Zlfdx " style="padding-top: 20px;">
                                    </div>
                                    <%
                                        }
                                        if (ref % 4 == 0) {
                                    %>
                                </div>
                                <%
                                    }
                                %>

                            </div>
                        </div>
                    </div>


                </div>


            </div>



            <div class="J2YDs">

            </div>
        </div>
        <script>
            function change()
            {


                document.getElementById("wrap").style.display = "none";
                document.getElementById("myloca").style.display = "block";
            }
            $(document).ready(function () {
                $('.dropdown-submenu a.test').on("click", function (e) {
                    $(this).next('ul').toggle();
                    e.stopPropagation();
                    e.preventDefault();
                });
            });
        </script>
        
        <%@include file="../footer.jsp" %>
        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/plugins.js"></script>
    <script src="../js/active.js"></script>

    </body>
</html>
