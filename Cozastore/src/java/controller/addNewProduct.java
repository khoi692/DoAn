/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SizeColorProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import model.Product;
import model.ProductColor;
import model.SizeColorProduct;

/**
 *
 * @author Nhat Anh
 */
@MultipartConfig
@WebServlet(name = "addNewProduct", urlPatterns = {"/addnewproduct"})
public class addNewProduct extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addNewProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<String> categories = categoryDAO.getAllCategoryGender();
        List<String> sizes = productDAO.getAllSize();
        List<String> colors = productDAO.getAllColor();
        request.setAttribute("sizes", sizes);
        request.setAttribute("colors", colors);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("add-new-product.jsp").forward(request, response);
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
        // init
        response.setHeader("Cache-Control", "no-store");
        ProductDAO productDAO = new ProductDAO();
        int numberSize = productDAO.getAllSize().size();
        SizeColorProductDAO scpDAO = new SizeColorProductDAO();
        String name = request.getParameter("productName");
        String category = request.getParameter("category");
        if (category.equalsIgnoreCase("man")) {
            category = "mcoat";
        } else if (category.equalsIgnoreCase("women")) {
            category = "wcoat";
        } else {
            category = "ucoat";
        }
        double costPrice = Double.parseDouble(request.getParameter("costPrice"));
        double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
        String describe = request.getParameter("describe");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startDate = convertToSQLDate(request.getParameter("startDate"));
        String endDate = convertToSQLDate(request.getParameter("endDate"));
        String[] colors = request.getParameterValues("color");
        // List image
        List<Part> fileImages = request.getParts().stream()
                .filter(part -> part.getName().equals("image"))
                .collect(Collectors.toList());

        String defaultImage = request.getParameter("defaultImage");

        String[] sizes_raw = request.getParameterValues("size");
        List<String> sizes = new ArrayList<>();
        for (int i = 0; i < sizes_raw.length; i++) {
            sizes.add(sizes_raw[i]);
        }
        String[] quantity_raw = request.getParameterValues("quantity");
        List<Integer> quantity = new ArrayList<>();
        for (int i = 0; i < quantity_raw.length; i++) {
            try {
                quantity.add(Integer.parseInt(quantity_raw[i]));
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        //update product in table product
        Product product = new Product(0, name, category, describe, costPrice, sellingPrice, discount, startDate, endDate);

        LocalDate localDate = LocalDate.now();
        java.sql.Date now = java.sql.Date.valueOf(localDate);
        product.setReleaseDate(now);

        int productId = productDAO.insertProduct(product);
        product.setProductId(productId);

        // tuong ung voi moi mau sac la 1 ban ghi
        for (int i = 0; i < colors.length; i++) {
            boolean isDefaultImage = defaultImage.equalsIgnoreCase(colors[i].toLowerCase());
            String sourceImg = "images/product/" + productId + "/" + colors[i].toLowerCase() + ".jpg";
            ProductColor productColor = new ProductColor(productId, colors[i].toLowerCase(), sourceImg, isDefaultImage, null, null); // phải sửa lại true
            productDAO.insertProductColor(productColor);

            uploadImgToServer(productId, colors[i].toLowerCase(), fileImages.get(i));
            String buildPath = getServletContext().getRealPath("images/product/") + productId;
            File buildTemp = new File(buildPath);
            if (!buildTemp.exists()) {
                for (int j = 0; j < 20; j++) {
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        // Handle interruption
                    }
                }
            }
            insertImage(productId, colors[i].toLowerCase(), fileImages.get(i));
            String buildPathImage = getServletContext().getRealPath("images/product/") + productId +"/" +colors[i].toLowerCase() +".jpg";
            File buildImageTemp = new File(buildPathImage);
            if (!buildImageTemp.exists()) {
                for (int j = 0; j < 20; j++) {
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        // Handle interruption
                    }
                }
            }
            SizeColorProduct scp = new SizeColorProduct();
            for (int j = 0; j < numberSize; j++) {
                String size = sizes.get(j);
                if (size.contains("#")) {
                    size = size.replace("#", "");
                }
                scp = new SizeColorProduct(0, colors[i].toLowerCase(), productId, size.toUpperCase(), quantity.get(j));
                scpDAO.insertSizeProductColor(scp);
                if (sizes.get(j).contains("#")) {
                    sizes.remove(j);
                    quantity.remove(j);
                    break;
                }
                sizes.remove(j);
                quantity.remove(j);
                j--;
            }

        }
        response.sendRedirect("product-detail-manage?id="+productId);
    }

    public String convertToSQLDate(String inputDate) {
        DateFormat inputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String outputDate = "";
        try {
            Date date = inputDateFormat.parse(inputDate);

            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            DateTimeFormatter outputDateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            outputDate = localDate.format(outputDateFormat);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return outputDate;
    }

    public void uploadImgToServer(int productId, String color, Part imagePart) throws IOException {
        String filePath = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId + "\\" + color + ".jpg";
        File oldPath = new File(filePath);
        if (oldPath.exists()) {
            oldPath.delete();
        }

        String saveBuildPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId;

        File fileSaveBuildDir = new File(saveBuildPath);
        if (!fileSaveBuildDir.exists()) {
            fileSaveBuildDir.mkdir();
        }        //save 

    }

    public void insertImage(int productId, String color, Part imagePart) throws IOException {
        String saveBuildPath1 = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId;
        String saveBuildPath2 = getServletContext().getRealPath("images/product/" + productId);

        String fileName = imagePart.getSubmittedFileName(); 

        String filePath1 = saveBuildPath1 + File.separator + fileName;
        try ( InputStream inputStream = imagePart.getInputStream()) {
            Files.copy(inputStream, Paths.get(filePath1), StandardCopyOption.REPLACE_EXISTING);
        }

        String filePath2 = saveBuildPath2 + File.separator + fileName;
        try ( InputStream inputStream = imagePart.getInputStream()) {
            Files.copy(inputStream, Paths.get(filePath2), StandardCopyOption.REPLACE_EXISTING);
        }

        String newFileName = color + ".jpg";
        File newBuildFile1 = new File(saveBuildPath1 + File.separator + newFileName);
        File newBuildFile2 = new File(saveBuildPath2 + File.separator + newFileName);
        File oldBuildFile1 = new File(saveBuildPath1 + File.separator + fileName);
        File oldBuildFile2 = new File(saveBuildPath2 + File.separator + fileName);
        oldBuildFile1.renameTo(newBuildFile1);
        oldBuildFile2.renameTo(newBuildFile2);
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
