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
import model.Voucher;

/**
 *
 * @author pc
 */
@WebServlet(name = "CartContact", urlPatterns = {"/CartContact"})
public class CartContact extends HttpServlet {

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
            out.println("<title>Servlet CartContact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartContact at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        CartDAO cd = new CartDAO();
        if (request.getParameter("getMethod") != null) {
            String code = request.getParameter("code");
            double discount = cd.getVoucherDiscountByCode(code);
            out.println(discount);
        } else {
            response.sendRedirect("product"); // can not check out if threr is no item
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

        HttpSession session = request.getSession();
        CartDAO cd = new CartDAO();
        String[] scpId;
        scpId = request.getParameterValues("scpId"); // all scpid that user select

        if (scpId.length < 1) {
            response.sendRedirect("product"); // can not check out if threr is no item
            return;
        }

        List<Cart> checkList = new ArrayList<>();

        if (session.getAttribute("account") != null) { //if loggend in
            User currentUser = (User) session.getAttribute("account");
            for (int i = 0; i < scpId.length; i++) { // add all item to checklist
                Cart item = cd.getCartItemByUserIdScpId(currentUser.getUserID(), Integer.parseInt(scpId[i]));
                if (!cd.isCartExist(item.getScpId(), currentUser.getUserID())) { // there is an issuese that item is created even when cart is not exist
                    response.sendRedirect("product"); // can not check out if threr is no item
                    return;
                }
                checkList.add(item);
            }
        } else { // if not logged in
            List<Cart> scart = (List<Cart>) session.getAttribute("sessionCart");
            for (int i = 0; i < scart.size(); i++) { // filter out product that user selected
                for (int k = 0; k < scpId.length; k++) {
                    if (scart.get(i).getScpId() == Integer.parseInt(scpId[k])) {
                        checkList.add(cd.getTempCartItemByScpId(scart.get(i).getScpId(), scart.get(i).getQuantity()));
                    }
                }
            }
        }

        //voucher
        List<Voucher> vlist = cd.getAllPublicVoucher();
        request.setAttribute("vlist", vlist);

        session.setAttribute("orderSession", checkList); // create an session of selected product
        if (checkList.size() < 1) {
            response.sendRedirect("product"); // can not check out if threr is no item
            return;
        }
        //session.setMaxInactiveInterval(1800); // order Contact will remains upto 600s and disappear if user
        //successfully paid or ordered
        request.getRequestDispatcher("cartContact.jsp").forward(request, response);
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
