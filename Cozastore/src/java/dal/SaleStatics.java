/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.SaleOrder;
import model.SaleOrderDetail;

/**
 *
 * @author Nhat Anh
 */
public class SaleStatics extends DBContext {

    public double getProfitInMonth(int month, int year) {
        String sql = "select SUM(Total) - SUM(total_purchase_cost) [profit]\n"
                + "from [Order]\n"
                + "where MONTH(orderTime) = ? and YEAR(orderTime) =? and orderStatus_id = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getDouble("profit"));
                return rs.getDouble("profit");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public double compareProfitBetweenMonth(int month, int year, int lastMonth, int lastYear) {
        double profit = getProfitInMonth(month, year);
        double lastProfit = getProfitInMonth(lastMonth, lastYear);
        DecimalFormat decimalFormat = new DecimalFormat(".##");
        String formattedNumber = decimalFormat.format((profit / lastProfit) * 100 - 100);
        System.out.println(formattedNumber);
        return Double.parseDouble(formattedNumber);
    }

    public double getRevenueInMonth(int month, int year) {
        String sql = "select SUM(Total) [revenue]\n"
                + "from [Order]\n"
                + "where MONTH(orderTime) = ? and YEAR(orderTime) = ? and orderStatus_id = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getDouble("revenue");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public double compareRevenueBetweenMonth(int month, int year, int lastMonth, int lastYear) {
        double revenue = getRevenueInMonth(month, year);
        double lastRevenue = getRevenueInMonth(lastMonth, lastYear);
        DecimalFormat decimalFormat = new DecimalFormat(".##");
        String formattedNumber = decimalFormat.format((revenue / lastRevenue) * 100 - 100);
        return Double.parseDouble(formattedNumber);
    }

    public int getNumberOrderInMonth(int month, int year) {
        String sql = "select COUNT(Order_id) [number_order]\n"
                + " from [Order]\n"
                + "where MONTH(orderTime) = ? and YEAR(orderTime) = ? and orderStatus_id = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("number_order");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getAllNumberPending() {
        String sql = "select COUNT(Order_id) [number_order]\n"
                + " from [Order]\n"
                + "where orderStatus_id = 3";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("number_order");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Double> getAllProfitInMonthByYear(int year) {
        List<Double> total = new ArrayList<>();
        String sql = "SELECT Months.[Month], ISNULL(MonthlyTotals.Total, 0) AS [total_purchase_cost]\n"
                + "FROM (\n"
                + "  SELECT MONTH(orderTime) AS [Month], SUM(Total) - SUM(total_purchase_cost) AS Total\n"
                + "  FROM [Order]\n"
                + "  WHERE YEAR(orderTime) = ? and orderStatus_id = 1\n"
                + "  GROUP BY MONTH(orderTime)\n"
                + ") AS MonthlyTotals\n"
                + "RIGHT JOIN (\n"
                + "  VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)\n"
                + ") AS Months([Month]) ON MonthlyTotals.[Month] = Months.[Month]\n"
                + "ORDER BY Months.[Month];";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total.add(rs.getDouble("total_purchase_cost"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Double> getAllRevenueInMonthByYear(int year) {
        List<Double> total = new ArrayList<>();
        String sql = "SELECT Months.[Month], ISNULL(MonthlyTotals.Total, 0) AS [revenue]\n"
                + "FROM (\n"
                + "SELECT MONTH(orderTime) AS [Month], SUM(Total) AS Total\n"
                + "FROM [Order]\n"
                + "WHERE YEAR(orderTime) = ? and orderStatus_id = 1\n"
                + " GROUP BY MONTH(orderTime)\n"
                + ") AS MonthlyTotals\n"
                + "RIGHT JOIN (\n"
                + "VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)\n"
                + ") AS Months([Month]) ON MonthlyTotals.[Month] = Months.[Month]\n"
                + "ORDER BY Months.[Month]";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total.add(rs.getDouble("revenue"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Integer> getOrderQuantityByMonthYear(int month, int year) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT os.orderStatus_id, os.orderStatus_name, COUNT(o.Order_id) AS orderCount\n"
                + "FROM Order_Status os\n"
                + "LEFT JOIN [Order] o \n"
                + "ON os.orderStatus_id = o.orderStatus_id AND DATEPART(MONTH, o.orderTime) = ? AND DATEPART(YEAR, o.orderTime) = ?\n"
                + "GROUP BY os.orderStatus_id, os.orderStatus_name\n"
                + "order by orderStatus_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("orderCount"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SaleOrder> getTop5OrderNewest() {
        List<SaleOrder> list = new ArrayList<>();
        String sql = "select top 5 Order_id, Total, [User_id], orderTime, orderStatus_id,[address], phone, customerFullName, total_purchase_cost\n"
                + "from [Order]\n"
                + "where orderStatus_id != 2\n"
                + "order by orderTime desc";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SaleOrder so = new SaleOrder();
                so.setAddress(rs.getString("address"));
                so.setCustomerFullName(rs.getString("customerFullName"));
                so.setOrderId(rs.getInt("Order_id"));
                so.setOrderStatusId(rs.getInt("orderStatus_id"));
                so.setOrderTime(rs.getDate("orderTime"));
                so.setPhone(rs.getString("phone"));
                so.setTotal(rs.getDouble("Total"));
                so.setTotalPurchaseCost(rs.getDouble("total_purchase_cost"));
                so.setUserId(rs.getInt("User_id"));
                list.add(so);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNext5ProductInMonth(int number, int month, int year) {
        List<Product> list = new ArrayList<>();
        ProductDAO d = new ProductDAO();
        String sql = "With A as (\n"
                + "	select o.Order_id, o.orderStatus_id, od.quantity, od.scp_id, o.orderTime\n"
                + "	from [Order] o, OrderDetail od\n"
                + "	where o.Order_id = od.order_id and o.orderStatus_id = 1 and MONTH(o.orderTime) = ? and YEAR(o.orderTime) = ?\n"
                + ")  \n"
                + "select Product_id, ISNULL(SUM(A.quantity), 0)  [quantity] \n"
                + "from A right join size_color_product scp\n"
                + "	on A.scp_id = scp.scp_id \n"
                + "group by Product_id\n"
                + "order by  [quantity] desc\n"
                + " OFFSET ? ROWS \n"
                + "Fetch next 5 Rows only";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            statement.setInt(3, number);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("Product_id");
                Product p = d.getProductById(productId);
                p.setTotalQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int totalQuantityInMonth(int month, int year) {
        ProductDAO d = new ProductDAO();
        String sql = "With A as (\n"
                + "	select o.Order_id, o.orderStatus_id, od.quantity, od.scp_id, o.orderTime\n"
                + "	from [Order] o, OrderDetail od\n"
                + "	where o.Order_id = od.order_id and o.orderStatus_id = 1 and MONTH(o.orderTime) = ? and YEAR(o.orderTime) = ?\n"
                + ")  \n"
                + "select SUM(A.quantity) [total] \n"
                + "from A right join size_color_product scp\n"
                + "	on A.scp_id = scp.scp_id \n";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int totalQuantityInYear(int year) {
        ProductDAO d = new ProductDAO();
        String sql = "With A as (\n"
                + "	select o.Order_id, o.orderStatus_id, od.quantity, od.scp_id, o.orderTime\n"
                + "	from [Order] o, OrderDetail od\n"
                + "	where o.Order_id = od.order_id and o.orderStatus_id = 1 and YEAR(o.orderTime) = ?\n"
                + ")  \n"
                + "select SUM(A.quantity) [total] \n"
                + "from A right join size_color_product scp\n"
                + "	on A.scp_id = scp.scp_id \n";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getNext5ProductInYear(int number, int year) {
        List<Product> list = new ArrayList<>();
        ProductDAO d = new ProductDAO();
        String sql = "With A as (\n"
                + "	select o.Order_id, o.orderStatus_id, od.quantity, od.scp_id, o.orderTime\n"
                + "	from [Order] o, OrderDetail od\n"
                + "	where o.Order_id = od.order_id and o.orderStatus_id = 1 and YEAR(o.orderTime) = ?\n"
                + ")  \n"
                + "select Product_id, ISNULL(SUM(A.quantity), 0)  [quantity] \n"
                + "from A right join size_color_product scp\n"
                + "	on A.scp_id = scp.scp_id \n"
                + "group by Product_id\n"
                + "order by  [quantity] desc\n"
                + " OFFSET ? ROWS \n"
                + "Fetch next 5 Rows only";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, year);
            statement.setInt(2, number);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("Product_id");
                Product p = d.getProductById(productId);
                p.setTotalQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SaleOrder> getAllOrderByMonthYear(int month, int year) {
        List<SaleOrder> list = new ArrayList<>();
        try {
            String sql = "select Order_id, Total,orderTime, orderStatus_id, [address],phone,customerFullName, total_purchase_cost\n"
                    + "from [Order] \n"
                    + "where MONTH(orderTime) = ? and YEAR(orderTime) = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SaleOrder order = new SaleOrder();
                order.setAddress(rs.getString("address"));
                order.setOrderId(rs.getInt("Order_id"));
                order.setTotal(rs.getDouble("Total"));
                order.setOrderTime(rs.getDate("orderTime"));
                order.setOrderStatusId(rs.getInt("orderStatus_id"));
                order.setPhone(rs.getString("phone"));
                order.setCustomerFullName(rs.getString("customerFullName"));
                order.setTotalPurchaseCost(rs.getDouble("total_purchase_cost"));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SaleOrderDetail> getAllOrderDetailByMonthYear(int month, int year) {
        List<SaleOrderDetail> list = new ArrayList<>();
        try {
            String sql = "with A as (\n"
                    + "	select p.Product_id, p.Product_name,p.Price,p.Entry_Price, scp.Color_id,scp.Size_id, scp.scp_id\n"
                    + "	from size_color_product scp, Product p\n"
                    + "	where scp.Product_id = p.Product_id\n"
                    + ")\n"
                    + "select B.order_id, A.Product_id, A.Product_name, A.Color_id, A.Size_id, A.Entry_Price, A.Price, B.quantity\n"
                    + "from A, (\n"
                    + "	select od.order_id,o.orderTime, od.quantity, od.scp_id\n"
                    + "	from [Order] o, OrderDetail od\n"
                    + "	where o.Order_id = od.order_id and MONTH(o.orderTime) = ? and YEAR(o.orderTime) = ?\n"
                    + ") as B\n"
                    + "where A.scp_id = B.scp_id";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, month);
            statement.setInt(2, year);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SaleOrderDetail od = new SaleOrderDetail();
                od.setColor(rs.getString("color_id"));
                od.setEntryPrice(rs.getDouble("entry_price"));
                od.setOrderId(rs.getInt("order_id"));
                od.setPrice(rs.getDouble("price"));
                od.setProductId(rs.getInt("product_id"));
                od.setProductName(rs.getString("product_name"));
                od.setQuantity(rs.getInt("quantity"));
                od.setSize(rs.getString("size_id"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SaleOrderDetail> getOrderDetailByOrderId(int orderId) {
        List<SaleOrderDetail> list = new ArrayList<>();
        String sql = "with A as (\n"
                + "select p.Product_id, p.Product_name, scp.Color_id,scp.Size_id, scp.scp_id, pc.image [image], p.Price\n"
                + "	from size_color_product scp, Product p, product_color pc\n"
                + "	where scp.Product_id = p.Product_id and pc.Product_id = p.Product_id and pc.Color_id = scp.Color_id\n"
                + ")\n"
                + "select B.order_id, A.Product_id, A.Product_name, A.Color_id, A.Size_id, B.quantity, A.image, A.Price\n"
                + "from A, (\n"
                + "select od.order_id,o.orderTime, od.quantity, od.scp_id\n"
                + "from [Order] o, OrderDetail od\n"
                + "	where o.Order_id = od.order_id)\n"
                + " as B\n"
                + "where A.scp_id = B.scp_id and B.order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                SaleOrderDetail od = new SaleOrderDetail();
                od.setColor(rs.getString("color_id"));
                od.setOrderId(rs.getInt("order_id"));
                od.setProductId(rs.getInt("product_id"));
                od.setProductName(rs.getString("product_name"));
                od.setQuantity(rs.getInt("quantity"));
                od.setSize(rs.getString("size_id"));
                od.setImage(rs.getString("image"));
                od.setPrice(rs.getDouble("price"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public double getTotalOrderById(int id) {
        String sql = "select Total\n"
                + "from [Order] o\n"
                + "where o.Order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getStatusOrderById(int id) {
        String sql = "select os.orderStatus_name\n"
                + "from [Order] o, Order_Status os\n"
                + "where o.orderStatus_id = os.orderStatus_id and o.Order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getString("orderStatus_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }

    public int getStatusIdOrderById(int id) {
        String sql = "select os.orderStatus_id\n"
                + "from [Order] o, Order_Status os\n"
                + "where o.orderStatus_id = os.orderStatus_id and o.Order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("orderStatus_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void updateOrderStatus(int orderId, int statusId) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET[orderStatus_id] = ?\n"
                + " WHERE Order_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, statusId);
            statement.setInt(2, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // have enough quantity or not
    public List<String> updateProductQuantity(int orderId) {
        List<String> listProduct = new ArrayList<>();

        String sqlTake = "with A as (\n"
                + "	select  o.Order_id, od.scp_id, od.quantity\n"
                + "	from [OrderDetail] od, [Order] o\n"
                + "where o.Order_id = od.order_id and o.Order_id = ?\n"
                + ")\n"
                + "\n"
                + "select A.Order_id, A.scp_id, A.quantity [buy_quantity],  scp.quantity [warehouse_quantity], p.Product_name, scp.Color_id, scp.Size_id\n"
                + "from A, size_color_product scp, Product p\n"
                + "where A.scp_id = scp.scp_id and p.Product_id = scp.Product_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sqlTake);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String productName = rs.getString("Product_name");
                String color = rs.getString("color_id");
                String size = rs.getString("size_id");
                int warehouseQuantity = rs.getInt("warehouse_quantity");
                int scpId = rs.getInt("scp_id");
                int newQuantity = rs.getInt("warehouse_quantity") - rs.getInt("buy_quantity");
                if (newQuantity >= 0) {
                    updateProductQuantity(scpId, newQuantity);
                } else {
                    listProduct.add(productName + " (" + color + ", " + size + ") has only " + warehouseQuantity + "( Missing " + Math.abs(newQuantity) + " )");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public void updateProductQuantityRevert(int orderId) {
        String sqlTake = "with A as (\n"
                + "	select  o.Order_id, od.scp_id, od.quantity\n"
                + "	from [OrderDetail] od, [Order] o\n"
                + "	where o.Order_id = od.order_id and o.Order_id = ?\n"
                + ")\n"
                + "\n"
                + "select A.Order_id, A.scp_id, A.quantity [buy_quantity],  scp.quantity [warehouse_quantity]\n"
                + "from A, size_color_product scp\n"
                + "where A.scp_id = scp.scp_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sqlTake);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int scpId = rs.getInt("scp_id");
                int newQuantity = rs.getInt("warehouse_quantity") + rs.getInt("buy_quantity");
                updateProductQuantity(scpId, newQuantity);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProductQuantity(int scpId, int quantity) {
        String sqlUpdate = "UPDATE [dbo].[size_color_product]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE scp_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sqlUpdate);
            statement.setInt(1, quantity);
            statement.setInt(2, scpId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        SaleStatics d = new SaleStatics();
//        List<SaleOrderDetail> l = d.getOrderDetailByOrderId(38);
//        for (int i = 0; i < l.size(); i++) {
//            System.out.println(l.get(i).getProductName());
//        }
//        System.out.println(d.getTotalOrderById(38));
        d.updateOrderStatus(32, 1);
    }
}
