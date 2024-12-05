<%-- 
    Document   : update
    Created on : Nov 30, 2024, 7:23:48 PM
    Author     : ohams
--%>

<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page import="com.project.models.Bike"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //retrieving id from the editBike.jsp
            String id = request.getParameter("id");
            int retrieveId = Integer.parseInt(id);

            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String year = request.getParameter("year");
            String priceParam = request.getParameter("price");
            String bikeCondition = request.getParameter("condition");
            String description = request.getParameter("description");
            String dateListed = request.getParameter("date_listed");
            String status = request.getParameter("status");

            float price = Float.parseFloat(priceParam); //converting to float

            BikeDao dao = new BikeDao(DbCon.getConnection());

            Bike bike = new Bike();
            bike.setId(retrieveId);
            bike.setModel(model);
            bike.setBrand(brand);;
            bike.setYear(year);
            bike.setPrice(price);
            bike.setBike_condition(bikeCondition);
            bike.setDescription(description);
            bike.setDate_listed(dateListed);
            bike.setStatus(status);

            boolean isCheck = dao.updateBike(bike);
            if (isCheck) {
                System.out.println("Updated successfully");
            } else {
                System.out.println("Not updated something went wrong");
            }
        %>
        <%= retrieveId%>
        <script>
            window.location.href = "seller.jsp";
        </script>
    </body>
</html>
