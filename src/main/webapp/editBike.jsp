<%-- 
    Document   : editBike
    Created on : Nov 9, 2024, 11:42:22 PM
    Author     : ohams
--%>

<%@page import="com.project.models.Bike"%>
<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String id = (String)request.getParameter("id");
          int retrieveId = Integer.parseInt(id);

          
          BikeDao dao = new BikeDao(DbCon.getConnection());
          Bike bike = dao.getValues(retrieveId);
          
        %>
        <div class="bg-white rounded-lg shadow-lg p-6 w-11/12 md:w-1/3">
           
            <form id="Update" action="AddNewBike" method="post">
                <input type="text" name="id" value="<%= retrieveId %>"/>
                <div class="first-wrapper mt-4 flex gap-2">
                    <div class="brand">
                        <input type="text" name="brand" class="w-40 p-2 border rounded-md" placeholder="Enter brand" value="<%= bike.getBrand() %>">
                        <div class="error" id="brandError" class="hidden"></div>
                    </div>
                    <div class="model">
                        <input type="text" name="model" class="w-40 p-2 border rounded-md" placeholder="Enter model" value="<%= bike.getModel() %>">
                        <div class="error" id="modelError" class="hidden"></div>
                    </div>
                </div>
                <div class="year mt-4">
                    <input type="text" name="year" class="w-[20.5rem] p-2 border rounded-md" placeholder="Enter year" value="<%= bike.getYear() %>">
                    <div class="error" id="yearError" class="hidden"></div>
                </div>
                <div class="condition mt-4">
                    <input type="text" name="condition" class="w-[20.5rem] p-2 border rounded-md" placeholder="Condition of your bike ie.good poor" value="<%= bike.getBike_condition() %>">
                    <div class="error" id="conditionError" class="hidden"></div>
                </div>
                <div class="price mt-2">
                    <input type="text" name="price" class="w-[20.5rem] p-2 border rounded-md" placeholder="Enter price" value="<%= bike.getPrice() %>">
                    <div class="error" id="priceError" class="hidden"></div>
                </div>
                <div class="description mt-2">
                    <input type="text" name="description" class="w-[20.5rem] p-2 border rounded-md" placeholder="Description of the bike" value="<%= bike.getDescription() %>">
                    <div class="error" id="descriptionError" class="hidden"></div>
                </div>
                <div class="date-listsed mt-2">
                    <input type="date" id="date_listed" name="date_listed" class="w-[20.5rem] p-2 border rounded-md" value="<%= bike.getDate_listed() %>">
                </div>
                <div class="categories mt-2">
                    <input type="text" name="categories" class="w-[20.5rem] p-2 border rounded-md" placeholder="Categories i.e sport,naked etc">
                    <div class="error" id="categoriesError" class="hidden"></div>
                </div>
                <div class="button mt-2">
                    <button class="bg-[#090963] w-56 p-2 border rounded-md text-white" type="submit">Update</button>
                </div>
            </form>
        </div>
    </body>
</html>
