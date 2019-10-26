
<%-- 
   Document   : Ajax
   Created on : Sep 14, 2019, 6:24:45 AM
   Author     : saru
--%>
<%@page import="java.util.*"%>
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
                                        ArrayList<Integer> Fids = new ArrayList<Integer>();
                                         
                                        String food = request.getParameter("food");
                                        int Cos =Integer.parseInt(request.getParameter("cos"));
                                        int t=food.length()-1;
                                        String temp="";
                                            while(t>=0)
                                            {
                                                char d=food.charAt(t);
                                                if(d!='*')
                                                    temp=temp+d+"";
                                                else
                                                {
                                                    Fids.add(Integer.parseInt(temp));
                                                    temp="";
                                                }
                                                t--;
                                            }
                                        
                                        
                                        
                                        
                                       
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                                            String str = "";
                                            int rowCount;
                                            
                                            for(int i=0;i<Fids.size();i++)
                                            {
                                                int fid=Fids.get(i);
                                            

                                            str = "insert into customer_cart (Customer_ID,Food_ID) values (?,?)";
                                            

                                            PreparedStatement ps = con.prepareStatement(str);
                                            ps.setInt(1, Cos);
                                            ps.setInt(2, fid);

                                            
                                            int rs = ps.executeUpdate();
                                            }
                                            response.sendRedirect("cart.jsp");
                                            
                                            
                                    %>


                                    
    </body>
</html>
