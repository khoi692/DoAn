/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author kienb
 */
public class OrderDTO {
    private int month;
    private double revunue;
    private double totalSell;
    private int year;

    public OrderDTO() {
    }

    public OrderDTO(int month, double revunue, double totalSell, int year) {
        this.month = month;
        this.revunue = revunue;
        this.totalSell = totalSell;
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getRevunue() {
        return revunue;
    }

    public void setRevunue(double revunue) {
        this.revunue = revunue;
    }

    public double getTotalSell() {
        return totalSell;
    }

    public void setTotalSell(double totalSell) {
        this.totalSell = totalSell;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    

    
    
    
}
