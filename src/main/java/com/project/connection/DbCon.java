/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.connection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ohams
 */
public class DbCon {
    private static Connection con;
    private static final String URL = "jdbc:mysql://localhost:3306/project";
    private static final String UNAME = "root";
    private static final String PWD = "";
    
    public static Connection getConnection() throws SQLException{
         try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, UNAME, PWD);
            System.out.println("connected to the database");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
        }

        return con;
        
    }
    
}
