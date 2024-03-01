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
import model.Category;

/**
 *
 * @author Nhat Anh
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        String sql = "select * from Category";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getString("category_id"));
                category.setGender(resultSet.getString("gender"));
                category.setCategoryName(resultSet.getString("category_name").toLowerCase());
                category.setCategoryName(category.getCategoryName().substring(0, 1).toUpperCase() + category.getCategoryName().substring(1)); // set Uppercase to first character
                list.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String getCategoryGenderByCategoryId(String categoryId) {
        String sql = "Select gender \n"
                + "From Category\n"
                + "Where category_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, categoryId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString("gender");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }

    public List<String> getAllCategoryGender() {
        String sql = "select gender\n"
                + "from Category\n"
                + "group by gender";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("gender"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDAO d = new CategoryDAO();
        System.out.println(d.getCategoryGenderByCategoryId("wshirt"));
    }
}
