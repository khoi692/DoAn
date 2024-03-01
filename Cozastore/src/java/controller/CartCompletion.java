/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.HomeDAO;
import dal.UserDAO;
import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;
import static jdk.nashorn.internal.objects.NativeError.printStackTrace;
import model.Cart;
import model.Product;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name = "CartCompletion", urlPatterns = {"/CartCompletion"})
public class CartCompletion extends HttpServlet {

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
            out.println("<title>Servlet CartCompletion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartCompletion at " + request.getContextPath() + "</h1>");
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
            response.sendRedirect("product");
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
        if (session.getAttribute("orderSession") == null) { //no order found
            response.sendRedirect("product");
            return;
        }

        double total = Double.parseDouble(request.getParameter("total"));
        String customer = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("Address");
        String voucher = request.getParameter("Voucher");

        VoucherDAO vd = new VoucherDAO();
        CartDAO cd = new CartDAO();
        UserDAO ud = new UserDAO();
        HomeDAO hd = new HomeDAO();

        double discount = vd.getVoucher(voucher).getDiscount(); //get the voucher discount

        User currentUser = new User();
        boolean isLogged = true;
        if (session.getAttribute("account") != null) {
            isLogged = true;
            currentUser = (User) session.getAttribute("account");//logged in
        } else {
            isLogged = false;
            String guestEmail = generateEmailForGuest();
            try {
                cd.createUserGuest(customer, phone, guestEmail, address, 2, true); // if not logged in, create new user
            } catch (ParseException e) {
                printStackTrace(e);
            }
            currentUser = ud.getUserByEmail(guestEmail);
        }

        List<Cart> sessionCart = (List<Cart>) session.getAttribute("sessionCart");
        List<Cart> clist = (List<Cart>) session.getAttribute("orderSession"); //order list
        // total purchase cost

        double totalPurchaseCost = 0;
        for (int i = 0; i < clist.size(); i++) {
            Cart item = clist.get(i);
            totalPurchaseCost += item.getEntryPrice() * item.getQuantity();
            if (isLogged) {
                cd.deleteCart(currentUser.getUserID(), item.getScpId()); //delete cart items that checked out
            }
        }

        if (!isLogged) {
            sessionCart.removeIf(cart -> clist.stream().anyMatch(c -> c.getScpId() == cart.getScpId()));  // delete ordered item
        }
        
        if(clist.size() < 1) {
            response.sendRedirect("product");
            return;
        }
        //create order
        int orderId = cd.createOrder(clist, currentUser.getUserID(), total, customer, phone, address, totalPurchaseCost);

        //information to cart completion
        List<Product> plist = hd.getNumberOfProduct(4);

        request.setAttribute("plist", plist); //4 product for decoration
        request.setAttribute("clist", clist); // list of item in order
        request.setAttribute("orderId", orderId);
        request.setAttribute("total", total);
        request.setAttribute("discount", discount);
        request.setAttribute("name", customer);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        
        //session storage after creating order
        session.removeAttribute("orderSession"); // remove order in session
        if (session.getAttribute("account") != null) {
            session.setAttribute("cartInfo", cd.getCartByUserId(currentUser.getUserID()));
        } else {
            session.setAttribute("cartInfo", sessionCart);
        }
        request.getRequestDispatcher("cartCompletion.jsp").forward(request, response);
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

    protected String generateEmailForGuest() {
        String guestString = "GUEST";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
        LocalDateTime now = LocalDateTime.now();
        String dateTimeString = dtf.format(now);
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            sb.append(randomChar);
        }
        String randomString = sb.toString();
        String finalString = guestString + dateTimeString + "@" + randomString;
        return finalString;
    }
}
