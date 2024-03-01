/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Nhat Anh
 */
public class SaleOrder {
    private int orderId;
    private double total, totalPurchaseCost;
    private int userId;
    private Date orderTime;
    private int orderStatusId;
    private String address;
    private String phone;
    private String customerFullName;

    public SaleOrder() {
    }

    public SaleOrder(int orderId, double total, double totalPurchaseCost, int userId, Date orderTime, int orderStatusId, String address, String phone, String customerFullName) {
        this.orderId = orderId;
        this.total = total;
        this.totalPurchaseCost = totalPurchaseCost;
        this.userId = userId;
        this.orderTime = orderTime;
        this.orderStatusId = orderStatusId;
        this.address = address;
        this.phone = phone;
        this.customerFullName = customerFullName;
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

    public double getTotalPurchaseCost() {
        return totalPurchaseCost;
    }

    public void setTotalPurchaseCost(double totalPurchaseCost) {
        this.totalPurchaseCost = totalPurchaseCost;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
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

    public String getCustomerFullName() {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) {
        this.customerFullName = customerFullName;
    }
    
    
}
