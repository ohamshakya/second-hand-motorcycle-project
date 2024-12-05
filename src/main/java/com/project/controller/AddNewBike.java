/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.connection.DbCon;
import com.project.models.User;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ohams
 */
@MultipartConfig
public class AddNewBike extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String model = request.getParameter("model");
        String brand = request.getParameter("brand");
        String yearParam = request.getParameter("year");
        String priceParam = request.getParameter("price");
        String bikeCondition = request.getParameter("condition");
        String description = request.getParameter("description");
        String dateListed = request.getParameter("date_listed");
        String status = request.getParameter("status");
        Part file = request.getPart("image");
        //get selected image filename
        String imageFileName = file.getSubmittedFileName();
        System.out.println("selected image file name : "+imageFileName);
        
        //get path of file where should the file be upload
        String uploadPath = "C:/Users/ohams/OneDrive/Documents/NetBeansProjects/ProjectIII/src/main/webapp/assets/images/"+imageFileName;
        
        //uploading image
        try{
            FileOutputStream fos = new FileOutputStream(uploadPath);
        InputStream in = file.getInputStream();
        byte[] data = new byte[in.available()];
        in.read(data);
        fos.write(data);
        fos.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        

// Get user session
        HttpSession userSession = request.getSession(false);
        if (userSession == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) userSession.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            int yearBike = Integer.parseInt(yearParam);
            double price = Double.parseDouble(priceParam);
            connection = DbCon.getConnection();

            // Prepare SQL statement without bike_id
            String sql = "INSERT INTO bike (model, brand, year_bike, price, bike_condition, description, date_listed,status,imageFilename, user_id) VALUES (?, ?, ?, ?, ?, ?, ?,?,?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, model);
            statement.setString(2, brand);
            statement.setInt(3, yearBike);
            statement.setDouble(4, price);
            statement.setString(5, bikeCondition);
            statement.setString(6, description);
            statement.setString(7, dateListed);
            statement.setString(8, status);
            statement.setString(9, imageFileName);
            statement.setInt(10, userId);

           
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("success", "Bike successfully added!");
                request.getRequestDispatcher("seller.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to insert data");
                request.getRequestDispatcher("seller.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("seller.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid number format: " + e.getMessage());
            request.getRequestDispatcher("seller.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
