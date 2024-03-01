/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.MD5;
import model.Role;
import model.User;

/**
 *
 * @author pc
 */
public class CreateAccountController extends HttpServlet {

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
        RoleDAO a = new RoleDAO();
        List<Role> allRole = a.getAllRole();
        List<Role> list = allRole.stream().filter((t) -> t.getRoleId() == 3 || t.getRoleId() == 4).collect(Collectors.toList());
        request.setAttribute("roles", list);
        request.getRequestDispatcher("Admin/createAccountAdmin.jsp").forward(request, response);
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
        int roleID = Integer.parseInt(request.getParameter("roles"));
        String fullname = request.getParameter("FullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        boolean genders = request.getParameter("gender").equals("Male");
        String gender = "0";
        if (genders == true) {
            gender = "1";
        }
        String rawPassword = request.getParameter("password");
        UserDAO udo = new UserDAO();
        User u = udo.getUserByEmail(email);
        if (u != null) {
            request.setAttribute("error", "Email existed!!");
            processRequest(request, response);
            return;
        }
        MD5 md5 = new MD5();
        String password = md5.getMd5(rawPassword);
        new UserDAO().createAccount(fullname, phone, email, address, gender, password, roleID);
        response.sendRedirect("userList");

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
