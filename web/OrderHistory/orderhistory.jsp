<%-- 
    Document   : orderhistory
    Created on : 2 Oct, 2019, 10:25:03 AM
    Author     : Mayank Jain
--%>

<%@page import="java.util.*"%>
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
        <link rel="stylesheet" href="orderhistory.css">
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
        <div>
            <% Integer SessionId = -1;

                try {
                    if (session.getAttribute("id") != null) {
                       
                        SessionId = (Integer) session.getAttribute("id");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('You have not signed in.');");
                        out.println("location='../Login/login.jsp';");
                        out.println("</script>");

                    }
                } catch (Exception e) {

                }
                int cid = SessionId;

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");
                String str = "Select distinct r.Resturant_Name,r.Img,o.DateTime,Date_Format(DateTime ,'%Y-%m-%d %H:%i') as formated_date from food as f,resturant as r ,order_history as o where f.Resturant_Name=r.Resturant_Name and f.Food_ID=o.Food_ID and Customer_ID=? GROUP by formated_date DESC";
                PreparedStatement ps = con.prepareStatement(str), ps2;
                String str2;
                ps.setInt(1, cid);

                String fname = "", datetime = "", rname = "", img = "", odt = "";
                int quan = 0, price = 0, total = 0, fid = 0;
                String Fids="";
                ResultSet rs = ps.executeQuery(), rs2;


            %>


            <div id="root" style="height: 100%;">
                <div class="_3arMG">
                    <div class="nDVxx">
                        <div class="_1w2w1">
                            <div class="_3tDvm ">
                                <div class="v6luz FvIBT"></div>
                                <div class="_2QhOV _3glSS">
                                    <div class="_3R9IF">
                                        <div class="_1stFr">
                                            <div>
                                                <div>
                                                    <div class="_3lCtm">Past Orders</div>

                                                    <%                                                    while (rs.next()) {
                                                            rname = rs.getString("Resturant_Name");
                                                            img = rs.getString("Img");
                                                            odt = rs.getString("DateTime");
                                                            datetime = rs.getString("formated_date");

                                                            total = quan * price;
                                                            str2 = "Select distinct f.Food_ID,f.Food_name,f.Price,o.Quantity from resturant as r, food as f ,order_history as o where f.Food_ID=o.Food_ID and Customer_ID=? and o.DateTime=' " + odt + "'";
                                                            ps2 = con.prepareStatement(str2);
                                                            ps2.setInt(1, cid);

                                                            rs2 = ps2.executeQuery();
                                                            Fids="";


                                                    %>


                                                    <div>
                                                        <div class="_3xMk0">
                                                            <div class="g28rk">
                                                                <div class="_359Fc">
                                                                    <img
                                                                        class="_2tuBw _12_oN"
                                                                        height="200"
                                                                        width="300"
                                                                        alt=""
                                                                        src=<%=img%>
                                                                        />
                                                                </div>
                                                                <div class="_2XWVq">
                                                                    <div class="_3h4gz"><%=rname%></div>

                                                                    <div class="_2uT6l">
                                                                        ORDERED ON <%=datetime%>
                                                                    </div>

                                                                    <div class="_2fkm7">
                                                                        <span>Delivered on </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="_3SKK0">
                                                                <div class="nRCg_">

                                                                    <%
                                                                        while (rs2.next()) {

                                                                            fid = rs2.getInt("Food_ID");
                                                                            fname = rs2.getString("Food_name");
                                                                            price = rs2.getInt("Price");
                                                                            quan = rs2.getInt("Quantity");
                                                                            total += price * quan;
                                                                            Fids=Fids+fid+"*";


                                                                    %>




                                                                    '<%=fname%> x <%=quan%>' 









                                                                    <%                                        }
                                                                    %>


                                                                </div>
                                                                <div class="_2a27y">
                                                                    

                                                                    <a class="_3PUy8 f4Ovn" href="reorder.jsp?cid=<%=cid%>&food=<%=Fids%>">REORDER</a>

                                                                </div>

                                                                <div class="_23DHc">
                                                                    Total Paid: <span class="_3Hghg"><b> <%=total%></b> </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <%
                                                        }


                                                    %>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="_1a4Mf _3m2h5"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                  
<!--
        <script>
            var request = new XMLHttpRequest();
            function Change(){
                var url ="../cart/pushcartAjax.jsp?food=" + fid + "&cos=" + cid;
             try {
                  
                    
                    request.open("GET", url, true);
                    request.send();
                } catch (e)
                {
                    alert("Unable to connect to server");
                }
            }
        </script>    -->
        
      <!--  <script>
                                                                        function(){
                                                                            var url = "../cart/pushcartAjax.jsp?food=" + fid + "&cos=" + cid;
                                                                            document.getElementById('reorder').innerHTML = "<a class='_3PUy8 f4Ovn' href='url'>REORDER</a>";
                                                                        }
                                                                        ;
        </script>  -->
        <%@include file="../footer.jsp" %>    
    </body>
</html>
