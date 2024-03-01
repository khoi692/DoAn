/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author khois
 */
public class Purchase {

    private int orderId;
    private double total;
    private int userId;
    private String cusName;
    private LocalDateTime orderTime;
    private int orderStatusId;
    private String address;
    private String phone;
    private int quantity;
    private double totalPurchaseCost;
    private String stringOrderTime;
    
    public Purchase() {
    }

    public Purchase(int orderId, double total, int userId, String cusName, LocalDateTime orderTime, int orderStatusId, String address, String phone, int quantity, double totalPurchaseCost) {
        this.orderId = orderId;
        this.total = total;
        this.userId = userId;
        this.cusName = cusName;
        this.orderTime = orderTime;
        this.orderStatusId = orderStatusId;
        this.address = address;
        this.phone = phone;
        this.quantity = quantity;
        this.totalPurchaseCost = totalPurchaseCost;
    }

    public Purchase(int orderId, double total, int userId, String cusName, LocalDateTime orderTime, int orderStatusId, String address, String phone, int quantity, double totalPurchaseCost, String stringOrderTime) {
        this.orderId = orderId;
        this.total = total;
        this.userId = userId;
        this.cusName = cusName;
        this.orderTime = orderTime;
        this.orderStatusId = orderStatusId;
        this.address = address;
        this.phone = phone;
        this.quantity = quantity;
        this.totalPurchaseCost = totalPurchaseCost;
        this.stringOrderTime = stringOrderTime;
    }

    
    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPurchaseCost() {
        return totalPurchaseCost;
    }

    public void setTotalPurchaseCost(double totalPurchaseCost) {
        this.totalPurchaseCost = totalPurchaseCost;
    }

    public String getStringOrderTime() {
        return stringOrderTime;
    }

    public void setStringOrderTime(String stringOrderTime) {
        this.stringOrderTime = stringOrderTime;
    }

    
}
