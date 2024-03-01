/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import function.CopyFolder;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import model.Blog;
import model.User;

/**
 *
 * @author Drag
 */
@MultipartConfig
public class AddPostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO b = new BlogDAO();
        request.getSession().removeAttribute("blog");
        request.getSession().setAttribute("cateList", b.getBlogCategories());
        request.getRequestDispatcher("../add_post.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CopyFolder cf = new CopyFolder();
        Blog b = new Blog();
        int highestId = (new BlogDAO()).highestId() + 1;

        Part filePart = request.getPart("thumbnail");
        String newFileName = "blog-" + highestId + ".jpg";

        String uploadPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\blog_thumbnail\\" + newFileName;
//        System.out.println(uploadPath);
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = filePart.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        }

        // Check for existence of thumbnail file
        File thumbnailFile = new File(getServletContext().getRealPath("") + "images\\blog_thumbnail\\" + newFileName);
        int a = 0;
        while (!thumbnailFile.exists() && a < 20) {
            // Wait for thumbnail to be created
            try {
                Thread.sleep(100);
                a++;
            } catch (InterruptedException e) {
                // Handle interruption
            }
        }

        Part categoryPart = request.getPart("category");
        InputStream categoryInputStream = categoryPart.getInputStream();
        String category = new BufferedReader(new InputStreamReader(categoryInputStream))
                .lines().collect(Collectors.joining("\n"));
        b.setCategoryId(Integer.parseInt(category));
        System.out.println(b.getCategoryId());

        java.sql.Timestamp timestamp = new java.sql.Timestamp(System.currentTimeMillis());
        b.setTime(timestamp.toString());

        Part titlePart = request.getPart("title");
        InputStream titleInputStream = titlePart.getInputStream();
        String title = new BufferedReader(new InputStreamReader(titleInputStream))
                .lines().collect(Collectors.joining("\n"));
        b.setTitle(title);
        System.out.println(b.getTitle());

        Part summaryPart = request.getPart("summary");
        InputStream summaryInputStream = summaryPart.getInputStream();
        String summary = new BufferedReader(new InputStreamReader(summaryInputStream))
                .lines().collect(Collectors.joining("\n"));
        b.setSummary(summary);
        System.out.println(b.getSummary());

        Part tagPart = request.getPart("tag");
        InputStream tagInputStream = tagPart.getInputStream();
        String tag = new BufferedReader(new InputStreamReader(tagInputStream))
                .lines().collect(Collectors.joining("\n"));
        b.setTag(tag);
        System.out.println(b.getTag());

        User u = (User) request.getSession().getAttribute("account");
        b.setAuthor(u.getName());

        b.setThumbnail("images/blog_thumbnail/blog-" + highestId + ".jpg");

        Part editorDataPart = request.getPart("editorData");
        InputStream editorDataInputStream = editorDataPart.getInputStream();
        String editorData = new BufferedReader(new InputStreamReader(editorDataInputStream))
                .lines().collect(Collectors.joining("\n"));
        b.setContent(editorData);
//        System.out.println(b.getContent());

        b.setStatus(true);

        (new BlogDAO()).addBlog(b);

        String srcPath = getServletContext().getRealPath("") + "images\\blogs\\blog-" + highestId;
        String desPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\blogs\\blog-" + highestId;
        File src = new File(srcPath);
        for (File file : src.listFiles()) {
            if (!b.getContent().contains(file.getName())) {
                file.delete();
                System.out.println(file.getName() + " deleted in add");
            }
        }
        cf.CopyFolder(srcPath, desPath);

        response.sendRedirect("../post");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
