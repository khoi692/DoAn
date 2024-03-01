/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Product;
import model.ProductColor;

/**
 *
 * @author Nhat Anh
 */
public class ProductDAO extends DBContext {
    
    public List<Product> getAll() {
        String sql = "select * from Product";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get n first product
    public List<Product> getProductByNumber(int number) {
        String sql = "select top (?) * \n"
                + "from Product";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, number);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getTop8() {
        String sql = "select top 4 * from Product";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                product.setReleaseDate(resultSet.getDate("releaseDate"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getNext8(int amount) {
        String sql = "select * \n"
                + "from Product\n"
                + "order by Product_id\n"
                + "offset ? rows\n"
                + "fetch  next 8 rows only";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, amount);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
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
    
    public List<Product> getProductByName(String productName) {
        String sql = "select * from Product\n"
                + "where product_name like ?";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + productName + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Product getProductById(int id) {
        String sql = "select P.Product_id, Product_name, Category_id, Describe, Entry_Price, Price, CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,start_discount, end_discount, releaseDate \n"
                + "from product_color pc, Product p\n"
                + "where pc.Product_id = p.Product_id and pc.[default] =1 and p.Product_id = ?";
        ProductDAO d = new ProductDAO();
        SizeColorProductDAO scpDAO = new SizeColorProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
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
                product.setProductImageDefault(d.getDefaultImageProductColor(product.getProductId()));
                product.setCategoryGender(categoryDAO.getCategoryGenderByCategoryId(resultSet.getString("category_Id")));
                product.setReleaseDate(resultSet.getDate("releaseDate"));
                product.setTotalQuantity(getQuantityByProductId(id));
                product.setQuantitySizeColor(scpDAO.checkProductQuantity(id));
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<ProductColor> getProductColorOfProductById(int productId) {
        String sql = "select scp.Product_id,scp.Color_id ,Size_id, quantity, pc.[image], pc.[default] from size_color_product scp, product_color pc\n"
                + "where  scp.Color_id = pc.Color_id and scp.Product_id = pc.Product_id and scp.Product_id = ?\n"
                + "group by scp.Product_id,scp.Color_id ,Size_id, quantity, pc.[image], pc.[default]";
        List<ProductColor> list = new ArrayList<>();
        List<String> listSize = new ArrayList<>();
        List<Integer> listQuantity = new ArrayList<>();
        ProductColor temp = new ProductColor();
        String image = null;
        String colorId = null;
        boolean defaultImage = false;
        String size;
        Integer quantity;
        
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                image = resultSet.getString("image");
                colorId = resultSet.getString("color_id");
                defaultImage = resultSet.getBoolean("default");
                size = resultSet.getString("size_id");
                quantity = resultSet.getInt("quantity");
                
                if (temp.getColorId() == null || temp.getColorId().equalsIgnoreCase(colorId)) {
                    listSize.add(size);
                    listQuantity.add(quantity);
                    
                } else {
                    ProductColor a = new ProductColor(productId, temp.getColorId(), temp.getImage(), temp.isDefaultImage(), listSize, listQuantity);
                    list.add(a);
                    listSize = new ArrayList<>();
                    listQuantity = new ArrayList<>();
                    listSize.add(size);
                    listQuantity.add(quantity);
                }
                
                temp.setColorId(colorId);
                temp.setDefaultImage(defaultImage);
                temp.setImage(image);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        if (temp != null && !listSize.isEmpty() && !listQuantity.isEmpty()) {
            ProductColor a = new ProductColor(productId, temp.getColorId(), temp.getImage(), temp.isDefaultImage(), listSize, listQuantity);
            list.add(a);
        }
        return list;
    }
    
    public List<Product> getAllByPrice(double priceFrom, double priceTo) {
        String sql = "select * from Product\n"
                + "where price >= ? and price < ?";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, priceFrom);
            statement.setDouble(2, priceTo);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean checkProductHavePrice(int productId, double priceFrom, double priceTo) {
        String sql = "select product_id from Product\n"
                + "where price >= ? and price < ? and product_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, priceFrom);
            statement.setDouble(2, priceTo);
            statement.setInt(3, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean checkProductHavePrice(int productId, double priceFrom) {
        String sql = "select product_id from Product\n"
                + "where price >= ? and product_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, priceFrom);
            statement.setInt(2, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Product> getAllByPrice(double priceFrom) {
        String sql = "select * from Product\n"
                + "where price >= ? ";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, priceFrom);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<String> getAllColor() {
        String sql = "select Color_name\n"
                + "from Color";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String color = resultSet.getString("color_name");
                color = color.substring(0, 1).toUpperCase() + color.substring(1).toLowerCase();
                list.add(color);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean checkProductHaveColor(int productId, String color) {
        String sql = "select product_Id\n"
                + "from size_color_product scp\n"
                + "where Color_id = ? and product_id = ?\n"
                + "group by Product_id";
        ProductDAO dao = new ProductDAO();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setInt(2, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                List<ProductColor> colorList = getProductColorOfProductById(productId);
                boolean flag = false;
                for (ProductColor productColor : colorList) {
                    if (color.equalsIgnoreCase(productColor.getColorId())) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Product> getAllProductWithColor(String color) {
        String sql = "select product_Id\n"
                + "from size_color_product scp\n"
                + "where Color_id = ? \n"
                + "group by Product_id";
        ProductDAO dao = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_Id");
                List<ProductColor> colorList = getProductColorOfProductById(productId);
                boolean flag = false;
                for (ProductColor productColor : colorList) {
                    if (color.equalsIgnoreCase(productColor.getColorId())) {
                        flag = true;
                        break;
                    }
                }
                if (flag) {
                    Product product = dao.getProductById(productId);
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean checkProductHaveColorAndPrice(int productId, String color, double startPrice, double endPrice) {
        String sql = "select p.Product_id\n"
                + "from size_color_product scp, Product p\n"
                + "where scp.Product_id = p.Product_id and scp.Color_id = ? and Price >=? and Price<? and p.product_id = ?\n"
                + "group by p.Product_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setDouble(2, startPrice);
            statement.setDouble(3, endPrice);
            statement.setInt(4, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean checkProductHaveColorAndPrice(int productId, String color, double startPrice) {
        String sql = "select p.Product_id\n"
                + "from size_color_product scp, Product p\n"
                + "where scp.Product_id = p.Product_id and scp.Color_id = ? and Price >=? and p.product_id = ?\n"
                + "group by p.Product_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setDouble(2, startPrice);
            statement.setInt(3, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Product> getAllProductWithColorAndPrice(String color, double startPrice, double endPrice) {
        String sql = "select p.Product_id\n"
                + "from size_color_product scp, Product p\n"
                + "where scp.Product_id = p.Product_id and scp.Color_id = ? and Price >? and Price<?\n"
                + "group by p.Product_id";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setDouble(2, startPrice);
            statement.setDouble(3, endPrice);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getAllProductWithColorAndPrice(String color, double startPrice) {
        String sql = "select p.Product_id\n"
                + "from size_color_product scp, Product p\n"
                + "where scp.Product_id = p.Product_id and scp.Color_id = ? and Price >? \n"
                + "group by p.Product_id";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setDouble(2, startPrice);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getAllProductWithGender(String gender) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_id\n"
                + "from Category c, Product p\n"
                + "where c.Category_id=p.Category_id and c.gender = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, gender);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt("product_id"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getAllPaging(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public List<Product> pagingProduct(List<Product> products, int numberPerPage, int xPage) {
        ProductDAO productDAO = new ProductDAO();
        int page = xPage;
        int size = products.size();
        
        int start = (page - 1) * numberPerPage;
        int end = Math.min(page * numberPerPage, size);
        
        return productDAO.getAllPaging(products, start, end);
    }
    
    public List<Product> sortLowToHigh(List<Product> products) {
        Comparator<Product> compareByPrice = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                if (o1.getPrice() * (100 - o1.getDiscount()) / 100 > o2.getPrice() * (100 - o2.getDiscount()) / 100) {
                    return 1;
                }
                if (o1.getPrice() * (100 - o1.getDiscount()) / 100 < o2.getPrice() * (100 - o2.getDiscount()) / 100) {
                    return -1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }
    
    public List<Product> sortHighToLow(List<Product> products) {
        Comparator<Product> compareByPrice = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                if (o1.getPrice() * (100 - o1.getDiscount()) / 100 > o2.getPrice() * (100 - o2.getDiscount()) / 100) {
                    return -1;
                }
                if (o1.getPrice() * (100 - o1.getDiscount()) / 100 < o2.getPrice() * (100 - o2.getDiscount()) / 100) {
                    return 1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }
    
    public List<Product> sortNewest(List<Product> products) {
        Comparator<Product> compareByPrice = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                if (o1.getReleaseDate().after(o2.getReleaseDate())) {
                    return -1;
                }
                if (o1.getReleaseDate().before(o2.getReleaseDate())) {
                    return 1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }
    
    public List<Product> sortPopularity(List<Product> products) {
        Comparator<Product> compareByPrice = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                if (getQuantityInOrderByProductId(o1.getProductId()) > getQuantityInOrderByProductId(o2.getProductId())) {
                    return -1;
                }
                if (getQuantityInOrderByProductId(o1.getProductId()) < getQuantityInOrderByProductId(o2.getProductId())) {
                    return 1;
                }
                return 0;
            }
        };
        Collections.sort(products, compareByPrice);
        return products;
    }
    
    public List<String> getAllSize() {
        List<String> list = new ArrayList<>();
        String sql = "select size_id from size";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("size_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int getProducQuantityByColor(int productId, String color, String size) {
        String sql = "select quantity from size_color_product\n"
                + "where product_Id = ? and color_id = ? and size_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            statement.setString(2, color);
            statement.setString(3, size);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.getInt("quantity");
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public int getQuantityByProductId(int productId) {
        String sql = "select Product_id, SUM(scp.quantity)[quantity]\n"
                + "from size_color_product scp \n"
                + "where Product_id = ?\n"
                + "group by Product_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public int getQuantityInOrderByProductId(int productId) {
        String sql = "select scp.Product_id, SUM(od.quantity)[quantity]\n"
                + "from [Order] o join OrderDetail od \n"
                + "	on o.Order_id = od.order_id\n"
                + "right join size_color_product scp\n"
                + "	on scp.scp_id = od.scp_id\n"
                + "where scp.Product_id = ?\n"
                + "group by scp.Product_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public void deleteProductInProductColorTable(int id) {
        String sql = "DELETE FROM [dbo].[product_color]\n"
                + "      WHERE product_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteProductById(int id) {
        SizeColorProductDAO scpDAO = new SizeColorProductDAO();
        scpDAO.deleteProduct(id);
        deleteProductInProductColorTable(id);
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE product_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<String> getAllColorOfProduct(int productId) {
        String sql = "select color_id from Product_color\n"
                + "where product_id = ?";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("color_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void updateProduct(Product product) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [Product_name] = ?\n"
                + "      ,[Category_id] = ?\n"
                + "      ,[Describe] = ?\n"
                + "      ,[Entry_Price] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Discount] = ?\n"
                + "      ,[start_discount] = ?\n"
                + "      ,[end_discount] = ?\n"
                + " WHERE product_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getCategoryId());
            statement.setString(3, product.getDescribe());
            statement.setDouble(4, product.getEntryPrice());
            statement.setDouble(5, product.getPrice());
            statement.setDouble(6, product.getDiscount());
            statement.setString(7, product.getStartDiscount());
            statement.setString(8, product.getEndDiscount());
            statement.setInt(9, product.getProductId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateProductColor(ProductColor product, String oldColor) {
        String sql = "UPDATE [dbo].[product_color]\n"
                + "   SET [Color_id] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[default] = ?\n"
                + " WHERE product_id = ? and color_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getColorId());
            statement.setString(2, product.getImage());
            statement.setBoolean(3, product.isDefaultImage());
            statement.setInt(4, product.getProductId());
            statement.setString(5, oldColor);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int insertProduct(Product product) {
        String sql = "INSERT INTO [dbo].[Product] ([Product_name], [Category_id], [Describe], [Entry_Price], [Price], [Discount], [start_discount], [end_discount], [releaseDate]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getCategoryId());
            statement.setString(3, product.getDescribe());
            statement.setDouble(4, product.getEntryPrice());
            statement.setDouble(5, product.getPrice());
            statement.setDouble(6, product.getDiscount());
            statement.setString(7, product.getStartDiscount());
            statement.setString(8, product.getEndDiscount());
            statement.setDate(9, product.getReleaseDate());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }

            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return -1;
    }

    public int insertProductColor(ProductColor product) {
        String sql = "INSERT INTO [dbo].[product_color]\n"
                + "           ([Product_id]\n"
                + "           ,[Color_id]\n"
                + "           ,[image]\n"
                + "           ,[default])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, product.getProductId());
            statement.setString(2, product.getColorId());
            statement.setString(3, product.getImage());
            statement.setBoolean(4, product.isDefaultImage());
            statement.executeUpdate();
            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }

            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return -1;
    }

    public List<Product> getTop5ProductBestSell() {
        String sql = "Select top 5 scp_id,sum(quantity) from OrderDetail o join Product p on o.scp_id = p.Product_id group by scp_id order by sum(quantity) desc";
        ProductDAO d = new ProductDAO();
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = getProductById(resultSet.getInt(1));
                product.setTotalQuantity(resultSet.getInt(2));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<String> getName() {
        ArrayList<String> names = new ArrayList<>();
        String sql = "SELECT Product_name\n"
                + "  FROM [Product]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                names.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("getName: " + e.getMessage());
        }
        
        return names;
    }
}
