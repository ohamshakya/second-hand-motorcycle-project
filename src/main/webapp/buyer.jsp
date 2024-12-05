<%-- 
    Document   : buyer
    Created on : Nov 8, 2024, 12:47:55 PM
    Author     : ohams
--%>

<%@page import="com.project.dao.UserDao"%>
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

<%    HttpSession userSession = request.getSession(false); // Get session without creating a new one
    User user = (User) userSession.getAttribute("user"); // Retrieve user from session

    if (user != null) {
        int userId = user.getId();
%>
<p><%= userId%></p>
<%
} else {
%>
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
    <body class="bg-gray-100 font-mono">   

    </table>
    <nav class=" p-4">
        <div class="container mx-auto flex justify-between items-center">
            <img src="./assets/images/background.png" class="w-16 p-2" alt="">
            <div class="tab flex gap-5">
                <button class="tablink" onclick="openPage('Home', this)" id="defaultOpen">Home</button>
                <button class="tablink" onclick="openPage('Profile', this)" >Profile</button>
                <a href="LogoutServlet" class="text-black hover:text-black mx-2">Logout</a>
            </div>
        </div>
    </nav>



    <!--tab content-->
    <div id="Home" class="tabcontent">
        <div class="container min-h-screen mx-auto mt-8">
            <h1 class="text-2xl font-bold mb-4">Available Motorcycles</h1>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <%            BikeDao dao = new BikeDao(DbCon.getConnection());
                    List<Bike> bike_info = dao.getAllBikes();
                    if (bike_info != null && !bike_info.isEmpty()) {
                        for (Bike bike : bike_info) {
                %>
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="http://localhost:7575/ProjectIII/assets/images/<%= bike.getImageFileName()%>" alt="bike-image" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold"><%= bike.getBrand() %></h2>
                    <p class="text-gray-700"><%= bike.getDescription() %></p>
                    <p class="text-lg font-bold mt-2"><%= bike.getPrice() %></p>
                    <p class="text-gray-600 mt-2"  style="color: <%= bike.getStatus().equals("available") ? "green" : "red"%>">status: <%= bike.getStatus()%></p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        <% System.out.println("Number of bikes: " + bike_info.size());%>

                    <a href="viewdetail.jsp?id=<%= bike.getId()%>" class="text-white-500 hover:underline mt-2 inline-block">View Details</a>
                    </button>
                </div>
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
    </div>

    <div id="Profile" class="tabcontent">
        <div class="w-90 mt-5 p-5 bg-white rounded-lg shadow-md flex gap-5">
            <h2 class="text-2xl font-bold mb-4">Profile</h2>
            <%
                User user_Id = (User) userSession.getAttribute("user"); // Retrieve user from session

                if (user_Id != null) {
                    int userIdSelection = user_Id.getId();
                    UserDao userdao = new UserDao(DbCon.getConnection());
                    List<User> user_retrieved = userdao.getUsersById(userIdSelection);
                    for (User u : user_retrieved) {
            %>

            <img class="" src="assets/images/avatar_pic.jpg" alt="profile"/>


            <div class="grid grid-cols-1 gap-6">
                <div class="first-second_wrapper flex gap-10">
                    <div>
                    <h2 class="text-xl font-bold">Firstname:</h2>
                    <p class="text-gray-700"><%= u.getFirstName()%></p>
                </div>
                <div>
                    <h2 class="text-xl font-bold">Lastname: </h2>
                    <p class="text-gray-700"><%= u.getLastName()%></p>
                </div>
                </div>
                <div>
                    <h2 class="text-xl font-bold">Email</h2>
                    <p class="text-gray-700"><%= u.getEmail()%></p>
                </div>
                <div>
                    <h2 class="text-xl font-bold"> Contact </h2>
                    <p class="text-gray-700"><%= u.getPhone()%></p>
                </div>
                <%
                    }
                } else {
                %>
                <p>No Users Found!</p>
                <%
                    }
                %>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white p-4 mt-8">
        <div class="container mx-auto text-center">
            <script>document.write(new Date().getFullYear())</script> All rights reserved
            </p>
        </div>
    </footer>



    <!--javascript code for opening tab-->
    <script>
        function openPage(pageName, elmnt) {
            // Hide all elements with class="tabcontent" by default */
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Remove the background color of all tablinks/buttons
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
            }

            // Show the specific tab content
            document.getElementById(pageName).style.display = "block";

            // Add the specific color to the button used to open the tab content
            elmnt.style.backgroundColor = color;
        }

    // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>

</body>
</html>
