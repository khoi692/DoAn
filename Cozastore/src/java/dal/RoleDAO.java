/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author kienb
 */
public class RoleDAO extends DBContext {

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [demo2].[dbo].[Role]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role a = new Role(rs.getInt(1), rs.getString(2));
                list.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
