<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

     <%
        
            String user=request.getParameter("username");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String phno=request.getParameter("phno"); 
            String address=request.getParameter("address"); 
                    
             Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                 
                
                
               
                
               
                int blocked=0;
                String strQuery="select count(*) from customer where Email=?";
                PreparedStatement prepared=con.prepareStatement(strQuery);
                prepared.setString(1, email);
                ResultSet resultprepare=prepared.executeQuery();
                
                while (resultprepare.next())
                {
                    blocked=Integer.parseInt(resultprepare.getString(1));
                }
                if(blocked == 0 ){
                   
                   
                   

                    String str="insert into customer(Username,Email,Password,PhNo,Address) values (?,?,?,?,?) ";
                    PreparedStatement ps=con.prepareStatement(str);
                
                
                ps.setString(1,user);
                ps.setString(2,email);
                ps.setString(3,pass);
                ps.setString(4,phno);
                ps.setString(5,address);
                
                   int rs=ps.executeUpdate();

                  
                   
                    if(rs>0)
                    {
                        session.setAttribute("sucess", "Sucessfully Signed Up,Sign In Now");
                        //response.sendRedirect("login.html");
                        //session.setAttribute("member",member);
                        
                        
                        
                        response.sendRedirect("login.jsp");
                    }
                        
                   
                   else
                   {
                       session.setAttribute("sucess", "Something Went Wrong");
                      response.sendRedirect("login.jsp");
                       
                   }
                }else
                {
                    
                     session.setAttribute("failure", "Email Already Exists");     
                    response.sendRedirect("login.jsp");
                }
                               
             %>
    </body>
</html>                
                
                