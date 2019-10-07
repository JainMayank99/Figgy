<%-- 
    Document   : ajax
    Created on : Oct 2, 2019, 5:41:11 PM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%-- 
    Document   : Resturant-List
    Created on : Sep 17, 2019, 11:24:15 AM
    Author     : saru
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>

       

        <!-- Title -->
       
        
        

       

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
        %>

        <!--
            Navigation bar Configured at header.jsp
        -->
        

        <!--
            Output of Ajax call to Resturant-List.jsp is Asynchronously displayed here 
            The output is filtered data of resturant based on SortID and Dir
        -->
        <div id="myloca" style="display:none;"></div>
        
        
        

        <%
            
            String ResD="";
            try{
                ResD = request.getParameter("ResD").toString();
            }catch(Exception e){
                
            }
        %>

        <div></div>
       
        <!-- Beginning of Resturant Body -->
        <div class="_29kDH"  >

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
                                        
                                        String strQuery = "select count(*) from resturant where Resturant_name like '%"+ResD+"%'";
                                        

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
                    if (ResD == null || ResD.trim().equals("")) {
                                            
                                        } else {
                                    %>    



                                    <!-- To Display Total Number Of Resturants left of top bar-->   
                                    <div class="BZR3j">
                                        <%=total%> restaurants
                                    </div>
                                        <%
                    }
                                        %>

                                    <!-- Components of 'Filter'  Ascending order and Desending Order  right of Top Bar-->
                                    
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
                                 if (ResD == null || ResD.trim().equals("")) {
                                            out.print("<center><p>Enter Item to be searched</p><br><center>");
                                            out.print("<center><p style='text-decoration: underline;'><b>OR</b></p><br><center>");
                                            out.print("<center><a class='btn btn-primary'  href='Resturant-List.jsp'>Search For ALL</a><center>");
                                        } else {
                                    String str="";
                                        if(ResD != "" && ResD.length() != 0){
                                         System.out.println("This is get");
                                          str= "Select * from resturant where Resturant_name like '%"+ResD+"%'";
                                        }
                                        else{
                                            System.out.println("nooo");
                                            str = "Select * from resturant";
                                        }
                                        
                                    

                                    //preparing str called ps
                                    PreparedStatement ps = con.prepareStatement(str);
                                    System.out.println(ps);

                                    //Initizization
                                    int ref = 0;
                                    int count = 0;
                                    int rowCount = 0;

                                    /*
                                     Based on SortID and Dir Query Is selected
                                     SortID=AvgPrice2,AvgDelTime,Rating
                                     Dir=ASC,DESC
                                     Based on SortID the query is sorted and BAsed on Dir It is sorted Ascending or Desending order
                                     */
                                

                                                    // if (str != "" && str.length() != 0) {
                                    //Excecuting the prepared statement=ps of query=str
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
                                        

                                        //After every 4 resturants the div must be excecuted which creates a new row
                                        if (count % 4 == 0) {
                                %>                

                                <!-- Starting Of a Row-->
                                <div class="MZy1T">

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
                                <div class="MZy1T">
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
                                        }
                                %>

                            </div>
                        </div>
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

          
        <!--
           Linking the script tags
        -->
        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/active.js"></script>
      
    </body>
</html>

    </body>
</html>
