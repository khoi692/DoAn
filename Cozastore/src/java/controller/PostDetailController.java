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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Blog;
import model.User;
import static org.apache.poi.hssf.usermodel.HeaderFooter.time;

/**
 *
 * @author Drag
 */
@MultipartConfig
public class PostDetailController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String blogId = request.getParameter("blogId");
        // Use the blogId to retrieve the corresponding blog post from the database
        BlogDAO b = new BlogDAO();
        Blog blog = b.getBlogById(blogId);
        request.getSession().setAttribute("blog", blog);
//        out.print(blog.getContent());
//        out.print(blog.getBlogId()+" "+blog.getAuthor());
//        out.print(blog.getThumbnail());
        request.getRequestDispatcher("../post_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Blog b = (Blog) request.getSession().getAttribute("blog");
//        out.print(request.getParameter("editorData"));
//        System.out.println(b.getBlogId());
        User u = (User) request.getSession().getAttribute("account");
        b.setAuthor(u.getName());
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String datetimeString = now.format(formatter);
        b.setTime(datetimeString);

        b.setStatus(request.getParameter("status").equals("1"));
        b.setTitle(request.getParameter("title"));
        b.setSummary(request.getParameter("summary"));
        b.setContent(request.getParameter("editorData"));
        BlogDAO bdao = new BlogDAO();
        bdao.update(b);

        int bid = b.getBlogId();
        Part filePart = request.getPart("thumbnail");
//        System.out.println(request.getPart("thumbnail"));
//        System.out.println(filePart.getSize());
        if (filePart.getSize() > 0) {
            String oldThumbnailPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\blogs\\blog-" + bid + ".jpg";
            File oldThumbnail = new File(oldThumbnailPath);
            if (oldThumbnail.exists()) {
                oldThumbnail.delete();
            }

            String newFileName = "blog-" + bid + ".jpg";
            String uploadPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\blog_thumbnail\\" + newFileName;
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
//            System.out.println(thumbnailFile.getPath());
            int a = 0;
            try {
                Thread.sleep(1500);
            } catch (InterruptedException e) {
            }
            do {
                // Wait for thumbnail to be created
                try {
//                    System.out.println(a);
                    Thread.sleep(100);
                    a++;
                } catch (InterruptedException e) {
                    // Handle interruption
                }
            } while (!thumbnailFile.exists() && a < 20);
        }

        String desPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\blogs\\blog-" + bid;
        File des = new File(desPath);
        for (File file : des.listFiles()) {
            if (!b.getContent().contains(file.getName())) {
                file.delete();
                System.out.println(file.getName() + " deleted in update");
            }
        }
        
        response.sendRedirect("/cozastore/post");
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
