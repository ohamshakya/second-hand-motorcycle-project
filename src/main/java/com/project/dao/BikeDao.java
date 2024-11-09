/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.dao;

import com.project.connection.DbCon;
import com.project.models.Bike;
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

            if (rs.next()) {
                Bike row = new Bike();
                row.setModel(rs.getString("model"));
                row.setBrand(rs.getString("brand"));
                row.setYear(rs.getString("year_bike"));
                row.setPrice(rs.getFloat("price"));
                row.setBike_condition(rs.getString("bike_condition"));
                row.setDescription(rs.getString("description"));
                row.setDescription(rs.getString("date_listed"));
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
                row.setId(rs.getInt("bike_id"));
                row.setBrand(rs.getString("brand"));
                row.setModel(rs.getString("model"));
                row.setYear(rs.getString("year_bike"));
                row.setBike_condition(rs.getString("bike_condition"));
                row.setDescription(rs.getString("description"));
                row.setDate_listed(rs.getString("date_listed"));
                row.setPrice(rs.getFloat("price"));
                bike.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bike;
    }

    public Bike getBikeById(int bikeId) {
        Bike bike = null;
        try {
            Connection conn = DbCon.getConnection();
            String sql = "SELECT * FROM bikes WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bikeId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                bike = new Bike();
                bike.setId(rs.getInt("id"));
                bike.setBrand(rs.getString("brand"));
                bike.setModel(rs.getString("model"));
                bike.setYear(rs.getString("year"));
                bike.setBike_condition(rs.getString("condition"));
                bike.setPrice(rs.getFloat("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bike;
    }
    
    public boolean deleteBike(int id){
        try{
            Connection con = DbCon.getConnection();
            String sql = "DELETE FROM bike where bike_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            int rowsAffected = pstmt.executeUpdate();
        }catch(SQLException e){
         e.printStackTrace();
        }
        return false;
    }
    
    public Bike getValues(String id){
        PreparedStatement pstmt = null;
            ResultSet rs = null;
            Bike bike = new Bike();
        try{
            Connection con = DbCon.getConnection();
            String sql = "Select * from bike where bike_id = ?";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                bike.setBrand(rs.getString("brand"));
                bike.setModel(rs.getString("model"));
                bike.setYear(rs.getString("year_bike"));
                bike.setBike_condition("bike_condition");
                bike.setPrice(rs.getFloat("price"));
                bike.setDescription(rs.getString("description"));
                bike.setDate_listed(rs.getString("date_listed"));  
            }
        }catch(SQLException e){
            e.printStackTrace();            
        }
        return bike;
    }
    
    public void updateBike(Bike bike){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try{
            Connection con = DbCon.getConnection();
            
            String sql = "Update bike set  brand = ?,model = ?,year_bike = ?,price = ?,bike_condition = ?,description = ?,date_listed = ? where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bike.getBrand());
            pstmt.setString(2, bike.getModel());
            pstmt.setString(3, bike.getYear());
            pstmt.setFloat(4, bike.getPrice());
            pstmt.setString(5,bike.getBike_condition());
            pstmt.setString(6,bike.getDescription());
            pstmt.setString(7,bike.getDate_listed());
            
            pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
}
