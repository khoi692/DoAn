<%-- 
    Document   : myorder
    Created on : Mar 9, 2023, 7:17:02 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Purchases</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/mypurchases.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/bloglist.css">
        <script src="js/orderdetail.js"></script>
        <script type="text/javascript">
            function doCancel(id) {
                if (confirm("        Please note that you have requested to cancel your order. Before proceeding with the cancellation, we would like to remind you of some important points to ensure that you have carefully considered your decision.\n\
        Canceling an order can impact the processing and delivery process. Additionally, it creates waste for the business and may inconvenience others who may have been waiting for the product/service.\n\
        You sure to cancel this order, id: " + id + "?")) {
                    window.location = "cancelorder?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="components/header.jsp"%>
        <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('https://avante.biz/wp-content/uploads/Clothing-Backgrounds/Clothing-Backgrounds-008.jpg');">
            <h1 id="main-title-dscewvc" style="text-align: center; color: black" class="ltext-105 cl0 txt-center">My Purchases</h1>
        </section>
        <section class="bg0 p-t-62 p-b-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <div class="flex-w flex-l-m filter-tope-group m-tb-10" style="place-content: center">
                            <c:forEach items="${requestScope.status}" var="s">
                                <a href="mypurchases?stt=${s.id}" class="button-59">
                                    ${s.name}
                                </a>
                            </c:forEach>
                            <a href="mypurchases?stt=0" class="button-59">
                                All
                            </a>
                        </div>
                        <div id="decor-bar-dsacxber"></div>
                        <div>
                            <c:forEach items="${requestScope.order}" var="o">
                                <div class="bound-bill-cenosau">

                                    <a class="bill-sec-cndsiou button-55" href="orderdetails?oid=${o.orderId}">
                                        <div class="sec-field-cvxz" style="display: flex; ">
                                            <div class="wqsvrerris">
                                                <p>Order ID: ${o.orderId}&nbsp;</p>
                                            </div>
                                        </div>
                                        <div class="sec-field-cvxz">
                                            <p style="margin: 0;">Contact</p>
                                            Phone: ${o.phone} <br/>
                                            Address: ${o.address}
                                        </div>
                                        <div class="sec-field-cvxz">
                                            <p style="margin: 0;">Receiver:</p>
                                            ${o.cusName}
                                        </div>
                                        <div class="sec-field-cvxz">
                                            <p style="margin: 0;">Total: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${o.total} "/></p>
                                        </div>
                                    </a>
                                    <div class="vmnoiedberis">
                                        <c:if test="${o.orderStatusId == 1}">
                                            <p>Status: &nbsp;</p>
                                            <p style="font-family: sans-serif; font-weight: bold"> Successful</p>
                                        </c:if>
                                        <c:if test="${o.orderStatusId == 2}">
                                            <p>Status: &nbsp;</p>
                                            <p style="font-family: sans-serif; font-weight: bold"> Fail</p>
                                        </c:if>
                                        <c:if test="${o.orderStatusId == 3}">
                                            <p>Status: &nbsp;</p>
                                            <p style="font-family: sans-serif; font-weight: bold"> Pending</p>&nbsp&nbsp
                                            <button class="button-89" role="button" onclick="doCancel('${o.orderId}')">Cancel Order</button>
                                        </c:if>
                                        <c:if test="${o.orderStatusId == 4}">
                                            <p>Status: &nbsp;</p>
                                            <p style="font-family: sans-serif; font-weight: bold"> Preparing Order</p>&nbsp&nbsp
                                            <button class="button-89" role="button" onclick="doCancel('${o.orderId}')">Cancel Order</button>
                                        </c:if>
                                        <c:if test="${o.orderStatusId == 5}">
                                            <p>Status: &nbsp;</p>
                                            <p style="font-family: sans-serif; font-weight: bold"> In transit</p>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 p-b-80">
                        <div class="side-menu">
                            <div class="p-t-65">
                                <h4 class="mtext-112 cl2 p-b-33">
                                    Suggest Products
                                </h4>
                                <ul>
                                    <c:forEach var="item" items="${requestScope.plist}">
                                        <li class="flex-w flex-t p-b-30">
                                            <a class="small-product-item-side" href="product-detail?id=${item.productId}">
                                                <div style="text-decoration: none;" href="#" class="wrao-pic-w size-214 m-r-20">
                                                    <img style="width: 100%;" src="${item.productImageDefault}" alt="PRODUCT">
                                                </div>
                                                <div class="size-215 flex-col-t p-t-8">
                                                    <p class="stext-116 cl8 hov-cl1 trans-04">
                                                        ${item.productName}
                                                    </p>
                                                    <span class="stext-116 cl6 p-t-20">
                                                        $ ${item.price}
                                                    </span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div  class="carousel slide carousel-fade" style="overflow: hidden; padding-right: 0;" id="carouselExampleCaptions" data-bs-ride="carousel">
                                <div style="height: 700px;" class="carousel-inner" data-bs-interval="3000">
                                    <c:forEach var="item" items="${requestScope.dclist}">
                                        <c:set var="discount" value="${item.discount}"></c:set>
                                        <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                        <a href="product-detail?id=${item.productId}" style="display: flex; justify-content: center;" class="carousel-item" data-bs-interval="3000">
                                            <div style="height:100%;padding:0;font-size: 3rem;top:0;width: 100%;left:0;right:0; background: #0000004f;" class="carousel-caption d-md-block">
                                                <p><fmt:formatNumber type="number" value="${discount}"/> % OFF</p>
                                                <p>${item.productName}</p>
                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                <c:if test="${discount != 0}">
                                                    <p style="text-decoration: line-through; font-size: 2rem; color: #ffffffa8;">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                    </p>
                                                </c:if>
                                            </div>
                                            <img src="${item.productImageDefault}" class="d-block" alt="${item.productName}">
                                        </a>
                                    </c:forEach>
                                    <script>
                                        document.querySelector(".carousel-item").classList.add("active");
                                    </script>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
