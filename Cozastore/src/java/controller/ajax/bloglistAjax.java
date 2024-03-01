/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.BlogDAO;
import dal.HomeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Product;

/**
 *
 * @author pc
 */
@WebServlet(name = "bloglistAjax", urlPatterns = {"/bloglistAjax"})
public class bloglistAjax extends HttpServlet {

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
            out.println("<title>Servlet bloglistAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bloglistAjax at " + request.getContextPath() + "</h1>");
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
        BlogDAO bd = new BlogDAO();
        int current_page = Integer.parseInt(request.getParameter("page"));
        int cateId = Integer.parseInt(request.getParameter("cateId"));
        String orderby = request.getParameter("orderby");
        String search = request.getParameter("search");
        List<Blog> blist = bd.getQueryBlog(current_page, cateId, orderby, search); // this function need to be replaced 
        PrintWriter out = response.getWriter();
        /*
            Print out neccessary data
         */
        int query_row = bd.queryBlog_row;
        out.println("<p id='blog-row' style=\"display:none;\">" + query_row + "</p>");
        out.println("<p id='cate-name-response' style=\"display:none;\">" + bd.getBlogCateById(cateId) + "</p>");
        out.println("<p id='orderby-response' style=\"display:none;\">" + orderby + "</p>");
        out.println("<p id='search-response' style=\"display:none;\">" + search + "</p>");
        /* =============Pagination================= */
        int page_qty = (query_row + 4) / 5; //number of divided pages , +4 to round up the result ex: 5.2 will be 6
        out.println("<div class=\"flex-l-m flex-w w-full p-t-10 m-lr--7\">");
        for (int i = 1; i <= page_qty; i++) {
            out.println("<button value=\"" + i + "\" id='page-number-" + i + "' onclick='showQueryBlog(document.getElementById(\"page-number-" + i + "\").value,document.getElementById(\"cateid-select\").value, document.getElementById(\"order-by-select\").value, document.getElementById(\"inputField-search\").value)' class=\"flex-c-m how-pagination1 trans-04 m-all-7\">\n"
                    + "                                " + i + "\n"
                    + "                            </button>");
        }
        out.println("</div>");

        /*
        error message print 
         */
        if (query_row == 0) {
            out.println("<!-- message out put -->\n"
                    + "                        <div  id='message-input' class=\"row\">\n"
                    + "                            <img class=\"col-7 col-xl-6\" src=\"images/blog_thumbnail/err_message.jpg\">\n"
                    + "                            <p class=\"col-5 col-xl-6 mtext-110 p-b-5\">Coza can't find any results with your inputs ! Let try other inputs<p>\n"
                    + "                        </div>\n"
                    + "                        <!-- message out put -->");
        }
        /*=================================*/
 /* print out blog list
            =================================
         */
        String[] months = {"", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date date = null;
        Calendar calendar = Calendar.getInstance();
        for (int i = 0; i < blist.size(); i++) {
            Blog item = blist.get(i);
            String dateString = item.getTime();
            try {
                date = format.parse(dateString); //parse String to date
            } catch (ParseException ex) {
                Logger.getLogger(bloglistAjax.class.getName()).log(Level.SEVERE, null, ex);
            }
            calendar.setTime(date);
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH) + 1;
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            out.println("<div class=\"flex-w flex-sb-m p-t-18\">\n"
                    + "            <span class=\"flex-w flex-m stext-111 cl2 p-r-30 m-tb-10\">\n"
                    + "                <!-- author -->\n"
                    + "                <span>\n"
                    + "                    <span class=\"cl4\">By</span> " + item.getAuthor() + " \n"
                    + "                    <span class=\"cl12 m-l-4 m-r-6\">|</span>\n"
                    + "                </span>\n"
                    + "                <!-- tags -->\n"
                    + "                <span>\n"
                    + "                   " + item.getTag() + "\n"
                    + "                    <span class=\"cl12 m-l-4 m-r-6\">|</span>\n"
                    + "                </span>\n"
                    + "            </span>\n"
                    + "        </div>\n"
                    + "        <a class=\"blog-item-link m-b-50 row\" href=\"/cozastore/blog/detail?id="+ item.getBlogId() +"\"class=\"p-b-63\">\n"
                    + "            <div class=\"col-12 col-xl-6 image-bound-blog-thumbnail p-0 hov-img0 how-pos5-parent\">\n"
                    + "                <img src=\"" + item.getThumbnail() + "\" alt=\"IMG-BLOG\">\n"
                    + "                <div class=\"flex-col-c-m size-123 bg9 how-pos5\">\n"
                    + "                    <span class=\"ltext-107 cl2 txt-center\">\n"
                    + "                        " + day + "\n"
                    + "                    </span>\n"
                    + "                    <span class=\"stext-109 cl3 txt-center\">\n"
                    + "                        " + months[month] + " " + year + "\n"
                    + "                    </span>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "\n"
                    + "            <div class=\"col-12 col-xl-6 p-t-32 p-l-32\">\n"
                    + "                <h4 class=\"p-b-15\">\n"
                    + "                    <div href=\"blog-detail.html\" class=\"ltext-108 cl2 hov-cl1 trans-04\">\n"
                    + "                        " + item.getTitle() + "\n"
                    + "                    </div>\n"
                    + "                </h4>\n"
                    + "                <p class=\"stext-117 cl6\">\n"
                    + "                    " + item.getSummary() + "\n"
                    + "                </p>\n"
                    + "            </div>\n"
                    + "        </a>");
        }
        /* 
       ==================================
         */
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
