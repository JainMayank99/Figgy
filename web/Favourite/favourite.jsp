<%-- 
    Document   : favourite
    Created on : 28 Oct, 2019, 10:29:02 AM
    Author     : Mayank Jain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             
             Integer SessionId=(Integer)session.getAttribute("id");
            try{
            if (session.getAttribute("id") != null)
         {
            out.println("<script type=\"text/javascript\">");
             out.println("alert("+session.getAttribute("id")+")");
            
             out.println("</script>");
              
             
            
             
             
         }
        else
        {
             out.println("<script type=\"text/javascript\">");
             out.println("alert('You have not signed in.');");
             out.println("location='../Login/login.jsp';");
             out.println("</script>");
            
        }
            }catch(Exception e){
                //response.sendRedirect("Login/login.jsp");
            }
            
            
            
            
             
             int cid=SessionId;
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
            String str = "";
             str = "select * from favourite where Customer_id=?";
             
            PreparedStatement ps = con.prepareStatement(str);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            
            
            
             %>
    </body>
</html>
