package controller;

import dal.UserCtDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.RetainData;
import utils.VerifyCaptchaUtils;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "resetnewpass", urlPatterns = {"/resetnewpass"})
public class ResetNewPasswordController extends HttpServlet {

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
            out.println("<title>Servlet ResetNewPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetNewPasswordController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("newPassword.jsp").forward(request, response);
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPass = request.getParameter("repassword");

        // create an instance of AccountService
        UserCtDAO dao = new UserCtDAO();

        boolean valid = true;
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);

        // Verify CAPTCHA.
        valid = VerifyCaptchaUtils.verify(gRecaptchaResponse);
        if (!valid) {
            request.setAttribute("errorString", "Captcha invalid");
            RetainData data = new RetainData();
            data.setPassword(password);
            data.setRepassword(confirmPass);
            request.setAttribute("retainData", data);
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            String result = dao.resetPassword(email, password, confirmPass);
            if (result.equals("success")) {
                session.removeAttribute("email");
                response.sendRedirect("login");
            } else {
                request.setAttribute("errorString", result);
                RetainData data = new RetainData();
                data.setPassword(password);
                data.setRepassword(confirmPass);
                request.setAttribute("retainData", data);
                request.getRequestDispatcher("newPassword.jsp").forward(request, response);
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
