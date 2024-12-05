<%-- 
    Document   : viewdetail
    Created on : Nov 8, 2024, 3:47:27 PM
    Author     : ohams
--%>
<%@page import="com.project.models.User"%>
<%@page import="java.util.List"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page import="com.project.models.Bike"%>
<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  HttpSession session_first = request.getSession(false);
  User user = (User)session_first.getAttribute("user");
  if(user!=null){
   int userId = user.getId();
%>
<%
    }else{
    response.sendRedirect("login.jsp");
     return;
    }
%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bike Details</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.0/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-100 p-6 font-mono">
        <%
            String bikeIdStr = request.getParameter("id");
            System.out.println(bikeIdStr);
            Bike selectedBike = null;

            if (bikeIdStr != null && !bikeIdStr.isEmpty()) {
                int bikeId = Integer.parseInt(bikeIdStr);

                BikeDao dao = new BikeDao(DbCon.getConnection());
                List<Bike> bikes = (List<Bike>) dao.getBikeById(bikeId);

                if (bikes != null) {
                    for (Bike bike : bikes) {
                        if (bike.getId() == bikeId) {
                            selectedBike = bike;
                            break;
                        }
                    }
                }
            }
        %>

        <%
            if (selectedBike != null) {
        %>
        <nav class=" p-4">
            <div class="container mx-auto flex justify-between items-center">
                <img src="./assets/images/background.png" class="w-16 p-2" alt="">
                <div class="tab flex gap-5">
                    <button class="tablinks" id="defaultOpen" onclick="openCity(event, 'home')">Home</button>
                    <button class="tablinks" onclick="openCity(event, 'profile')">Profile</button>
                    <a href="LogoutServlet" class="text-black hover:text-black mx-2">Logout</a>
                </div>
            </div>
        </nav>      
        <div class="wrapper  flex gap-5">
            <div class="w-full min-h-screen mt-5 p-5 bg-white rounded-lg shadow-md">
                <h1 class="text-3xl font-bold mb-4">Bike Details</h1>

                <img src="http://localhost:7575/ProjectIII/assets/images/<%= selectedBike.getImageFileName()%>" alt="Bike Image" class="w-90 h-64 object-cover rounded-lg mb-4">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div>
                        <h2 class="text-xl font-bold">Brand:</h2>
                        <p class="text-gray-700"><%= selectedBike.getBrand()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Model:</h2>
                        <p class="text-gray-700"><%= selectedBike.getModel()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Year:</h2>
                        <p class="text-gray-700"><%= selectedBike.getYear()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Condition:</h2>
                        <p class="text-gray-700"><%= selectedBike.getBike_condition()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Price:</h2>
                        <p class="text-gray-700">rs <%= String.format("%.2f", selectedBike.getPrice())%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Status:</h2>
                        <p class="text-gray-700" style="color: <%= selectedBike.getStatus().equals("available") ? "green" : "red"%>"><%= selectedBike.getStatus()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold">Description:</h2>
                        <p class="text-gray-700"><%= selectedBike.getDescription()%></p>
                    </div>
                </div>


            </div>
            <div class="w-80 mt-5 p-5 bg-white rounded-lg shadow-md">
                <h2 class="text-2xl font-bold mb-4">Seller Details</h2>

                <img class="" src="assets/images/avatar_pic.jpg" alt="profile"/>
                <%
                    BikeDao dao = new BikeDao(DbCon.getConnection());
                    User user_retrieve = dao.getUserByBikeId(selectedBike.getId());
                %>
                <div class="grid grid-cols-1 gap-6">
                    <div>
                        <h2 class="text-xl font-bold">Name:</h2>
                        <p class="text-gray-700"><%= user_retrieve.getFirstName() + " " +user_retrieve.getLastName() %></p>
                    </div>
                    
                    <div>
                        <h2 class="text-xl font-bold">Email</h2>
                        <p class="text-gray-700"><%= user_retrieve.getEmail()%></p>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold"> Contact </h2>
                        <p class="text-gray-700"><%= user_retrieve.getPhone()%></p>
                    </div>
                </div>
                <div>
                </div>
            </div>
            <%
            } else {
            %>
            <p class="text-center text-red-500">User not found</p>
            <%
                }
            %>


    </body>
</html>