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
<h1>Welcome, Seller!</h1>

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
            .tabcontent {
                display: none
            }

            .tablinks {
                cursor: pointer;
            }


            .tablinks:hover {
                font-weight: bold;
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
                            <button class="tablink" onclick="openPage('MyListings', this)" id="defaultOpen">MyListings</button>
                            <button class="tablink" onclick="openPage('News', this)" >Transaction</button>
                            <button class="tablink" onclick="openPage('Contact', this)">Profile</button>

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
                            <form id="bikeForm" action="AddNewBike" method="post" enctype="multipart/form-data">
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
                                <div class="status mt-2">
                                    <input type="hidden" id="status" name="status" class="w-[20.5rem] p-2 border rounded-md" placeholder="status: available - sold out" value="available">
                                </div>

                                <div class="categories mt-2">
                                    <input type="text" name="categories" class="w-[20.5rem] p-2 border rounded-md" placeholder="Categories i.e sport,naked etc">
                                    <div class="error" id="categoriesError" class="hidden"></div>
                                </div>
                                <div class="image mt-2">
                                    Select image of your bike: <input type="file" name="image">
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


                    span.onclick = function () {
                        modal.style.display = "none";
                    }


                    window.onclick = function (event) {
                        if (event.target === modal) {
                            modal.style.display = "none";
                        }
                    }
                </script>


            </main>
            <div class=" overflow-x-auto shadow-md sm:rounded-lg mt-4">
                <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                Brand
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Model
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Year
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Condition
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Price
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Description
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Status
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Action
                            </th>
                        </tr>
                    </thead>
                    <tbody>
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
                        <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                <%= bike.getBrand()%>
                            </th>
                            <td class="px-6 py-4">
                                <%= bike.getModel()%>
                            </td>
                            <td class="px-6 py-4">
                                <%= bike.getYear()%>
                            </td>
                            <td class="px-6 py-4">
                                <%= bike.getBike_condition()%>
                            </td>
                            <td class="px-6 py-4">
                                <%= String.format("%.2f", bike.getPrice())%>
                            </td>
                            <td class="px-6 py-4">
                                <%= bike.getDescription()%>
                            </td>
                            <td class="px-6 py-4">
                                <%= bike.getStatus()%>
                            </td>

                            <td class="px-6 py-4">
                                <a class="bg-yellow-300 outline outline-offset-2 outline-1 outline-yellow-600 text-black" href="editBike.jsp?id=<%=bike.getId()%>&userId=<%= user_id%>" >Edit</a>
                                <a class="bg-red-500 outline outline-offset-2 outline-1 outline-red-500 text-black"  href="deleteBike.jsp?id=<%= bike.getId()%>&userId=<%= user_id%>">Delete</a>
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
            </div>




            <div id="Home" class="tabcontent">
                <h3>Home</h3>
                <p>Home is where the heart is..</p>
            </div>

            <div id="News" class="tabcontent">
                <h3>News</h3>
                <p>Some news this fine day!</p>
            </div>

            <div id="Contact" class="tabcontent">
                <h3>Contact</h3>
                <p>Get in touch, or swing by for a cup of coffee.</p>
            </div>



            <script>
//                Tab javascript code

                function openPage(pageName, element) {
                    var i, tabcontent, tablinks;

                    // Hide all tab content
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }

                    // Remove the "active" class from all tab links
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }

                    // Show the clicked tab content
                    document.getElementById(pageName).style.display = "block";

                    // Add the "active" class to the clicked tab
                    element.className += " active";
                }

                // Set the default open tab to "MyListings"
                document.getElementById("defaultOpen").click();
            </script>
            <script>
//                 Validation code

                document.getElementById("bikeForm").onsubmit = function (event) {
                    event.preventDefault();

                    var errors = document.querySelectorAll(".error");
                    errors.forEach(function (error) {
                        error.classList.add("hidden");
                    });


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
                // Get today's date in YYYY-MM-DD format
                const today = new Date().toISOString().split('T')[0]; // e.g., "2024-12-01"

                // Set the "min" attribute of the input field to today's date
                document.getElementById("date_listed").setAttribute("min", today);

                // Optionally, add validation on form submission
                document.getElementById("date_listed").addEventListener("input", function () {
                    const inputDate = this.value;
                    if (inputDate < today) {
                        alert("The selected date cannot be before today.");
                        this.setCustomValidity("The selected date cannot be before today.");
                    } else {
                        this.setCustomValidity("");
                    }
                });
            </script>


    </body>
</html>