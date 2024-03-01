/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Voucher;

/**
 *
 * @author pc
 */
@WebServlet(name = "voucherManagement", urlPatterns = {"/voucherManagement"})
public class voucherManagement extends HttpServlet {

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
            out.println("<title>Servlet voucherManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet voucherManagement at " + request.getContextPath() + "</h1>");
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
        VoucherDAO vd = new VoucherDAO();
        //page : for pagination
        //type : for type (COMMON / COZA)
        // start_voucher : for starrt date of that voucher 
        // end_voucher : for end date of that voucher
        // quantity : quantity of that voucher left 
        // status : out of date , on waiting , on going // default status : 10
        // orderby : 1 : asc / -1 : desc
        if (request.getParameter("direct") != null) {
            String page = request.getParameter("direct");
            if (page.equals("voucher-detail")) { //go to detail
                String code = request.getParameter("code");
                Voucher item = vd.getVoucher(code);
                request.setAttribute("item", item);
                request.getRequestDispatcher("voucher-detail.jsp").forward(request, response);
                return; // return so that there only one dispatcher
            }
            if (page.equals("voucher-add-new")) { //go create
                request.getRequestDispatcher("voucher-add-new.jsp").forward(request, response);
                return; // return so that there only one dispatcher
            }
            if (page.equals("voucher-delete")) { //go delete
                String code = request.getParameter("code");
                vd.deleteVoucher(code);
                request.getRequestDispatcher("voucher-list.jsp").forward(request, response);
                return; // return so that there only one dispatcher
            }
        }
        vd.getVoucherList(1, 20, "", "quantity", -1, 10);
        request.setAttribute("rows", vd.getQueryVoucher_row());
//        PrintWriter out = response.getWriter();
//        out.println(vlist);
        //go to voicher detail 
        request.getRequestDispatcher("voucher-list.jsp").forward(request, response);
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
        VoucherDAO vd = new VoucherDAO();
        if (request.getParameter("method").equals("modify")) {
            String code = request.getParameter("code");
            String new_code = request.getParameter("new_code");
            String describe = request.getParameter("describe");
            double discount = Double.parseDouble(request.getParameter("discount"));
            //double min = Double.parseDouble(request.getParameter("min"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            try {
                vd.updateVoucher(code, new_code, quantity, describe, start, end, discount);
                //test
//            PrintWriter out = response.getWriter();
//            out.println("code:"+ code +"\n");
//            out.println("describe:"+ describe +"\n");
//            out.println("discount:"+ discount +"\n");
//            out.println("min:"+ min +"\n");
//            out.println("start:"+ start +"\n");
//            out.println("end:"+ end +"\n");
//            out.println("quantity:"+ quantity+"\n");
//            test
                response.sendRedirect("voucherManagement?direct=voucher-detail&code=" + new_code);
                return;
            } catch (ParseException ex) {
                Logger.getLogger(voucherManagement.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("method").equals("create")) { //finish up create
            String[] code = request.getParameterValues("code");
            String describe = request.getParameter("describe");
            double discount = Double.parseDouble(request.getParameter("discount"));
            //double min = Double.parseDouble(request.getParameter("min"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String start = request.getParameter("start");
            String end = request.getParameter("end");
//
//            PrintWriter out = response.getWriter();
//            out.println(Arrays.toString(code));
            try {
                vd.createVoucher(code, quantity, describe, start, end, discount);
            } catch (ParseException | SQLException ex) {
                Logger.getLogger(voucherManagement.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("voucherManagement");
        }
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
