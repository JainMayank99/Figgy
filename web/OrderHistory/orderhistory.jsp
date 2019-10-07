<%-- 
    Document   : orderhistory
    Created on : 2 Oct, 2019, 10:25:03 AM
    Author     : Mayank Jain
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        <%@include file="../header.jsp" %>
        <%            int cid = 2;

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
            String str = "Select r.Resturant_Name,r.Img,o.DateTime from food as f,resturant as r ,order_history as o where f.Resturant_Name=f.Resturant_Name and f.Food_ID=o.Food_ID and Customer_ID=? GROUP by o.DateTime DESC";
            PreparedStatement ps = con.prepareStatement(str), ps2;
            String str2;
            ps.setInt(1, cid);
            String fname = "", datetime = "",rname="",img="";
            int quan = 0, price = 0, total = 0;
            ResultSet rs = ps.executeQuery(), rs2;


        %>


        <div id="root" style="height: 100%;">
            <div class="_3arMG">
                <div class="nDVxx">
                    <div class="_1w2w1">
                        <div class="_3tDvm ">
                            <div class="v6luz FvIBT"></div>
                            <div class="_2QhOV _3glSS">
                                <div class="_3R9IF">
                                    <div class="_1stFr">
                                        <div>
                                            <div>
                                                <div class="_3lCtm">Past Orders</div>

                                                <%   
                                                    while (rs.next()) {
                                                        rname=rs.getString("Resturant_Name");
                                                        img=rs.getString("Img");
                                                        datetime = rs.getString("DateTime");
                                                        
                                                        total = quan * price;
                                                        str2 = "Select f.Food_name,f.Price,o.Quantity from resturant as r, food as f ,order_history as o where f.Food_ID=o.Food_ID and Customer_ID=? and o.DateTime='?'";
                                                        ps2 = con.prepareStatement(str2);
                                                        ps2.setInt(1, cid);
                                                        ps2.setString(2, datetime);
                                                        rs2 = ps2.executeQuery();

                                                        datetime = datetime.substring(0, datetime.length() - 5);
                                                        
                                                        
                                                        %>
                                                        
                                                         <div>
                                                    <div class="_3xMk0">
                                                        <div class="g28rk">
                                                            <div class="_359Fc">
                                                                <img
                                                                    class="_2tuBw _12_oN"
                                                                    height="200"
                                                                    width="300"
                                                                    alt=""
                                                                    src=<%=img%>
                                                                    />
                                                            </div>
                                                            <div class="_2XWVq">
                                                                <div class="_3h4gz"><%=rname%></div>
                                                                
                                                                <div class="_2uT6l">
                                                                    ORDERED ON <%=datetime%>
                                                                </div>
                                                                
                                                                <div class="_2fkm7">
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="_3SKK0">
                                                            <div class="nRCg_">

                                                        <%        
                                                        while (rs2.next())
                                                        {
                                                            
                                                            
                                                            fname = rs2.getString("Food_name");
                                                            price = rs2.getInt("Price");
                                                            quan = rs2.getInt("Quantity");
                                                            total += price * quan;
                                                            


                                                %>



                                               
                                                               <%=fname%> x <%=quan%>, 
                                                            








                                                <%                                        }
                                                        %>
                                                        
                                                        
                                                        </div>
                                                            <div class="_2a27y">
                                                                <!--
                                                                <a class="_3PUy8 f4Ovn">REORDER</a
                                                                >
                                                            </div>
                                                                -->
                                                            <div class="_23DHc">
                                                                Total Paid: <span class="_3Hghg"> <%=total%> </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                        
                                                        
                                                      <%  
                                                    }


                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="_1a4Mf _3m2h5"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>    
    </body>
</html>
