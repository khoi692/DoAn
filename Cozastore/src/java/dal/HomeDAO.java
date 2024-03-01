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
import model.Blog;
import model.Product;

/**
 *
 * @author pc
 */
public class HomeDAO extends DBContext {

    //select a number of products 
    public List<Product> getNumberOfProduct(int num) {
        String sql = "select top (?) Product_id, Product_name, Category_id, Describe, Entry_Price, Price, \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,\n"
                + "start_discount, end_discount, releaseDate\n"
                + "from Product\n"
                + "order by releaseDate desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = GetProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //select a number of product base on gender
    public List<Product> getNumberOfProductByGender(int num, String gender) {
        String sql = "select top (?) Product_id, Product_name, c.Category_id, Describe, Entry_Price, Price, "
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,"
                + "start_discount, end_discount, releaseDate from Product p ,Category c\n"
                + "where p.Category_id = c.Category_id and c.gender= ?\n"
                + "order by releaseDate desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            statement.setString(2, gender);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setDescribe(resultSet.getString("describe"));
                product.setDiscount(resultSet.getDouble("discount"));
                product.setEndDiscount(resultSet.getString("end_discount"));
                product.setEntryPrice(resultSet.getDouble("Entry_Price"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProductId(resultSet.getInt("product_Id"));
                product.setProductName(resultSet.getString("product_Name"));
                product.setStartDiscount(resultSet.getString("start_discount"));
                product.setProductImageDefault(getDefaultImageProductColor(product.getProductId()));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // get the default image link of a product
    public String getDefaultImageProductColor(int productId) {
        String sql = "SELECT [image] FROM Product_Color\n"
                + "WHERE product_Id = ? AND [default] = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString("image");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }
    // get a product by its id

    public Product GetProductById(int id) {
        String sql = "select P.Product_id, Product_name, Category_id, Describe, Entry_Price, Price, "
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,"
                + "start_discount, end_discount, releaseDate \n"
                + "from product_color pc, Product p\n"
                + "where pc.Product_id = p.Product_id and pc.[default] =1 and p.Product_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setDescribe(resultSet.getString("describe"));
                product.setDiscount(resultSet.getDouble("discount"));
                product.setEndDiscount(resultSet.getString("end_discount"));
                product.setEntryPrice(resultSet.getDouble("Entry_Price"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProductId(resultSet.getInt("product_Id"));
                product.setProductName(resultSet.getString("product_Name"));
                product.setStartDiscount(resultSet.getString("start_discount"));
                product.setProductImageDefault(getDefaultImageProductColor(product.getProductId()));
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // get a number of products that was sold the most in a pre-definded time 
    public List<Product> GetSeasonTopProduct(int num, int year, int startmonth, int endmonth) {
        String sql = "select top (?) Product_id,  sum(od.quantity)[QTY]\n"
                + "from size_color_product scp, [Order] o, OrderDetail od\n"
                + "where scp.scp_id=od.scp_id and od.order_id = o.Order_id and o.orderStatus_id =1\n"
                + "and orderTime >= ? and orderTime < ?\n"
                + "group by  Product_id\n"
                + "order by QTY desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            statement.setString(2, startmonth + "/1/" + year);
            statement.setString(3, endmonth + "/1/" + year);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(GetProductById(resultSet.getInt("product_id")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // get a number of products that was sold the most in a pre-definded time 
    public List<Product> GetSeasonTopProduct(int num, int year) {
        String sql = "select top (?) Product_id,  sum(od.quantity)[QTY]\n"
                + "from size_color_product scp, [Order] o, OrderDetail od\n"
                + "where scp.scp_id=od.scp_id and od.order_id = o.Order_id and o.orderStatus_id =1\n"
                + "and orderTime >= ? and orderTime < ?\n"
                + "group by  Product_id\n"
                + "order by QTY desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            statement.setString(2, "1/1/" + year);
            statement.setString(3, "1/1/" + (year + 1));
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(GetProductById(resultSet.getInt("product_id")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get the products that dícount the most (base on the money decreased , not the percentage)
    public List<Product> getNumberOfProductTopDiscount(int num) {
        String sql = "select top (?)  Product_id, Product_name, Category_id, Describe, Entry_Price, Price, \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,\n"
                + "start_discount, end_discount, releaseDate , (price * Discount / 100)[save] \n"
                + "from Product\n"
                + "where start_discount < GETDATE() and end_discount > GETDATE() \n"
                + "order by [save] desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setDescribe(resultSet.getString("describe"));
                product.setDiscount(resultSet.getDouble("discount"));
                product.setEndDiscount(resultSet.getString("end_discount"));
                product.setEntryPrice(resultSet.getDouble("Entry_Price"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProductId(resultSet.getInt("product_Id"));
                product.setProductName(resultSet.getString("product_Name"));
                product.setStartDiscount(resultSet.getString("start_discount"));
                product.setProductImageDefault(getDefaultImageProductColor(product.getProductId()));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // get the list of blog order by realease date
    public List<Blog> getNumberOfBlog(int num) {
        String sql = "Select top (?) * from Blog\n"
                + "where [STATUS] = 1 \n"
                + "order by [Time] desc";
        List<Blog> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Blog blog = new Blog();
                blog.setAuthor(resultSet.getString("Author"));
                blog.setBlogId(resultSet.getInt("Blog_id"));
                blog.setCategoryId(resultSet.getInt("Category_id"));
                blog.setTime(resultSet.getString("Time"));
                blog.setTitle(resultSet.getString("Title"));
                blog.setSummary(resultSet.getString("Summary"));
                blog.setTag(resultSet.getString("Tag"));
                blog.setThumbnail(resultSet.getString("Thumbnail"));
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        HomeDAO d = new HomeDAO();
        Product list = d.GetProductById(1);
        System.out.println(list.getDiscount());
    }

    public List<Product> getProductListByKey(int num, String key) {
        List<Product> list = new ArrayList<>();
        if(key.trim().equals("")) return list;
        String sql = "select top (?)  Product_id, Product_name, Category_id, Price, \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount , releaseDate\n"
                + "from Product\n"
                + "where Product_name like (?) \n"
                + "order by releaseDate desc";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            statement.setString(2, "%"+key+"%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setDiscount(resultSet.getDouble("discount"));
                product.setPrice(resultSet.getDouble("price"));
                product.setProductId(resultSet.getInt("product_Id"));
                product.setProductName(resultSet.getString("product_Name"));
                product.setProductImageDefault(getDefaultImageProductColor(product.getProductId()));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
