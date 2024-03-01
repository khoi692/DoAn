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
import model.ProductColor;
import model.SizeColorProduct;

/**
 *
 * @author Nhat Anh
 */
public class SizeColorProductDAO extends DBContext {

    public boolean checkProductQuantity(int productId) {
        String sql = "select Product_id,Color_id,Size_id,quantity\n"
                + "from size_color_product\n"
                + "where Product_id = ?\n"
                + "group by Product_id,Color_id,Size_id,quantity";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getInt("quantity") == 0) {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[size_color_product]\n"
                + "      WHERE product_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<SizeColorProduct> getAll() {
        String sql = "select  product_id, color_id, size_id, quantity\n"
                + "from size_color_product\n"
                + "group by product_id, color_id, size_id, quantity";
        List<SizeColorProduct> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                SizeColorProduct scp = new SizeColorProduct();
                scp.setColorId(resultSet.getString("color_id"));
                scp.setProductId(resultSet.getInt("product_id"));
                scp.setQuantity(resultSet.getInt("quantity"));
                scp.setSizeId(resultSet.getString("size_Id"));
                list.add(scp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<SizeColorProduct> getColorAndSizeByProductId(int productId) {
        String sql = "select  product_id, color_id, size_id, quantity\n"
                + "from size_color_product\n"
                + "group by product_id, color_id, size_id, quantity";
        List<SizeColorProduct> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                SizeColorProduct scp = new SizeColorProduct();
                scp.setColorId(resultSet.getString("color_id"));
                scp.setProductId(resultSet.getInt("product_id"));
                scp.setQuantity(resultSet.getInt("quantity"));
                scp.setSizeId(resultSet.getString("size_Id"));
                list.add(scp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateSizeProductColor(ProductColor product, String oldColor) {
        String sql = "UPDATE [dbo].[size_color_product]\n"
                + "   SET [Color_id] = ?\n"
                + " WHERE Product_id = ? and color_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getColorId());
            statement.setInt(2, product.getProductId());
            statement.setString(3, oldColor);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSizeProductColor(SizeColorProduct scp) {
        String sql = "DELETE FROM [dbo].[size_color_product]\n"
                + "      WHERE Product_id = ? and Color_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, scp.getProductId());
            statement.setString(2, scp.getColorId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean insertSizeProductColor(SizeColorProduct scp) {
        String sql = "INSERT INTO [dbo].[size_color_product]\n"
                + "           ([Color_id]\n"
                + "           ,[Size_id]\n"
                + "           ,[Product_id]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, scp.getColorId());
            statement.setString(2, scp.getSizeId());
            statement.setInt(3, scp.getProductId());
            statement.setInt(4, scp.getQuantity());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    public static void main(String[] args) {
        SizeColorProductDAO d = new SizeColorProductDAO();
        d.insertSizeProductColor(new SizeColorProduct(0, "blue", 18, "L", 20));
        d.insertSizeProductColor(new SizeColorProduct(0, "pink", 18, "L", 20));
    }
   
}
