<%-- 
    Document   : signin
    Created on : Sep 28, 2019, 2:30:29 PM
    Author     : saru
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
        
            
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            
                    
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                 
                
                
               
                
               
                int blocked=0,id=0;
                String strQuery="select count(*),Customer_ID from customer where Email=? and Password=?";
                PreparedStatement prepared=con.prepareStatement(strQuery);
                prepared.setString(1, email);
                prepared.setString(2, pass);
                ResultSet resultprepare=prepared.executeQuery();
                
                while (resultprepare.next())
                {
                    blocked=resultprepare.getInt(1);
                    id=resultprepare.getInt(2);
                }
                if(blocked == 1 ){
                   session.setAttribute("id",id);
                   
                   response.sendRedirect("../index.jsp");
                    
                }else
                {
                    
                    session.setAttribute("sucess", "Email Does not Exists");     
                    response.sendRedirect("login.jsp");
                }
                               
             %>
    </body>
</html>
