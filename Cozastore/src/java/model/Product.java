/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Nhat Anh
 */
public class Product {
    private int productId;
    private String productName;
    private String categoryId;
    private String describe;
    private double entryPrice,price,discount;
    private String startDiscount,endDiscount;
    private String productImageDefault;
    private String categoryGender;
    private Date releaseDate;
    private int totalQuantity;
    private boolean quantitySizeColor;
    public Product() {
    }
    
    public Product(int productId, String productName, String categoryId, String describe, double entryPrice, double price, double discount, String startDiscount, String endDiscount) {
        this.productId = productId;
        this.productName = productName;
        this.categoryId = categoryId;
        this.describe = describe;
        this.entryPrice = entryPrice;
        this.price = price;
        this.discount = discount;
        this.startDiscount = startDiscount;
        this.endDiscount = endDiscount;
    }
    
    public Product(int productId, String productName, String categoryId, String describe, double entryPrice, double price, double discount, String startDiscount, String endDiscount, String productImageDefault, String categoryGender, Date releaseDate, int totalQuantity, boolean quantitySizeColor) {
        this.productId = productId;
        this.productName = productName;
        this.categoryId = categoryId;
        this.describe = describe;
        this.entryPrice = entryPrice;
        this.price = price;
        this.discount = discount;
        this.startDiscount = startDiscount;
        this.endDiscount = endDiscount;
        this.productImageDefault = productImageDefault;
        this.categoryGender = categoryGender;
        this.releaseDate = releaseDate;
        this.totalQuantity = totalQuantity;
        this.quantitySizeColor = quantitySizeColor;
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

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public double getEntryPrice() {
        return entryPrice;
    }

    public void setEntryPrice(double entryPrice) {
        this.entryPrice = entryPrice;
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

    public String getStartDiscount() {
        return startDiscount;
    }

    public void setStartDiscount(String startDiscount) {
        this.startDiscount = startDiscount;
    }

    public String getEndDiscount() {
        return endDiscount;
    }

    public void setEndDiscount(String endDiscount) {
        this.endDiscount = endDiscount;
    }

    public String getProductImageDefault() {
        return productImageDefault;
    }

    public void setProductImageDefault(String productImageDefault) {
        this.productImageDefault = productImageDefault;
    }

    public String getCategoryGender() {
        return categoryGender;
    }

    public void setCategoryGender(String categoryGender) {
        this.categoryGender = categoryGender;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public boolean isQuantitySizeColor() {
        return quantitySizeColor;
    }

    public void setQuantitySizeColor(boolean quantitySizeColor) {
        this.quantitySizeColor = quantitySizeColor;
    }

   
}
