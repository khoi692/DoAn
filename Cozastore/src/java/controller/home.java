/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import model.Blog;
import model.Product;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name = "home", urlPatterns = {"/home"})
public class home extends HttpServlet {

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
            out.println("<title>Servlet home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet home at " + request.getContextPath() + "</h1>");
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
        /*
        TEST section !!!! delete whenever you like
        */
        //User test = new User(10, "Pro gamer"," male", "26-3-2003", "0904431642", "Bac Giang", "garenaobamazz@gmail.com", "Than Quang Phuong" , "12345", 2, true );
        //HttpSession session=request.getSession();
        //session.setAttribute("account", test);
        /*
        ====================================================
        */
        HomeDAO hd = new HomeDAO();
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int year = localDate.getYear(); //get corrent year
        int month = localDate.getMonthValue(); //get current date
        int start = 1;
        int end = 4;
        String season = "SPRING";
        if (month >= 1 && month < 4) {
            season = "SPRING";
            start = 1;
            end = 4;
        }
        if (month >= 4 && month < 7) {
            season = "SUMMER";
            start = 4;
            end = 7;
        }
        if (month >= 7 && month < 10) {
            season = "AUTUMN";
            start = 7;
            end = 10;
        }
        if (month >= 10 && month < 12) {
            season = "WINTER";
            start = 10;
            end = 12;
        }
        List<Blog> blist = hd.getNumberOfBlog(3);
        List<Product> discountlist = hd.getNumberOfProductTopDiscount(6);
        List<Product> slist = hd.GetSeasonTopProduct(4, year, start, end); //product for season top banner
        List<Product> ylist = hd.GetSeasonTopProduct(4, year);  //product for year top banner
        if (slist.size() < 4) { // if there is not enough data yet , get data of previous year
            slist.addAll(hd.GetSeasonTopProduct(4 - slist.size(), year - 1, start, end));
            if (slist.size() < 4) {
                slist = hd.getNumberOfProduct(4);
            }
        }
        if (ylist.size() < 4) { // if there is not enough data yet , get data of previous year
            ylist.addAll(hd.GetSeasonTopProduct(4 - ylist.size(), year - 1));
            if (ylist.size() < 4) {
                ylist = hd.getNumberOfProduct(4);
            }
        }
        List<Product> plist = hd.getNumberOfProduct(16);  //product for new product overview
        List<Product> manlist = hd.getNumberOfProductByGender(16, "man"); //product for men product overview
        List<Product> womenlist = hd.getNumberOfProductByGender(16, "women"); //product for women product overview
        List<Product> unisexlist = hd.getNumberOfProductByGender(16, "unisex"); //product for unisex product overview
        request.setAttribute("slist", slist);
        request.setAttribute("blist", blist);
        request.setAttribute("ylist", ylist);
        request.setAttribute("discountlist", discountlist);
        request.setAttribute("plist", plist);
        request.setAttribute("manlist", manlist);
        request.setAttribute("womenlist", womenlist);
        request.setAttribute("unisexlist", unisexlist);
        request.setAttribute("season", season);
        request.setAttribute("year", year);
        
        //session cart
        CartDAO cd = new CartDAO();
        HttpSession session = request.getSession();
        if(session.getAttribute("account") != null){
            User currentUser = (User) session.getAttribute("account");
            session.setAttribute("cartInfo", cd.getCartByUserId(currentUser.getUserID()));
        }
        else if(session.getAttribute("sessionCart") != null){
            session.setAttribute("cartInfo", session.getAttribute("sessionCart"));
        }
        else session.setAttribute("cartInfo", null);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        HomeDAO hd = new HomeDAO();
        PrintWriter out = response.getWriter();
        String key = request.getParameter("key");
        List<Product> splist = hd.getProductListByKey(4, key);
        if (splist.isEmpty()) {
            out.println("<!-- message out put -->\n"
                    + "                        <div  id='message-input' class=\"row\">\n"
                    + "                            <img class=\"col-12\" src=\"images/blog_thumbnail/err_message.jpg\">\n"
                    + "                        </div>\n"
                    + "                        <!-- message out put -->");
            return;
        }
        for (int i = 0; i < splist.size(); i++) {
            Product item = splist.get(i);
            double discount = item.getDiscount();
            double newprice = item.getPrice() * (100 - discount) / 100;
            newprice = Math.round(newprice * 100) / 100.0;
            out.println("<a style=\"text-decoration: none\" href=\"product-detail?id=" + item.getProductId() + "\" class=\"search-result-item col-12 p-b-35 isotope-item\">\n"
                    + "            <!-- Block2 -->\n"
                    + "            <div class=\"block2 row\">\n"
                    + "                <div class=\"block2-pic hov-img0 col-3\">\n"
                    + "                    <img src=\"" + item.getProductImageDefault() + "\" alt=\"IMG-PRODUCT\">\n"
                    + "                </div>\n"
                    + "                <div class=\"block2-txt flex-w flex-t p-t-14 col-9\">\n"
                    + "                    <div class=\"block2-txt-child1 flex-col-l \">\n"
                    + "                        <div href=\"product-detail.html\" class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\n"
                    + "                            " + item.getProductName() + "\n"
                    + "                        </div>\n"
                    + "                        <div>\n"
                    + "                            <span class=\"stext-105 cl3 newprice\">\n"
                    + "                               $" + newprice + "\n"
                    + "                            </span>\n");
            if (discount != 0) {
                out.println("<span class=\"stext-105 cl3 price\">$" + item.getPrice() + "</span>\n");
            }
            out.println(""
                    + "                        </div>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </a>\n"
            );
        }
        out.println("<a id=\"search-view-more\" style=\"justify-content: center; padding: 20px\" href=\"product\" class=\"nav-link\">VIEW MORE</a>");
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
