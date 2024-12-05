/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.dao;

import com.project.connection.DbCon;
import com.project.models.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ohams
 */
public class AdminDao {
    
    private Connection conn;
    
    
    public AdminDao(Connection con){
        this.conn = con;
    }
    public boolean getAdminByUsernmae(String username,String password){
        boolean isLogin = false;
        Admin admin = null;
        String sql = "SELECT * from admin where username = ? and password = ?";
        try{
            Connection con = DbCon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            admin = new Admin();
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()){
                isLogin = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
       return isLogin;
    }
    
    public boolean adminRegister(Admin admin){
        boolean isInserted = false;
        String sql = "INSERT INTO admin(username,password) VALUES (?,?)";
        
        try{
            Connection con = DbCon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, admin.getUsername());
            pstmt.setString(2,admin.getPassword());
            
            int i = pstmt.executeUpdate();
            if(i==1){
                isInserted = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return isInserted;
    }
    
    public int countBikes(){
        int count = 0;
        try{
        Connection con = DbCon.getConnection();
        String query = "SELECT COUNT(*) from bike";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            if(rs.next()){
                count = rs.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
        
        
    }
    
}
