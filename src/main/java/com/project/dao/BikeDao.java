/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.dao;

import com.project.connection.DbCon;
import com.project.models.Bike;
import com.project.models.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ohams
 */
public class BikeDao {

    private Connection conn;
    private PreparedStatement pstmt;

    public BikeDao(Connection conn) {
        this.conn = conn;
    }

    public List<Bike> getAllBikes() throws ClassNotFoundException, SQLException {
        List<Bike> bike = new ArrayList<Bike>();

        String sql = "Select * from bike";
        try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Bike row = new Bike();
                row.setId(rs.getInt("id"));
                row.setModel(rs.getString("model"));
                row.setBrand(rs.getString("brand"));
                row.setYear(rs.getString("year_bike"));
                row.setPrice(rs.getFloat("price"));
                row.setBike_condition(rs.getString("bike_condition"));
                row.setDescription(rs.getString("description"));
                row.setDate_listed(rs.getString("date_listed"));
                row.setStatus(rs.getString("status"));
                row.setImageFileName(rs.getString("imageFilename"));
                bike.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bike;
    }

    public List<Bike> getBikesById(int userId) {
        List<Bike> bike = new ArrayList<Bike>();
        String sql = "SELECT * FROM bike where user_id = ?";

        try (Connection con = DbCon.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Bike row = new Bike();
                row.setId(rs.getInt("id"));
                row.setBrand(rs.getString("brand"));
                row.setModel(rs.getString("model"));
                row.setYear(rs.getString("year_bike"));
                row.setBike_condition(rs.getString("bike_condition"));
                row.setDescription(rs.getString("description"));
                row.setDate_listed(rs.getString("date_listed"));
                row.setPrice(rs.getFloat("price"));
                row.setStatus(rs.getString("status"));
                bike.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bike;
    }

    public List<Bike> getBikeById(int bikeId) {
        List<Bike> bike = new ArrayList<Bike>();
        
        try {
            Connection conn = DbCon.getConnection();
            String sql = "SELECT * FROM bike WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bikeId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
               Bike row = new Bike();
                row.setId(rs.getInt("id"));
                row.setBrand(rs.getString("brand"));
                row.setModel(rs.getString("model"));
                row.setYear(rs.getString("year_bike"));
                row.setBike_condition(rs.getString("bike_condition"));
                row.setDescription(rs.getString("description"));
                row.setDate_listed(rs.getString("date_listed"));
                row.setPrice(rs.getFloat("price"));
                row.setStatus(rs.getString("status"));
                row.setImageFileName(rs.getString("imageFilename"));
                bike.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bike;
    }
    
    public boolean deleteBike(int id){
        try{
            Connection con = DbCon.getConnection();
            String sql = "DELETE FROM bike where id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            int rowsAffected = pstmt.executeUpdate();
        }catch(SQLException e){
         e.printStackTrace();
        }
        return false;
    }
    
    public Bike getValues(int id){
        PreparedStatement pstmt = null;
            ResultSet rs = null;
            Bike bike = new Bike();
        try{
            Connection con = DbCon.getConnection();
            String sql = "Select * from bike where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                bike.setBrand(rs.getString("brand"));
                bike.setModel(rs.getString("model"));
                bike.setYear(rs.getString("year_bike"));
                bike.setBike_condition(rs.getString("bike_condition"));
                bike.setPrice(rs.getFloat("price"));
                bike.setDescription(rs.getString("description"));
                bike.setDate_listed(rs.getString("date_listed"));  
                bike.setStatus(rs.getString("status"));
            }
        }catch(SQLException e){
            e.printStackTrace();            
        }
        return bike;
    }
    
    public boolean updateBike(Bike bike){
            String sql = "UPDATE bike SET brand = ?,model = ?,year_bike = ?,price = ?,bike_condition = ?,description = ?,date_listed = ?,status = ? WHERE id = ?";
            boolean isUpdated = false;

      
        try  {
            Connection con = DbCon.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, bike.getBrand());      
            ps.setString(2, bike.getModel()); 
            ps.setString(3, bike.getYear());     
            ps.setFloat(4, bike.getPrice());  
            ps.setString(5, bike.getBike_condition());
            ps.setString(6,bike.getDescription());
            ps.setString(7,bike.getDate_listed());
            ps.setString(8, bike.getStatus());
            
            System.out.println(bike.getStatus());
            
            ps.setInt(9, bike.getId());           
            
            
           int rowsUpdated = ps.executeUpdate();

            
            if (rowsUpdated > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  
        }
        return isUpdated;
    }
    
    public User getUserByBikeId(int id){
                        
        String sql = "SELECT firstname,lastname,email,phone FROM users INNER JOIN bike ON users.id = bike.user_id Where bike.id = ?";
        try{
            Connection con = DbCon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
           if(rs.next()){
               User user = new User();
               user.setFirstName(rs.getString("firstname"));
               user.setLastName(rs.getString("lastname"));
               user.setEmail(rs.getString("email"));
               user.setPhone(rs.getString("phone"));
               return user;
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        
       
        return null;
    }
}
