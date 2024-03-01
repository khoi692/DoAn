/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Drag
 */
@WebServlet(name = "FeedbackDetail", urlPatterns = "/feedback/detail")
public class FeedbackDetailController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().print(request.getParameter("id"));
//        request.getRequestDispatcher("../feedback_list.jsp").forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws jakarta.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.getWriter().print(request.getParameter("id"));
//        response.getWriter().print(request.getParameter("status"));
        (new FeedbackDAO()).updateStatus(Integer.parseInt(request.getParameter("id")), request.getParameter("status"));
        response.sendRedirect("../feedback");
    }
}
