/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.ajax;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;
import model.Cart;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name = "cartAjax", urlPatterns = {"/cartAjax"})
public class cartAjax extends HttpServlet {

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
            out.println("<title>Servlet cartAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartAjax at " + request.getContextPath() + "</h1>");
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
        CartDAO cd = new CartDAO();
        PrintWriter out = response.getWriter();
        int cId = Integer.parseInt(request.getParameter("cId"));
        Cart currentVariant = cd.getTempCartItemByScpId(cId);
        int ProductId = Integer.parseInt(request.getParameter("proId"));
        String getMethod = request.getParameter("getMethod");
        if (getMethod.equals("color")) { //print out color checkboxes
            List<String> list = cd.getColorListByProductId(ProductId);
            int num = 1;
            for (int i = 0; i < list.size(); i++) {
                String color = list.get(i);
                if (currentVariant.getColorId().equals(color)) {
                    out.println("<input onclick='chooseColor(\"" + color + "\"," + cId + ", " + ProductId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" checked autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + color + "</label>");
                } else if (cd.getQuantityInStock(ProductId, color) > 0) { // check if there is still prodcut in stock
                    out.println("<input onclick='chooseColor(\"" + color + "\"," + cId + ", " + ProductId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + color + "</label>");
                } else {
                    out.println("<input disabled onclick='chooseColor(\"" + color + "\"," + cId + ", " + ProductId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + color + "</label>");
                }
                num++;
            }
        }
        if (getMethod.equals("size")) { //print out size check boxes
            String color = request.getParameter("color");
            List<String> list = cd.getSizeList(ProductId, color);
            int num = 1;
            for (int i = 0; i < list.size(); i++) {
                String size = list.get(i);
                if (currentVariant.getSizeId().equals(size)) {
                    out.println("<input onclick='chooseSize(\"" + size + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" checked autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + size + "</label>");
                } else if (cd.getQuantityInStock(ProductId, color, size) > 0) {
                    out.println("<input onclick='chooseSize(\"" + size + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + size + "</label>");
                } else {
                    out.println("<input disabled onclick='chooseSize(\"" + size + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" autocomplete=\"off\">\n"
                            + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + size + "</label>");
                }
                num++;
            }
        }
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
        PrintWriter out = response.getWriter();
        CartDAO cd = new CartDAO();
        String getMethod = request.getParameter("getMethod");
        HttpSession session = request.getSession();
        //user
        User current = new User();
        int userId = -1;
        boolean isLoggedIn = false; // check for loggin
        //
        if (session.getAttribute("account") != null) {
            current = (User) session.getAttribute("account"); //get current user
            userId = current.getUserID(); // get current user id
            isLoggedIn = true;
        }
        
        //if there is change on variants of product
        //status : -1 : cannot change due to duplicate cart item
        if (getMethod.equals("scp")) { //replace current scp with new scp 
            int old_cId = Integer.parseInt(request.getParameter("cId")); //get cId
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            int fixedId = Integer.parseInt(request.getParameter("fixedId"));
            int ProductId = Integer.parseInt(request.getParameter("proId"));
            int new_cId = cd.getScpIdByItsComponent(ProductId, color, size); //new cid
            if (isLoggedIn) {//if there is a user logged in
                try {
                    if(cd.isCartExist(new_cId, userId) && old_cId != new_cId) {
                        out.println("-1");
                        return;
                    } //duplicate
                    cd.updateCart(old_cId, new_cId, userId);
                } catch (Exception e) {
                }
                out.println(cartItem(cd.getCartItemByUserIdScpId(userId, new_cId), fixedId));
            } else {
                List<Cart> clist = (List<Cart>) session.getAttribute("sessionCart");
                if(cd.isSessionCartExist(new_cId, clist) && old_cId != new_cId){
                    out.println("-1");
                    return;
                }
                for (int i = 0; i < clist.size(); i++) {
                    if (clist.get(i).getScpId() == old_cId) {
                        clist.set(i, cd.getTempCartItemByScpId(new_cId, clist.get(i).getQuantity()));
                        session.setAttribute("sessionCart", clist);
                        out.println(cartItem(cd.getTempCartItemByScpId(new_cId, clist.get(i).getQuantity()), fixedId));
                        break;
                    }
                }
            }

        }

        //if there is change on quantity of product
        if (getMethod.equals("quantity")) {
            //status : a : product left
            // -a : user choose a more product than stock has
            int cId = Integer.parseInt(request.getParameter("cId")); //get cId
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int quantityInStock = cd.getQuantityInStock(cId); // get quantity left of this product in stock
            if (quantity > quantityInStock) {
                out.println(quantityInStock * -1);
            } else if (quantity > 10 || quantity < 1) {
                out.println("Don't try to inspect !");
            } else {
                if (isLoggedIn) {
                    cd.updateQuantityCart(cId, userId, quantity);
                } else {
                    List<Cart> clist = (List<Cart>) session.getAttribute("sessionCart");
                    for (int i = 0; i < clist.size(); i++) {
                        if (clist.get(i).getScpId() == cId) {
                            clist.get(i).setQuantity(quantity);
                            session.setAttribute("sessionCart", clist);
                            break;
                        }
                    }
                }
            }
        }

        //if there is delete
        if (getMethod.equals("delete")) {
            int cId = Integer.parseInt(request.getParameter("cId")); //get cId
            if (isLoggedIn) {
                cd.deleteCart(userId, cId);
                session.setAttribute("cartInfo", cd.getCartByUserId(current.getUserID()));
            } else {
                List<Cart> clist = (List<Cart>) session.getAttribute("sessionCart");
                for (int i = 0; i < clist.size(); i++) {
                    if (clist.get(i).getScpId() == cId) {
                        clist.remove(i);
                        session.setAttribute("cartInfo",clist);
                        break;
                    }
                }
            }
        }
        
        //if  user want to refresh
        if (getMethod.equals("refresh")) {
            int cId = Integer.parseInt(request.getParameter("cId")); //get cId
            int fixedId = Integer.parseInt(request.getParameter("fixedId"));
            if (isLoggedIn) {
                out.println(cartItem(cd.getCartItemByUserIdScpId(userId, cId), fixedId));
            } else {
                List<Cart> clist = (List<Cart>) session.getAttribute("sessionCart");
                for (int i = 0; i < clist.size(); i++) {
                    if (clist.get(i).getScpId() == cId) {
                        out.println(cartItem(cd.getTempCartItemByScpId(cId, clist.get(i).getQuantity()), fixedId));
                        break;
                    }
                }
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

    public String cartItem(Cart item,int fixedId) {
        DecimalFormat df = new DecimalFormat("#.##");
        int proId = item.getProductId();
        int qty = item.getQuantity();
        double price = item.getPrice();
        double discount = item.getDiscount();
        int cId = item.getScpId();
        String color = item.getColorId();
        String size = item.getSizeId();
        int status = item.getStatus();
        String image = item.getProductImageDefault();
        String name = item.getProductName();
        double oldPrice = price * qty;
        double newPrice = price * (100 - discount) / 100 * qty;

        CartDAO cd = new CartDAO();
        List<String> listC = cd.getColorListByProductId(proId); //color list

        List<String> listS = cd.getSizeList(proId, color); // size list

        // item cart
        String itemCart ="<div id=\"cart-item-" + cId + "\" class=\"row cart-item-bound\">"
                + "<div class=\"col-12 col-xl-4 inner-field-cart d-flex align-items-center\">\n"
                + "    <label class=\"control control-checkbox\">\n";
        if (status < 0) {
            itemCart += "<input disabled=\"true\" onchange=\"checkOne(" + cId + ")\" id=\"check-box-opt-" + cId + "\" class=\"check-box-list\" type=\"checkbox\" name=\"scpId\" price=\""+newPrice+"\" value=\"" + cId + "\">\n";
        } else if (status == 0) {
            itemCart += "<input disabled=\"true\" onchange=\"checkOne(" + cId + ")\" id=\"check-box-opt-" + cId + "\" class=\"check-box-list\" type=\"checkbox\" name=\"scpId\" price=\""+newPrice+"\" value=\"" + cId + "\">\n";
        } else {
            itemCart += "<input onchange=\"checkOne(" + cId + ")\" id=\"check-box-opt-" + cId + "\" class=\"check-box-list\" type=\"checkbox\" name=\"scpId\" price=\""+newPrice+"\" value=\"" + cId + "\">\n";

        }
        itemCart += "        <div class=\"control_indicator\"></div>\n"
                + "    </label>\n"
                + "    <a class=\"fdytrfdsa-link inner-field-cart\" href=\"product-detail?id=" + proId + "\">\n"
                + "        <img id=\"cart-product-img-" + cId + "\" class=\"cart-product-img\" src=\"" + image + "\">\n"
                + "        <p style=\"margin-left: 10px;\" class=\"cart-product-name\">" + name + "</p>\n"
                + "    </a>\n"
                + "</div>\n"
                + "<!-- variation -->\n"
                + "<div class=\"col-12 col-xl-2\">\n"
                + "    <div class=\"btn-group dropend\">\n"
                + "        <button class=\"btn btn-light dropdown-toggle\" data-bs-auto-close=\"outside\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\" type=\"button\">\n"
                + "            <div class=\"variant-box\">\n"
                + "                <p id=\"displayed-cart-color-" + cId + "\" style=\"border-color:" + color + "\" class=\"color-variant\">" + color + "</p>\n"
                + "                <p> , </p>\n"
                + "                <p id=\"displayed-cart-size-" + cId + "\">" + size + "</p>\n"
                + "            </div>\n"
                + "        </button>\n"
                + "        <div class=\"dropdown-menu text-body-secondary\" style=\"\">\n"
                + "            <div id=\"variant-opened-box-" + cId + "\" class=\"p-3\">\n"
                + "                <div>\n"
                + "                    <p>Color</p>  \n"
                + "                    <div id=\"color-list-" + cId + "\" class=\"btn-group\" role=\"group\" aria-label=\"Basic radio toggle button group\">\n";
        int num = 1;
        for (int i = 0; i < listC.size(); i++) {
            String colorf = listC.get(i);
            if (color.equals(colorf)) {
                itemCart += ("<input onclick='chooseColor(\"" + colorf + "\"," + cId + ", " + proId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" checked autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + colorf + "</label>");
            } else if (cd.getQuantityInStock(proId, color) > 0) { // check if there is still prodcut in stock
                itemCart += ("<input onclick='chooseColor(\"" + colorf + "\"," + cId + ", " + proId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + colorf + "</label>");
            } else {
                itemCart += ("<input disabled onclick='chooseColor(\"" + colorf + "\"," + cId + ", " + proId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradio-" + cId + "\" id=\"btnradio-" + cId + "-" + (num) + "\" autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradio-" + cId + "-" + num + "\">" + colorf + "</label>");
            }
            num++;
        }
        itemCart += "                    </div>\n"
                + "                </div>\n"
                + "                <div>\n"
                + "                    <p>Size</p>   \n"
                + "                    <div id=\"size-list-" + cId + "\" class=\"btn-group\" role=\"group\" aria-label=\"Basic radio toggle button group\">\n";
        num = 1;
        for (int i = 0; i < listS.size(); i++) {
            String sizef = listS.get(i);
            if (size.equals(sizef)) {
                itemCart += ("<input onclick='chooseSize(\"" + sizef + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" checked autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + sizef + "</label>");
            } else if (cd.getQuantityInStock(proId, color, sizef) > 0) {
                itemCart += ("<input onclick='chooseSize(\"" + sizef + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + sizef + "</label>");
            } else {
                itemCart += ("<input disabled onclick='chooseSize(\"" + sizef + "\"," + cId + ")' type=\"radio\" class=\"btn-check btn-temp-coza\" name=\"btnradios-" + cId + "\" id=\"btnradios-" + cId + "-" + num + "\" autocomplete=\"off\">\n"
                        + "<label class=\"btn btn-outline-dark\" for=\"btnradios-" + cId + "-" + num + "\">" + sizef + "</label>");
            }
            num++;
        }
        itemCart += "                    </div>\n"
                + "                </div>\n"
                + "                <div>\n"
                + "                    <button class=\"btn btn-outline-dark mt-3\" onclick='confirmChange(" + fixedId + "," + cId + ", " + proId + ")' id=\"variantSumary-" + cId + "\" color=\"" + color + "\" size=\"" + size + "\" type=\"button\">Confirm</button>\n"
                + "                    <script>\n"
                + "                        //initail value of this button when first load\n"
                + "                        color_f = document.getElementById(\"displayed-cart-color-\" + " + cId + ").innerHTML;\n"
                + "                        size_f = document.getElementById(\"displayed-cart-size-\" + " + cId + ").innerHTML;\n"
                + "                        informButton = document.getElementById(\"variantSumary-\" + " + cId + ");\n"
                + "                        informButton.setAttribute(\"color\", color_f);\n"
                + "                        informButton.setAttribute(\"size\", size_f);\n"
                + "                    </script>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "\n"
                + "</div>\n"
                + "<!-- quantity -->\n"
                + "<div class=\"counter col-12 col-xl-3 \">\n"
                + "    <div class=\"input-group w-75\">\n"
                + "        <button id=\"decrease-button-" + cId + "\" onclick=\"decrease(" + cId + "," + cId + ");\" class=\"btn btn-outline-secondary d-flex align-items-center justify-content-center\" type=\"button\">-</button>\n";
        if (status < 0) {
            itemCart += "<i class=\"bi bi-exclamation-circle warning-stock\"> left in stock : " + (status * -1) + "</i>\n"
                    + "<input id=\"quantity-" + cId + "\" readonly disabled style=\"background: white; border: 1px solid red; color: red;\" name=\"quantity\"  type=\"number\" class=\"form-control quantity-box-list\" value=\"" + qty + "\" min=\"1\">\n";
        } else if (status == 0) {
            itemCart += "<i class=\"bi bi-exclamation-circle warning-stock\"> Out of stock</i>\n"
                    + "<input id=\"quantity-" + cId + "\" readonly disabled style=\"background: white; border: 1px solid red; color: red;\" name=\"quantity\"  type=\"number\" class=\"form-control quantity-box-list\" value=\"" + qty + "\" min=\"1\">\n";
        } else {
            itemCart += "<input id=\"quantity-" + cId + "\" readonly disabled style=\"background: white\" name=\"quantity\"  type=\"number\" class=\"form-control quantity-box-list\" value=\"" + qty + "\" min=\"1\">\n";
        }
        itemCart += "<button id=\"increase-button-" + cId + "\" onclick=\"increase(" + cId + "," + cId + "); calallbuy()\" class=\"btn btn-outline-secondary d-flex align-items-center justify-content-center\" type=\"button\">+</button>\n"
                + "    </div>\n"
                + "</div>  \n"
                + "<!-- price -->       \n"
                + "<div class=\"col-12 col-xl-1\">\n"
                + "    <div id=\"price-info-" + cId + "\" unitprice=\"" + price + "\" discount=\"" + discount + "\"></div>\n";
        if (discount != 0) {
            itemCart += "<p id=\"cart-old-price-" + cId + "\" class=\"cart-old-price\">$" + df.format(oldPrice) + "</p>\n";
        }
        itemCart += "    <p id=\"cart-new-price-" + cId + "\" class=\"cart-new-price\">$" + df.format(newPrice) + "</p>\n"
                + "</div>\n"
                + "\n"
                + "<div class=\"col-12 col-xl-2\">\n"
                + "    <!-- Button trigger modal -->\n"
                + "    <button style=\"width: 100%;\" type=\"button\" class=\"btn btn-outline-dark\" data-bs-toggle=\"modal\" data-bs-target=\"#Delete-confirm-modal-" + cId + "\">\n"
                + "        <i class=\"bi bi-trash\"></i>\n"
                + "    </button>\n"
                + "    <button style=\"width: 100%;\" class=\"btn btn-outline-dark\" type=\"button\" onclick=\"refreshCart(" + fixedId + "," + cId + ")\" ><p class=\"fdsafdsa-text\">Refresh</p></button>\n"
                + "    <!-- Modal -->\n"
                + "    <div class=\"modal fade\" id=\"Delete-confirm-modal-" + cId + "\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n"
                + "        <div class=\"modal-dialog\">\n"
                + "            <div class=\"modal-content\">\n"
                + "                <div class=\"modal-header\">\n"
                + "                    <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">Are you sure deleting this item ?</h1>\n"
                + "                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n"
                + "                </div>\n"
                + "                <div class=\"modal-body\">\n"
                + "                    This item will no longer lie in your cart\n"
                + "                    <div class=\"row fdytrfdsa-link inner-field-cart\">\n"
                + "                        <img id=\"confirm-image-modal-" + cId + "\" class=\"cart-product-img col-3\" src=\"" + image + "\">\n"
                + "                        <p style=\"margin-left: 10px;\" class=\"cart-product-name col-8\">" + name + "</p>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "                <div class=\"modal-footer\">\n"
                + "                    <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancel</button>\n"
                + "                    <button id=\"delete-button-" + cId + "\" onclick=\"deleteCart(" + fixedId + "," + cId + ")\" type=\"button\" data-bs-dismiss=\"modal\" class=\"btn btn-primary\">Delete it</button>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "    <!-- Modal -->\n"
                + "</div>   \n"
                + "</div>   \n"
                + "";
        return itemCart;
    }

}
