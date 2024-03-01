/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import static jdk.nashorn.internal.objects.NativeError.printStackTrace;
import model.Cart;
import model.Voucher;

/**
 *
 * @author pc
 */
public class CartDAO extends DBContext {

    public void addToCart(int userId, int scpId, int quantity) {
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([User_id]\n"
                + "           ,[scp_id]\n"
                + "           ,[Quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, scpId);
            statement.setInt(3, quantity);
            statement.executeUpdate();
        } catch (SQLException e) {
            printStackTrace(e);
        }
    }

    public List<Cart> getCartByUserId(int userId) {
        HomeDAO hd = new HomeDAO();
        String sql = "select scp.scp_id, p.Product_id, Product_name, Category_id, Price, \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,\n"
                + "Color_id, Size_id, c.Quantity \n"
                + "from Product p, size_color_product scp , cart c\n"
                + "where p.Product_id = scp.Product_id and scp.scp_id = c.scp_id and [User_id] = ?\n"
                + "order by addTime desc";
        List<Cart> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Cart cart = new Cart();
                cart.setScpId(resultSet.getInt("scp_id"));
                cart.setProductId(resultSet.getInt("Product_id"));
                cart.setProductName(resultSet.getString("Product_name"));
                cart.setCategoryId(resultSet.getString("Category_id"));
                cart.setPrice(resultSet.getDouble("Price"));
                cart.setDiscount(resultSet.getDouble("Discount"));
                cart.setColorId(resultSet.getString("Color_id"));
                cart.setSizeId(resultSet.getString("Size_id"));
                cart.setQuantity(resultSet.getInt("Quantity"));
                //status for cart
                // status : -a : quantity in stock is smaller than quantity in cart (a left)
                // status : 0 : quantity in stock is 0 (out of stock)
                // status : a : a product left in stock
                int left = getQuantityInStock(cart.getScpId());
                if (cart.getQuantity() > left) {
                    cart.setStatus(left * -1);
                } else if (left == 0) {
                    cart.setStatus(0);
                } else {
                    cart.setStatus(left);
                }
                //
                cart.setProductImageDefault(getImageByScpId(cart.getScpId()));
                list.add(cart);
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return list;
    }

    public void createUserGuest(String fullname, String phone, String email, String address, int roleID, boolean status) throws ParseException {
        int statusID = status ? 1 : 0;
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date utilDate = sdf.parse(dob);
//        Date sqlDate = new Date(utilDate.getTime());
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([Full_name]\n"
                    + "           ,[Phone_number]\n"
                    + "           ,[Email]\n"
                    + "           ,[Address]\n"
                    + "           ,[Role_id]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, phone);
            statement.setString(3, email);
            statement.setString(4, address);
            statement.setInt(5, roleID);
            statement.setInt(6, statusID);
            statement.executeUpdate();
        } catch (SQLException e) {
            printStackTrace(e);
        }
    }

    public boolean isCartExist(int ScpId, int UserId) {
        String sql = "select * from Cart\n"
                + "where scp_id = ?\n"
                + "and [User_id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ScpId);
            statement.setInt(2, UserId);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return false;
    }

    public boolean isSessionCartExist(Cart a, List<Cart> list) {
        boolean duplicated = false;
        for (int i = 0; i < list.size(); i++) {
            if (a.getScpId() == list.get(i).getScpId()) {
                duplicated = true;
            }
        }
        return duplicated;
    }

    public boolean isSessionCartExist(int scpId, List<Cart> list) {
        boolean duplicated = false;
        for (int i = 0; i < list.size(); i++) {
            if (scpId == list.get(i).getScpId()) {
                duplicated = true;
            }
        }
        return duplicated;
    }

