/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.SaleStatics;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "changeOrderStatus", urlPatterns = {"/change-status"})
public class changeOrderStatus extends HttpServlet {

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
            out.println("<title>Servlet changeOrderStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeOrderStatus at " + request.getContextPath() + "</h1>");
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
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int statusId = Integer.parseInt(request.getParameter("statusId"));
        int oldStatusId = Integer.parseInt(request.getParameter("oldStatusId"));
        List<String> notify = new ArrayList<>();

        SaleStatics sDAO = new SaleStatics();


        if (statusId == 4 && oldStatusId == 3) {
            notify = sDAO.updateProductQuantity(orderId);
            if(notify == null) {
                sDAO.updateOrderStatus(orderId, statusId);
            }
        } else if (statusId == 2 && oldStatusId == 5) {
            sDAO.updateOrderStatus(orderId, statusId); // update status
            sDAO.updateProductQuantityRevert(orderId);
        } else {
            sDAO.updateOrderStatus(orderId, statusId); // update status
        }

        if (notify != null) {
            String noti = "";
            for (int i = 0; i < notify.size() - 1; i++) {
                noti += notify.get(i) + "<br><br>";
            }
            noti += notify.get(notify.size() - 1);

            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("notify", noti);

            response.setContentType("application/json");

            response.getWriter().write(jsonResponse.toString());
        }

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
