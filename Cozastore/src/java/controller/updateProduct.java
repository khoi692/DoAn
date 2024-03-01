/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Product;
import model.ProductColor;
import model.SizeColorProduct;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "updateProduct", urlPatterns = {"/updateproduct"})
@MultipartConfig
public class updateProduct extends HttpServlet {

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
            out.println("<title>Servlet updateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProduct at " + request.getContextPath() + "</h1>");
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
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDAO productDAO = new ProductDAO();
        SizeColorProductDAO scpDAO = new SizeColorProductDAO();
        List<String> oldColor = productDAO.getAllColorOfProduct(productId);
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
        Product product = new Product(productId, name, category, describe, costPrice, sellingPrice, discount, startDate, endDate);
        productDAO.updateProduct(product);

        // tuong ung voi moi mau sac la 1 ban ghi
        for (int i = 0; i < colors.length; i++) {
            ///update in product_color + scp table 
            boolean img = defaultImage.equalsIgnoreCase(colors[i]);
            String sourceImg = "images/product/" + productId + "/" + colors[i].toLowerCase() + ".jpg";
            ProductColor productColor = new ProductColor(productId, colors[i].toLowerCase(), sourceImg, img, null, null);
            productDAO.updateProductColor(productColor, oldColor.get(i));

            //if haven't image upload
            if (fileImages.get(i).getSubmittedFileName() == "") {
                changeFileName(productId, oldColor.get(i), colors[i].toLowerCase());
            } else { // if have image upload
                uploadImgToServer(productId, colors[i].toLowerCase(), fileImages.get(i), oldColor.get(i));
            }
            SizeColorProduct scp = new SizeColorProduct();
            scp.setProductId(productId);
            scp.setColorId(colors[i].toLowerCase());
            scpDAO.deleteSizeProductColor(scp);
            for (int j = 0; j < productDAO.getAllSize().size(); j++) {
                String size = sizes.get(j);
                if (size.contains("#")) {
                    size = size.substring(1);
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
        // delay to load image
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            // Handle interruption
        }
        
//        request.setAttribute("a", colors.length);
//        request.getRequestDispatcher("product-detail-manage?id=" + productId).forward(request, response);
        response.sendRedirect("product-detail-manage?id=" + productId);
    }

    public void changeFileName(int productId, String oldName, String newName) {
        String filePath = getServletContext().getRealPath("images/product/" + productId);
        File oldFile = new File(filePath + "/" + oldName + ".jpg");
        File newFile = new File(filePath + "/" + newName + ".jpg");
        oldFile.renameTo(newFile);
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

    public boolean uploadImgToServer(int productId, String color, Part imagePart, String oldColor) throws IOException {
        String filePath = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId + "\\" + color + ".jpg";
        String oldColorPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId + "\\" + oldColor + ".jpg";
        File oldPath = new File(filePath);
        if (oldPath.exists()) {
            oldPath.delete();
        }
        if (!oldColorPath.equalsIgnoreCase(filePath)) {
            File oldImagePath = new File(oldColorPath);
            oldImagePath.delete();
        }
        String saveBuildPath = getServletContext().getRealPath("") + "..\\..\\web\\images\\product\\" + productId;
        File fileSaveBuildDir = new File(saveBuildPath);
        if (!fileSaveBuildDir.exists()) {
            fileSaveBuildDir.mkdir();
        }        //save 
        Part imageBuildPart = imagePart; //get uploaded file
        String fileName = imagePart.getSubmittedFileName(); // get cai image name 
        // luu vo o dia
        imageBuildPart.write(saveBuildPath + File.separator + fileName); // luu vo o build
        // rename nek
        String oldFileName = fileName;
        String newFileName = color + ".jpg";
        File oldBuildFile = new File(saveBuildPath + "\\" + oldFileName);
        File newBuildFile = new File(saveBuildPath + "\\" + newFileName);
        return oldBuildFile.renameTo(newBuildFile);
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
