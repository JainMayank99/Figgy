<%-- 
    Document   : reorder
    Created on : 26 Oct, 2019, 12:48:43 PM
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
        
    </head>
    <body>
       <%
                                        int cid =Integer.parseInt(request.getParameter("cid"));
                                        String food = request.getParameter("food");
                                        
                                        int Fids[]=new int[20],c=0;
                                         
                                       
                                        String temp="";
                                           for(int i=0;i<food.length();i++)
                                           {
                                                char d=food.charAt(i);
                                                if(d!='*')
                                                    temp=temp+d+"";
                                                else
                                                {
                                                    Fids[c++]=Integer.parseInt(temp);
                                                    temp="";
                                                }
                                            }
                                        
                                       
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String str = "";
                                            
                                            
                                            for(int i=0;i<c;i++)
                                           {
                                               int fid=Fids[i]; 
                                           

                                            str = "insert into customer_cart (Customer_ID,Food_ID) values (?,?)";
                                            

                                            PreparedStatement ps = con.prepareStatement(str);
                                            ps.setInt(1, cid);
                                            ps.setInt(2, fid);

                                            
                                            int rs = ps.executeUpdate();
                                           }
                                           response.sendRedirect("../cart/cart.jsp");
                                            
                                    %>
    </body>
</html>
