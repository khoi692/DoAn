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
import verify.RandomCode;
import verify.SendEmail;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MD5;

/**
 *
 * @author pc
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        //get info from form
        String FullName = request.getParameter("FullName");
        String UserName = request.getParameter("UserName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        boolean genders = request.getParameter("gender").equals("Male");
        String gender = "0";
        if (genders == true) {
            gender = "1";
        }
        String password = request.getParameter("password");

        UserDAO udb = new UserDAO();
        User u = udb.getUserByEmail(email);
        if (u != null) {
            request.setAttribute("error", "Email existed!!");
            doGet(request, response);
            return;
        }
        MD5 md5 = new MD5();
        try {
            new UserDAO().createUser(FullName, phone, address, email, dob, gender, UserName, password, 2, false);
        } catch (ParseException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
//        response.sendRedirect("login");
        request.getSession().setAttribute("rawuser", email);

        //add info to session
//        ArrayList<User> userList = udb.getAllUser();
//        User userI = userList.stream()
//                .filter(user -> user.getEmail().equals(email))
//                .findFirst().orElse(null);
//        if (userI == null) {
//            try {
//                udb.createUser(FullName, phone, address, email, dob, gender, UserName, password, 2, false);
//            } catch (ParseException ex) {
//                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        } else {
////            request.setAttribute("mess", "Account already exists");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
//        request.getSession().setAttribute("rawuser", email);
        //activate 6-digit code
        RandomCode rc = new RandomCode();
        String verifyCode = rc.activateCode();

        //verify user email
        SendEmail se = new SendEmail();
        se.send(email, verifyCode);
        request.getSession().setAttribute("verifyCode", verifyCode);
        request.getSession().setAttribute("status", "register");
        request.getRequestDispatcher("verify.jsp").forward(request, response);
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
