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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.MD5;
import model.User;
import utils.VerifyCaptchaUtils;

/**
 *
 * @author pc
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet responsesw22
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("passWord");

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
        boolean valid = true;
        // Verify CAPTCHA.
        valid = VerifyCaptchaUtils.verify(gRecaptchaResponse);

        // Check if CAPTCHA is not valid
        if (!valid) {
            request.setAttribute("mess", "Please verify the CAPTCHA!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return; // Stop processing further if CAPTCHA is invalid.
        }
        
        UserDAO udao = new UserDAO();
        MD5 md5 = new MD5();
        ArrayList<User> userList = udao.getAllUser();
        User userI = userList.stream()
                .filter(user -> user.getEmail().equals(email)
                //                && user.isStatus() == true
                && user.getPassWord().equals(md5.getMd5(password)))
                .findFirst().orElse(null);

//        if (userI != null) {
//            switch (userI.getRoleID()) {
//                case 1:
//                    session.setAttribute("account", userI);
//                    response.sendRedirect("admin");
//                    break;
//                case 2:
//                    session.setAttribute("account", userI);
//                    response.sendRedirect("home");
//                    break;
//                case 3:
//                    session.setAttribute("account", userI);
//                    response.sendRedirect("marketing");
//                    break;
//                case 4:
//                    session.setAttribute("account", userI);
//                    response.sendRedirect("sale-dashboard");
//                    break;
//            }
//        } else {
//            request.getSession().setAttribute("account", null);
//            request.setAttribute("mess", "Email or password wrong!");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
        if (userI != null) {
            if (userI.isStatus()) {
                switch (userI.getRoleID()) {
                    case 1:
                        session.setAttribute("account", userI);
                        response.sendRedirect("admin");
                        break;
                    case 2:
                        session.setAttribute("account", userI);
                        response.sendRedirect("home");
                        break;
                    case 3:
                        session.setAttribute("account", userI);
                        response.sendRedirect("marketing");
                        break;
                    case 4:
                        session.setAttribute("account", userI);
                        response.sendRedirect("sale-dashboard");
                        break;
                }
            } else {
                request.getSession().setAttribute("account", null);
                request.setAttribute("mess", "Account has been temporarily locked!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.getSession().setAttribute("account", null);
            request.setAttribute("mess", "Email or password wrong!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
