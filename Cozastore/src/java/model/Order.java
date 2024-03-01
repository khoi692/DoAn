/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 *
 * @author Drag
 */
public class Order {

    Connection cnn;
    PreparedStatement stm;
    ResultSet rs;

    public void connect() {
        cnn = (new DBContext()).connection;
        if (cnn != null) {
            System.out.println("Success");
        } else {
            System.out.println("Fail");
        }
    }

    String id, name, product, total, status, date;

    public Order() {
        connect();
    }

    public Order(String id, String name, String product, String total, String status, String date) {
        this.id = id;
        this.name = name;
        this.product = product;
        this.total = total;
        this.status = status;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int count() {
        int c = 0;
        try {
            String select = "select * from [Order] where orderStatus_id = 3";
            stm = cnn.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (SQLException e) {
            System.out.println("count:" + e.getMessage());
        }
        return c;
    }

    public ArrayList<Integer> getWeeklyRevenue(String[] dates) {
        ArrayList<Integer> weeklyRevenue = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0, 0, 0));
        String startDate = dates[0];
        String endDate = dates[1];
        String query = "SELECT DATEPART(dw, orderTime) as dayOfWeek, SUM(Total) as revenue FROM [Order] WHERE orderStatus_id = 3 AND orderTime BETWEEN ? AND ? GROUP BY DATEPART(dw, orderTime)";
        try {
            PreparedStatement stm = cnn.prepareStatement(query);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int dayOfWeek = rs.getInt("dayOfWeek");
                int revenue = rs.getInt("revenue");
                weeklyRevenue.set(dayOfWeek - 1, revenue);
            }
        } catch (SQLException e) {
            System.out.println("getWeeklyRevenue: " + e.getMessage());
        }
        return weeklyRevenue;
    }

    public ArrayList<Order> getOrders() {
    ArrayList<Order> orders = new ArrayList<>();
    try {
        String select = "SELECT o.Order_id, u.Full_name, p.Product_name, o.Total, os.orderStatus_name, o.orderTime FROM [Order] o JOIN [User] u ON o.[User_id] = u.[User_id] JOIN OrderDetail od ON o.Order_id = od.order_id JOIN size_color_product scp ON od.scp_id = scp.scp_id JOIN Product p ON scp.Product_id = p.Product_id JOIN Order_Status os ON o.orderStatus_id = os.orderStatus_id";
        stm = cnn.prepareStatement(select);
        rs = stm.executeQuery();
        HashMap<String, Order> orderMap = new HashMap<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        while (rs.next()) {
            String id = rs.getString("Order_id");
            String name = rs.getString("Full_name");
            String product = rs.getString("Product_name");
            String total = Double.toString(rs.getDouble("Total"));
            String status = rs.getString("orderStatus_name");
            Timestamp timestamp = rs.getTimestamp("orderTime");
            String date = dateFormat.format(timestamp);
            if (orderMap.containsKey(id)) {
                Order order = orderMap.get(id);
                order.setProduct(order.getProduct() + ", " + product);
            } else {
                Order order = new Order(id, name, product, total, status, date);
                orderMap.put(id, order);
            }
        }
        orders.addAll(orderMap.values());
    } catch (SQLException e) {
        System.out.println("getOrders: " + e.getMessage());
    }
    return orders;
}


}
