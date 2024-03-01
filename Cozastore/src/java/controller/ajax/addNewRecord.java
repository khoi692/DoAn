/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "addNewRecord", urlPatterns = {"/addnewrecord"})
public class addNewRecord extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        ProductDAO productDAO = new ProductDAO();
        List<String> colors = productDAO.getAllColor();
        List<String> sizes = productDAO.getAllSize();
        out.println("<div class=\"row record\">\n"
                + "                                                <!-- color form -->\n"
                + "                                                <div class=\"col-md-3\">\n"
                + "                                                    <div class=\"scp-tittle\">\n"
                + "                                                        Color\n"
                + "                                                    </div>\n"
                + "                                                    <div class=\"scp-detail\">\n"
                + "                                                        <div class=\"form-group\" id=\"color\">\n"
                + "                                                            <select class=\"select2-single-placeholder form-control select2SinglePlaceholder color\" onchange=\"changeValueDefault(this)\" name=\"color\" >\n");
        for (int i = 0; i < colors.size(); i++) {
            String color = colors.get(i);
            out.println("<option value=\"" + color + "\" >" + color + "</option>");
        }
        out.println("</select>\n"
                + "                                                            <div class=\"more-color\">\n"
                + "                                                                <input type=\"text\" class=\"input-color\" placeholder=\"New color\"/>\n"
                + "                                                                <button onclick=\"color(this)\" class=\"btn-sm btn-primary pointer add-color \">\n"
                + "                                                                    <i class=\"fas fa-plus icon-plus\"></i>\n"
                + "                                                                </button>\n"
                + "                                                            </div>\n"
                + "                                                        </div>\n"
                + "                                                    </div>\n"
                + "                                                </div>\n"
                + "                                                <!-- size form -->\n"
                + "                                                <div class=\"col-md-4\">\n"
                + "                                                    <div class=\"scp-tittle\">\n"
                + "                                                        Size\n"
                + "                                                    </div>\n"
                + "                                                    <div class=\"size-input\">");
        for (int i = 0; i < sizes.size(); i++) {
            String size = sizes.get(i);
            out.println("<div class=\"size-input-detail\">\n"
                    + "                                                                <div>\n"
                    + "                                                                    <input onchange=\"log(this)\" name=\"size\" checked class=\"checkbox\" type=\"checkbox\" value=\"" + size + "\"/><span class=\"size-title\">" + size + "</span>\n"
                    + "                                                                </div>\n"
                    + "                                                                <input type=\"text\" class=\"border1 slide2 input-quantity\" pattern=\"[0-9]+\" \n"
                    + "                                                                       required placeholder=\"Enter quantity\" \n"
                    + "                                                                       title=\"Quantity must be natural number.\" \n"
                    + "                                                                       id=\"numberInput\" name=\"quantity\" />\n"
                    + "                                                            </div>");
        }
        out.println("</div>\n"
                + "                                                        </div>\n"
                + "\n"
                + "                                                        <div class=\"col-md-5\">\n"
                + "                                                             <div class=\"img-default\">\n"
                + "                                                                 <input onchange=\"checkedImage(this)\" type=\"checkbox\"\n"
                + "                                                                   name=\"defaultImage\"  class=\"checkedImage\" }/><span style=\"margin-left: 6px;\">Default Image</span>\n"
                + "                                                             </div>"
                + "                                                            <div class=\"image\">\n"
                + "                                                                <input type=\"file\" name=\"image\" class=\"file-input\" accept=\"image/*\" hidden>\n"
                + "                                                                <div class=\"img-area\" data-img=\"\">\n"
                + "                                                                    <i class=\"fas fa-cloud-upload-alt icon\"></i>\n"
                + "                                                                    <h3>Upload Image</h3>\n"
                + "                                                                </div>\n"
                + "                                                            </div>\n"
                + "                                                        </div>\n"
                + "                                                        <div class=\"close-btn\" onclick=\"deleteRecord(this)\">\n"
                + "                                                            <ion-icon name=\"close-outline\"></ion-icon>\n"
                + "                                                        </div>\n"
                + "                                                    </div>");
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
        processRequest(request, response);
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
