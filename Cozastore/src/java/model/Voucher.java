/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Voucher {
    private String code, describe, start_voucher, end_voucher, type;
    private int quantity, status, min_condition;
    private double discount;
    //status
    //-2 : out of number
    //-1: out of date
    //0: on waiting
    //1 : avail on going ( on going and quantity avail

    public Voucher() {
    }

    public Voucher(String code, String describe, String start_voucher, String end_voucher, String type, int quantity, int status, int min_condition, double discount) {
        this.code = code;
        this.describe = describe;
        this.start_voucher = start_voucher;
        this.end_voucher = end_voucher;
        this.type = type;
        this.quantity = quantity;
        this.status = status;
        this.min_condition = min_condition;
        this.discount = discount;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getStart_voucher() {
        return start_voucher;
    }

    public void setStart_voucher(String start_voucher) {
        this.start_voucher = start_voucher;
    }

    public String getEnd_voucher() {
        return end_voucher;
    }

    public void setEnd_voucher(String end_voucher) {
        this.end_voucher = end_voucher;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public int getMin_condition() {
        return min_condition;
    }

    public void setMin_condition(int min_condition) {
        this.min_condition = min_condition;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    
}
