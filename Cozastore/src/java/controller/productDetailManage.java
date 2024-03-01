/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Product;
import model.ProductColor;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "productDetailManage", urlPatterns = {"/product-detail-manage"})
public class productDetailManage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store");
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        Product product = productDAO.getProductById(productId);
        List<String> categories = categoryDAO.getAllCategoryGender();
        List<String> sizes = productDAO.getAllSize();
        List<String> colors = productDAO.getAllColor();
        List<ProductColor> productColor = productDAO.getProductColorOfProductById(productId);
        String startDiscount = formatDate(product.getStartDiscount());
        String endDiscount = formatDate(product.getEndDiscount());

        request.setAttribute("productId", productId);
        request.setAttribute("productName", product.getProductName());
        request.setAttribute("category", product.getCategoryGender());
        request.setAttribute("costPrice", product.getEntryPrice());
        request.setAttribute("sellingPrice", product.getPrice());
        request.setAttribute("describe", product.getDescribe());
        request.setAttribute("discount", product.getDiscount());
        request.setAttribute("startDiscount", startDiscount);
        request.setAttribute("endDiscount", endDiscount);
        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("colors", colors);
        request.setAttribute("productColor", productColor);
        request.getRequestDispatcher("dashboard/product-detail-manage.jsp").forward(request, response);
    }

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
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        Product product = productDAO.getProductById(productId);
        List<String> categories = categoryDAO.getAllCategoryGender();
        List<String> sizes = productDAO.getAllSize();
        List<String> colors = productDAO.getAllColor();
        List<ProductColor> productColor = productDAO.getProductColorOfProductById(productId);
        String startDiscount = formatDate(product.getStartDiscount());
        String endDiscount = formatDate(product.getEndDiscount());
        request.setAttribute("productId", productId);
        request.setAttribute("productName", product.getProductName());
        request.setAttribute("category", product.getCategoryGender());
        request.setAttribute("costPrice", product.getEntryPrice());
        request.setAttribute("sellingPrice", product.getPrice());
        request.setAttribute("describe", product.getDescribe());
        request.setAttribute("discount", product.getDiscount());
        request.setAttribute("startDiscount", startDiscount);
        request.setAttribute("endDiscount", endDiscount);
        request.setAttribute("categories", categories);
        request.setAttribute("sizes", sizes);
        request.setAttribute("colors", colors);
        request.setAttribute("productColor", productColor);
        request.getRequestDispatcher("dashboard/product-detail-manage.jsp").forward(request, response);
    }

    public String formatDate(String currentDateTime) {

        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        LocalDateTime dateTime = LocalDateTime.parse(currentDateTime, inputFormatter);

        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = dateTime.format(outputFormatter);

        return formattedDate;
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
        processRequest(request, response);
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
