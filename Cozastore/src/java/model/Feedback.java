/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nhat Anh
 */
public class Feedback {
    private int feadbackId, userId;
    private String content;
    private int rating;
    private int productId;
    private String userImage;
    private String fullName, productName, time;
    private boolean status;
    public Feedback() {
    }

    public Feedback(int feadbackId, int userId, String content, int rating, int productId, String userImage, String fullName) {
        this.feadbackId = feadbackId;
        this.userId = userId;
        this.content = content;
        this.rating = rating;
        this.productId = productId;
        this.userImage = userImage;
        this.fullName = fullName;
    }

    public int getFeadbackId() {
        return feadbackId;
    }

    public void setFeadbackId(int feadbackId) {
        this.feadbackId = feadbackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
