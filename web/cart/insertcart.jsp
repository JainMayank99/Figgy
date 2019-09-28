<%-- 
    Document   : insertcart
    Created on : 25 Sep, 2019, 2:27:17 PM
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
      
        
        <link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/plugins.css">
	<link rel="stylesheet" href="../style.css">

	<!-- Cusom css -->
   <link rel="stylesheet" href="../css/custom.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <body>
        <%  
        
                                         int fid = Integer.parseInt(request.getParameter("fid"));
                                         int val=Integer.parseInt(request.getParameter("val"));
                                        Class.forName("com.mysql.jdbc.Driver");

                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                          String str = "update customer_cart set Quantity=? where Food_ID= ?";
                                          
                                          PreparedStatement ps = con.prepareStatement(str);
                                        ps.setInt(1,val);
                                         ps.setInt(2,fid);
                                        int i= ps.executeUpdate(),quantity=0,price=0,sum=0;//,sum=0;
                                        
                                        
                                        
                                            //System.out.println("Message");
                                            String str2 = "select cc.Quantity,f.Price from food as f ,customer_cart as cc WHERE f.Food_ID=cc.Food_ID and STATUS=1  AND Customer_ID=2";
                                            PreparedStatement ps2 = con.prepareStatement(str2);
                                            ResultSet rs = ps2.executeQuery();
                                            
                                            while(rs.next())
                                            {
                                                quantity=rs.getInt("Quantity");
                                                price=rs.getInt("Price");
                                                
                                                sum=sum+quantity*price;

                                                // int sum = rs.getInt("pun");
                                              //  System.out.println(sum);
                                            //    value = Double.parseDouble(sum);
                                            }
                                            System.out.println(sum);
                                            %>
                                            
                                           <%=sum%>
                                            
                                            <% 
                                            //response.sendRedirect("cart.jsp");
                                        
                                        
        
        %>
    </body>
</html>
