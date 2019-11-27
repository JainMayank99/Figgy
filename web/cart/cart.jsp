<%-- 
    Document   : cart
    Created on : Sep 10, 2019, 7:00:35 PM
    Author     : saru
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
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       
    </head>
    <body>
        <%
            Integer SessionId=(Integer)session.getAttribute("id");
            try{
            if (session.getAttribute("id") != null)
         {
           
              
             
            
             
             
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
        %>
        <%@include file="../header.jsp" %>
        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                        <tbody>




                                     <%
                                    
                                         Class.forName("com.mysql.jdbc.Driver");
                                    
                                         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                           
                                        int Customer_ID=SessionId;
                                        String str="select cc.ID,f.Food_name,f.Price,f.Food_ID,cc.Quantity from food as f ,customer_cart as cc WHERE f.Food_ID=cc.Food_ID and STATUS=1  AND Customer_ID=?";
                                          PreparedStatement ps=con.prepareStatement(str);
                                          ps.setInt(1, Customer_ID);
                                        ResultSet rs = ps.executeQuery();
                                          int i=1,total=0,Price,id=-1,fid=0,quan=0;
                                        //int rowCount = 0;
                                        while (rs.next()) {
                                            //rowCount = rs.getRow();
                                             id = rs.getInt("ID");
                                           
                                            String Food_name = rs.getString("Food_name");
                                            //String Resturant_name = rs.getString("Resturant_name");
                                            Price = rs.getInt("Price");
                                            
                                            fid=rs.getInt("Food_ID");
                                            quan=rs.getInt("Quantity");



                                     %>
                                    <tbody>
                                        <tr>
                                            <td class="product-name"><%=Food_name%></td>
                                            <td class="product-price"><span class="amount"><%=Price%></span></td>
                                            <td class="product-quantity" ><input type="number" id="p" name="quantity" value="<%=quan%>" min="0" onchange="Change(this.value,<%=Price%>,<%=i%>,<%=fid%>);"></td>
                                            <td class="product-subtotal" id="<%=i%>"><%=Price*quan%></td> 
                                            <%
                                            total+=Price*quan;
                                            i++;
                                           // System.out.println("Sum="+total);
                                            %>
                                            
                                            <td class="product-remove"><a href="deletecart.jsp?id=<%=id%>">X</a></td>
                                        </tr>
                                        </tbody>
                                        
                                        
                                        
                                       
                                       
                                      <%
                                      
                                        }
                                                
                                        
                                      %>
                                      
                                </table>
                                                                        

                                      <div class="cart__total__amount">
                                       <span>Grand Total</span>
                                       <b style="color:white"><div id="grandtotal"><%=total%></div></b>
                                      </div> 
                
                        </form> 
                        <div class="cartbox__btn">
                            <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                                <li><a href="../Resturant-List/Resturant-List.jsp">Resturant List</a></li>
                                <li><a href="../OrderPlaced/orderplaced.jsp">Check Out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        </div>
         <%@include file="../footer.jsp" %>                             
                            
        <script src="../js/vendor/jquery-3.2.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/plugins.js"></script>
	<script src="../js/active.js"></script>
        <script>
             var request = new XMLHttpRequest();
            function Change(value,price,id,fid)
            {
            var newtwo=document.getElementById(id);
            var total= parseInt(value)*parseInt(price);
            newtwo.innerHTML=total;
            //alert(value);
            
                            
                                        
                                        
                var url = "insertcart.jsp?val="+value+"&fid="+fid;
                try {
                    request.onreadystatechange = function () 
                    {
                        if (request.readyState == 4) 
                        {
                            var val = request.responseText;
                            document.getElementById("grandtotal").innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true); 
                    request.send();
                } catch (e) 
                {
                    alert("Unable to connect to server");
                }
            }
        </script>     
    </body>
</html>
