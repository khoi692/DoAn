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
import java.util.Arrays;
import java.util.HashMap;
import model.Order;
import model.OrderDTO;

/**
 *
 * @author Drag
 */
public class OrderDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public int count() {
        int c = 0;
        try {
            String select = "select * from [Order] where orderStatus_id = 1";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (SQLException e) {
            System.out.println("count:" + e.getMessage());
        }
        return c;
    }

    public double getTotalRevenue() {
        String sql = "select Total from [Order]";
        double total = 0;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                total += rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotal: " + e.getMessage());
        }
        return total;
    }

    public ArrayList<Integer> getWeeklyRevenue(String[] dates) {
        ArrayList<Integer> weeklyRevenue = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0, 0, 0));
        String startDate = dates[0];
        String endDate = dates[1];
        String query = "SET DATEFIRST 1\nSELECT DATEPART(dw, orderTime) as dayOfWeek, SUM(Total) as revenue FROM [Order] WHERE orderStatus_id = 1 AND orderTime BETWEEN ? AND ? GROUP BY DATEPART(dw, orderTime)";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            rs = stm.executeQuery();
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
            String select = "SELECT o.Order_id, u.Full_name, p.Product_name, o.Total, os.orderStatus_name, o.orderTime FROM [Order] o JOIN [User] u ON o.[User_id] = u.[User_id] JOIN OrderDetail od ON o.Order_id = od.order_id JOIN size_color_product scp ON od.scp_id = scp.scp_id JOIN Product p ON scp.Product_id = p.Product_id JOIN Order_Status os ON o.orderStatus_id = os.orderStatus_id\n"
                    + "order by orderTime desc";
            stm = connection.prepareStatement(select);
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

    public ArrayList<OrderDTO> getAllOrderDTO() {
        ArrayList<OrderDTO> orders = new ArrayList<>();
        try {
            String select = "Select Month(orderTime),Year(orderTime),sum(Total) - sum(total_purchase_cost),sum(Total) from [Order] where orderStatus_id = 1\n"
                    + "group by Month(orderTime),Year(orderTime) order by Year(orderTime) desc,Month(orderTime) desc";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setMonth(rs.getInt(1));
                o.setYear(rs.getInt(2));
                o.setRevunue(rs.getDouble(3));
                o.setTotalSell(rs.getDouble(4));
                orders.add(o);
            }
        } catch (SQLException e) {

        }
        return orders;
    }
}
