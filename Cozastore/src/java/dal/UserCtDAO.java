/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import utils.PasswordUtils;

/**
 *
 * @author khois
 */
public class UserCtDAO extends DBContext {

    public User getUserByUserId(int userid) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = new User();
        try {
            String sql = "SELECT [User_id]\n"
                    + "      ,[Full_name]\n"
                    + "      ,[Gender]\n"
                    + "      ,[Dob]\n"
                    + "      ,[Phone_number]\n"
                    + "      ,[Address]\n"
                    + "      ,[Email]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Role_id]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[User]"
                    + "  WHERE [User_id] = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();

            while (rs.next()) {
                user.setUserID(rs.getInt("User_id"));
                user.setName(rs.getString("Full_name"));
                user.setDob(rs.getString("Dob"));
                user.setPhone(rs.getString("Phone_number"));
                user.setGender(rs.getString("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setEmail(rs.getString("Email"));
                user.setUserName(rs.getString("Username"));
                user.setPassWord(rs.getString("Password"));
                user.setRoleID(rs.getInt("Role_id"));
                user.setStatus(rs.getBoolean("status"));
                return user;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User editUserProfile(User user) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [Full_name] = ?\n"
                    + "      ,[Gender] = ?\n"
                    + "      ,[Dob] = ?\n"
                    + "      ,[Phone_number] = ?\n"
                    + "      ,[Address] = ?\n"
                    + " WHERE [User_id] = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getGender());
            ps.setString(3, user.getDob());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePassword(String password, int userId) {
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "UPDATE [dbo].[User]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [User_id] = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, PasswordUtils.MD5(password));
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changePasswordByEmail(String password, String email) {
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "UPDATE [dbo].[User]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE [Email] = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, PasswordUtils.MD5(password));
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String validateChangePassword(String curPass, String newPass, String confirmPass, boolean valid, User user) throws Exception {
        if (!valid) {
            return "Captcha invalid";
        }

        String curPassHash = PasswordUtils.MD5(curPass);
        String oldPassHash = user.getPassWord();

        if (!oldPassHash.equals(curPassHash)) {
            return "Old password not true";
        }
        if (!oldPassHash.equals(oldPassHash)) {
            return "Old password not true";
        }

        if (curPass.equals(newPass)) {
            return "New password must different old password";
        }

        if (!confirmPass.equals(newPass)) {
            return "Password not match";
        }

        return null;
    }

    public boolean isAccountExisted(String email) {
        boolean isAccountExisted = false;
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "Select * from [User] where [Email] = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                isAccountExisted = true;
            }
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        return isAccountExisted;
    }

    public User getAccountByEmail(String email) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = new User();
        try {
            conn = new DBContext().connection;
            String query = "Select * from [User] where [Email] = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setUserID(rs.getInt("User_id"));
                user.setName(rs.getString("Full_name"));
                user.setDob(rs.getString("Dob"));
                user.setPhone(rs.getString("Phone_number"));
                user.setGender(rs.getString("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setEmail(rs.getString("Email"));
                user.setUserName(rs.getString("Username"));
                user.setPassWord(rs.getString("Password"));
                user.setRoleID(rs.getInt("Role_id"));
                user.setStatus(rs.getBoolean("status"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String resetPassword(String email, String password, String confirmPass) {
        if (!password.equals(confirmPass)) {
            return "Password not match";
        } else if (!isAccountExisted(email)) {
            return "Email not found";
        } else {
            User user = getAccountByEmail(email);
            String userEmail = user.getEmail();
            changePasswordByEmail(password, userEmail);
            return "success";
        }
    }

    public static void main(String[] args) {
        UserCtDAO dao = new UserCtDAO();
        User user = dao.getAccountByEmail("khois2p@gmail.com");
//        User user = new User(2, "phuong1", "female", null, "12341234124", "ádfasf", "?dfsf", null, null, 1, true);
        dao.resetPassword("khois2p@gmail.com", "1234", "1234");
//        System.out.println(dao.isAccountExisted("khois2p@gmail.com"));
//        System.out.println(user.getName());
//        System.out.println(user.getName());
    }
}
