<%-- 
    Document   : cartCompletion
    Created on : Jun 10, 2023, 9:29:12 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/cartContact.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->
        <div class="container-fluid pt-4 pb-4" style="background: repeating-linear-gradient(45deg, black, #000000d9 100px);">
            <div class="container" style="background: aliceblue; border-radius: 5px;">
                <h1 class="mb-4 pt-3">Order successfully</h1>
                <p class="mt-3 mb-3">
                    Your order is on pending and soon delivered to you. <br>
                </p>
                <div class="mt-3 mb-3">
                    <h4 class="mt-3 mb-3">Order id: ${requestScope.orderId}</h4>
                    <div class="pb-2">
                        <div id="topz-mark-deco">
                        </div>
                        <div class="pb-2" id="topz-mark-title">
                            <i class="bi bi-geo-alt-fill"></i>
                            <p>Delivery Address</p>
                        </div>
                        <div class="pb-2" id="user-name">
                            ${requestScope.name}
                        </div>
                        <div class="pb-2" id="user-phone">
                            ${requestScope.phone}
                        </div>
                        <span style="font-weight: bold">Address: </span>
                        <div class="pb-2" id="user-address">
                            ${requestScope.address}
                        </div>
                    </div>
                    <table class="table table-light table-striped caption-top">
                        <caption style="font-weight: bold">Chosen products</caption>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th colspan="2" scope="col">Product</th>
                                <th scope="col">Variant</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                        <script>var num = 1;</script>
                        <c:forEach items="${requestScope.clist}" var="item">
                            <c:set var="price" value="${item.price}"></c:set>
                            <c:set var="discount" value="${item.discount}"></c:set>
                            <c:set var="quantity" value="${item.quantity}"></c:set>
                            <c:set var="cId" value="${item.scpId}"></c:set>
                            <c:set var="totalPrice" value="${price*(100-discount)/100 * quantity}"></c:set>
                                <tr>
                                    <th scope="row"><script>document.write(num++);</script></th>
                                    <td><img width="50rem" src="${item.productImageDefault}"></td>
                                <td>${item.productName}</td>
                                <td>${item.colorId}, ${item.sizeId}</td>
                                <td>x ${quantity}</td>
                                <td class="item-price" price="${totalPrice}" >$<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" /></td>
                            </tr>
                        </c:forEach>
                        <tr >
                            <td colspan="2" price="" id="total-price">Total: $</td>
                        </tr>
                        <tr>
                            <td colspan="2" price="" id="voucherDiscount">Voucher discount: -$${requestScope.discount}</td>
                        </tr>
                        <tr>
                            <td colspan="2" price="" id="total-payment">Total payment: $${requestScope.total}</td>
                        </tr>
                        <script>
                            totalPrice();
                            function totalPrice() {
                                //initail value of this button when first load or oncall
                                let itemPrice = document.getElementsByClassName("item-price");
                                let totalPrice = 0;
                                for (let i = 0; i < itemPrice.length; i++) {
                                    totalPrice += Number(itemPrice[i].getAttribute("price"));
                                }
                                let total = document.getElementById("total-price");
                                total.innerHTML = "Total: $" + totalPrice.toFixed(2);
                                total.setAttribute("price", totalPrice.toFixed(2));
                                document.getElementById("merchandise-subtotal").innerHTML = "$" + totalPrice.toFixed(2);
                                return totalPrice;
                            }
                        </script>
                        </tbody>
                    </table>
                </div>
                <div>
                    <button class="btn btn-primary mb-5" onclick="location.href = 'product'">Back to store</button>
                </div>
            </div>
        </div>

        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->
    </body>
</html>
