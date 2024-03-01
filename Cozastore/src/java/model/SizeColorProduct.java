/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nhat Anh
 */
public class SizeColorProduct {
    private int scpId;
    private String colorId;
    private int productId;
    private String sizeId;
    private int quantity;

    public SizeColorProduct() {
    }

    public SizeColorProduct(int scpId, String colorId, int productId, String sizeId, int quantity) {
        this.scpId = scpId;
        this.colorId = colorId;
        this.productId = productId;
        this.sizeId = sizeId;
        this.quantity = quantity;
    }

    public int getScpId() {
        return scpId;
    }

    public void setScpId(int scpId) {
        this.scpId = scpId;
    }

    public String getColorId() {
        return colorId;
    }

    public void setColorId(String colorId) {
        this.colorId = colorId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSizeId() {
        return sizeId;
    }

    public void setSizeId(String sizeId) {
        this.sizeId = sizeId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
