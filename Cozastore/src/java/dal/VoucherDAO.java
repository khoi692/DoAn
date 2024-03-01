/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Voucher;

/**
 *
 * @author pc
 */
public class VoucherDAO extends DBContext {

    //page : for pagination
    //type : for type (COMMON / COZA)
    // start_voucher : for starrt date of that voucher 
    // end_voucher : for end date of that voucher
    // quantity : quantity of that voucher left 
    // status : out of date , on waiting , on going // default status : 10
    // orderby : 1 : asc / -1 : desc
    private int queryVoucher_row = 0; //number of result(voucher) found

    public int getQueryVoucher_row() {
        return queryVoucher_row;
    }

    public void setQueryVoucher_row(int queryVoucher_row) {
        this.queryVoucher_row = queryVoucher_row;
    }

    public List<Voucher> getVoucherList(int page, int num_row, String type, String orderAttribute, int orderby, int status) {
        int row = (page - 1) * num_row;
        String order;
        String attribute = "Code";
        if (orderAttribute.equals("Code")) {
            attribute = "Code"; //order by code
        }
        if (orderAttribute.equals("quantity")) {
            attribute = "quantity"; // order by quantity
        }
        if (orderAttribute.equals("discount")) {
            attribute = "discount"; // order by discount amount
        }
        if (orderby == 1) {
            order = "asc";
        } else {
            order = "desc";
        }
//        String sql = "With A as(\n"
//                + "select *, CASE\n"
//                + "WHEN (start_voucher > GETDATE()) THEN 0\n"
//                + "WHEN (end_voucher < GETDATE()) then -1\n"
//                + "WHEN (quantity <= 0 ) then -2 \n"
//                + "ELSE 1 END AS [Status]\n"
//                + "from Voucher\n"
//                + ")\n"
//                + "Select * from A\n"
//                + "Where 1=1 \n";
//        if (!type.equals("")) { 
//            sql += "and CODE like (?) \n";
//        }
//        if (status != 10) {
//            sql += "and [Status] = (?) \n";
//        }
//        if (!orderAttribute.equals("")) {
//            sql += "order by " + attribute + " " + order + " \n";
//        }
//        sql += "Offset (?) row \n"
//                + "fetch next (?) row only";

        StringBuilder sbSql = new StringBuilder("With A as(\n")
                .append("select *, CASE\n")
                .append("WHEN (start_voucher > GETDATE()) THEN 0\n")
                .append("WHEN (end_voucher < GETDATE()) then -1\n")
                .append("WHEN (quantity <= 0 ) then -2 \n")
                .append("ELSE 1 END AS [Status]\n")
                .append("from Voucher\n")
                .append(")\n")
                .append("Select *,count(*) over() as [rows] from A\n")
                .append("Where 1=1 \n");
        if (!type.equals("")) {
            sbSql.append("and CODE like (?) \n");
        }
        if (status != 10) {
            sbSql.append("and [Status] = (?) \n");
        }
        if (!orderAttribute.equals("")) {
            sbSql.append("order by ").append(attribute).append(" ").append(order).append(" \n");
        }
        sbSql.append("Offset (?) row \n fetch next (?) row only");
        String sql = sbSql.toString();
        List<Voucher> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            int i = 1;
            if (!type.equals("")) {
                statement.setString(i++, type + "%");
            }
            if (status != 10) {
                statement.setInt(i++, status);  // status
            }
//            if (!orderAttribute.equals("")) {
//                statement.setString(i++, orderAttribute);
//            }
            statement.setInt(i++, row); //skipped rows 
            statement.setInt(i++, num_row);  // rows per page
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Voucher voucher = new Voucher();
//                String code_r = resultSet.getString("Code");
                voucher.setCode(resultSet.getString("Code"));
                voucher.setDescribe(resultSet.getString("describe"));
                voucher.setStart_voucher(resultSet.getString("start_voucher"));
                voucher.setEnd_voucher(resultSet.getString("end_voucher"));
                voucher.setQuantity(resultSet.getInt("quantity"));
                voucher.setStatus(resultSet.getInt("status"));
                voucher.setDiscount(resultSet.getDouble("discount"));
                setQueryVoucher_row(resultSet.getInt("rows")); //get the number of rows that query out
//                if (code_r.contains("CATE")) {
//                    // EXAMPLE CODE : COMMON0001__CATEmcoat__GENman__MIN100
//                    String[] parts = code_r.split("__");
//                    voucher.setCate_condition(parts[1].substring(4));
//                    if (code_r.contains("GEN")) {
//                        voucher.setGen_condition(parts[2].substring(3));
//                    }
//                    if (code_r.contains("MIN")) {
//                        voucher.setMin_condition(Integer.parseInt(parts[3].substring(3)));
//                    }
//                }
                list.add(voucher);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public Voucher getVoucher(String code) {
        String sql = "With A as\n"
                + "(\n"
                + "select *, CASE\n"
                + "WHEN (start_voucher > GETDATE()) THEN 0\n"
                + "WHEN (end_voucher < GETDATE()) then -1\n"
                + "WHEN (quantity <= 0 ) then -2 \n"
                + "ELSE 1 END AS [Status]\n"
                + "from Voucher\n"
                + "where code = (?) \n"
                + ")\n"
                + "Select * from A";
        Voucher voucher = new Voucher();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, code);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
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
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return voucher;
    }

    public void updateVoucher(String code, String new_code, int quantity, String describe, String start, String end, double discount) throws ParseException {
        String sql = "UPDATE [dbo].[Voucher]\n"
                + "   SET [Code] = (?) \n"
                + "      ,[quantity] = (?) \n"
                + "      ,[describe] = (?) \n"
                + "      ,[start_voucher] = (?) \n"
                + "      ,[end_voucher] = (?) \n"
                + "      ,[discount] = (?) \n"
                + " WHERE [Code] = (?) ";
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        try {
            //date convert
            Date sdate = inputFormat.parse(start); //start date parsed
            Date edate = inputFormat.parse(end); // end date parsed
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String outputStartDate = outputFormat.format(sdate);
            String outputEndDate = outputFormat.format(edate);
            //
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, new_code);
            statement.setInt(2, quantity);
            statement.setString(3, describe);
            statement.setString(4, outputStartDate);
            statement.setString(5, outputEndDate);
            statement.setDouble(6, discount);
            statement.setString(7, code);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void createVoucher(String[] code, int quantity, String describe, String start, String end, double discount) throws ParseException, SQLException {
        StringBuilder sbSql = new StringBuilder();
        //date convert
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date sdate = inputFormat.parse(start); //start date parsed
        Date edate = inputFormat.parse(end); // end date parsed
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String outputStartDate = outputFormat.format(sdate);
        String outputEndDate = outputFormat.format(edate);
        //
        for (String code1 : code) {
            sbSql.append("INSERT INTO [dbo].[Voucher] ([Code],[quantity],[describe],[start_voucher],[end_voucher],[discount]) VALUES('").append(code1).append("',").append(quantity).append(", '").append(describe).append("','").append(outputStartDate).append("','").append(outputEndDate).append("',").append(discount).append(")\n");
        }
        String sql = sbSql.toString();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.executeUpdate();
    }

    public void deleteVoucher(String code) {
        String sql = "DELETE FROM [dbo].[Voucher]\n"
                + "      WHERE Code = (?) \n";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, code);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAllUnavailable() {
        String sql = "DELETE FROM [dbo].[Voucher]\n"
                + "WHERE quantity = 0 or end_voucher < GETDATE()";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