    public Cart getCartItemByUserIdScpId(int userId, int ScpId) {
        String sql = "select scp.scp_id, p.Product_id, Product_name, Category_id, Price, \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount ,\n"
                + "Color_id, Size_id, c.Quantity, p.Entry_Price \n"
                + "from Product p, size_color_product scp , cart c\n"
                + "where p.Product_id = scp.Product_id and scp.scp_id = c.scp_id \n"
                + "and [User_id] = ?\n"
                + "and c.scp_id = ?";
        Cart cart = new Cart();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, ScpId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cart.setScpId(resultSet.getInt("scp_id"));
                cart.setProductId(resultSet.getInt("Product_id"));
                cart.setProductName(resultSet.getString("Product_name"));
                cart.setCategoryId(resultSet.getString("Category_id"));
                cart.setPrice(resultSet.getDouble("Price"));
                cart.setDiscount(resultSet.getDouble("Discount"));
                cart.setColorId(resultSet.getString("Color_id"));
                cart.setSizeId(resultSet.getString("Size_id"));
                cart.setQuantity(resultSet.getInt("Quantity"));
                cart.setProductImageDefault(getImageByScpId(cart.getScpId()));
                cart.setEntryPrice(resultSet.getDouble("entry_price"));
                //status for cart
                // status : -a : quantity in stock is smaller than quantity in cart (a left)
                // status : 0 : quantity in stock is 0 (out of stock)
                // status : a : a product left in stock
                int left = getQuantityInStock(cart.getScpId());
                if (cart.getQuantity() > left) {
                    cart.setStatus(left * -1);
                } else if (left == 0) {
                    cart.setStatus(0);
                } else {
                    cart.setStatus(left);
                }
                //
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return cart;
    }

    // return a temp cart that have enough information excepfor some field 
    //mainly use for session cart //quickly made a cart
    public Cart getTempCartItemByScpId(int ScpId, int quantity) {
        String sql = "select scp.scp_id, p.Product_id, Product_name, Category_id, Price,  \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount, \n"
                + "Color_id, Size_id, p.Entry_Price \n"
                + "from Product p, size_color_product scp \n"
                + "where p.Product_id = scp.Product_id\n"
                + "and scp_id = ?";
        Cart cart = new Cart();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ScpId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cart.setScpId(resultSet.getInt("scp_id"));
                cart.setProductId(resultSet.getInt("Product_id"));
                cart.setProductName(resultSet.getString("Product_name"));
                cart.setCategoryId(resultSet.getString("Category_id"));
                cart.setPrice(resultSet.getDouble("Price"));
                cart.setDiscount(resultSet.getDouble("Discount"));
                cart.setColorId(resultSet.getString("Color_id"));
                cart.setSizeId(resultSet.getString("Size_id"));
                cart.setQuantity(quantity);
                cart.setProductImageDefault(getImageByScpId(cart.getScpId()));
                cart.setEntryPrice(resultSet.getDouble("entry_price"));
                //status for cart
                // status : -a : quantity in stock is smaller than quantity in cart (a left)
                // status : 0 : quantity in stock is 0 (out of stock)
                // status : a : a product left in stock
                int left = getQuantityInStock(cart.getScpId());
                if (quantity > left) {
                    cart.setStatus(left * -1);
                } else if (left == 0) {
                    cart.setStatus(0);
                } else {
                    cart.setStatus(left);
                }
                //
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return cart;
    }

    // return a temp cart that have enough information excepfor some field 
    //mainly use for session cart
    public Cart getTempCartItemByScpId(int ScpId) {
        String sql = "select scp.scp_id, p.Product_id, Product_name, Category_id, Price,  \n"
                + "CASE WHEN (start_discount > GETDATE() or end_discount < GETDATE()) THEN 0 ELSE Discount END AS Discount, \n"
                + "Color_id, Size_id, p.Entry_Price \n"
                + "from Product p, size_color_product scp \n"
                + "where p.Product_id = scp.Product_id\n"
                + "and scp_id = ?";
        Cart cart = new Cart();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ScpId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cart.setScpId(resultSet.getInt("scp_id"));
                cart.setProductId(resultSet.getInt("Product_id"));
                cart.setProductName(resultSet.getString("Product_name"));
                cart.setCategoryId(resultSet.getString("Category_id"));
                cart.setPrice(resultSet.getDouble("Price"));
                cart.setDiscount(resultSet.getDouble("Discount"));
                cart.setColorId(resultSet.getString("Color_id"));
                cart.setSizeId(resultSet.getString("Size_id"));
                cart.setProductImageDefault(getImageByScpId(cart.getScpId()));
                cart.setEntryPrice(resultSet.getDouble("entry_price"));
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return cart;
    }

