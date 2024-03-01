/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nhat Anh
 */
public class SaleOrderDetail {
    private int orderId, productId;
    private String productName, color,size;
    private double entryPrice,Price;
    private int quantity;
    private String image;
    public SaleOrderDetail() {
    }

    public SaleOrderDetail(int orderId, int productId, String productName, String color, String size, double entryPrice, double Price, int quantity) {
        this.orderId = orderId;
        this.productId = productId;
        this.productName = productName;
        this.color = color;
        this.size = size;
        this.entryPrice = entryPrice;
        this.Price = Price;
        this.quantity = quantity;
    }

    public SaleOrderDetail(int orderId, int productId, String productName, String color, String size, double entryPrice, double Price, int quantity, String image) {
        this.orderId = orderId;
        this.productId = productId;
        this.productName = productName;
        this.color = color;
        this.size = size;
        this.entryPrice = entryPrice;
        this.Price = Price;
        this.quantity = quantity;
        this.image = image;
    }
    
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public double getEntryPrice() {
        return entryPrice;
    }

    public void setEntryPrice(double entryPrice) {
        this.entryPrice = entryPrice;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    @Override
    public String toString() {
        return getColor() +" "+ getProductName() +" "+ getSize() +" "+ getEntryPrice() +" "+ getOrderId() +" "+ getPrice() +" "+ getProductId() +" "+ getQuantity();
    }
    
}
