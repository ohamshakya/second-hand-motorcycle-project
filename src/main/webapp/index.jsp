<%-- 
    Document   : index
    Created on : Nov 8, 2024, 12:52:51 PM
    Author     : ohams
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.project.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection connection = DbCon.getConnection();
        
        if (connection != null) {
            out.println("<h3>Connection established successfully!</h3>");
        } else {
            out.println("<h3>Failed to establish connection.</h3>");
        }
    %>
    </body>
</html>
