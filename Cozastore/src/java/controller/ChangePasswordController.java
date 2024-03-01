/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserCtDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.RetainData;
import utils.VerifyCaptchaUtils;

public class ChangePasswordController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String curPass = request.getParameter("current-password");
            String newPass = request.getParameter("new-password");
            String confirmPass = request.getParameter("confirm-password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
            boolean valid = true;
            // Verify CAPTCHA.
            valid = VerifyCaptchaUtils.verify(gRecaptchaResponse);

            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("user");
            User user = (User) session.getAttribute("account");


            UserCtDAO dao = new UserCtDAO();
            String errorMessage = dao.validateChangePassword(curPass, newPass, confirmPass, valid, user);

            if (errorMessage != null) {
                RetainData data = new RetainData();
                data.setPassword(curPass);
                data.setNewPassword(newPass);
                data.setRepassword(confirmPass);
                request.setAttribute("retainData", data);
                request.setAttribute("error", errorMessage);
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else {
                dao.changePassword(newPass, user.getUserID());
//                dao.changePassword(newPass, 2);
                response.sendRedirect("logout");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
