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
            String str = "Select f.Food_name,f.Price,o.Quantity,o.DateTime from food as f ,order_history as o where f.Food_ID=o.Food_ID and Customer_ID=? ORDER by o.DateTime DESC";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setInt(1, cid);
            String fname = "", datetime = "";
            int quan = 0, price = 0, total = 0;
            ResultSet rs = ps.executeQuery();
        %>

        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <div class="table-content table-responsive">
                            <table>
                                <thead >
                                    <tr class="title-top"  >
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                        <th class="product-remove">Ordered On</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        while (rs.next()) {
                                            fname = rs.getString("Food_name");
                                            price = rs.getInt("Price");
                                            quan = rs.getInt("Quantity");
                                            datetime = rs.getString("DateTime");
                                            total = quan * price;

                                    %>
                                <tbody>
                                    <tr>
                                        <td class="product-name"><%=fname%></td>
                                        <td class="product-price"><span class="amount"><%=price%></span></td>
                                        <td class="product-quantity" ><%=quan%></td>
                                        <td class="product-subtotal" ><%=total%></td> 
                                        <td><b><%=datetime%></b></td>

                                    </tr>
                                </tbody>





                                <%
                                    }


                                %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>    
    </body>
</html>
