<%-- 
    Document   : deleteBike
    Created on : Nov 10, 2024, 1:01:59 AM
    Author     : ohams
--%>

<%@page import="com.project.connection.DbCon"%>
<%@page import="com.project.dao.BikeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
           
         String id = (String)request.getParameter("id");
         int retrieveId = Integer.parseInt(id);
         
         BikeDao dao = new BikeDao(DbCon.getConnection());
         boolean isCheck = dao.deleteBike(retrieveId);
         
          if (isCheck) {
            out.println("<script>alert('Todo deleted successfully');</script>");
            response.sendRedirect("seller.jsp");
        } else {
            out.println("<script>alert('Something went wrong');</script>");
       
            response.sendRedirect("seller.jsp");
        }
         
        %>
        
    </body>
</html>
