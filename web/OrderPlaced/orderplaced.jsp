<%-- 
    Document   : orderplaced
    Created on : 1 Oct, 2019, 2:10:49 PM
    Author     : Mayank Jain
    Confirnmation  to show that order has been placed and being able to redirect to order history page
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
        <style>
          svg {
  width: 300px;
  display: block;
  margin: 100px auto 0;
}
.path {
  stroke-dasharray: 1000;
  stroke-dashoffset: 0;
}
.path.circle {
  -webkit-animation: dash 3s ease-in-out;
  animation: dash 3s ease-in-out;
}
.path.line {
  stroke-dashoffset: 1000;
  -webkit-animation: dash 3s 2.5s ease-in-out forwards;
  animation: dash 3s 0.1s ease-in-out forwards;
}
.path.check {
  stroke-dashoffset: -100;
  -webkit-animation: dash-check 1.5s 2.5s ease-in-out forwards;
  animation: dash-check 3s 2.5s ease-in-out forwards;
}
p {
  text-align: center;
  margin: 20px 0 60px;
  font-size: 3.6em;
}
p.success {
  color: #73AF55;
}
p.error {
  color: #D06079;
}
@-webkit-keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}
@keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}
@-webkit-keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}
@keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}

            </style>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        
        
        
<!--[if lte IE 9]>
  <style>
    .path {stroke-dasharray: 0 !important;}
  </style>
<![endif]-->

<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
  <circle class="path circle" fill="none" stroke="#73AF55" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"/>
  <polyline class="path check" fill="none" stroke="#73AF55" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 "/>
  </svg><br><br>
<p class="success">Order Placed !<a href="../OrderHistory/orderhistory.jsp" style="size:3.5em;">Check Your Order History</a>!</p>
    

<br>
<br>


                <%  
                
                
                Integer SessionId=-1;
            try {
                if (session.getAttribute("id") != null) {
                    out.println("<script type=\"text/javascript\">");
                    
                    out.println("</script>");
                    SessionId=(Integer)session.getAttribute("id");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have not signed in.');");
                    out.println("location='../Login/login.jsp';");
                    out.println("</script>");
                    

                }
            } catch (Exception e) {

            }

   
          
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                   String str="select cc.Food_ID,cc.Quantity from customer_cart as cc where cc.Customer_ID=? and Status=1";
                   PreparedStatement ps = con.prepareStatement(str);
                   ps.setInt(1,SessionId);
                   ResultSet rs = ps.executeQuery();
         
         
                   PreparedStatement ps2=null,ps3=null;
                   int fid=0,quan=0;
                   while(rs.next())
                   {
                       
                       fid=rs.getInt("Food_ID");
                       quan=rs.getInt("Quantity");
             
                       String str2="insert into order_history(Customer_ID,Food_ID,Quantity) values (?,?,?)";
                       ps2=con.prepareStatement(str2);
             
                       ps2.setInt(1,SessionId);
                       ps2.setInt(2,fid);
                       ps2.setInt(3,quan);
           
                       System.out.println("CID"+SessionId+"fid"+fid+"quan"+quan);
             
                       ps2.executeUpdate();
             
                       String str3="DELETE FROM customer_cart WHERE Customer_ID= ? AND Food_ID= ? AND Status =1";
             
                       ps3=con.prepareStatement(str3);
                       ps3.setInt(1,SessionId);
                       ps3.setInt(2,fid);
             
                       ps3.executeUpdate();
                   }
         
         
         
  
                %>
                <%@include file="../footer.jsp" %>
                
                </body>
                </html>
