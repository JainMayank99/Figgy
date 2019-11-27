<%-- 
    Document   : Admin
    Created on : Nov 27, 2019, 1:59:12 PM
    Author     : saru
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="../text/html; charset=UTF-8">
        <title>ADMIN</title>
        <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
    </head>
    <body style="background: #000;">
        
        <div class="limiter" >
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">ID</th>
								<th class="column2">Username</th>
								<th class="column3">Food_name</th>
								<th class="column4">Resturant_Name</th>
								<th class="column5">Quantity</th>
								<th class="column6">Formated_Date</th>
							</tr>
						</thead>
						<tbody>
								
									
						
        <%
                                        //Establishing a connection with the database figgy
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/figgy", "root", "");

                                        //Initizization
                                        String Countrow = "";
                                        
                                        int total;

                                        //Query to Count the total number of resturants
                                        
                                        String strQuery = "CALL GetLogs()";
                                        

                                        //preparing strQuery called pas
                                        PreparedStatement pas = con.prepareStatement(strQuery);

                                        //Excecuting the prepared statement=pas of query=strQuery
                                        ResultSet ses = pas.executeQuery();

                                        while (ses.next()) {
                                            //Count the total number of resturants 
                                            int ID = ses.getInt("ID");
                                            String Username = ses.getString("Username");
                                            String Food_name = ses.getString("Food_name");
                                            String Resturant_Name = ses.getString("Resturant_Name");
                                            int Quantity = ses.getInt("Quantity");
                                            String formated_date = ses.getString("formated_date");
                                            
                                            
                                        %>
                                        <tr>
                                       <td class="column1"> <%= ID %></td>
									<td class="column2"><%= Username %></td>
									<td class="column3"><%= Food_name %></td>
									<td class="column4"><%= Resturant_Name %></td>
									<td class="column5"><%= Quantity %></td>
									<td class="column6"><%= formated_date %></td>
                                                                </tr>
							                                                
                                       <%
                                        
                                        } 
        
        
        %>
        
        </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

    </body>
</html>
