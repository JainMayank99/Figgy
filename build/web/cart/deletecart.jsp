<%-- 
    Document   : deletecart
    Created on : 25 Sep, 2019, 1:35:13 PM
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
        <title>JSP Page</title>
        <!-- Modernizer js -->
	<script src="../js/vendor/modernizr-3.5.0.min.js"></script>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <body>
             <%
                                        int id = Integer.parseInt(request.getParameter("id"));

                                        Class.forName("com.mysql.jdbc.Driver");

                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");

                                        String str = "delete FROM customer_cart where ID=? ";
                                        PreparedStatement ps = con.prepareStatement(str);
                                        ps.setInt(1,id);
                                        int i= ps.executeUpdate();
                                        
                                        if(i==1)
                                        {
                                            response.sendRedirect("cart.jsp");
                                        }
                                        
                                        
                                        %>
    </body>
</html>
