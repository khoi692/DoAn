/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OdDetail;
import model.OdStatus;
import model.Purchase;

/**
 *
 * @author khois
 */
public class PurchaseDAO extends DBContext {

    public List<OdStatus> getAllStatus() {
        String sql = "SELECT [orderStatus_id]\n"
                + ",UPPER(LEFT([orderStatus_name], 1)) + SUBSTRING([orderStatus_name], 2, LEN([orderStatus_name])) AS [orderStatus_name]\n"
                + "FROM [dbo].[Order_Status]";
        List<OdStatus> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OdStatus os = new OdStatus();
                os.setId(rs.getInt("orderStatus_id"));
                os.setName(rs.getString("orderStatus_name"));
                list.add(os);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public OdStatus getStatusyById(int id) {
        String sql = "SELECT [orderStatus_id]\n"
                + "      ,[orderStatus_name]\n"
                + "  FROM [dbo].[Order_Status]\n"
                + "  WHERE [orderStatus_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OdStatus o = new OdStatus();
                o.setId(rs.getInt("orderStatus_id"));
                o.setName(rs.getString("orderStatus_name"));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Purchase> getAllPurchasesByStatus(int userId, int stt) {
        String sql = "SELECT [Order_id]\n"
                + "      ,[Total]\n"
                + "      ,[User_id]\n"
                + "      ,[customerFullName]\n"
                + "      ,[orderStatus_id]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[Order]\n"
                + "  WHERE [User_id] = ?\n";
        if (stt != 0) {
            sql += " and [orderStatus_id] = " + stt;
        }
        sql += "  ORDER BY [orderTime] DESC";
        List<Purchase> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Purchase purchase = new Purchase();
                purchase.setOrderId(rs.getInt("Order_id"));
                purchase.setTotal(rs.getDouble("Total"));
                purchase.setUserId(rs.getInt("User_id"));
                purchase.setCusName(rs.getString("customerFullName"));
                purchase.setOrderStatusId(rs.getInt("orderStatus_id"));
                purchase.setAddress(rs.getString("address"));
                purchase.setPhone(rs.getString("phone"));
                list.add(purchase);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void cancelOrder(int id) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [orderStatus_id] = 2\n"
                + " WHERE [Order_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public Purchase getOrderById(int id) {
        String sql = "SELECT [Order_id]\n"
                + "      ,[Total]\n"
                + "      ,[User_id]\n"
                + "      ,[customerFullName]\n"
                + "      ,[orderTime]\n"
                + "      ,[orderStatus_id]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "      ,[total_purchase_cost]\n"
                + "  FROM [dbo].[Order]\n"
                + "  WHERE [Order_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Purchase o = new Purchase();
                o.setOrderId(rs.getInt("Order_id"));
                o.setTotal(rs.getDouble("Total"));
                o.setUserId(rs.getInt("User_id"));
                o.setCusName(rs.getString("customerFullName"));
                LocalDateTime createdDate = rs.getTimestamp("orderTime").toLocalDateTime();
                o.setOrderTime(createdDate);
                o.setOrderStatusId(rs.getInt("orderStatus_id"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setTotalPurchaseCost(rs.getDouble("total_purchase_cost"));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OdDetail> getDetailByOrderId(int orderId) {
        String sql = "WITH A AS (SELECT P.Product_id, Product_name, Price, pc.image, pc.Color_id,\n"
                + "CASE WHEN (start_discount > GETDATE() OR end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount\n"
                + "FROM product_color pc\n"
                + "INNER JOIN Product p ON pc.Product_id = p.Product_id\n"
                + "),\n"
                + "B AS (\n"
                + "SELECT od.order_id, scp.Color_id, scp.Size_id, scp.Product_id, od.quantity\n"
                + "FROM OrderDetail od\n"
                + "INNER JOIN size_color_product scp ON od.scp_id = scp.scp_id\n"
                + ")\n"
                + "SELECT order_id, A.Product_id, B.Color_id, Size_id, quantity, Product_name, [image],\n"
                + "CONVERT(DECIMAL(10,2),(Price - Price * (ISNULL(Discount, 0)/100))*quantity)AS Price\n"
                + "FROM B\n"
                + "LEFT OUTER JOIN A ON B.Product_id = A.Product_id\n"
                + "WHERE B.Color_id = A.Color_id and order_id = ?";
        List<OdDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OdDetail odd = new OdDetail();
                odd.setOrderId(rs.getInt("order_id"));
                odd.setProductId(rs.getInt("Product_id"));
                odd.setColor(rs.getString("Color_id"));
                odd.setSize(rs.getString("Size_id"));
                odd.setQuantity(rs.getInt("quantity"));
                odd.setProductName(rs.getString("Product_name"));
                odd.setImage(rs.getString("image"));
                odd.setPrice(rs.getDouble("Price"));
                list.add(odd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Purchase> getAllOrder() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String sql = "SELECT [Order_id]\n"
                + ",[Total]\n"
                + ",[User_id]\n"
                + ",[orderTime]\n"
                + ",[orderStatus_id]\n"
                + ",[address]\n"
                + ",[phone]\n"
                + " ,[customerFullName]\n"
                + " ,[total_purchase_cost]\n"
                + " FROM [dbo].[Order]\n"
                + " order by orderTime";
        List<Purchase> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Purchase o = new Purchase();
                o.setOrderId(rs.getInt("Order_id"));
                o.setTotal(rs.getDouble("Total"));
                o.setUserId(rs.getInt("User_id"));
                o.setCusName(rs.getString("customerFullName"));
                LocalDateTime createdDate = rs.getTimestamp("orderTime").toLocalDateTime();
                o.setOrderTime(createdDate);
                o.setOrderStatusId(rs.getInt("orderStatus_id"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setTotalPurchaseCost(rs.getDouble("total_purchase_cost"));
                o.setStringOrderTime(createdDate.format(formatter));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Purchase> search(String orderId, String total, String userId, String cusName, String orderStatusId, String totalPurchaseCost) {
        ArrayList<Purchase> listOrder = new ArrayList<>();
        try {
            List<Object> listParams = new ArrayList<>();
            String sql = "SELECT * FROM [Order] where 1 = 1";
            if (orderId != null && !orderId.trim().isEmpty()) {
                sql += " and [Order_id] like ?";
                listParams.add(orderId.equals("1"));
            }
            if (total != null && !total.trim().isEmpty()) {
                sql += " and [Total] like ?";
                listParams.add("%" + total + "%");
            }
            if (userId != null && !userId.trim().isEmpty()) {
                sql += " and [User_id] = ?";
                listParams.add(userId.equals("1"));
            }
            if (cusName != null && !cusName.trim().isEmpty()) {
                sql += " and [customerFullName] = ?";
                listParams.add("%" + cusName + "%");
            }
            if (orderStatusId != null && !orderStatusId.trim().isEmpty()) {
                sql += " and [orderStatus_id] = ?";
                listParams.add(orderStatusId.equals("1"));
            }
            if (totalPurchaseCost != null && !totalPurchaseCost.trim().isEmpty()) {
                sql += " and [total_purchase_cost] = ?";
                listParams.add("%" + totalPurchaseCost + "%");
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            setParams(stm, listParams);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Purchase o = new Purchase();
                o.setOrderId(rs.getInt("Order_id"));
                o.setTotal(rs.getDouble("Total"));
                o.setUserId(rs.getInt("User_id"));
                o.setCusName(rs.getString("customerFullName"));
                LocalDateTime createdDate = rs.getTimestamp("orderTime").toLocalDateTime();
                o.setOrderTime(createdDate);
                o.setOrderStatusId(rs.getInt("orderStatus_id"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setTotalPurchaseCost(rs.getDouble("total_purchase_cost"));
                listOrder.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOrder;
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

    public void updateStatus(Purchase pur) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [orderStatus_id] = ?\n"
                + " WHERE [Order_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pur.getOrderStatusId());
            st.setInt(2, pur.getOrderId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {
        PurchaseDAO dao = new PurchaseDAO();
        List<OdDetail> purchase = dao.getDetailByOrderId(1);
        Purchase pur = new Purchase(42, 0, 0, null, null, 2, null, null, 0, 0);
        dao.updateStatus(pur);
    }
}
