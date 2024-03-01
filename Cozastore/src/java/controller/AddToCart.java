/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        //status : 0 no user found
        //status : 1 successful
        //status : -1 
        CartDAO cd = new CartDAO();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int ProductId = Integer.parseInt(request.getParameter("proId"));
        int quantity = Integer.parseInt(request.getParameter("num-product"));
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        int scpId = cd.getScpIdByItsComponent(ProductId, color, size);
        if (session.getAttribute("account") != null) { //LOGGED IN
            User currentUser = (User) session.getAttribute("account");
            if (!cd.isCartExist(scpId, currentUser.getUserID())) {
                cd.addToCart(currentUser.getUserID(), scpId, quantity);
                session.setAttribute("cartInfo", cd.getCartByUserId(currentUser.getUserID()));
                out.println("1"); // successs
            } else {
                out.println("-1"); // duplicated
            }
        } else { // NOT LOGGED IN
            if (session.getAttribute("sessionCart") == null) { //if there no cart before
                List<Cart> clist = new ArrayList<>();
                Cart temp = cd.getTempCartItemByScpId(scpId, quantity);
                clist.add(temp);
                session.setAttribute("sessionCart", clist);
                out.println("0");  // success but not logged in
            } else { //there is a cart on session before
                Cart temp = cd.getTempCartItemByScpId(scpId, quantity);
                List<Cart> clist = (List<Cart>) session.getAttribute("sessionCart");
                if(!cd.isSessionCartExist(temp, clist)){
                    clist.add(temp);
                    session.setAttribute("sessionCart", clist);
                    out.println("0"); // success but not logged in
                }else{
                    out.println("-1");
                }
            }
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
