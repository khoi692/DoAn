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
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Blog;

/**
 *
 * @author pc
 */
public class BlogDAO extends DBContext {
    // get the list of blog order by realease date

    PreparedStatement stm;
    ResultSet rs;

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

    public List<Integer> getBlogCategoryList() {
        String sql = "select Category_id\n"
                + "from BlogCategory";
        List<Integer> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("Category_id");
                list.add(id);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getBlogCateById(int id) {
        String sql = "select Category_name\n"
                + "from BlogCategory \n"
                + "where Category_id = ?";
        String cate_name = "";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                cate_name = resultSet.getString("Category_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cate_name;
    }

    public int queryBlog_row = 0; //get the full number of rows (without fetch , offset
    //get the full number of rows (without fetch , offset)

    public void queryBlog_row_f(int cateId, String search) {
        String sql = "Select count(*)[row] from Blog\n"
                + "where [STATUS] = 1 \n";
        if (cateId != 0) {
            sql += "and Category_id = ?\n";
        }
        if (!search.equals("")) {
            sql += "and ( title LIKE ?\n"
                    + "or Tag LIKE ? )\n";
        }
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            int i = 1;
            if (cateId != 0) {
                statement.setInt(i++, cateId);
            }
            if (!search.trim().equals("")) {
                statement.setString(i++, "%" + search + "%");
                statement.setString(i++, "%" + search + "%");
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                queryBlog_row = resultSet.getInt("row");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // get list of blog after a filter
    public List<Blog> getQueryBlog(int page, int cateId, String order, String search) {
        int offset = (page - 1) * 5; // get the offset as 5 row a page
        queryBlog_row_f(cateId, search);
        String sql = "Select * from Blog \n"
                + "where [STATUS] = 1 \n";
        if (cateId != 0) {
            sql += "and Category_id = (?) \n";
        }
        if (!search.trim().equals("")) {
            sql += "and (title LIKE (?)\n"
                    + "or Tag LIKE (?) )\n";
        }
        sql += "order by [Time] " + order + " \n";
        sql += "offset (?) row\n"
                + "fetch next 5 row only";
        List<Blog> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            int i = 1;
            if (cateId != 0) {
                statement.setInt(i++, cateId);
            }
            if (!search.equals("")) {
                statement.setString(i++, "%" + search + "%");
                statement.setString(i++, "%" + search + "%");
            }
            //statement.setObject(i++, order);
            statement.setInt(i++, offset);
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

    public ArrayList<Blog> getBlogs() {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String select = "SELECT * FROM Blog";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            while (rs.next()) {
                int blogId = rs.getInt("Blog_id");
                int categoryId = rs.getInt("Category_id");
                Timestamp timestamp = rs.getTimestamp("Time");
                String time = dateFormat.format(timestamp);
                String title = rs.getString("Title");
                String summary = rs.getString("Summary");
                String tag = rs.getString("Tag");
                String author = rs.getString("Author");
                String thumbnail = rs.getString("Thumbnail");
                boolean status = rs.getBoolean("Status");
                String content = rs.getString("Content").replace("\r\n", "").replace("\n", "").replace("\r", "");
                Blog blog = new Blog(blogId, categoryId, time, title, summary, tag, author, thumbnail, status, content);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println("getBlogs: " + e.getMessage());
        }
        return blogs;
    }

    public Blog getBlogById(String blogId) {
        Blog blog = null;
        try {
            String select = "SELECT * FROM Blog WHERE Blog_id = ?";
            stm = connection.prepareStatement(select);
            stm.setString(1, blogId);
            rs = stm.executeQuery();
            if (rs.next()) {
                blog = new Blog();
                blog.setBlogId(rs.getInt("Blog_id"));
                blog.setCategoryId(rs.getInt("Category_id"));
                blog.setTime(rs.getString("Time"));
                blog.setTitle(rs.getString("Title"));
                blog.setSummary(rs.getString("Summary"));
                blog.setTag(rs.getString("Tag"));
                blog.setAuthor(rs.getString("Author"));
                blog.setThumbnail("../" + rs.getString("Thumbnail"));
                blog.setStatus(rs.getBoolean("Status"));
                blog.setContent(rs.getString(9).replace("\r\n", "").replace("\n", "").replace("\r", ""));
            }
        } catch (SQLException e) {
            System.out.println("getBlogById: " + e.getMessage());
        }
        return blog;
    }

    public void update(Blog b) {
        try {
            String select = "UPDATE [dbo].[Blog]\n"
                    + "   SET [Title] = ?\n"
                    + "      ,[Summary] = ?\n"
                    + "      ,[Content] = ?\n"
                    + "      ,[Status] = ?\n"
                    + "      ,[Author] = ?\n"
                    + "      ,[Time] = ?\n"
                    + " WHERE Blog_id = ?";
            stm = connection.prepareStatement(select);
            stm.setString(1, b.getTitle());
            stm.setString(2, b.getSummary());

            stm.setString(3, b.getContent().replace("\r\n", "").replace("\n", "").replace("\r", ""));
            stm.setBoolean(4, b.isStatus());
            stm.setString(5, b.getAuthor());
            stm.setString(6, b.getTime());
            stm.setInt(7, b.getBlogId());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("update: " + e.getMessage());
        }

    }

    public ArrayList<String> getUniqueSortedAuthors() {
        ArrayList<String> authorsList = new ArrayList<>();
        try {
            String select = "SELECT DISTINCT Author FROM Blog ORDER BY Author";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                authorsList.add(rs.getString("Author"));
            }
        } catch (SQLException e) {
            System.out.println("getUniqueSortedAuthors: " + e.getMessage());
        }
        return authorsList;
    }

    public ArrayList<String> getBlogCategories() {
        ArrayList<String> cateList = new ArrayList<>();
        try {
            String select = "select * from [BlogCategory]";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                cateList.add(rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("getBlogCategories: " + e.getMessage());
        }
        return cateList;
    }

    public ArrayList<String> getTags() {
        ArrayList<String> tags = new ArrayList<>();
        Set<String> tagSet = new HashSet<>();
        try {
            String select = "SELECT Tag FROM Blog";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            while (rs.next()) {
                String tagString = rs.getString(1);
                String[] tagArray = tagString.split("#");
                for (String tag : tagArray) {
                    if (!tagSet.contains(tag)) {
                        tags.add(tag);
                        tagSet.add(tag);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("getTags: " + e.getMessage());
        }
        return tags;
    }

    public int highestId() {
        int a = 0;
        try {
            String sql = "SELECT IDENT_CURRENT('Blog');";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("highestId: " + e.getMessage());
        }

        return a;
    }

    public void addBlog(Blog b) {
        try {
            String sql = "INSERT INTO [dbo].[Blog]\n"
                    + "           ([Category_id]\n"
                    + "           ,[Time]\n"
                    + "           ,[Title]\n"
                    + "           ,[Summary]\n"
                    + "           ,[Tag]\n"
                    + "           ,[Author]\n"
                    + "           ,[Thumbnail]\n"
                    + "           ,[Content]\n"
                    + "           ,[Status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, b.getCategoryId());
            stm.setTimestamp(2, Timestamp.valueOf(b.getTime()));
            stm.setString(3, b.getTitle());
            stm.setString(4, b.getSummary());
            stm.setString(5, b.getTag());
            stm.setString(6, b.getAuthor());
            stm.setString(7, b.getThumbnail());
            stm.setString(8, b.getContent());
            stm.setBoolean(9, b.isStatus());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addBlog: " + e.getMessage());
        }
    }

    public ArrayList<Blog> getAvailableBlogs() {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String select = "SELECT * FROM Blog where Status = 1";
            stm = connection.prepareStatement(select);
            rs = stm.executeQuery();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            while (rs.next()) {
                int blogId = rs.getInt("Blog_id");
                int categoryId = rs.getInt("Category_id");
                Timestamp timestamp = rs.getTimestamp("Time");
                String time = dateFormat.format(timestamp);
                String title = rs.getString("Title");
                String summary = rs.getString("Summary");
                String tag = rs.getString("Tag");
                String author = rs.getString("Author");
                String thumbnail = rs.getString("Thumbnail");
                boolean status = rs.getBoolean("Status");
                String content = rs.getString("Content").replace("\r\n", "").replace("\n", "").replace("\r", "");
                Blog blog = new Blog(blogId, categoryId, time, title, summary, tag, author, thumbnail, status, content);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println("getBlogs: " + e.getMessage());
        }
        return blogs;
    }

    public int getTotal() {
        int total = 0;
        try {
            String sql = "select * from [dbo].[Blog]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                total++;
            }
        } catch (SQLException e) {
            System.out.println("getTotal: " + e.getMessage());
        }
        return total;
    }

    public ArrayList<Integer> getTotalPostCounts(ArrayList<String> categories) {
        ArrayList<Integer> postCounts = new ArrayList<>();
        for (int i = 0; i < categories.size(); i++) {
            postCounts.add(0);
        }
        try {
            String sql = "SELECT bc.Category_name FROM [demo1].[dbo].[Blog] b join BlogCategory bc on b.Category_id = bc.Category_id";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                for (int i = 0; i < categories.size(); i++) {
                    String cate = categories.get(i);
                    if (rs.getString(1).equals(cate)) {
                        // Get current count for this category
                        int currentCount = postCounts.get(i);
                        // Increment count
                        currentCount++;
                        // Update count for this category 
                        postCounts.set(i, currentCount);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("getPostCount: " + e.getMessage());
        }
        return postCounts;
    }

    public int getTotalLastMonth() {

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

        try {
            String sql = "SELECT COUNT(*) AS total FROM Blog WHERE Time BETWEEN ? AND ?";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));
//            System.out.println(new java.sql.Date(start.getTime()));
//            System.out.println(new java.sql.Date(end.getTime()));
            rs = stm.executeQuery();
            if (rs.next()) {
//                System.out.println(rs.getInt("total"));
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalLastMoth: " + e.getMessage());
        }

        return 0;
    }

    public ArrayList<Integer> getTotalPostCountsLastMonth(ArrayList<String> categories) {

        ArrayList<Integer> postCounts = new ArrayList<>();

        for (String category : categories) {
            postCounts.add(0);
        }

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

        try {
            String sql = "SELECT bc.Category_name, COUNT(*) AS count "
                    + "FROM Blog b JOIN BlogCategory bc ON b.Category_id = bc.Category_id "
                    + "WHERE b.Time BETWEEN ? AND ? "
                    + "GROUP BY bc.Category_name";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                String category = rs.getString("Category_name");
                int count = rs.getInt("count");

                int index = categories.indexOf(category);
                postCounts.set(index, count);
            }
        } catch (SQLException e) {
            System.out.println("getTotalPostCountsLastMonth: " + e.getMessage());
        }

        return postCounts;

    }

    public int getTotalLast6Months() {

        Calendar cal = Calendar.getInstance();

        // Set to 1st of this month
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 month
        cal.add(Calendar.MONTH, -6);

        // Get start of last month
        Date start = cal.getTime();

        // Go back to 1st of this month
        cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 day to get end of last month
        cal.add(Calendar.DATE, -1);
        Date end = cal.getTime();

        try {
            String sql = "SELECT COUNT(*) AS total FROM Blog WHERE Time BETWEEN ? AND ?";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));
//            System.out.println(new java.sql.Date(start.getTime()));
//            System.out.println(new java.sql.Date(end.getTime()));
            rs = stm.executeQuery();
            if (rs.next()) {
//                System.out.println(rs.getInt("total"));
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalLast6Months: " + e.getMessage());
        }

        return 0;
    }

    public ArrayList<Integer> getTotalPostCounts6LastMonths(ArrayList<String> categories) {

        ArrayList<Integer> postCounts = new ArrayList<>();

        for (String category : categories) {
            postCounts.add(0);
        }

        Calendar cal = Calendar.getInstance();

        // Set to 1st of this month
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 month
        cal.add(Calendar.MONTH, -6);

        // Get start of last month
        Date start = cal.getTime();

        // Go back to 1st of this month
        cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Go back 1 day to get end of last month
        cal.add(Calendar.DATE, -1);
        Date end = cal.getTime();

        try {
            String sql = "SELECT bc.Category_name, COUNT(*) AS count "
                    + "FROM Blog b JOIN BlogCategory bc ON b.Category_id = bc.Category_id "
                    + "WHERE b.Time BETWEEN ? AND ? "
                    + "GROUP BY bc.Category_name";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                String category = rs.getString("Category_name");
                int count = rs.getInt("count");

                int index = categories.indexOf(category);
                postCounts.set(index, count);
            }
        } catch (SQLException e) {
            System.out.println("getTotalPostCountsLastMonth: " + e.getMessage());
        }

        return postCounts;
    }

    public int getTotalThisMonth() {

        Calendar cal = Calendar.getInstance();

        // Set to 1st day of current month
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date start = cal.getTime();

        // Set to current date
        Date end = new Date();

        String sql = "SELECT COUNT(*) AS total FROM Blog "
                + "WHERE Time BETWEEN ? AND ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("getTotalThisMonth: " + e.getMessage());
        }

        return 0;
    }

    public ArrayList<Integer> getTotalPostCountsThisMonth(ArrayList<String> categories) {
        ArrayList<Integer> postCounts = new ArrayList<>();
        for (String category : categories) {
            postCounts.add(0);
        }

        Calendar cal = Calendar.getInstance();

        // Set to 1st day of current month
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date start = cal.getTime();

        // Set to current date
        Date end = new Date();

        try {
            String sql = "SELECT bc.Category_name, COUNT(*) AS count "
                    + "FROM Blog b JOIN BlogCategory bc ON b.Category_id = bc.Category_id "
                    + "WHERE b.Time BETWEEN ? AND ? "
                    + "GROUP BY bc.Category_name";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));

            rs = stm.executeQuery();

            while (rs.next()) {
                String category = rs.getString("Category_name");
                int count = rs.getInt("count");

                int index = categories.indexOf(category);
                postCounts.set(index, count);
            }
        } catch (SQLException e) {
            System.out.println("getTotalPostCountsLastMonth: " + e.getMessage());
        }

        return postCounts;
    }

}
