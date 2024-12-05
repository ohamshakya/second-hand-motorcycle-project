<%-- 
    Document   : dashboard
    Created on : Dec 2, 2024, 3:42:07 PM
    Author     : ohams
--%>

<%@page import="com.project.models.Admin"%>


<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.dao.AdminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <!-- Sidebar -->
    <div class="flex h-screen">
        <div class="w-64 bg-gray-800 text-white p-5">
            <h2 class="text-2xl font-bold mb-5">Admin Dashboard</h2>
            <ul>
                <li class="mb-3">
                    <a href="#" class="hover:bg-gray-700 p-2 rounded block">Dashboard</a>
                </li>
                <li class="mb-3">
                    <a href="#" class="hover:bg-gray-700 p-2 rounded block">Bikes</a>
                </li>
                <li class="mb-3">
                    <a href="#" class="hover:bg-gray-700 p-2 rounded block">Users</a>
                </li>
                <li class="mb-3">
                    <a href="#" class="hover:bg-gray-700 p-2 rounded block">Settings</a>
                </li>
                <li class="mb-3">
                    <a href="./AdminLogout" class="hover:bg-gray-700 p-2 rounded block">Logout</a>
                </li>
            </ul>
        </div>

      
        <div class="flex-1 p-6">
            <!-- Header -->
            <header class="flex justify-between items-center mb-6">
                <h1 class="text-3xl font-semibold">Welcome to the Admin Dashboard</h1>
                <button class="bg-blue-500 text-white px-4 py-2 rounded-lg">Profile</button>
            </header>

            <!-- Dashboard Widgets -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Bike Count Card -->
                <div class="bg-white p-5 rounded-lg shadow-lg">
                    <h3 class="text-xl font-semibold mb-3">Total Bikes</h3>
                    
                    <p class="text-2xl font-bold text-gray-700"></p>
                </div>

                <!-- User Count Card -->
                <div class="bg-white p-5 rounded-lg shadow-lg">
                    <h3 class="text-xl font-semibold mb-3">Total Users</h3>
                    <p class="text-2xl font-bold text-gray-700">1,250</p>
                </div>

                <!-- Revenue Card -->
                <div class="bg-white p-5 rounded-lg shadow-lg">
                    <h3 class="text-xl font-semibold mb-3">Total Revenue</h3>
                    <p class="text-2xl font-bold text-gray-700">$12,500</p>
                </div>

                <!-- Orders Card -->
                <div class="bg-white p-5 rounded-lg shadow-lg">
                    <h3 class="text-xl font-semibold mb-3">Total Orders</h3>
                    <p class="text-2xl font-bold text-gray-700">450</p>
                </div>
            </div>

</body>
</html>
