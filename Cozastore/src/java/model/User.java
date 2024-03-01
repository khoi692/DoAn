/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nhat Anh
 */
public class User {
    private int userID;
    private String name;
    private String gender;
    private String dob;
    private String phone;
    private String address;
    private String email;
    private String userName;
    private String passWord;
    private int roleID;
    private boolean status;

    public User() {
    }
 


    public User(int userID, String name, String gender, String dob, String phone, String address, String email, String userName, String passWord, int roleID, boolean status) {
        this.userID = userID;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.userName = userName;
        this.passWord = passWord;
        this.roleID = roleID;
        this.status = status;
    }
    
    //guest
    public User(String name, int roleID,String email, String address, String phone ,boolean status) {
        this.name = name;
        this.roleID = roleID;
        this.status = status;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }



    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
