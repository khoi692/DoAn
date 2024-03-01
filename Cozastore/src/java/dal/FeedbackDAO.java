/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Feedback;

/**
 *
 * @author Nhat Anh
 */
public class FeedbackDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Feedback> getFeedbackByProductID(int productId) {
        List<Feedback> feedbacks = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        String sql = "select * from Feedback\n"
                + "where product_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Feedback feedback = new Feedback();
                feedback.setContent(resultSet.getString("content"));
                feedback.setFeadbackId(resultSet.getInt("feedback_id"));
                feedback.setProductId(productId);
                feedback.setRating(resultSet.getInt("rating"));
                feedback.setUserId(resultSet.getInt("user_id"));
                feedback.setFullName(userDAO.getFullNameByUserID(feedback.getUserId()));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return feedbacks;
    }

    public void insertFeedback(Feedback feedback) {
        String sql = "INSERT INTO [dbo].[feedback]\n"
                + "           ([user_id]\n"
                + "           ,[content]\n"
                + "           ,[rating]\n"
                + "           ,[product_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, feedback.getUserId());
            statement.setString(2, feedback.getContent());
            statement.setInt(3, feedback.getRating());
            statement.setInt(4, feedback.getProductId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Feedback> getAll() {
        ArrayList<Feedback> list = new ArrayList<>();
        String sql = "SELECT [feedback_id], f.[user_id], [content], [rating], f.[product_id], u.Full_name, p.Product_name, f.time, f.status\n"
                + "FROM [dbo].[feedback] f\n"
                + "JOIN [dbo].[User] u ON f.user_id = u.User_id\n"
                + "JOIN [dbo].[Product] p ON f.product_id = p.Product_id;";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), "", rs.getString(6));
                f.setProductName(rs.getString(7));
                f.setTime(rs.getString(8));
                f.setStatus(rs.getBoolean(9));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }
        return list;
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE [dbo].[feedback]\n"
                + "   SET [status] = ?\n"
                + " WHERE feedback_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status.equals("Available"));
            stm.setInt(2, id);
            stm.executeUpdate();
            System.out.println(id + " " + status.equals("Available"));
        } catch (SQLException e) {
            System.out.println("updateStatus: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        dao.insertFeedback(new Feedback(0, 0, "abc", 4, 1, "", ""));

    }

    public ArrayList<Integer> getFeedbackCounts() {

        ArrayList<Integer> counts = new ArrayList<>();

        for (int i = 1; i <= 5; i++) {
            counts.add(0);
        }

        try {
            String sql = "SELECT rating, COUNT(*) AS count FROM feedback GROUP BY rating";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");

                counts.set(rating - 1, count);
            }

        } catch (SQLException e) {
            System.out.println("getFeedbackCounts: " + e.getMessage());
        }

        return counts;
    }

    public double getAverageFeedback() {

        double average = 0;

        try {
            String sql = "SELECT AVG(rating) AS average_rating FROM feedback";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                average = rs.getDouble("average_rating");
            }

        } catch (SQLException e) {
            System.out.println("getAverageFeedback: " + e.getMessage());
        }

        return average;
    }

    public double getAverageFeedbackThisMonth() {

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date start = cal.getTime();

        Date end = new Date();

        double average = 0;

        String sql = "SELECT AVG(rating) AS average "
                + "FROM feedback "
                + "WHERE time BETWEEN ? AND ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            if (rs.next()) {
                average = rs.getDouble("average");
            }

        } catch (SQLException e) {
            System.out.println("getAvgFeedbackThisMonth: " + e.getMessage());
        }

        return average;
    }

    public ArrayList<Integer> getFeedbackCountsThisMonth() {

        ArrayList<Integer> counts = new ArrayList<>();

        for (int i = 1; i <= 5; i++) {
            counts.add(0);
        }

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date start = cal.getTime();

        Date end = new Date();

        try {
            String sql = "SELECT rating, COUNT(*) AS count "
                    + "FROM feedback "
                    + "WHERE time BETWEEN ? AND ? "
                    + "GROUP BY rating";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");

                counts.set(rating - 1, count);
            }

        } catch (SQLException e) {
            System.out.println("getFeedbackCountsThisMonth: " + e.getMessage());
        }

        return counts;
    }

    public double getAverageFeedbackLastMonth() {

        Calendar cal = Calendar.getInstance();

        // Set to 1st of this month
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 month
        cal.add(Calendar.MONTH, -1);

        // Get start of last month
        Date start = cal.getTime();

        // Go back to 1st of this month
        cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 day to get end of last month
        cal.add(Calendar.DATE, -1);
        Date end = cal.getTime();

        double average = 0;

        try {
            String sql = "SELECT AVG(rating) AS average FROM feedback "
                    + "WHERE time BETWEEN ? AND ?";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            if (rs.next()) {
                average = rs.getDouble("average");
            }

        } catch (SQLException e) {
            System.out.println("getAvgFeedbackLastMonth: " + e.getMessage());
        }

        return average;
    }

    public ArrayList<Integer> getFeedbackCountsLastMonth() {

        ArrayList<Integer> counts = new ArrayList<>();

        for (int i = 1; i <= 5; i++) {
            counts.add(0);
        }

        Calendar cal = Calendar.getInstance();

        // Set to 1st of this month
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 month
        cal.add(Calendar.MONTH, -1);

        Date start = cal.getTime();

        // Go back to 1st of this month
        cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 day to get end of last month
        cal.add(Calendar.DATE, -1);
        Date end = cal.getTime();

        try {
            String sql = "SELECT rating, COUNT(*) AS count FROM feedback "
                    + "WHERE time BETWEEN ? AND ? "
                    + "GROUP BY rating";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");

                counts.set(rating - 1, count);
            }

        } catch (SQLException e) {
            System.out.println("getFeedbackCountsLastMonth: " + e.getMessage());
        }

        return counts;
    }

    public double getAverageFeedbackLast6Months() {

        Calendar cal = Calendar.getInstance();

        // Set to first day of 6 months ago
        cal.add(Calendar.MONTH, -6);
        Date start = cal.getTime();

        // Set to today
        Date end = new Date();

        double average = 0;

        try {
            String sql = "SELECT AVG(rating) AS average FROM feedback "
                    + "WHERE time >= ? AND time <= ?";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            if (rs.next()) {
                average = rs.getDouble("average");
            }

        } catch (SQLException e) {
            System.out.println("getAverageFeedbackLast6Months: " + e.getMessage());
        }

        return average;
    }

    public ArrayList<Integer> getFeedbackCountsLast6Months() {

        ArrayList<Integer> counts = new ArrayList<>();

        for (int i = 1; i <= 5; i++) {
            counts.add(0);
        }

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -6);
        Date start = cal.getTime();

        Date end = new Date();

        try {
            String sql = "SELECT rating, COUNT(*) AS count FROM feedback "
                    + "WHERE time >= ? AND time <= ? "
                    + "GROUP BY rating";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");

                counts.set(rating - 1, count);
            }

        } catch (SQLException e) {
            System.out.println("getFeedbackCountsLast6Months: " + e.getMessage());
        }

        return counts;
    }
}
