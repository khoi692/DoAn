/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.ActionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Action;

/**
 *
 * @author Drag
 */
@WebServlet(name = "History", urlPatterns = "/admin/history")
public class HistoryController extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActionDAO a = new ActionDAO();
        ArrayList<Action> alist = a.getAll();
        request.getSession().setAttribute("actionlist", a.getActionNames());
        request.getSession().setAttribute("objectlist", a.getObjectNames());
        request.getSession().setAttribute("alist", alist);
        request.getRequestDispatcher("../history_of_change.jsp").forward(request, response);
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
