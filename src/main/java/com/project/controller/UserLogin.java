/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.connection.DbCon;
import com.project.models.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ohams
 */
public class UserLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
          String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = null;
        String storedHash = null;  
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DbCon.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            // Set parameters for the SQL query
            statement.setString(1, email);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getInt("role"));
                    storedHash = rs.getString("password");  // Fetch the stored hashed password from the DB
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate();
        }
        session = request.getSession(true);
        if (storedHash != null && BCrypt.checkpw(password, storedHash)) {
            session.setAttribute("user", user);  // Store user in session

            
            switch (user.getRole()) {
                case 1:
                    response.sendRedirect("buyer.jsp"); // Redirect to buyer page if role is 1
                    break;
                case 2:
                    response.sendRedirect("seller.jsp"); // Redirect to seller page if role is 2
                    break;
                default:
                    response.sendRedirect("login.jsp?error=Something went wrong"); // Handle unknown roles
                    break;
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");  // Invalid credentials
        }
    }

}
