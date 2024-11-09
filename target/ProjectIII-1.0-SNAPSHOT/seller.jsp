<%-- 
    Document   : seller
    Created on : Nov 8, 2024, 12:48:28 PM
    Author     : ohams
--%>

<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.project.models.Bike"%>
<%@page import="com.project.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false); // Get session without creating a new one
    User user = (User) userSession.getAttribute("user"); // Retrieve user from session

    if (user != null) {
        int userId = user.getId(); // Retrieve user ID
%>
<!--<h1>Welcome, Seller!</h1>
<p>Your User ID: <%= userId%></p>
<a href="addNewBike.jsp">Add New Bike</a>-->

<%
} else {
%>

<%
        response.sendRedirect("login.jsp");
        return;

    }
%>

<%
    String successMessage = (String) request.getAttribute("success");
    String errorMessage = (String) request.getAttribute("error");
    if (successMessage != null) {
%>
<div style="color: green;">
    <strong><%= successMessage%></strong>
</div>
<%
    }
    if (errorMessage != null) {
%>
<div style="color: red;">
    <strong><%= errorMessage%></strong>
</div>
<%
    }
%>
<!doctype html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .modal {
                display: none;
            }
            .error {
                color: red;
                font-size: 0.875rem;
            }
        </style>
    </head>

    <body class="font-mono">
        <header>
            <div class="wrapper flex justify-between items-center border border-1">
                <div class="logo">
                    <img src="./assets/images/background.png" class="w-16 ml-4" alt="logo">

                </div>
                <div class="navbar">
                    <nav>
                        <ul class="flex gap-4 items-center">
                            <li><a href="#" class="tablinks" onclick="openPage('MyListings', this, 'red')" id="defaultOpen">MyListings</a></li>
                            <li><a href="#" class="tablinks" onclick="openPage('Transaction', this, 'red')">Transactions</a></li>
                            <li><a href="#" class="tablinks" onclick="openPage('profile', this, 'red')">Profile</a></li>
                            <li><a href="LogoutServlet" class="tablinks">Logout</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <div class="tabcontent" id="MyListings">
            <main>
                <div class="section_add mt-4 flex flex-col justify-center items-center">
                    <button type="button" class="bg-[#090963] w-56 p-2 border rounded-md text-white mt-4" id="openModalBtn">Add new bike</button>
                    <div id="myModal" class="modal fixed inset-0 bg-gray-900 bg-opacity-50 flex justify-center items-center">
                        <div class="bg-white rounded-lg shadow-lg p-6 w-11/12 md:w-1/3">
                            <span class="close cursor-pointer float-right text-gray-500 hover:text-gray-800">&times;</span>
                            <h2 class="text-lg font-semibold">Add New Bike</h2>
                            <form id="bikeForm" action="AddNewBike" method="post">
                                <div class="first-wrapper mt-4 flex gap-2">
                                    <div class="brand">
                                        <input type="text" name="brand" class="w-40 p-2 border rounded-md" placeholder="Enter brand">
                                        <div class="error" id="brandError" class="hidden"></div>
                                    </div>
                                    <div class="model">
                                        <input type="text" name="model" class="w-40 p-2 border rounded-md" placeholder="Enter model">
                                        <div class="error" id="modelError" class="hidden"></div>
                                    </div>
                                </div>
                                <div class="year mt-4">
                                    <input type="text" name="year" class="w-[20.5rem] p-2 border rounded-md" placeholder="Enter year">
                                    <div class="error" id="yearError" class="hidden"></div>
                                </div>
                                <div class="condition mt-4">
                                    <input type="text" name="condition" class="w-[20.5rem] p-2 border rounded-md" placeholder="Condition of your bike ie.good poor">
                                    <div class="error" id="conditionError" class="hidden"></div>
                                </div>
                                <div class="price mt-2">
                                    <input type="text" name="price" class="w-[20.5rem] p-2 border rounded-md" placeholder="Enter price">
                                    <div class="error" id="priceError" class="hidden"></div>
                                </div>
                                <div class="description mt-2">
                                    <input type="text" name="description" class="w-[20.5rem] p-2 border rounded-md" placeholder="Description of the bike">
                                    <div class="error" id="descriptionError" class="hidden"></div>
                                </div>
                                <div class="date-listed mt-2">
                                    <input type="date" id="date_listed" name="date_listed" class="w-[20.5rem] p-2 border rounded-md">
                                </div>
                                <div class="categories mt-2">
                                    <input type="text" name="categories" class="w-[20.5rem] p-2 border rounded-md" placeholder="Categories i.e sport,naked etc">
                                    <div class="error" id="categoriesError" class="hidden"></div>
                                </div>
                                <div class="button mt-2">
                                    <button class="bg-[#090963] w-56 p-2 border rounded-md text-white" type="submit">Add bike</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    var modal = document.getElementById("myModal");
                    var btn = document.getElementById("openModalBtn");
                    var span = document.getElementsByClassName("close")[0];

                    // Open modal
                    btn.onclick = function () {
                        modal.style.display = "flex";
                    }

                    // Close modal when 'x' is clicked
                    span.onclick = function () {
                        modal.style.display = "none";
                    }

                    // Close modal when clicking outside of it
                    window.onclick = function (event) {
                        if (event.target === modal) {
                            modal.style.display = "none";
                        }
                    }
                </script>

                <script>
                    // Handle form submission
                    document.getElementById("bikeForm").onsubmit = function (event) {
                        event.preventDefault();

                        var errors = document.querySelectorAll(".error");
                        errors.forEach(function (error) {
                            error.classList.add("hidden");
                        });

                        // Validate inputs
                        var brand = document.querySelector("input[name='brand']").value.trim();
                        var model = document.querySelector("input[name='model']").value.trim();
                        var year = document.querySelector("input[name='year']").value.trim();
                        var condition = document.querySelector("input[name='condition']").value.trim();
                        var price = document.querySelector("input[name='price']").value.trim();
                        var description = document.querySelector("input[name='description']").value.trim();
                        var categories = document.querySelector("input[name='categories']").value.trim();

                        var valid = true;

                        if (brand === "") {
                            document.getElementById("brandError").innerText = "Brand is required.";
                            document.getElementById("brandError").classList.remove("hidden");
                            valid = false;
                        }
                        if (model === "") {
                            document.getElementById("modelError").innerText = "Model is required.";
                            document.getElementById("modelError").classList.remove("hidden");
                            valid = false;
                        }
                        if (year === "") {
                            document.getElementById("yearError").innerText = "Year is required.";
                            document.getElementById("yearError").classList.remove("hidden");
                            valid = false;
                        }
                        if (condition === "") {
                            document.getElementById("conditionError").innerText = "Condition is required.";
                            document.getElementById("conditionError").classList.remove("hidden");
                            valid = false;
                        }
                        if (price === "") {
                            document.getElementById("priceError").innerText = "Price is required.";
                            document.getElementById("priceError").classList.remove("hidden");
                            valid = false;
                        }
                        if (description === "") {
                            document.getElementById("descriptionError").innerText = "Description is required.";
                            document.getElementById("descriptionError").classList.remove("hidden");
                            valid = false;
                        }
                        if (categories === "") {
                            document.getElementById("categoriesError").innerText = "Categories are required.";
                            document.getElementById("categoriesError").classList.remove("hidden");
                            valid = false;
                        }

                        if (valid) {
                            // Form is valid, submit the form
                            this.submit();
                        }
                    }
                </script>
            </main>

            <table class="mt-4">
                <thead class="border">
                    <tr class="border p-4">
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Condition</th>
                        <th>Price</th>
                        <th>description</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class="border">
                    <%
                        HttpSession userSessionId = request.getSession(false);
                        if (userSessionId == null) {
                            out.println("No session found.");
                        } else {
                            User user_retrieve = (User) userSessionId.getAttribute("user");
                            int user_id = user_retrieve.getId();
                            BikeDao dao = new BikeDao(DbCon.getConnection());
                            
                            List<Bike> bikes = dao.getBikesById(user_id);
                            
                            if (bikes != null && !bikes.isEmpty()) {
                                for (Bike bike : bikes) {
                                System.out.println(bike.getId());
                    %>
                    <tr class="border">
                        
                        <td class="border border-gray-200"><%= bike.getBrand()%></td>
                        <td class="border border-gray-200"><%= bike.getModel()%></td>
                        <td class="border border-gray-200"><%= bike.getDate_listed() %></td>
                        <td class="border border-gray-200"><%= bike.getBike_condition()%></td>
                        <td class="border border-gray-200"><%= String.format("%.2f", bike.getPrice())%></td>
                       <td class="border border-gray-200"><%= bike.getDescription() %></td>
                        <td class="border border-gray-200">Available</td>
                        <td class="border border-gray-200">
                            <a class="bg-yellow-300 outline outline-offset-2 outline-1 outline-yellow-600 text-black" href="editBike.jsp?id=<%=bike.getId() %>&userId=<%= user_id%>" >Edit</a> | 
                            <a class="bg-red-900 outline outline-offset-2 outline-1 outline-red-500 text-black"  href="deleteBike.jsp?id=<%= bike.getId()%>&userId=<%= user_id%>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No bikes available.</td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
    </body>
</html>