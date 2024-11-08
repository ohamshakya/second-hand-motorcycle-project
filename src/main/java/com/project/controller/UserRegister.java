/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.connection.DbCon;
import com.project.dao.UserDao;
import com.project.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


/**
 *
 * @author ohams
 */
public class UserRegister extends HttpServlet {

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
       String firstname = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int role = Integer.parseInt(request.getParameter("role"));
        String password = request.getParameter("password");
        String confrimPassword = request.getParameter("confirmpassword");
        RequestDispatcher dispatcher = null;

        try {
            if (!password.equals(confrimPassword)) {
                request.setAttribute("status", "passwords_do_not_match");
                dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
                return;
            }
            
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            
            User u = new User();
            u.setFirstName(firstname);
            u.setLastName(lastName);
            u.setEmail(email);
            u.setPhone(phone);
            u.setRole(role);
            u.setPassword(hashedPassword);

            UserDao dao = new UserDao(DbCon.getConnection());

            boolean isCheck = dao.userRegister(u);
            dispatcher = request.getRequestDispatcher("register.jsp");
            if (isCheck) {
                request.setAttribute("status", "successfully registered");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);
        } catch (Exception e) {

            e.printStackTrace();
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
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
