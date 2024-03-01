/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "testDeleteFolder", urlPatterns = {"/delete-product"})
public class deleteProduct extends HttpServlet {

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
            out.println("<title>Servlet testDeleteFolder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet testDeleteFolder at " + request.getContextPath() + "</h1>");
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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            productDAO.deleteProductById(id);

            String duongDanThuMuc = "/images/product/" + id; 


            File thuMuc = new File(getServletContext().getRealPath(duongDanThuMuc));

            if (thuMuc.exists() && thuMuc.isDirectory()) {
                if (xoaThuMuc(thuMuc)) {
                    request.setAttribute("success", "d-block");
                    request.getRequestDispatcher("table-product").forward(request, response);
                } else {
                    request.setAttribute("error", "d-block");
                    request.getRequestDispatcher("table-product").forward(request, response);
                }
            } else {
                request.setAttribute("error", "d-block");
                request.getRequestDispatcher("table-product").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("warning", "d-block");
            request.getRequestDispatcher("table-product").forward(request, response);
        }

//        ServletContext context = getServletContext();
//        String duongDanThuMuc = "/images/product/" + id; 
//        String tenTapTin = "5.png";
//
//        String realPath = context.getRealPath(duongDanThuMuc);
//
//        File thuMuc = new File(getServletContext().getRealPath(duongDanThuMuc));
//
////        if (thuMuc.exists() && thuMuc.isDirectory()) {
////            if (xoaThuMuc(thuMuc)) {
////                response.getWriter().println("1.");
////            } else {
////                response.getWriter().println("2.");
////            }
////        } else {
////            response.getWriter().println("3i.");
////        }
//        // xoa tap tin
//        File tapTin = new File(thuMuc, tenTapTin);
//        if (tapTin.exists()) {
//            if (tapTin.delete()) {
//                response.getWriter().println("1");
//            } else {
//                response.getWriter().println("2");
//            }
//        } else {
//            response.getWriter().println("3");
//        }
    }

    private boolean xoaThuMuc(File thuMuc) {
        File[] danhSachTapTin = thuMuc.listFiles();
        if (danhSachTapTin != null) {
            for (File tapTin : danhSachTapTin) {
                if (tapTin.isDirectory()) {
                    xoaThuMuc(tapTin);
                } else {
                    tapTin.delete();
                }
            }
        }
        return thuMuc.delete();
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