    public List<String> getColorListByProductId(int proid) {
        String sql = "select  DISTINCT  Color_id\n"
                + "from size_color_product scp , Product p \n"
                + "where scp.Product_id = p.Product_id and p.Product_id = ?";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, proid);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("Color_id"));
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return list;
    }

    public List<String> getSizeList(int proId, String color) {
        String sql = "select  Size_id\n"
                + "from size_color_product scp, product_color pc\n"
                + "where scp.Color_id = pc.Color_id and scp.Product_id = pc.Product_id \n"
                + "and scp.Color_id = ?\n"
                + "and scp.Product_id = ?";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, color);
            statement.setInt(2, proId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("Size_id"));
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return list;
    }

    public String getImageByScpId(int scpId) {
        String sql = "select [image]\n"
                + "from size_color_product scp, product_color pc\n"
                + "where scp.Color_id = pc.Color_id and scp.Product_id = pc.Product_id and scp_id = ?";
        String image = "";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, scpId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                image = resultSet.getString("image");
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return image;
    }

    public int getScpIdByItsComponent(int productId, String colorId, String sizeId) {
        String sql = "select scp_id\n"
                + "from size_color_product \n"
                + "where Product_id = ?\n"
                + "and Size_id = ? \n"
                + "and Color_id = ? ";
        int scpId = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            statement.setString(2, sizeId);
            statement.setString(3, colorId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                scpId = resultSet.getInt("scp_id");
            }
        } catch (SQLException e) {

        }
        return scpId;
    }

    //update cart
    public void updateCart(int old_scpId, int new_scpId, int userId) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [scp_id] = ?\n"
                //                + "	  ,[addTime] = GETDATE()\n"
                + " WHERE [User_id] = ? and [scp_id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, new_scpId);
            statement.setInt(2, userId);
            statement.setInt(3, old_scpId);
            statement.executeUpdate();
        } catch (SQLException e) {
            printStackTrace(e);
        }
    }

    //quantity
    public void updateQuantityCart(int scpId, int userId, int quantity) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [Quantity] = ?\n"
                //                + "	  ,[addTime] = GETDATE()\n"
                + " WHERE [User_id] = ? and [scp_id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setInt(2, userId);
            statement.setInt(3, scpId);
            statement.executeUpdate();
        } catch (SQLException e) {
            printStackTrace(e);
        }
    }

    //delete 
    public void deleteCart(int userId, int scpId) {
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "WHERE scp_id = ? and [User_id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, scpId);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            printStackTrace(e);
        }
    }

    //create order 
    public int createOrder(List<Cart> clist, int uId, double total, String customer, String phone, String address, double entryPrice) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([Total]\n"
                + "           ,[User_id]\n"
                + "           ,[orderTime]\n"
                + "           ,[orderStatus_id]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[customerFullName]\n"
                + "           ,[total_purchase_cost])\n"
                + "     VALUES (?,?,GETDATE(),3,?,?,?,?)";

        String getId = "Select top 1 Order_id\n"
                + "from [Order]\n"
                + "order by Order_id desc";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            PreparedStatement statementId = connection.prepareStatement(getId);
            statement.setDouble(1, total);
            statement.setInt(2, uId);
            statement.setString(3, address);
            statement.setString(4, phone);
            statement.setString(5, customer);
            statement.setDouble(6, entryPrice);
            statement.executeUpdate();

            // create order detail
            int orderId = 0;
            ResultSet resultSet = statementId.executeQuery();
            while(resultSet.next()){
                orderId = resultSet.getInt("Order_id");
            }
            createOrderDetail(clist, orderId); //update order detail
            return orderId;
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return 0;
    }

    public void createOrderDetail(List<Cart> clist, int orderId) {
        StringBuilder sqlsbdInsert =  new StringBuilder();
        //StringBuilder sqlsbdDecrease = new StringBuilder();
        String sqlInsert ="";
        //String sqlDecrease = "";
        for (int i = 0; i < clist.size(); i++) {
            Cart item = clist.get(i);
            String insert = "INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity], [Price], [Entry_Price]) VALUES (" + orderId + "," + item.getScpId() + ", " + item.getQuantity() + "," + item.getPrice() + "," + item.getEntryPrice() + ") \n";
            //String decreaseQty = "UPDATE [dbo].[size_color_product] SET [quantity] = "+(getQuantityInStock(item.getScpId())-item.getQuantity())+" WHERE scp_id = "+item.getScpId()+" \n";
            sqlsbdInsert.append(insert);
            //sqlsbdDecrease.append(decreaseQty);
            sqlInsert = sqlsbdInsert.toString();
            //sqlDecrease = sqlsbdDecrease.toString();
        }
        try {
            PreparedStatement statement = connection.prepareStatement(sqlInsert);
            //PreparedStatement statement2 = connection.prepareStatement(sqlDecrease);
            statement.executeUpdate();
            //statement2.executeUpdate();
        } catch (SQLException e) {

        }
//        String single = "INSERT [dbo].[OrderDetail] ([order_id], [scp_id], [quantity]) VALUES (?, ?, ?) \n";
//        StringBuilder sqlSB = new StringBuilder("");
//        for (int i = 0; i < clist.size(); i++) {
//            sqlSB.append(single); //append all insert line 
//        }
//        String sql = sqlSB.toString();
//        try {
//            PreparedStatement statement = connection.prepareStatement(sql);
//            int index = 1;
//            for (int i = 0; i < clist.size(); i++) {
//                Cart item = clist.get(i);
//                statement.setInt(index++, orderId);
//                statement.setInt(index++, item.getScpId());
//                statement.setInt(index++, item.getQuantity());
//            }
//            statement.executeUpdate();
//        } catch (SQLException e) {
//
//        }
    }

    public int getQuantityInStock(int scpId) {
        String sql = "select quantity\n"
                + "from size_color_product\n"
                + "where scp_id =?";
        int qty = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, scpId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                qty = resultSet.getInt("quantity");
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return qty;
    }

    public int getQuantityInStock(int proId, String color) {
        String sql = "select sum(quantity)[quantity]\n"
                + "from size_color_product\n"
                + "where Product_id = ?\n"
                + "and Color_id = ? ";
        int qty = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, proId);
            statement.setString(2, color);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                qty = resultSet.getInt("quantity");
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return qty;
    }

    public int getQuantityInStock(int proId, String color, String size) {
        String sql = "select quantity\n"
                + "from size_color_product\n"
                + "where Product_id = ? \n"
                + "and Color_id = ? \n"
                + "and Size_id = ? ";
        int qty = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, proId);
            statement.setString(2, color);
            statement.setString(3, size);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                qty = resultSet.getInt("quantity");
            }
        } catch (SQLException e) {

        }
        return qty;
    }

    public List<Voucher> getAllPublicVoucher() { // get all available public voucher
        String sql = "With A as\n"
                + "(\n"
                + "select *, CASE\n"
                + "WHEN (start_voucher > GETDATE()) THEN 0\n"
                + "WHEN (end_voucher < GETDATE()) then -1\n"
                + "WHEN (quantity <= 0 ) then -2 \n"
                + "ELSE 1 END AS [Status]\n"
                + "from Voucher\n"
                + ")\n"
                + "Select * from A\n"
                + "where [status] = 1 and code like 'PUBLIC%'\n"
                + "Order by start_voucher desc";
        List<Voucher> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Voucher voucher = new Voucher();
                String code_r = resultSet.getString("Code");
                voucher.setCode(code_r);
                voucher.setDescribe(resultSet.getString("describe"));
                voucher.setStart_voucher(resultSet.getString("start_voucher"));
                voucher.setEnd_voucher(resultSet.getString("end_voucher"));
                voucher.setQuantity(resultSet.getInt("quantity"));
                voucher.setStatus(resultSet.getInt("status"));
                voucher.setDiscount(resultSet.getDouble("discount"));
                if (code_r.contains("PUBLIC")) {
                    voucher.setType("PUBLIC");
                    // EXAMPLE CODE : COMMON0001__MIN100
                    String[] parts = code_r.split("__");
                    if (code_r.contains("MIN")) {
                        voucher.setMin_condition(Integer.parseInt(parts[1].substring(3)));
                    }
                } else {
                    voucher.setType("HIDDEN");
                }
                list.add(voucher);
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return list;
    }

    public double getVoucherDiscountByCode(String code) {
        String sql = "select discount\n"
                + "from Voucher\n"
                + "where Code = ? ";
        double discount = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, code);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                discount = resultSet.getDouble("discount");
            }
        } catch (SQLException e) {
            printStackTrace(e);
        }
        return discount;
    }

}
