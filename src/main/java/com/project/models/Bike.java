/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.models;

/**
 *
 * @author ohams
 */
public class Bike {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private String model;
     private String brand;
     private String year;
     private float price;
     private String bike_condition;
     private String description;
     private String date_listed;

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getBike_condition() {
        return bike_condition;
    }

    public void setBike_condition(String bike_condition) {
        this.bike_condition = bike_condition;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate_listed() {
        return date_listed;
    }

    public void setDate_listed(String date_listed) {
        this.date_listed = date_listed;
    }
    
}
