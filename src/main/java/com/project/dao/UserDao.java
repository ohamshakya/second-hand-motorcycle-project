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
public class UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean userRegister(User user) throws SQLException {
        boolean isInserted = false;
        try {
            String sql = "INSERT INTO users(firstname,lastname,email,phone,role,password) VALUES (?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.setInt(5, user.getRole());
            pstmt.setString(6, user.getPassword());

            int i = pstmt.executeUpdate();

            if (i == 1) {
                isInserted = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } 
        return isInserted;

    }

    public User getUserByEmail(String email, String password) throws ClassNotFoundException, SQLException {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ? and password = ?";

        try {
            Connection conn = DbCon.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
             rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public Bike selectBikes(int id) throws ClassNotFoundException {
        Bike bike = null;
        String sql = "Select * from bike where id = ?";
        try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String model = rs.getString("model");
                String brand = rs.getString("brand");
                int year = rs.getInt("year");
                float price = rs.getFloat("price");
                String bike_condition = rs.getString("bike_condition");
                String description = rs.getString("description");
                String date_listed = rs.getString("date_listed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bike;
    }

    public List<User> selectAllUsers() throws ClassNotFoundException {

        List<User> userinfo = new ArrayList<User>();
        String sql = "Select * from users where role = 1";
        try (Connection con = DbCon.getConnection(); 
                PreparedStatement pstmt = con.prepareCall(sql)) {

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                User row = new User();
                row.setFirstName(rs.getString("firstname"));
                row.setLastName(rs.getString("lastname"));
                row.setPhone(rs.getString("phone"));
                row.setEmail(rs.getString("email"));

                userinfo.add(row);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userinfo;
    }
    
}
