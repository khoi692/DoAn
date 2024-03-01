/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.MD5;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author pc
 */
public class UserDAO extends DBContext {

    public String getFullNameByUserID(int userId) {

        String sql = "select full_name from [User]\n"
                + "where user_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString("full_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }
    private MD5 md5 = new MD5();

    public ArrayList<User> getAllUser() {
        ArrayList<User> listUser = new ArrayList<>();
        try {

            String sql = "SELECT * FROM [User]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11));
                listUser.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public ArrayList<User> getAllCustomer() {
        ArrayList<User> listUser = new ArrayList<>();
        try {

            String sql = "SELECT * FROM [User] where Role_id = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11));
                listUser.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public void createUser(String fullname, String phone, String address, String email, String dob, String gender,
            String username, String password, int roleID, boolean status) throws ParseException {
        int statusID = status ? 1 : 0;
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date utilDate = sdf.parse(dob);
//        Date sqlDate = new Date(utilDate.getTime());
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([Full_name]\n"
                    + "           ,[Gender]\n"
                    + "           ,[Dob]\n"
                    + "           ,[Phone_number]\n"
                    + "           ,[Address]\n"
                    + "           ,[Email]\n"
                    + "           ,[Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[Role_id]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, gender);
            statement.setDate(3, null);
            statement.setString(4, phone);
            statement.setString(5, address);
            statement.setString(6, email);
            statement.setString(7, null);
            statement.setString(8, md5.getMd5(password));
            statement.setInt(9, roleID);
            statement.setInt(10, statusID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUser(String email, boolean status) {
        int statusID = status ? 1 : 0;
        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE Email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusID);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int count() {
        int c = 0;
        try {
            String select = "select * from [User] where status = 1 and Role_id = 2";
            PreparedStatement stm = connection.prepareStatement(select);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (SQLException e) {
            System.out.println("count:" + e.getMessage());
        }
        return c;
    }

    public User getUserById(String id) {
        User u = new User();
//        UserDTO u = new UserDTO();
        String sql = "Select * from [User] u \n"
                + "where u.User_id =? and u.Role_id = 2";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(id));
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setGender(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setPhone(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setEmail(rs.getString(7));
                u.setUserName(rs.getString(8));
                u.setPassWord(rs.getString(9));
                u.setRoleID(2);
                u.setStatus(rs.getBoolean(11));
//                u.setMessage(rs.getString(13));
//                u.setTime(rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public ArrayList<User> search(String username, String email, String gender) {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            List<Object> listParams = new ArrayList<>();
            String sql = "SELECT * FROM [User] where 1 = 1 and Role_id = 2";
            if (username != null && !username.trim().isEmpty()) {
                sql += " and [Full_name] like ?";
                listParams.add("%" + username + "%");
            }
            if (email != null && !email.trim().isEmpty()) {
                sql += " and email like ?";
                listParams.add("%" + email + "%");
            }
//            if (status != null && !status.trim().isEmpty()) {
//                sql += " and [status] = ?";
//                listParams.add(status.equals("1"));
//            }
            if (gender != null && !gender.trim().isEmpty()) {
                sql += " and gender = ?";
                listParams.add(gender.equals("1"));
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            setParams(stm, listParams);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11));
                listUser.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public ArrayList<String> getName() {
        ArrayList<String> names = new ArrayList<>();
        String sql = "SELECT Full_name\n"
                + "  FROM [User]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                names.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("getName:" + e.getMessage());
        }
        return names;
    }

    public static void setParams(PreparedStatement ps, List<Object> list) throws SQLException {
        int i = 1;
        for (Object arg : list) {
            if (arg instanceof java.util.Date) {
                ps.setTimestamp(i++, new Timestamp(((java.util.Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else if (arg instanceof Boolean) {
                ps.setBoolean(i++, (Boolean) arg);
            } else {
                ps.setString(i++, (String) arg);
            }
        }
    }

    public ArrayList<User> getUserByRole(int roleId) {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User]";
            if (roleId != 0) {
                sql = "SELECT * FROM [User] where Role_id = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (roleId != 0) {
                stm.setInt(1, roleId);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11));
                listUser.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUser;
    }

    public void updateStatus(int id, boolean status) {
        int statusID = status ? 1 : 0;
        try {
            String sql = "update [User] set [status] = ? where [User_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getAllUserById(String id) {
        User u = new User();
//        UserDTO u = new UserDTO();
        String sql = "Select * from [User] u \n"
                + "where u.User_id =? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(id));
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setGender(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setPhone(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setEmail(rs.getString(7));
                u.setUserName(rs.getString(8));
                u.setPassWord(rs.getString(9));
                u.setRoleID(2);
                u.setStatus(rs.getBoolean(11));
//                u.setMessage(rs.getString(13));
//                u.setTime(rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public User getUserByEmail(String email) {
        User u = new User();
//        UserDTO u = new UserDTO();
        String sql = "Select * from [User] u \n"
                + "where u.[Email] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setGender(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setPhone(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setEmail(rs.getString(7));
                u.setUserName(rs.getString(8));
                u.setPassWord(rs.getString(9));
                u.setRoleID(2);
                u.setStatus(rs.getBoolean(11));
//                u.setMessage(rs.getString(13));
//                u.setTime(rs.getString(14));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Integer> getCustomerAgeCount() {

        ArrayList<Integer> counts = new ArrayList<>();

        counts.add(0); // <18
        counts.add(0); // 18-24
        counts.add(0); // 25-34 
        counts.add(0); // 35-44
        counts.add(0); // 45-54
        counts.add(0); // 55+

        String sql = "SELECT CASE "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) < 18 THEN '<18' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 18 AND 24 THEN '18-24' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 25 AND 34 THEN '25-34' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 35 AND 44 THEN '35-44' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 45 AND 54 THEN '45-54' "
                + "ELSE '55+' END AS AgeGroup, COUNT(*) AS Count "
                + "FROM [User] where status = 1 and Role_id = 2 "
                + "GROUP BY CASE "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) < 18 THEN '<18' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 18 AND 24 THEN '18-24' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 25 AND 34 THEN '25-34' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 35 AND 44 THEN '35-44' "
                + "WHEN DATEDIFF(YEAR, Dob, GETDATE()) BETWEEN 45 AND 54 THEN '45-54' "
                + "ELSE '55+' END";
//        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String ageGroup = rs.getString("AgeGroup");
                int count = rs.getInt("Count");

                int index = getAgeGroupIndex(ageGroup);
                counts.set(index, count);
            }
        } catch (SQLException e) {
            System.out.println("Error getting age counts: " + e.getMessage());
        }

        return counts;
    }

    public int getAgeGroupIndex(String ageGroup) {

        if (ageGroup.equals("<18")) {
            return 0;
        } else if (ageGroup.equals("18-24")) {
            return 1;
        } else if (ageGroup.equals("25-34")) {
            return 2;
        } else if (ageGroup.equals("35-44")) {
            return 3;
        } else if (ageGroup.equals("45-54")) {
            return 4;
        } else if (ageGroup.equals("55+")) {
            return 5;
        }

        return -1;
    }

    public ArrayList<Integer> getCustomerGenderCount() {

        ArrayList<Integer> counts = new ArrayList<>();
        counts.add(0); // Male 
        counts.add(0); // Female

        String sql = "SELECT Gender, COUNT(*) AS Count FROM [User] where status = 1 and Role_id = 2 "
                + "GROUP BY Gender";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int gender = rs.getInt("Gender");
                int count = rs.getInt("Count");

                if (gender == 1) {
                    counts.set(0, count); // Male
                } else {
                    counts.set(1, count); // Female
                }
            }

        } catch (SQLException e) {
            System.out.println("Error getting gender counts: " + e.getMessage());
        }

        return counts;
    }
    public void createAccount(String fullname, String phone, String email, String address, String gender, String password, int roleID) {
        int statusID = 1;
        try {
            String sql = "INSERT INTO [dbo].[User] ("
            + "[Full_name], [Gender], [Phone_number], [Address], [Email], [Password], [Role_id], [status])"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, 1)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, fullname);
        statement.setString(2, gender);
        statement.setString(3, phone);
        statement.setString(4, address);
        statement.setString(5, email);
        statement.setString(6, password);
        statement.setInt(7, roleID);
        statement.executeUpdate();
        } catch (SQLException ex) {
             Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
