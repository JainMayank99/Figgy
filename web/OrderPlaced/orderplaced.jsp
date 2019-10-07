<%-- 
    Document   : orderplaced
    Created on : 1 Oct, 2019, 2:10:49 PM
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
        


                <%  

   
          
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                   String str="select cc.Customer_ID,cc.Food_ID,cc.Quantity from customer_cart as cc where cc.Customer_ID=2";
                   PreparedStatement ps = con.prepareStatement(str);
                   ResultSet rs = ps.executeQuery();
         
         
                   PreparedStatement ps2=null,ps3=null;
                   int cid=0,fid=0,quan=0;
                   while(rs.next())
                   {
                       cid=rs.getInt("Customer_ID");
                       fid=rs.getInt("Food_ID");
                       quan=rs.getInt("Quantity");
             
                       String str2="insert into order_history(Customer_ID,Food_ID,Quantity) values (?,?,?)";
                       ps2=con.prepareStatement(str2);
             
                       ps2.setInt(1,cid);
                       ps2.setInt(2,fid);
                       ps2.setInt(3,quan);
           
                       System.out.println("CID"+cid+"fid"+fid+"quan"+quan);
             
                       ps2.executeUpdate();
             
                       String str3="DELETE FROM customer_cart WHERE Customer_ID= ? AND Food_ID= ? AND Status =1";
             
                       ps3=con.prepareStatement(str3);
                       ps3.setInt(1,cid);
                       ps3.setInt(2,fid);
             
                       ps3.executeUpdate();
                   }
         
         
         
  
                %>                               
                </body>
                </html>
