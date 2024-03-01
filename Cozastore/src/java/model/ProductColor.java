/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Nhat Anh
 */
public class ProductColor {
    private int productId;
    private String colorId;
    private String image;
    private boolean defaultImage;
    private List<String> size;
    private List<Integer> quantity;
    
    public ProductColor() {
    }

    public ProductColor(int productId, String colorId, String image, boolean defaultImage, List<String> size, List<Integer> quantity) {
        this.productId = productId;
        this.colorId = colorId;
        this.image = image;
        this.defaultImage = defaultImage;
        this.size = size;
        this.quantity = quantity;
    }

    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getColorId() {
        return colorId;
    }

    public void setColorId(String colorId) {
        this.colorId = colorId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isDefaultImage() {
        return defaultImage;
    }

    public void setDefaultImage(boolean defaultImage) {
        this.defaultImage = defaultImage;
    }

    public List<String> getSize() {
        return size;
    }

    public void setSize(List<String> size) {
        this.size = size;
    }

    public List<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(List<Integer> quantity) {
        this.quantity = quantity;
    }
    
}
