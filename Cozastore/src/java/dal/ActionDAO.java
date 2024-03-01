/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Action;

/**
 *
 * @author Drag
 */
public class ActionDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<String> getActionNames() {
        ArrayList<String> names = new ArrayList<>();
        try {
            String sql = "Select * from [Action]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                names.add(rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("getActionNames: " + e.getMessage());
        }

        return names;
    }
    
    public ArrayList<String> getObjectNames() {
        ArrayList<String> names = new ArrayList<>();
        try {
            String sql = "Select * from [Object]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                names.add(rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("getObjectNames: " + e.getMessage());
        }

        return names;
    }
    
    public ArrayList<Action> getAll() {
        ArrayList<Action> actions = new ArrayList<>();
        try {
            String select = "SELECT h.id, a.Name, o.name, detail, time FROM [dbo].[History_of_change] h join Action a on h.action_id=a.Id join Object o on h.obj_id=o.id";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            while (rs.next()) {
                String id = rs.getString(1);
//            System.out.println(id);
                String action = rs.getString(2);
//            System.out.println(action);
                String object = rs.getString(3);
                String detail = rs.getString(4);
                Timestamp timestamp = rs.getTimestamp(5);
                String time = dateFormat.format(timestamp);
                Action actionObj = new Action(id, action, object, detail, time);
                actions.add(actionObj);
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }
        return actions;
    }

}
