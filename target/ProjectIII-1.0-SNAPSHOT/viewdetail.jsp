<%-- 
    Document   : viewdetail
    Created on : Nov 8, 2024, 3:47:27 PM
    Author     : ohams
--%>

<%@page import="java.util.List"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page import="com.project.models.Bike"%>
<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Details</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-6">

    <%
        // Retrieve the bikeId from the request parameter
        String bikeIdStr = request.getParameter("bikeId");
        Bike selectedBike = null;

        if (bikeIdStr != null && !bikeIdStr.isEmpty()) {
            int bikeId = Integer.parseInt(bikeIdStr);

            // Assuming you already have the list of bikes in the session or request
            List<Bike> bikes = (List<Bike>) request.getAttribute("bikes");

            // Find the selected bike by its ID
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

    <div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg">
        <h1 class="text-3xl font-semibold text-center mb-6">Bike Details</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
                <h2 class="text-xl font-bold">Brand:</h2>
                <p class="text-gray-700"><%= selectedBike.getBrand() %></p>
            </div>
            <div>
                <h2 class="text-xl font-bold">Model:</h2>
                <p class="text-gray-700"><%= selectedBike.getModel() %></p>
            </div>
            <div>
                <h2 class="text-xl font-bold">Year:</h2>
                <p class="text-gray-700"><%= selectedBike.getYear() %></p>
            </div>
            <div>
                <h2 class="text-xl font-bold">Condition:</h2>
                <p class="text-gray-700"><%= selectedBike.getBike_condition() %></p>
            </div>
            <div>
                <h2 class="text-xl font-bold">Price:</h2>
                <p class="text-gray-700">$<%= String.format("%.2f", selectedBike.getPrice()) %></p>
            </div>
            <div>
                <h2 class="text-xl font-bold">Status:</h2>
                <p class="text-gray-700">Available</p>
            </div>
        </div>

        <div class="mt-6">
            <a href="editBike.jsp?bikeId=<%= selectedBike.getId() %>" class="bg-yellow-500 text-white px-4 py-2 rounded-md">Edit Bike</a>
            <a href="deleteBike.jsp?bikeId=<%= selectedBike.getId() %>" class="bg-red-500 text-white px-4 py-2 rounded-md">Delete Bike</a>
        </div>
    </div>

    <%
        } else {
    %>
            <p class="text-center text-red-500">Bike not found.</p>
    <%
        }
    %>

</body>
</html>