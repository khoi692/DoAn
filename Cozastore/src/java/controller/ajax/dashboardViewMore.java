/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.SaleStatics;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "dashboardViewMore", urlPatterns = {"/dashboard-view-more"})
public class dashboardViewMore extends HttpServlet {

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
        LocalDateTime now = LocalDateTime.now();
        int month = now.getMonthValue();
        int year = now.getYear();
        double totalQuantityInMonth = Double.parseDouble(request.getParameter("totalQuantityInMonth"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String productSoldType = "";
        if(request.getParameter("productSold") != null){
            productSoldType = request.getParameter("productSold");
        }
        SaleStatics dao = new SaleStatics();
        List<Product> products = new ArrayList<>();
        if(productSoldType.equalsIgnoreCase("year")){
            products = dao.getNext5ProductInYear(amount, year);
        } else {
           products = dao.getNext5ProductInMonth(amount, month, year); 
        }
        PrintWriter out = response.getWriter();

        for (int i = 0; i < products.size(); i++) {
            out.println("<div class=\"mb-3 product\">\n"
                    + "                                                <div class=\"small text-gray-500\">"+products.get(i).getProductName()+"\n"
                    + "                                                    <div class=\"small float-right\"><b>"+products.get(i).getTotalQuantity()+" of "+totalQuantityInMonth+" Items</b></div>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"progress\" style=\"height: 12px;\">\n"
                    + "                                                    <div class=\"progress-bar bg-info\" role=\"progressbar\" style=\"width: "+(products.get(i).getTotalQuantity()/totalQuantityInMonth)*100+"%\" aria-valuenow=\""+(products.get(i).getTotalQuantity()/totalQuantityInMonth)*100+"\"\n"
                    + "                                                         aria-valuemin=\"0\" aria-valuemax=\"100\"></div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>");
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
