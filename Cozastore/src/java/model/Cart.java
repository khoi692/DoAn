/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Cart {
    // status : -a : quantity in stock is smaller than quantity in cart (a left)
    // status : 0 : quantity in stock is 0 (out of stock)
    private int scpId, productId, quantity, status;
    private String productName, categoryId, colorId, sizeId,productImageDefault;
    private double price, discount, entryPrice;

    public Cart() {
    }

    public Cart(int scpId, int productId, int quantity, int status, String productName, String categoryId, String colorId, String sizeId, String productImageDefault, double price, double discount, double entryPrice) {
        this.scpId = scpId;
        this.productId = productId;
        this.quantity = quantity;
        this.status = status;
        this.productName = productName;
        this.categoryId = categoryId;
        this.colorId = colorId;
        this.sizeId = sizeId;
        this.productImageDefault = productImageDefault;
        this.price = price;
        this.discount = discount;
        this.entryPrice = entryPrice;
    }

     public Cart(int scpId, int productId, int quantity, int status, String productName, String categoryId, String colorId, String sizeId, String productImageDefault, double price, double discount) {
        this.scpId = scpId;
        this.productId = productId;
        this.quantity = quantity;
        this.status = status;
        this.productName = productName;
        this.categoryId = categoryId;
        this.colorId = colorId;
        this.sizeId = sizeId;
        this.productImageDefault = productImageDefault;
        this.price = price;
        this.discount = discount;
    }

    

    public int getScpId() {
        return scpId;
    }

    public void setScpId(int scpId) {
        this.scpId = scpId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getColorId() {
        return colorId;
    }

    public void setColorId(String colorId) {
        this.colorId = colorId;
    }

    public String getSizeId() {
        return sizeId;
    }

    public void setSizeId(String sizeId) {
        this.sizeId = sizeId;
    }

    public String getProductImageDefault() {
        return productImageDefault;
    }

    public void setProductImageDefault(String productImageDefault) {
        this.productImageDefault = productImageDefault;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getEntryPrice() {
        return entryPrice;
    }

    public void setEntryPrice(double entryPrice) {
        this.entryPrice = entryPrice;
    }
    
}  
