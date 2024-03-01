/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "filterPrice", urlPatterns = {"/filterprice"})
public class filterPrice extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();

        List<Product> listProduct = new ArrayList<>();
        List<Product> list = new ArrayList<>();
        String priceRange = request.getParameter("priceRange");
        String color = request.getParameter("color");

        String gender = request.getParameter("gender");
        if (gender.equalsIgnoreCase("default")) {
            listProduct = productDAO.getAll();

        } else {
            listProduct = productDAO.getAllProductWithGender(gender);
        }

        if (!priceRange.equalsIgnoreCase("none") && !color.equalsIgnoreCase("none")) { // Case: color and price both not "none"
            double price = Double.parseDouble(priceRange);
            if (price < 200) {
                // delete product don't have color and price
                for (int i = 0; i < listProduct.size(); i++) {
                    int productId = listProduct.get(i).getProductId();
                    if (!productDAO.checkProductHaveColorAndPrice(productId, color, price, price + 50)) {
                        listProduct.remove(listProduct.get(i));
                        i--;
                    }
                }
            } else if (price >= 200) {
                // delete product don't have color and price
                for (int i = 0; i < listProduct.size(); i++) {
                    int productId = listProduct.get(i).getProductId();
                    if (!productDAO.checkProductHaveColorAndPrice(productId, color, price)) {
                        listProduct.remove(listProduct.get(i));
                        i--;
                    }
                }
            }
        } else if (!priceRange.equalsIgnoreCase("none") && color.equalsIgnoreCase("none")) { // Case: color "none" and price not "none"
            if (Double.parseDouble(priceRange) >= 200) {
                double price = Double.parseDouble(priceRange);
                // delete Product dont have price in range
                for (int i = 0; i < listProduct.size(); i++) {
                    int productId = listProduct.get(i).getProductId();
                    if (!productDAO.checkProductHavePrice(productId, price)) {
                        listProduct.remove(listProduct.get(i));
                        i--;
                    }
                }

            } else if (Double.parseDouble(priceRange) < 200) {
                double price = Double.parseDouble(priceRange);
                // delete Product dont have price in range
                for (int i = 0; i < listProduct.size(); i++) {
                    int productId = listProduct.get(i).getProductId();
                    if (!productDAO.checkProductHavePrice(productId, price, price + 50)) {
                        listProduct.remove(listProduct.get(i));
                        i--;
                    }
                }
            }
        } else if (priceRange.equalsIgnoreCase("none") && !color.equalsIgnoreCase("none")) { // Case: color not "none" and price "none"
            listProduct = productDAO.getAllProductWithColor(color);
        }

        session.setAttribute("allProduct", listProduct);
        list = productDAO.pagingProduct(listProduct, 8, 1);
        int size = listProduct.size();
        int number = (size % 8 == 0 ? (size / 8) : ((size / 8) + 1));

        DecimalFormat decimalFormat = new DecimalFormat("##");
        DecimalFormat formatPrice = new DecimalFormat(".##");
        out.println("<div  class=\"row isotope-grid \" >");
        for (Product product : list) {
            double discount = product.getDiscount();
            double productPrice = Double.parseDouble(formatPrice.format(product.getPrice())); //format price and convert to double
            String formattedNumber = decimalFormat.format(discount);
            double newPrice = Double.parseDouble(formatPrice.format(productPrice * (100 - discount) / 100)); // format price and caculate new price

            out.println("<div class=\"product col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item " + product.getCategoryGender() + "\">\n"
                    + "" + (product.getDiscount() != 0 ? "<div class=\"product-discount-mark\">" + formattedNumber + "% OFF</div>" : "") + "\n"
                    + "" + (product.getTotalQuantity() == 0 ? "<div class=\"product-soldout-mark\">Sold out</div>" : "") + "\n"
                    + "                                        <!-- Block2 -->\n"
                    + "                                        <div class=\"block2\">\n"
                    + "                                            <div class=\"block2-pic hov-img0\">\n"
                    + "                                                <img src=\"" + product.getProductImageDefault() + "\" alt=\"IMG-PRODUCT\">\n"
                    + "\n"
                    + "                                                <a onclick=\"quickView(${c.productId})\" href=\"productdetail?id=${c.productId}\" class=\"block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 \">\n"
                    + "                                                    View Details\n"
                    + "                                                </a>\n"
                    + "                                            </div>\n"
                    + "\n"
                    + "                                            <div class=\"block2-txt flex-w flex-t p-t-14\">\n"
                    + "                                                <div class=\"block2-txt-child1 flex-col-l \">\n"
                    + "                                                    <a href=\"product-detail?id=" + product.getProductId() + "\" class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\n"
                    + "                                                       " + product.getProductName() + "\n"
                    + "                                                    </a>\n"
                    + "\n"
                    + "                                            <div>\n"
                    + "                                                <span class=\"stext-105 cl3 newprice\">\n"
                    + "                                                    $" + newPrice + "\n"
                    + "                                                </span>\n"
                    + "                                                " + (discount != 0 ? "<span class=\"stext-105 cl3 price\">\n"
                            + "                                                        $" + productPrice + "\n"
                            + "                                                    </span>" : "") + ""
                    + "                                            </div>"
                    + "                                                </div>\n"
                    + "\n"
                    + "                                                <div class=\"block2-txt-child2 flex-r p-t-3\">\n"
                    + "                                                    <a href=\"#\" class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\n"
                    + "                                                        <img class=\"icon-heart1 dis-block trans-04\" src=\"images/icons/icon-heart-01.png\" alt=\"ICON\">\n"
                    + "                                                        <img class=\"icon-heart2 dis-block trans-04 ab-t-l\" src=\"images/icons/icon-heart-02.png\" alt=\"ICON\">\n"
                    + "                                                    </a>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>");
        }
        out.println("</div>");
        out.println("<div class=\"flex-c-m flex-w w-full p-t-38\">");
        for (int i = 1; i <= number; i++) {
            out.println("<button onclick=\"loadMore(" + i + ")\" class=\"paging flex-c-m stext-101 cl5  bg2 bor1 hov-btn1 p-all-15 trans-04 m-all-15 " + (i == 1 ? "active-paging" : "") + "\"} \" style=\"height: 46px; width: 46px\">\n"
                    + "                            " + i + "\n"
                    + "                        </button>");
        }
        out.println("</div>");

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
        processRequest(request, response);
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
