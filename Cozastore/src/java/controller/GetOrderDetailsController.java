/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PurchaseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Purchase;

/**
 *
 * @author khois
 */
@WebServlet(name = "GetOrderDetailsController", urlPatterns = {"/getorderdetails"})
public class GetOrderDetailsController extends HttpServlet {

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
            String id_raw = request.getParameter("id");
            PurchaseDAO udo = new PurchaseDAO();
            int id;
            try {
                id = Integer.parseInt(id_raw);
                Purchase u = udo.getOrderById(id);
                LocalDateTime localDateTime = u.getOrderTime();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String formattedDateTime = localDateTime.format(formatter);
                out.println("                              <div class=\"container mt-5 mb-5\">\n"
                        + "            <div class=\"row d-flex justify-content-center\">\n"
                        + "                <div class=\"col-md-8\">\n"
                        + "                    <div class=\"card\">\n"
                        + "                        <div class=\"text-left logo p-2 px-5\" style=\"background-color: #E0E0E0\"> <img src=\"images/icons/pin.png\"> </div>\n"
                        + "                        <div class=\"invoice p-5\">\n"
                        + "                            <c:set value=\"${requestScope.oddetail}\" var=\"odd\"/>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 1}\">\n"
                        + "                                <h5>Your order is Successful!</h5>\n"
                        + "                                <span class=\"font-weight-bold d-block mt-4\">Hello, ${sessionScope.account.name}</span> \n"
                        + "                                <span>Your order has been Successful, please give us your feedback. Thank you for your support!</span>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 2}\">\n"
                        + "                                <h5>Your order is Unsuccessful!</h5>\n"
                        + "                                <span class=\"font-weight-bold d-block mt-4\">Hello, ${sessionScope.account.name}</span> \n"
                        + "                                <span>Your order has been Cancel successfully, sorry about this bad experience. Thank you for your support!</span>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 3}\">\n"
                        + "                                <h5>Your order is Pending!</h5>\n"
                        + "                                <span class=\"font-weight-bold d-block mt-4\">Hello, ${sessionScope.account.name}</span> \n"
                        + "                                <span>Your order has been pending. Thank you for your support!</span>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 4}\">\n"
                        + "                                <h5>Your order is in preparing!</h5>\n"
                        + "                                <span class=\"font-weight-bold d-block mt-4\">Hello, ${sessionScope.account.name}</span> \n"
                        + "                                <span>Your order has been preparing, it will be in transit soon. Thank you for your support!</span>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 5}\">\n"
                        + "                                <h5>Your order is In transit!</h5>\n"
                        + "                                <span class=\"font-weight-bold d-block mt-4\">Hello, ${sessionScope.account.name}</span> \n"
                        + "                                <span>Your order has been In transit and will be completed in a few days. Thank you for your support!</span>\n"
                        + "                            </c:if>\n"
                        + "                            <div class=\"payment border-top mt-3 mb-3 border-bottom table-responsive\">\n"
                        + "                                <table class=\"table table-borderless\">\n"
                        + "                                    <tbody>\n"
                        + "                                        <tr>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Order Date</span><span>${requestScope.date}</span> </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Order No</span> <span>${odd.orderId}</span> </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Payment</span> <span><img src=\"https://th.bing.com/th/id/R.4fb60217bc8a511de45849d7b0e4a219?rik=Hwqz6YfN1jX%2bkA&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fcash-icon-transparent%2fcash-icon-transparent-3.png&ehk=2IxKNkG7wpMQvepk15C8oRc3RkiXoxCbLo9ey8Kc1Ok%3d&risl=&pid=ImgRaw&r=0\" width=\"20\" /></span> </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Shipping Address</span> <span>${odd.address}</span> </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Receiver</span> <span>${odd.cusName}</span> </div>\n"
                        + "                                            </td>\n"
                        + "                                            <td>\n"
                        + "                                                <div class=\"py-2\"> <span class=\"d-block text-muted\">Phone Number</span> <span>${odd.phone}</span> </div>\n"
                        + "                                            </td>\n"
                        + "                                        </tr>\n"
                        + "                                    </tbody>\n"
                        + "                                </table>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"product border-bottom table-responsive\">\n"
                        + "                                <table class=\"table table-borderless\">\n"
                        + "                                    <tbody>\n"
                        + "                                        <c:forEach items=\"${requestScope.oddt}\" var=\"o\">\n"
                        + "                                            <tr style=\"border-bottom: solid; color: #8181812e;\" onclick=\"redirectToPDPage('${o.productId}')\">\n"
                        + "                                                <td width=\"20%\"> <img src=\"${o.image}\" width=\"90\"> </td>\n"
                        + "                                                <td width=\"60%\"> <span class=\"font-weight-bold\" style=\"color: black\">${o.productName}</span>\n"
                        + "                                                    <div class=\"product-qty\"> <span class=\"d-block\" style=\"color: #909090\">Quantity: ${o.quantity}</span> <span style=\"color: #909090\">Color: ${o.color}</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                                <td width=\"20%\">\n"
                        + "                                                    <div class=\"text-right\"> <span class=\"font-weight-bold\" style=\"color: black\">$${o.price}</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>\n"
                        + "                                        </c:forEach>\n"
                        + "                                    </tbody>\n"
                        + "                                </table>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"row d-flex justify-content-end\">\n"
                        + "                                <div class=\"col-md-5\">\n"
                        + "                                    <table class=\"table table-borderless\">\n"
                        + "                                        <tbody class=\"totals\">\n"
                        + "                                            <tr>\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-left\"> <span class=\"text-muted\">Subtotal</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-right\"> <span>$${odd.total}</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>\n"
                        + "                                            <tr>\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-left\"> <span class=\"text-muted\">Discount</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-right\"> <span class=\"text-danger\">None</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>\n"
                        + "                                            <tr class=\"border-top border-bottom\">\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-left\"> <span class=\"font-weight-bold\">Total</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                                <td>\n"
                        + "                                                    <div class=\"text-right\"> <span class=\"font-weight-bold\">$${odd.total}</span> </div>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>\n"
                        + "                                        </tbody>\n"
                        + "                                    </table>\n"
                        + "                                </div>\n"
                        + "                            </div>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 1}\">\n"
                        + "                                <button onclick=\"redirectToPage()\" class=\"button-89\" role=\"button\" style=\"float: right\">Return to Product page</button>\n"
                        + "                                <div class=\"container d-flex mt-5\">\n"
                        + "                                    <div class=\"row\">\n"
                        + "                                        <div class=\"col-md-12\">\n"
                        + "                                            <div class=\"stars\">\n"
                        + "                                                <form action=\"orderdetails\" method=\"post\">\n"
                        + "                                                    Leave Your Feedback <textarea rows=\"3\" cols=\"60\" name=\"feedback\"></textarea>\n"
                        + "                                                    \n"
                        + "                                                    <input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" value=\"1\"/>\n"
                        + "\n"
                        + "                                                    <label class=\"star star-5\" for=\"star-5\"></label>\n"
                        + "\n"
                        + "                                                    <input class=\"star star-4\" id=\"star-4\" type=\"radio\" name=\"star\" value=\"2\"/>\n"
                        + "\n"
                        + "                                                    <label class=\"star star-4\" for=\"star-4\"></label>\n"
                        + "\n"
                        + "                                                    <input class=\"star star-3\" id=\"star-3\" type=\"radio\" name=\"star\" value=\"3\"/>\n"
                        + "\n"
                        + "                                                    <label class=\"star star-3\" for=\"star-3\"></label>\n"
                        + "\n"
                        + "                                                    <input class=\"star star-2\" id=\"star-2\" type=\"radio\" name=\"star\" value=\"4\"/>\n"
                        + "\n"
                        + "                                                    <label class=\"star star-2\" for=\"star-2\"></label>\n"
                        + "\n"
                        + "                                                    <input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" value=\"5\"/>\n"
                        + "\n"
                        + "                                                    <label class=\"star star-1\" for=\"star-1\"></label>\n"
                        + "                                                    <input  type=\"submit\" class=\"button-89\" value=\"Submit\"/>\n"
                        + "                                                </form>\n"
                        + "                                            </div>	\n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 2}\">\n"
                        + "                                <button onclick=\"redirectToPage()\" class=\"button-89\" role=\"button\" style=\"float: right\">Return to Product page</button>\n"
                        + "                            </c:if>\n"
                        + "                            <c:if test=\"${odd.orderStatusId == 3 || odd.orderStatusId == 4}\">\n"
                        + "                                <button onclick=\"redirectToPage()\" class=\"button-89\" role=\"button\" style=\"float: right\">Return to Product page</button>\n"
                        + "                                <button class=\"button-89\" role=\"button\" style=\"float: right\" onclick=\"doCancel('${odd.orderId}')\">Cancel Order</button>\n"
                        + "                            </c:if>\n"
                        + "                            <p class=\"font-weight-bold mb-0\">Thanks for shopping with us!</p> <span>Coza Shop</span>\n"
                        + "                        </div>\n"
                        + "\n"
                        + "                    </div>\n"
                        + "                </div>\n"
                        + "            </div>\n"
                        + "        </div> ");
            } catch (Exception e) {
                System.out.println(e);
            }
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
        String orderid_raw = request.getParameter("orderid");
        String stt_raw = request.getParameter("status");
        int orderid;
        int stt;
        try {
            PurchaseDAO dao = new PurchaseDAO();
            orderid = Integer.parseInt(orderid_raw);
            stt = Integer.parseInt(stt_raw);
            Purchase pur = new Purchase(orderid, 0, 0, null, null, stt, null, null, 0, 0);
            dao.updateStatus(pur);
            response.sendRedirect("ordermanage");
        } catch (Exception e) {
            System.out.println(e);
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
