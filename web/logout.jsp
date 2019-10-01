<%-- 
    Document   : logout
    Created on : May 6, 2018, 9:42:57 PM
    Author     : saru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%  if(session!=null)
                           {
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
     %>
    </body>
</html>
