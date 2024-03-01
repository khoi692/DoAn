/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;


import dal.SaleStatics;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author kienb
 */
public class AdminDashBoardController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SaleStatics saleDAO = new SaleStatics();
        String productSoldType = "";
        if(request.getParameter("productSold") != null){
            productSoldType = request.getParameter("productSold");
        }
        LocalDateTime now = LocalDateTime.now();
        int totalQuantityInMonth = 0;
        int month = now.getMonthValue();
        int year = now.getYear();
        int lastMonth, lastYear;
        if(month == 1){
            lastMonth = 12;
            lastYear = year - 1;
        } else {
            lastMonth = month - 1;
            lastYear = year;
        }
        List<Product> products = new ArrayList<>();
        if(productSoldType.equalsIgnoreCase("year")){
            products = saleDAO.getNext5ProductInYear(0, year);
            totalQuantityInMonth = saleDAO.totalQuantityInYear(year);
        } else {
           products = saleDAO.getNext5ProductInMonth(0, month, year); 
           totalQuantityInMonth = saleDAO.totalQuantityInMonth(month, year);
        }
        
        int compareOrder = saleDAO.getNumberOrderInMonth(month, year) - saleDAO.getNumberOrderInMonth(lastMonth, lastYear);
        compareOrder = Math.abs(compareOrder);
        
        request.setAttribute("time", month + "/" + year);
        request.setAttribute("year", year);
        request.setAttribute("top5Order", saleDAO.getTop5OrderNewest());
        request.setAttribute("profitChart", saleDAO.getAllProfitInMonthByYear(year));
        request.setAttribute("revenueChart", saleDAO.getAllRevenueInMonthByYear(year));
        request.setAttribute("orderPieChart", saleDAO.getOrderQuantityByMonthYear(month, year));
        request.setAttribute("profit", saleDAO.getProfitInMonth(month, year));
        request.setAttribute("profitLastMonth", saleDAO.getProfitInMonth(lastMonth, lastYear));
        request.setAttribute("compareProfit", saleDAO.compareProfitBetweenMonth(month, year, lastMonth, lastYear));
        request.setAttribute("revenue", saleDAO.getRevenueInMonth(month, year));
        request.setAttribute("revenueLastMonth", saleDAO.getRevenueInMonth(lastMonth, lastYear));
        request.setAttribute("compareRevenue", saleDAO.compareProfitBetweenMonth(month, year, lastMonth, lastYear));
        request.setAttribute("numberOrder", saleDAO.getNumberOrderInMonth(month, year));
        request.setAttribute("numberOrderLastMonth", saleDAO.getNumberOrderInMonth(lastMonth, lastYear));
        request.setAttribute("compareOrder",  compareOrder);
        request.setAttribute("compareOrderCheck",  saleDAO.getNumberOrderInMonth(month, year) - saleDAO.getNumberOrderInMonth(lastMonth, lastYear));
        request.setAttribute("numberPending", saleDAO.getAllNumberPending());
        request.setAttribute("products", products);
        request.setAttribute("totalQuantityInMonth", totalQuantityInMonth);
        request.setAttribute("productSoldType", productSoldType);
        request.getRequestDispatcher("Admin/AdminDashBoard.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
