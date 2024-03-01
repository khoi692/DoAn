<%-- 
    Document   : orderDetail
    Created on : Jun 6, 2023, 5:49:10 PM
    Author     : khois
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="css/orderdetail.css">
        <link rel="stylesheet" type="text/css" href="css/mypurchases.css">
        <script src="js/orderdetail.js"></script>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript">
            function doCancel(id) {
                if (confirm("        Please note that you have requested to cancel your order. Before proceeding with the cancellation, we would like to remind you of some important points to ensure that you have carefully considered your decision.\n\
        Canceling an order can impact the processing and delivery process. Additionally, it creates waste for the business and may inconvenience others who may have been waiting for the product/service.\n\
        You sure to cancel this order, id: " + id + "?")) {
                    window.location = "cancelorder?id=" + id;
                }
            }
            function redirectToPage() {
                // Chuyển hướng đến một trang cụ thể
                window.location.href = "product";
            }
            function redirectToPDPage(id) {
                // Chuyển hướng đến một trang cụ thể
                window.location.href = "product-detail?id=" + id;
            }
        </script>
        <style>
            /* CSS cho chữ "Leave Your Feedback" */
            .feedback-label {
                font-size: 18px;
                color: #4a1497;
            }
        </style>
        <style>
            body{
                background-color: #eee;
            }

            div.stars {

                width: 270px;

                display: inline-block;

            }

            .mt-200{
                margin-top:200px;
            }

            input.star {
                display: none;
            }



            label.star {

                float: right;

                padding: 10px;
                
                font-size: 25px;

                color: #4A148C;

                transition: all .2s;

            }



            input.star:checked ~ label.star:before {

                content: '\f005';

                color: #FD4;

                transition: all .25s;

            }


            input.star-5:checked ~ label.star:before {

                color: #FE7;

                text-shadow: 0 0 20px #952;

            }



            input.star-1:checked ~ label.star:before {
                color: #F62;
            }



            label.star:hover {
                transform: rotate(-15deg) scale(1.3);
            }



            label.star:before {

                content: '\f006';

                font-family: FontAwesome;

            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp"%>
        <div class="container mt-5 mb-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="text-left logo p-2 px-5" style="background-color: #E0E0E0"> <img src="images/icons/pin.png"> </div>
                        <div class="invoice p-5">
                            <c:set value="${requestScope.oddetail}" var="odd"/>
                            <c:if test="${odd.orderStatusId == 1}">
                                <h5>Your order is Successful!</h5>
                                <span class="font-weight-bold d-block mt-4">Hello, ${sessionScope.account.name}</span> 
                                <span>Your order has been Successful, please give us your feedback. Thank you for your support!</span>
                            </c:if>
                            <c:if test="${odd.orderStatusId == 2}">
                                <h5>Your order is Unsuccessful!</h5>
                                <span class="font-weight-bold d-block mt-4">Hello, ${sessionScope.account.name}</span> 
                                <span>Your order has been Cancel successfully, sorry about this bad experience. Thank you for your support!</span>
                            </c:if>
                            <c:if test="${odd.orderStatusId == 3}">
                                <h5>Your order is Pending!</h5>
                                <span class="font-weight-bold d-block mt-4">Hello, ${sessionScope.account.name}</span> 
                                <span>Your order has been pending. Thank you for your support!</span>
                            </c:if>
                            <c:if test="${odd.orderStatusId == 4}">
                                <h5>Your order is in preparing!</h5>
                                <span class="font-weight-bold d-block mt-4">Hello, ${sessionScope.account.name}</span> 
                                <span>Your order has been preparing, it will be in transit soon. Thank you for your support!</span>
                            </c:if>
                            <c:if test="${odd.orderStatusId == 5}">
                                <h5>Your order is In transit!</h5>
                                <span class="font-weight-bold d-block mt-4">Hello, ${sessionScope.account.name}</span> 
                                <span>Your order has been In transit and will be completed in a few days. Thank you for your support!</span>
                            </c:if>
                            <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Order Date</span><span>${requestScope.date}</span> </div>
                                            </td>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Order No</span> <span>${odd.orderId}</span> </div>
                                            </td>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Payment</span> <span><img src="https://th.bing.com/th/id/R.4fb60217bc8a511de45849d7b0e4a219?rik=Hwqz6YfN1jX%2bkA&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fcash-icon-transparent%2fcash-icon-transparent-3.png&ehk=2IxKNkG7wpMQvepk15C8oRc3RkiXoxCbLo9ey8Kc1Ok%3d&risl=&pid=ImgRaw&r=0" width="20" /></span> </div>
                                            </td>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Shipping Address</span> <span>${odd.address}</span> </div>
                                            </td>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Receiver</span> <span>${odd.cusName}</span> </div>
                                            </td>
                                            <td>
                                                <div class="py-2"> <span class="d-block text-muted">Phone Number</span> <span>${odd.phone}</span> </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="product border-bottom table-responsive">
                                <table class="table table-borderless">
                                    <tbody>
                                        <c:forEach items="${requestScope.oddt}" var="o">
                                            <tr style="border-bottom: solid; color: #8181812e;" onclick="redirectToPDPage('${o.productId}')">
                                                <td width="20%"> <img src="${o.image}" width="90"> </td>
                                                <td width="60%"> <span class="font-weight-bold" style="color: black">${o.productName}</span>
                                                    <div class="product-qty"> <span class="d-block" style="color: #909090">Quantity: ${o.quantity}</span> <span style="color: #909090">Color: ${o.color}</span> </div>
                                                </td>
                                                <td width="20%">
                                                    <div class="text-right"> <span class="font-weight-bold" style="color: black">$${o.price}</span> </div>
                                                </td>
                                            </tr>
                                            <c:if test="${odd.orderStatusId == 1}">
                                                <tr>
                                                    <td colspan="3">
                                                        <div class="container d-flex mt-5">
                                                            <div class="row" style="width: 100%">
                                                                <div class="col-md-12">
                                                                    <div class="stars" style="width: 100%">
                                                                        <form action="orderfeedback" method="post">
                                                                            <input type="text" name="pid" value="${o.productId}" hidden/>
                                                                            <div style="float: left; width: 100%">
                                                                            <label class="feedback-label" for="feedback">Leave Your Feedback</label>
                                                                            <textarea style="font-size: 1rem; width: 100%; border: 1px solid" rows="4" cols="50" name="feedback"></textarea>

                                                                            <input class="star star-5" id="star-5-${o.productId}" type="radio" name="star" value="5" required/>
                                                                            <label class="star star-5" for="star-5-${o.productId}"></label>

                                                                            <input class="star star-4" id="star-4-${o.productId}" type="radio" name="star" value="4" required/>
                                                                            <label class="star star-4" for="star-4-${o.productId}"></label>

                                                                            <input class="star star-3" id="star-3-${o.productId}" type="radio" name="star" value="3" required/>
                                                                            <label class="star star-3" for="star-3-${o.productId}"></label>

                                                                            <input class="star star-2" id="star-2-${o.productId}" type="radio" name="star" value="2" required/>
                                                                            <label class="star star-2" for="star-2-${o.productId}"></label>

                                                                            <input class="star star-1" id="star-1-${o.productId}" type="radio" name="star" value="1" required/>
                                                                            <label class="star star-1" for="star-1-${o.productId}"></label>
                                                                            </div>
                                                                            <br/><br/><input type="submit" class="button-89" value="Submit"/>
                                                                        </form>
                                                                    </div>	
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row d-flex justify-content-end">
                                <div class="col-md-5">
                                    <table class="table table-borderless">
                                        <tbody class="totals">
                                            <tr>
                                                <td>
                                                    <div class="text-left"> <span class="text-muted">Subtotal</span> </div>
                                                </td>
                                                <td>
                                                    <div class="text-right"> <span>$${odd.total}</span> </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="text-left"> <span class="text-muted">Discount</span> </div>
                                                </td>
                                                <td>
                                                    <div class="text-right"> <span class="text-danger">None</span> </div>
                                                </td>
                                            </tr>
                                            <tr class="border-top border-bottom">
                                                <td>
                                                    <div class="text-left"> <span class="font-weight-bold">Total</span> </div>
                                                </td>
                                                <td>
                                                    <div class="text-right"> <span class="font-weight-bold">$${odd.total}</span> </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <c:if test="${odd.orderStatusId == 2 || odd.orderStatusId == 1}">
                                <button onclick="redirectToPage()" class="button-89" role="button" style="float: right">Return to Product page</button>
                            </c:if>
                            <c:if test="${odd.orderStatusId == 3 || odd.orderStatusId == 4}">
                                <button onclick="redirectToPage()" class="button-89" role="button" style="float: right">Return to Product page</button>
                                <button class="button-89" role="button" style="float: right" onclick="doCancel('${odd.orderId}')">Cancel Order</button>
                            </c:if>
                            <p class="font-weight-bold mb-0">Thanks for shopping with us!</p> <span>Coza Shop</span>
                        </div>

                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
