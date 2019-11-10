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
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- JQuery and Bootstrap linking -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

        <!-- meta data about page -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <meta name="description">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicons -->
        <link rel="shortcut icon" href="../images/favicon.ico">
        <link rel="apple-touch-icon" href="../images/icon.png">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/plugins.css">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../css/plugins.css">
        <link rel="stylesheet" href="Resturant-List.css">

        <!-- Custom css -->
        <link rel="stylesheet" href="../css/custom.css">

        <!-- Modernizer js -->
        <script src="../js/vendor/modernizr-3.5.0.min.js"></script>

        <!-- Title -->
        <title>Resturant List</title>
        
        

        

        <!-- Custom Styling -->
        <style>
             .dropdown-submenu {
                 position: relative;
             }
 
             .dropdown-submenu .dropdown-menu {
                 top: 0;
                 left: 100%;
                 margin-top: -1px;
             }
             .custom-search {
	position: absolute;
	right: 20px;
	top: 1px;
}
#express-form-typeahead {
	background-color: white;
	background-position: 5px center;
        background-image: url("../images/abc.png");
	background-repeat: no-repeat;
	background-size: 40px 40px;
        z-index: 1003;
	border: none;
	cursor: pointer;
	height: 40px;
	margin: 3px 0;
	padding: 0 0 0 34px;
	position: relative;
	-webkit-transition: width 400ms ease, background 400ms ease;
	transition:         width 400ms ease, background 400ms ease;
	width: 0px;  
}
.cus ._3Ynv- {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin: 50px;
}
.cus{
    position: relative;
    
}
#express-form-typeahead:focus {
	background-color: #fff;
	border: 2px solid black;
	cursor: text;
	outline: 0;
	width: 230px;
}
.search-btn {
  display: none;
}
input[type="search"] {
  -webkit-appearance: textfield;
}
        </style>

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
            Integer SessionId;
            try {
                if (session.getAttribute("id") != null) {
                    out.println("<script type=\"text/javascript\">");
                    
                    out.println("</script>");
                    SessionId=(Integer)session.getAttribute("id");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have not signed in.');");
                    out.println("location='../Login/login.jsp';");
                    out.println("</script>");
                    

                }
            } catch (Exception e) {

            }
        %>

        <!--
            Navigation bar Configured at header.jsp
        -->
        <div id='myheader' style="position:sticky; top:0; z-index: 1001" >
            <%@include file="../header.jsp"  %>
        </div>

        <!--
            Output of Ajax call to Resturant-List.jsp is Asynchronously displayed here 
            The output is filtered data of resturant based on SortID and Dir
        -->
        <div id="myloca" style="diplay:none;" ></div>
        
        
        

        <%
            //Initialization
            String SortID = "";
            String Dir = "";
            int pagemsg = 1;
            // Ajax call Made to Resturant-List.jsp Parameters are extracted
            try {

                SortID = request.getParameter("SortID").toString();
                Dir = request.getParameter("Dir").toString();

            } catch (Exception e) {
            }
            
            String ResD="";
            try{
                ResD = request.getParameter("ResD").toString();
            }catch(Exception e){
                
            }
             try {
                pagemsg = Integer.parseInt(request.getParameter("num"));
                
            } catch (Exception ex) {
            }
        %>

        <div></div>
        <div id="dav" style="display:block;" class="cus span3 widget-span widget-type-raw_html custom-search" style="" data-widget-type="raw_html" data-x="4" data-w="3">
                                            <div class="cell-wrapper layout-widget-wrapper">
                                                <div id="hs_cos_wrapper_module_14308928327274411" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_raw_html"  data-hs-cos-general-type="widget" data-hs-cos-type="raw_html">
                                                    
                                                        <input required="" name="q" placeholder="Search" class="form-control tt-input" id="express-form-typeahead" style="background-color:white;"autocomplete="off" spellcheck="false" dir="auto" type="text" onfocusin="myFunction();" onkeyup="se(this.value);">
                                                        <button class="search-btn"><span class="icon"></span></button>
                                                   
                                                </div>
                                            </div>
                                            <!--end layout-widget-wrapper -->
                                        </div>
        
        <div id="myl" style="display:none;"></div>
        <!-- Beginning of Resturant Body -->
        <div class="_29kDH" id="wra" style="display: block;" >

            <!-- 
                wrapper for all resturants + Top bar
            -->
            <div class="_1LV_f undefined" id="all_restaurants">

                <!-- Left Side Space - Orange Color -->
                <div class="_3LhmH">
                </div>

                <!-- Middle Space for displaying all resturant + Top bar - white color -->
                <div class="_10p2" >

                    <!-- Start of Top Bar -->
                    <div class="k4axS" >
                        <div class="_19Aso">
                            <div class="_2LB31">
                                <div class="_3IrNP">

                                    <!-- Circle next to total number of resturants left of top bar-->
                                    <div class="_1H8qJ">
                                    </div>

                                    <%
                                        //Establishing a connection with the database figgy
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");

                                        //Initizization
                                        String Countrow = "";
                                        int total;

                                        //Query to Count the total number of resturants
                                        
                                        String strQuery = "select count(*) from resturant";
                                        

                                        //preparing strQuery called pas
                                        PreparedStatement pas = con.prepareStatement(strQuery);

                                        //Excecuting the prepared statement=pas of query=strQuery
                                        ResultSet ses = pas.executeQuery();

                                        while (ses.next()) {
                                            //Count the total number of resturants 
                                            Countrow = ses.getString(1);
                                        }

                                        //converting String to Integer
                                        total = Integer.parseInt(Countrow);

                                    %>    



                                    <!-- To Display Total Number Of Resturants left of top bar-->   
                                    <div class="BZR3j">
                                        <%=total%> restaurants
                                    </div>

                                    <!-- Components of 'Filter'  Ascending order and Desending Order  right of Top Bar-->
                                    <div class="_3Ynv-">
                                        
                                        
                                        
                                        <!-- Filter component -->
                                        <div class="_2-ofZ" style="cursor: default; border: none;">
                                            <span class="h0xOG" >Filters : </span>
                                        </div>
                                        
                                        

                                        <!-- 
                                            Ascending order Drop Down 
                                            Can be sorted based on AvgPrice2,AvgDelTime and Ratings on click
                                            func(this.value, SortID) Sorts the value based on sortid in  Ascending order
                                            change() displays 'myloca' and hides 'wrapper' when triggered , ie Sorts the resturant in Resturant-List.jsp by ajax call and the output is displayed in 'myloca' and exsisting 'Wrap' is disappered
                                        -->    
                                        <div class="dropdown" id="wra">
                                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Ascending Order
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu " style='margin: 0 0 0 -2rem;'>
                                                <li><button class="_2-ofZ" value="ASC"  id="AvgPrice2" onclick="func(this.value, 'AvgPrice2',<%=pagemsg%>);">Cost For Two</button></li>
                                                <li><button class="_2-ofZ"  value="ASC" id="AvgDelTime" onclick="func(this.value, 'AvgDelTime',<%=pagemsg%>);">Delivery Time</button></li>
                                                <li><button class="_2-ofZ"  value="ASC" id="Rating" onclick="func(this.value, 'Rating',<%=pagemsg%>);">Rating</button></li>
                                            </ul>
                                        </div>

                                        <!-- 
                                            Descending order Drop Down 
                                            Can be sorted based on AvgPrice2,AvgDelTime and Ratings onclick
                                            func(this.value, SortID) Sorts the value based on sortid in  Descending order
                                            change() displays 'myloca' and hides 'wrapper' when triggered , ie Sorts the resturant in Resturant-List.jsp by ajax call and the output is displayed in 'myloca' and exsisting 'Wrap' is disappered
                                            butcus is custom class 
                                        -->   
                                        <div class="dropdown butcus">
                                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Descending Order
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu" style='margin: 0 0 0 -2rem;'>
                                                <li><button class="_2-ofZ" value="DESC" id="AvgPrice2" onclick="func(this.value, 'AvgPrice2',<%=pagemsg%>);">Cost For Two</button></li>
                                                <li><button class="_2-ofZ" value="DESC" id="AvgDelTime" onclick="func(this.value, 'AvgDelTime',<%=pagemsg%>);">Delivery Time</button></li>
                                                <li><button class="_2-ofZ" value="DESC" id="Rating" onclick="func(this.value, 'Rating',<%=pagemsg%>);">Rating</button></li>
                                            </ul>
                                        </div>    
                                    </div>
                                    <!--End of Components of 'Filter'  Ascending order and Desending Order  right of Top Bar-->

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Top Bar -->

                    <!-- Start of Resturant List -->
                    <div class="_2GhU5"  >

                        <div>
                            <div> 

                                <%
                                    // Query to select all resturant
                                    String str="";
                                        
                                            
                                            str = "Select * from resturant order by Resturant_name limit ? offset ?";
                                        
                                        
                                    

                                    
                                    
                                    
                                    //Initizization
                                    int ref = 0;
                                    int count = 0;
                                    int rowCount = 0;
                                    
            

           
                                    int page_number = pagemsg;
                                    int perpage = 39;
                                        int totpage = (int) Math.ceil(total / perpage);
                                        if (!(total % perpage == 0)) {
                                            totpage++;
                                        }
                                        int posit = (page_number - 1) * perpage;
                                        
                                    //preparing str called ps
                                    PreparedStatement ps = con.prepareStatement(str);
                                    ps.setInt(1, perpage);
                                    ps.setInt(2, posit);

                                    /*
                                     Based on SortID and Dir Query Is selected
                                     SortID=AvgPrice2,AvgDelTime,Rating
                                     Dir=ASC,DESC
                                     Based on SortID the query is sorted and BAsed on Dir It is sorted Ascending or Desending order
                                     */
                                    if ((SortID.equalsIgnoreCase("AvgPrice2") || SortID.equalsIgnoreCase("AvgDelTime") || SortID.equalsIgnoreCase("Rating")) && (Dir.equalsIgnoreCase("ASC") || Dir.equalsIgnoreCase("DESC"))) {

                                        if (SortID.equalsIgnoreCase("AvgPrice2")) {
                                        //Based on AvgPrice2    

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                //Ascending order
                                                str = "Select * from resturant ORDER BY AvgPrice2,Resturant_name ASC limit ? offset ?";

                                            } else {
                                                //Desending order
                                                str = "Select * from resturant ORDER BY AvgPrice2 DESC limit ? offset ?";
                                                

                                            }
                                            //preparing str called ps
                                            ps = con.prepareStatement(str);
                                            ps.setInt(1, perpage);
                                    ps.setInt(2, posit);
                                    System.out.println(perpage+" "+posit+" "+ps);

                                        } else if (SortID.equalsIgnoreCase("AvgDelTime")) {
                                            //Based on  AvgDelTime

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                //Ascending order
                                                str = "Select * from resturant ORDER BY AvgDelTime,Resturant_name ASC limit ? offset ?";

                                            } else {
                                                //Desending order
                                                str = "Select * from resturant ORDER BY AvgDelTime DESC limit ? offset ?";

                                            }
                                            //preparing str called ps
                                            ps = con.prepareStatement(str);
                                            ps.setInt(1, perpage);
                                    ps.setInt(2, posit);

                                        } else if (SortID.equalsIgnoreCase("Rating")) {
                                          //Based on Rating

                                            if (Dir.equalsIgnoreCase("ASC")) {
                                                //Ascending order
                                                str = "Select * from resturant ORDER BY Rating,Resturant_name ASC limit ? offset ?";

                                            } else {
                                                //Desending order
                                                str = "Select * from resturant ORDER BY Rating DESC limit ? offset ?";

                                            }
                                            //preparing str called ps
                                            ps = con.prepareStatement(str);
                                            ps.setInt(1, perpage);
                                    ps.setInt(2, posit);

                                        } else {
                                        }

                                    }
                                     
                                                    // if (str != "" && str.length() != 0) {
                                    //Excecuting the prepared statement=ps of query=str
                                    System.out.println(ps);
                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {

                                        // Extracting Resturant_ID,Resturant_name,AvgPrice2,AvgDelTime,Rating,Description,Offers from Resultset=rs
                                        rowCount = rs.getRow();
                                        int Resturant_ID = rs.getInt("Resturant_ID");
                                        String Resturant_name = rs.getString("Resturant_name");
                                        int AvgPrice2 = rs.getInt("AvgPrice2");
                                        int AvgDelTime = rs.getInt("AvgDelTime");
                                        float Rating = rs.getFloat("Rating");
                                        String Description = rs.getString("Description");
                                        String Offers = rs.getString("Offers");
                                        String Img=rs.getString("Img");        	
                                        
                                        System.out.println(Resturant_ID+Resturant_name+AvgPrice2+AvgDelTime+Rating+Description+Offers);
                                        total=rowCount;
                                        //After every 4 resturants the div must be excecuted which creates a new row
                                        if (count % 4 == 0) {
                                %>                

                                <!-- Starting Of a Row-->
                                <div class="MZy1T" style="margin-bottom: 0px;">

                                    <%
                                        }
                                    %>

                                    <!--Start Resturant View -->
                                    <div class="_3XX_A ">

                                        <!-- Redirection to resturant menu-list onclick the element -->
                                        <a href="../menu-item/menu-list.jsp?res=<%=Resturant_ID%>&num=1" class="_1j_Yo">

                                            <!--Start One Resturant content -->
                                            <div class="_1HEuF">                                                                                          
                                                <div class="_3FR5S">

                                                    <!-- 
                                                        Start Top part Image,Promoted,Exculsive,Resturant Name and Description
                                                    -->

                                                    <!-- Image of Resturant -->
                                                    <div class="efp8s">
                                                        <img class="_2tuBw _12_oN" alt="<%=Resturant_name%>" width="254" height="160" src="<%=Img%>">
                                                    </div>

                                                    <!-- Promoted Sticker -->
                                                    <%
                                                        Random rand = new Random(); 
  
                                                        // Generate random integers in range 0 to 999 
                                                        int number = rand.nextInt(20); 
                                                        
  
                                                        if(number<5)
                                                        {
                                                    %>
                                                    <div class="IJsqo" style="background: rgb(58, 60, 65); color: rgb(255, 255, 255); border-color: rgb(30, 32, 35) transparent;">
                                                        <div class="_1kXWW">Promoted</div>
                                                    </div>
                                                            
                                                    <%
                                                        }else if (number >5 && number <10){ 
                                                    %>
                                                    <!-- Exclusive Sticker -->
                                                    <div class="IJsqo" style="background: rgb(250, 74, 91); color: rgb(255, 255, 255); border-color: rgb(209, 42, 59) transparent;">
                                                        <div class="_1kXWW">Exclusive</div>             
                                                    </div>
                                                    
                                                    <%
                                                        }else
                                                        {}
                                                    %>

                                                    <!-- Contains Resturant Name and Description -->
                                                    <div class="_3Ztcd">

                                                        <!-- Resturant_name -->
                                                        <div class="nA6kb"><%=Resturant_name%></div>

                                                        <!-- Description -->
                                                        <div class="_1gURR" title="<%=Description%>"><%=Description%></div>

                                                    </div>
                                                    <!-- 
                                                        End Top part Image,Promoted,Exculsive,Resturant Name and Description
                                                    -->

                                                    <!-- Component of Rating,Average Dilivery Time and Average price for two -->
                                                    <div class="_3Mn31">

                                                        <!-- Rating -->
                                                        <div class="_9uwBC wY0my">
                                                            <span class="icon-star _537e4"></span>
                                                            <span><i class="zmdi zmdi-star"></i>          <%=Rating%></span>
                                                        </div>

                                                        <!-- Average Dilevery Time -->
                                                        <div>•</div><div><%=AvgDelTime%> MIN</div><div>•</div>

                                                        <!-- Average Price of two -->
                                                        <div class="nVWSi">₹<%=AvgPrice2%> TWO</div> 

                                                    </div>
                                                    <!--End Component of Rating,Average Dilivery Time and Average price for two -->

                                                    <!-- Offer Component -->
                                                    <div class="Zlfdx">
                                                        <span class="icon-offer-filled _2fujs"></span>
                                                        <span class="sNAfh"><%=Offers%></span>
                                                         <span class="icon-offer-filled _2fujs"></span>
                                                    </div>
                                                    <!--End Offer Component -->

                                                </div>


                                            </div>
                                            <!--End One Resturant content -->
                                        </a>
                                    </div>
                                    <!--End Resturant View -->

                                    <%
                                        //to calculate the number of grey spots to fill    
                                        ref = 4 - (total % 4);

                                        //The 4th resturant will end the row by closing the div
                                        if (count % 4 == 3) {
                                    %>
                                </div>

                                <%
                                        }
                                        //Count increment
                                        count++;
                                    }

                                    //if the row is starting 
                                    if (ref % 4 == 0) {

                                %>
                                <div class="MZy1T" style="margin-bottom: 0px;">
                                    <%                                        }
                                        //a loop which print grey area for remaining resturant
                                        for (int i = 0; i < ref; i++) {
                                    %>         
                                    <div class="_3XX_A a _1HEuF _3FR5S efp8s _3Ztcd _3Mn31 Zlfdx " style="padding-top: 20px;">
                                    </div>
                                    <%
                                        }
                                        //close the row after the fourth element
                                        if (ref % 4 == 0) {

                                    %>
                                </div>
                                <%                                    }
                                %>

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
                                <li><a href="Resturant-List.jsp?num=<%=page_number - 1%>"><i class="zmdi zmdi-chevron-left"></i></a></li>
                                        <%
                                            }

                                            //A for loop to display all the pages present which is clickable and coustomer is redirected to that page
                                            for (int i = 1; i <= totpage; i++) {

                                                //if current page number matches with i a black circle encloses the ith page number 
                                                if (i == page_number) {
                                        %>   
                                <li class="active"><a href="Resturant-List.jsp?num=<%=i%>"><%=i%></a></li>
                                    <% } else {
                                        //else it is displayed normally
%>
                                <li><a href="Resturant-List.jsp?num=<%=i%>"><%=i%></a></li>
                                    <%
                                            }
                                        }
                                    %>


                                <%
                                    //Check if page number is less than total pages if it is display forward Sign so that coustomer can visit next page
                                    if (page_number < totpage) {

                                %>
                                <li><a href="Resturant-List.jsp?num=<%=page_number + 1%>"><i class="zmdi zmdi-chevron-right"></i></a></li>
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
                    <!-- Start of Resturant List -->
                    

                </div>
                <!--End Middle Space for displaying all resturant + Top bar - white color -->


                <div class="J2YDs">
                </div>
                <!-- Left Side Space - Orange Color -->    

            </div>
            <!-- 
                 End wrapper for all resturants + Top bar
            -->

        </div>
        <!-- End of Resturant Body -->
           
        <script>

            // myFunction() displays 'mylocation' and hides 'wrapper' when triggered
            
            var request = new XMLHttpRequest
            // Ajax call to Asynchronously Sort the resturant Based on SortID and Dir
            // SortID = average price, avgerage dilivery time, rating
            // Dir = Ascending or Decending order
            function func(Dir, SortID,Pag) {
                document.getElementById("myloca").style.display = "block";
                document.getElementById("myheader").style.display = "none";
               document.getElementById("wra").style.display = "none";
               document.getElementById("dav").style.display = "none";
                //Call to Resturant-List.jsp
               
                var url = "Resturant-List.jsp?SortID=" + SortID + "&Dir=" + Dir +"&num=" + Pag;

                //Returns the output of Resturant-List.jsp to 'myloca'
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
             request = new XMLHttpRequest();
            // Ajax call to Asynchronously searching of element from search bar 
            function se(value) {
                
                
                //value = The value to be searched , res = The resturant ID
                name = value;
                
                //alert(name);
                //Call to Ajax.jsp
                var url = "ajax.jsp?ResD=" + name ;
                

                //Returns the output of Ajax.jsp to 'mylocation' 
                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('myl').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            /* $(document).ready(function () {
             $('.dropdown-submenu a.test').on("click", function (e) {
             $(this).next('ul').toggle();
             e.stopPropagation();
             e.preventDefault();
             });
             });*/
        </script>
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
                                                            document.getElementById("wra").style.display = "none";
                                                            document.getElementById("myl").style.display = "block";
                                                            
                                                        }
        </script>
    </body>
</html>
