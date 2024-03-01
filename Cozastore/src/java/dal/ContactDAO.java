/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import model.Contact;

/**
 *
 * @author Nhat Anh
 */
public class ContactDAO extends DBContext {

    public void insertContact(Contact contact) {
        String sql = "INSERT INTO [dbo].[Contact]\n"
                + "           ([User_id]\n"
                + "           ,[Message]\n"
                + "           ,[Time])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, contact.getUserId());
            statement.setString(2, contact.getMessage());
            statement.setString(3, contact.getTime());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
}
