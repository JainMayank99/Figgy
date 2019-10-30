<%-- 
    Document   : favourite
    Created on : 28 Oct, 2019, 9:52:21 AM
    Author     : Mayank Jain
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

            int cid = Integer.parseInt(request.getParameter("cid"));
            int fid = Integer.parseInt(request.getParameter("fid"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
            String str = "";
            
            str = "insert into favourite (Customer_ID,Food_ID) values (?,?)";
             
            PreparedStatement ps = con.prepareStatement(str);
            ps.setInt(1, cid);
            ps.setInt(2, fid);
                                            
            int rs = ps.executeUpdate();

        %>
        
        
    </body>
</html>
