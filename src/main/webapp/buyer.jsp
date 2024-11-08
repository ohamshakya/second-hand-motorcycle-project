<%-- 
    Document   : buyer
    Created on : Nov 8, 2024, 12:47:55 PM
    Author     : ohams
--%>

<%@page import="java.util.List"%>
<%@page import="com.project.models.Bike"%>
<%@page import="com.project.models.Bike"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    BikeDao bikeinfo = new BikeDao(DbCon.getConnection());
    List<Bike> bikes = bikeinfo.getAllBikes();

%>

<%
    HttpSession userSession = request.getSession(false); // Get session without creating a new one
    User user = (User) userSession.getAttribute("user"); // Retrieve user from session

    if (user != null) {
        int userId = user.getId(); 
%>
<p><%= userId %></p>
<%
} else {
%>
<!--<p>You are not logged in. Please <a href="login.jsp">log in</a>.</p>-->
<%
    response.sendRedirect("login.jsp");
    return;
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Page - Second Hand Motorcycle Marketplace</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom styles for hover effects */
        .bike-card:hover {
            transform: scale(1.05);
            transition: transform 0.3s;
        }
    </style>
</head>
<body class="bg-gray-100">   
   
</table>
    <nav class=" p-4">
        <div class="container mx-auto flex justify-between items-center">
            <img src="./assets/images/background.png" class="w-16 p-2" alt="">
            <div>
                <a href="#" class="text-black hover:text-white mx-2">Home</a>
                <a href="#" class="text-black hover:text-white mx-2">My Listings</a>
                <a href="#" class="text-black hover:text-white mx-2">Profile</a>
                <a href="LogoutServlet" class="text-black hover:text-white mx-2">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mx-auto mt-8">
    <h1 class="text-2xl font-bold mb-4">Available Motorcycles</h1>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <%
           BikeDao dao = new BikeDao(DbCon.getConnection());
           List<Bike> bike_info = dao.getAllBikes();
            if (bike_info != null && !bike_info.isEmpty()) {
                for (Bike bike : bike_info) {
        %>
            <div class="bg-white p-4 rounded shadow bike-card">
                <h2 class="text-lg font-bold"><%= bike.getBrand() %></h2>
                <p class="text-gray-600">Model: <%= bike.getModel() %></p>
                
                <p class="text-gray-600">Price: rs<%= bike.getPrice() %></p>
                <p class="text-gray-600">Condition: <%= bike.getBike_condition()%></p>
                <p class="text-gray-600">Description: <%= bike.getDescription()%></p>
                
                <a href="viewdetail.jsp" class="text-blue-500 hover:underline mt-2 inline-block">View Details</a>
            </div>
        <%
                }
            } else {
        %>
            <p>No bikes available.</p>
        <%
            }
        %>
    </div>
</div>
    <!-- Footer -->
    <footer class="bg-gray-800 text-white p-4 mt-8">
        <div class="container mx-auto text-center">
            <script>document.write(new Date().getFullYear())</script> All rights reserved
        </p>
        </div>
    </footer>

</body>
</html>
