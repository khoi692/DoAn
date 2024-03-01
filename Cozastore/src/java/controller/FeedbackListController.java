/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Drag
 */
@WebServlet(name = "FeedbackList", urlPatterns = {"/feedback"})
public class FeedbackListController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> plist = (new ProductDAO()).getName();
        ArrayList<String> clist = (new UserDAO()).getName();
        Collections.sort(clist);
        Collections.sort(plist);
        request.getSession().setAttribute("plist", plist);
        request.getSession().setAttribute("clist", clist);
        request.getSession().setAttribute("flist", (new FeedbackDAO()).getAll());
        request.getRequestDispatcher("feedback_list.jsp").forward(request, response);
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

    }
}
