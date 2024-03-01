/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Voucher;

/**
 *
 * @author pc
 */
@WebServlet(name = "VoucherAjax", urlPatterns = {"/VoucherAjax"})
public class VoucherAjax extends HttpServlet {

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
            out.println("<title>Servlet VoucherAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherAjax at " + request.getContextPath() + "</h1>");
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
        // delete voucher
        if(request.getParameter("delete") != null){
            vd.deleteVoucher(request.getParameter("code"));
        }
        // delete all unavailable voucher
        if(request.getParameter("deleteAllUnavail") != null){
            vd.deleteAllUnavailable();
        }
        // input
        String attr = "quantity";
        int orderby = -1;
        int page = 1;
        int numPerPage = 20;
        int status = 10; //all
        String type = "";
        //
        if (request.getParameter("attr") != null) {
            attr = request.getParameter("attr");
            orderby = Integer.parseInt(request.getParameter("orderby"));
        }
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        if (request.getParameter("numPerPage") != null) {
            numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
        }
        if (request.getParameter("status") != null) {
            status = Integer.parseInt(request.getParameter("status"));
        }
        if (request.getParameter("type") != null) {
            type = request.getParameter("type");
        }
        List<Voucher> vlist = vd.getVoucherList(page, numPerPage, type, attr, orderby, status);
        PrintWriter out = response.getWriter();
        out.println("<input id=\"query-row\" style=\"display:none\" value=" + vd.getQueryVoucher_row() + ">");
        out.println("<input id=\"current-page\" style=\"display:none\" value=" + page + ">");
        for (int i = 0; i < vlist.size(); i++) {
            Voucher item = vlist.get(i);
            int stt = item.getStatus();
            String sttName = "";
            if (stt == 1) {
                out.println("<tr class=\"table-success\">");
                sttName = "Available";
            }
            if (stt == 0) {
                out.println("<tr class=\"table-warning\">");
                sttName = "Future";
            }
            if (stt == -1) {
                out.println("<tr class=\"table-danger\">");
                sttName = "Expired";
            }
            if (stt == -2) {
                out.println("<tr class=\"table-danger\">");
                sttName = "Used up";
            }
            out.println("<td>" + (i + 1 + (page - 1) * numPerPage) + "</td>\n"
                    + "<td>" + item.getCode() + "</td>\n"
                    + "<td>" + item.getQuantity() + "</td>\n"
                    + "<td>" + item.getDescribe() + "</td>\n"
                    + "<td>$" + item.getDiscount() + "</td>\n"
                    + "<td>" + sttName + "</td>\n"
                    + "<td>"
                    + "<a href=\"voucherManagement?direct=voucher-detail&code=" + item.getCode() + "\"><i class=\"bi bi-info-circle-fill\"></i></a>"
                    + "<button class=\"btn\" onClick=(deleteVoucher(\""+item.getCode()+"\")) style=\"padding-left: 10px;\"><i class=\"bi bi-trash3\"></i></button>"
                    + "</td>\n"
                    + "</tr>");
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
