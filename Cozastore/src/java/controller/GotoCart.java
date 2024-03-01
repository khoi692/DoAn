/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.ajax.cartAjax;
import dal.CartDAO;
import dal.HomeDAO;
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
import model.Product;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name = "GotoCart", urlPatterns = {"/GotoCart"})
public class GotoCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void printCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            List<Cart> clist = (List<Cart>)session.getAttribute("cartInfo");
            // print out cart
            cartAjax ca = new cartAjax();
            for (int i = 0; i < clist.size(); i++) {
                out.println("<div id=\"cart-item-bound-master-" + clist.get(i).getScpId() + "\">\n");  //initial cart item in a div tag
                out.println(ca.cartItem(clist.get(i), clist.get(i).getScpId()));
                out.println("</div>");
            }
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
        // quantity in cart : a
        //! stock status : -1 : quantity left in stock is < a; 
        //! stock status : -2 : quantity left in stock is 0;

        HomeDAO hd = new HomeDAO();
        List<Product> plist = hd.getNumberOfProduct(4); // get some other product 
        request.setAttribute("plist", plist);
        CartDAO cd = new CartDAO();
        List<Cart> clist = new ArrayList<>();
        HttpSession session = request.getSession();
        User currentUser = new User();
        boolean isLoggedIn = false;
        if (session.getAttribute("account") != null) {
            currentUser = (User) session.getAttribute("account");
            isLoggedIn = true;
        }
        
        //this function below is for adding product in session incase use loggin. but everything is just in plan
        if (session.getAttribute("sessionCart") != null) {
            List<Cart> sclist = (List<Cart>) session.getAttribute("sessionCart");
                clist.addAll(sclist);
        }

        if (isLoggedIn) { // if logged in, get cart in db
            clist = cd.getCartByUserId(currentUser.getUserID());
        }
        session.setAttribute("cartInfo", clist);
        request.getRequestDispatcher("cartdetail.jsp").forward(request, response);
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
        printCart(request, response);
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
