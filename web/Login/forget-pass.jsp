<%-- 
    Document   : forget-pass.jsp
    Created on : 13 Nov, 2019, 7:59:09 PM
    Author     : Mayank Jain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String email=request.getParameter("inputEmail");
            String pass=request.getParameter("inputPass");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
            
            String str = "UPDATE customer set PASSWORD='"+pass+"' where Email='"+email+"'";
            PreparedStatement pre=con.prepareStatement(str);
            pre.executeUpdate();
            
            
            response.sendRedirect("login.jsp");
            
            
            
            
            
            %>
    </body>
</html>
