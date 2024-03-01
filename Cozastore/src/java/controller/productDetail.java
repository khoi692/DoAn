/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Feedback;
import model.Product;
import model.User;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "productDetail", urlPatterns = {"/product-detail"})
public class productDetail extends HttpServlet {

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
            out.println("<title>Servlet productDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productDetail at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDao = new ProductDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        Product product = productDao.getProductById(productId);

        List<Feedback> feedbacks = feedbackDAO.getFeedbackByProductID(productId);

        request.setAttribute("discount", product.getDiscount());
        request.setAttribute("totalQuantity", productDao.getQuantityByProductId(productId));
        request.setAttribute("productSize", productDao.getAllSize());
        request.setAttribute("productName", product.getProductName());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("descibe", product.getDescribe());
        request.setAttribute("productId", product.getProductId());
        request.setAttribute("productGender", product.getCategoryGender());
        request.setAttribute("images", productDao.getProductColorOfProductById(productId));
        request.setAttribute("relatedProduct", productDao.getTop8());

        request.setAttribute("numberFeedback", feedbacks.size());
        request.setAttribute("feedbacks", feedbacks);
        String html = "<form action=\"sendfeedback?id="+productId+"\" method=\"post\" class=\"w-full\" style=\"border-top: 2px solid black\">\n"
                + "\n"
                + "                                            <div class=\"flex-w flex-m p-t-50 p-b-23\">\n"
                + "                                                <span class=\"stext-102 cl3 m-r-16\">\n"
                + "                                                    Your Rating\n"
                + "                                                </span>\n"
                + "\n"
                + "                                                <span class=\"wrap-rating fs-18 cl11 pointer\">\n"
                + "                                                    <i class=\"item-rating pointer zmdi zmdi-star-outline\"></i>\n"
                + "                                                    <i class=\"item-rating pointer zmdi zmdi-star-outline\"></i>\n"
                + "                                                    <i class=\"item-rating pointer zmdi zmdi-star-outline\"></i>\n"
                + "                                                    <i class=\"item-rating pointer zmdi zmdi-star-outline\"></i>\n"
                + "                                                    <i class=\"item-rating pointer zmdi zmdi-star-outline\"></i>\n"
                + "                                                    <input class=\"dis-none\" type=\"number\" name=\"rating\">\n"
                + "                                                </span>\n"
                + "                                            </div>\n"
                + "\n"
                + "                                            <div class=\"row p-b-25\">\n"
                + "                                                <div class=\"col-12 p-b-5\">\n"
                + "                                                    <label class=\"stext-102 cl3\" for=\"review\">Your review</label>\n"
                + "                                                    <textarea class=\"size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10\" id=\"review\" name=\"review\"></textarea>\n"
                + "                                                </div>\n"
                + "                                            </div>\n"
                + "\n"
                + "                                            <button type=\"submit\" class=\"flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10\">\n"
                + "                                                Submit\n"
                + "                                            </button>\n"
                + "                                        </form>";
        if (user == null) {
            request.setAttribute("html", "");
        } else {
            request.setAttribute("html", html);
        }
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
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
