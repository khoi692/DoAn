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
 * @author Admin
 */
public class VerifyController extends HttpServlet {

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
        request.getRequestDispatcher("verify.jsp").forward(request, response);
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
        String status = (String) request.getSession().getAttribute("status");
        //get verification code
        String rawCode = "";
        for (int i = 1; i < 7; i++) {
            rawCode += request.getParameter("number" + i);
        }

        String verifyCode = (String) request.getSession().getAttribute("verifyCode");

        UserDAO udb = new UserDAO();
        
        if (status.equals("register")) {
            //get register information from session
           String email = (String) request.getSession().getAttribute("rawuser");

            if (rawCode.equals(verifyCode)) {                
                udb.updateUser(email, true);
                response.sendRedirect("login");
            } else {
                request.setAttribute("msg", "Verification code is not correct. Please try again");
                request.getRequestDispatcher("verify.jsp").forward(request, response);
            }
        }else{
            if(rawCode.equals(verifyCode)){
                response.sendRedirect("resetnewpass");
            }else{
                request.setAttribute("msg", "Verification code is not correct. Please try again");
                request.getRequestDispatcher("verify.jsp").forward(request, response);
            }
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
