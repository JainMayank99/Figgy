
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

        
    </head>
    <body>

        
                                    <%
                                        int food = Integer.parseInt(request.getParameter("food"));
                                        int Cos =Integer.parseInt(request.getParameter("cos"));
                                        
                                        
                                       
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String str = "";
                                            int rowCount;

                                            str = "insert into customer_cart (Customer_ID,Food_ID) values (?,?)";
                                            

                                            PreparedStatement ps = con.prepareStatement(str);
                                            ps.setInt(1, Cos);
                                            ps.setInt(2, food);

                                            
                                            int rs = ps.executeUpdate();
                                            
                                            
                                            
                                    %>


                                    
    </body>
</html>
