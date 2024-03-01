<%-- 
    Document   : cartdetail
    Created on : May 30, 2023, 4:37:58 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="css/home.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Header -->
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->
        <div class="container-fluid pt-4" style="background: repeating-linear-gradient(45deg, black, #000000eb 200px);">
            <div class="container" style="background: aliceblue; border-radius: 5px;">
                <div style="    display: flex;align-items: center;">
                    <i style="font-size: 2rem;" class="bi bi-bag-check-fill p-2"></i>
                    <h1 class="mb-4 pt-3">Cart</h1>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form id="form-master-check-out" class="container row" action="CartContact" method="post">
                            <div class="col-8">
                                <div class="container row d-none d-lg-flex mb-2" style="background: white;">
                                    <div class="col-4"><p>Product</p></div>
                                    <div class="col-2"><p>Variation</p></div>
                                    <div class="col-3"><p>Quantity</p></div>
                                    <div class="col-1"><p>Total</p></div>
                                    <div class="col-2"><p>Action</p></div>
                                </div>

                                <!------------------------------------ cart print --------------------------------------------------->
                                <div id="fdbaovbwnjsdso-cart-item-box">
                                    <script>
                                        function printCart() {
                                            var xhttp;
                                            xhttp = new XMLHttpRequest();
                                            xhttp.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {
                                                    document.getElementById("fdbaovbwnjsdso-cart-item-box").innerHTML = this.responseText;
                                                    document.getElementById("choose-all-title").innerHTML = "Choose all ("+getNumberOfItem()+")";
                                                }
                                            };
                                            let data = "";
                                            xhttp.open("post", "GotoCart", true);
                                            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                            xhttp.send(data);
                                            var xhttp;
                                        }
                                        printCart()
                                    </script>
                                </div>
                                <!------------------------------------ cart print --------------------------------------------------->

                            </div>
                            <div class="col-4">
                                <div id="fdsavc-submit-buy-bound">
                                    <div id="fdsavc-submit-buy">
                                        <label class="control control-checkbox">
                                            <p id="choose-all-title">Choose all (0)</p>
                                            <input onchange="checkAll()" id="fdsaf-get-all" type="checkbox">
                                            <div class="control_indicator"></div>
                                        </label>
                                        <div id="fdsa-number-of-selected">
                                            Total of 0 product(s):
                                        </div>
                                        <div id="dsavcx-sumary-price">
                                            $0
                                        </div>
                                        <button onclick="handleSubmitCart(event)" class="btn btn-outline-dark" type="submit">
                                            Check out
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
                <div class="row col-8 isotope-grid">
                    <h2 class="mb-5 mt-5">New products</h2>
                    <!-- new product review -->
                    <c:forEach var="item" items="${requestScope.plist}">
                        <c:set var="discount" value="${item.discount}"></c:set>
                        <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                        <a href="product-detail?id=${item.productId}" class="newpro col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                            <c:if test="${discount != 0}">
                                <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                            </c:if>
                            <!-- Block2 -->
                            <div class="block2">
                                <div class="block2-pic hov-img0">
                                    <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                    <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                        View
                                    </div>
                                </div>
                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${item.productName}
                                        </div>
                                        <div>
                                            <span class="stext-105 cl3 newprice">
                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                            </span>
                                            <c:if test="${discount != 0}">
                                                <span class="stext-105 cl3 price">
                                                    $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                </span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- end content -->
        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->
        <script src="js/cart.js"></script>
        <script src="vendor/sweetalert/sweetalert.min.js"></script>
    </body>
</html>