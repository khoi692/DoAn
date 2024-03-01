/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.FeedbackDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Drag
 */
public class MarketingDashboardController extends HttpServlet {

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
        BlogDAO b = new BlogDAO();
        FeedbackDAO f = new FeedbackDAO();
        UserDAO u = new UserDAO();
        
        ArrayList<String> categories = b.getBlogCategories();
        request.getSession().setAttribute("numPostCurrentMonth", b.getTotalThisMonth());
        request.getSession().setAttribute("postCountsCurrentMonth", b.getTotalPostCountsThisMonth(categories));
        
        request.getSession().setAttribute("numPostLast6Months", b.getTotalLast6Months());
        request.getSession().setAttribute("postCountsLast6Months", b.getTotalPostCounts6LastMonths(categories));
        
        request.getSession().setAttribute("numPostLastMonth", b.getTotalLastMonth());
        request.getSession().setAttribute("postCountsLastMonth", b.getTotalPostCountsLastMonth(categories));
        
        request.getSession().setAttribute("numPost", b.getTotal());
        request.getSession().setAttribute("postCounts", b.getTotalPostCounts(categories));
        
        request.getSession().setAttribute("categories", categories);
        
        request.getSession().setAttribute("feedbackAverage", f.getAverageFeedback());
        request.getSession().setAttribute("feedbackCounts", f.getFeedbackCounts());
        
        request.getSession().setAttribute("feedbackAverageThisMonth", f.getAverageFeedbackThisMonth());
        request.getSession().setAttribute("feedbackCountsThisMonth", f.getFeedbackCountsThisMonth());
        
        request.getSession().setAttribute("feedbackAverageLastMonth", f.getAverageFeedbackLastMonth());
        request.getSession().setAttribute("feedbackCountsLastMonth", f.getFeedbackCountsLastMonth());
        
        request.getSession().setAttribute("feedbackAverageLast6Months", f.getAverageFeedbackLast6Months());
        request.getSession().setAttribute("feedbackCountsLast6Months", f.getFeedbackCountsLast6Months());
        
        request.getSession().setAttribute("userCount", u.count());
        request.getSession().setAttribute("ageGroups", u.getCustomerAgeCount());
        request.getSession().setAttribute("genderGroups", u.getCustomerGenderCount());
        request.getRequestDispatcher("marketing_dashboard.jsp").forward(request, response);
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
