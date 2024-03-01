/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author kienb
 */
public class getUserByIDController extends HttpServlet {

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
            String id = request.getParameter("id");
            UserDAO udo = new UserDAO();
            User u = udo.getUserById(id);
            out.println("                            <div class=\"row\">\n"
                    + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label class=\"control-label\">Name</label>\n"
                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"masp\" value=\"" + u.getName() + "\" >\n"
                    + "                                </div>\n"
                    + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label class=\"control-label\">DOB</label>\n"
                    + "                                    <input disabled class=\"form-control\" type=\"text\" required name=\"tensp\" value=\"" + u.getDob() + "\" >\n"
                    + "                                </div>\n"
                    + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label class=\"control-label\">Phone</label>\n"
                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"giasp\" value=\"" + u.getPhone() + "\" >\n"
                    + "                                </div>\n"
                    + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label class=\"control-label\">Address</label>\n"
                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"quantity\" value=\"" + u.getAddress() + "\" >\n"
                    + "                                </div>\n"
                    + "                                <div class=\"form-group col-md-6\">\n"
                    + "                                    <label class=\"control-label\">Email</label>\n"
                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"discountsp\" value=\"" + u.getEmail() + "\" >\n"
                    + "                                </div>\n"
//                    + "                                <div class=\"form-group col-md-6\">\n"
//                    + "                                    <label class=\"control-label\">Message</label>\n"
//                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"discountsp\" value=\"" + u.getMessage() + "\" >\n"
//                    + "                                </div>\n"
//                    + "                                <div class=\"form-group col-md-6\">\n"
//                    + "                                    <label class=\"control-label\">Time</label>\n"
//                    + "                                    <input disabled class=\"form-control\" type=\"text\" name=\"discountsp\" value=\"" + u.getTime() + "\" >\n"
//                    + "                                </div>\n"
                    + "<a class=\"btn btn-cancel\" data-dismiss=\"modal\" href=\"#\">Close</a>");
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
