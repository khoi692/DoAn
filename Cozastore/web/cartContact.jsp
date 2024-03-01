<%-- 
    Document   : cartContact
    Created on : Jun 9, 2023, 7:23:21 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/cartContact.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->
        <div class="container-fluid pt-4" style="background: repeating-linear-gradient(45deg, black, #000000eb 200px);">
            <div class="container" style="background: aliceblue; border-radius: 5px;">
                <h1 class="mb-4 pt-3">Confirm Checkout</h1>
                <div class="row">
                    <div class="col-4 m-3" style="background: white">
                        <!-- address field -->
                        <div class="p-2" id="address-field">
                            <c:set var="user" value="${sessionScope.account}"></c:set>
                                <div class="pb-2">
                                    <div id="topz-mark-deco">
                                    </div>
                                    <div class="pb-2" id="topz-mark-title">
                                        <i class="bi bi-geo-alt-fill"></i>
                                        <p>Delivery Address</p>
                                    </div>
                                    <div class="pb-2" id="user-name">
                                    ${user.name}
                                </div>
                                <div class="pb-2" id="user-phone">
                                    ${user.phone}
                                </div>
                                <span style="font-weight: bold">Address: </span>
                                <div class="pb-2" id="user-address">
                                    ${user.address}
                                </div>
                            </div>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#changeAddress">
                                Update Information
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="changeAddress" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                <div class="modal-dialog" style="max-width: 1000px;">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Update Information</h1> 
                                            <div style="margin-left: 222px; font-weight: bold" id="coordinate"></div>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body" style="height: 600px">
                                            <div class="card-container">                                               
                                                <div class="panel" style="justify-content: normal;">
                                                    <form needs-validation was-validated" novalidate="">
                                                        <div>
                                                            <i class="bi bi-geo-alt-fill"></i>
                                                            <span style="top:0" class="sb-title">Address Selection</span>                                                       
                                                        </div>
                                                        <div class="mt-3">
                                                            <label for="fullname-inputFeedback" class="form-label m-0">Full name</label>
                                                            <input class="form-control" maxlength="25" id="fullname-input" value="${user.name}" type="text" aria-describedby="fullname-inputFeedback" required placeholder="Full name"/>
                                                            <div id="fullname-inputFeedback" class="invalid-feedback">
                                                                Please provide your full name
                                                            </div>
                                                        </div>
                                                        <div class="mt-3">
                                                            <label for="phone-input" class="form-label m-0">Phone</label>
                                                            <input class="form-control" maxlength="25"  id="phone-input" value="${user.phone}" aria-describedby="phone-inputFeedback" required oninput="this.value=this.value.replace(/[^0-9]/g,'');" type="text" placeholder="Phone"/>
                                                            <div id="phone-inputFeedback" class="invalid-feedback">
                                                                Please provide your phone
                                                            </div>
                                                        </div>
                                                        <div class="mt-3">
                                                            <label for="country-input" class="form-label m-0">Country</label>
                                                            <input class="form-control" maxlength="25" type="text" placeholder="Country" aria-describedby="country-inputFeedback" required id="country-input"/>
                                                            <div id="country-inputFeedback" class="invalid-feedback">
                                                                Please provide your country
                                                            </div>
                                                        </div>
                                                        <div class="half-input-container mt-3">
                                                            <div>
                                                                <label for="administrative_area_level_1-input" class="form-label m-0">State/Province</label>
                                                                <input type="text" maxlength="25" class="half-input form-control" placeholder="State/Province" aria-describedby="administrative_area_level_1-inputFeedback" required id="administrative_area_level_1-input"/>
                                                                <div id="administrative_area_level_1-inputFeedback" class="invalid-feedback">
                                                                    Please fill in this
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <label for="locality-input" class="form-label m-0">City/District</label>
                                                                <input class="form-control" maxlength="25" type="text" placeholder="City/District" aria-describedby="locality-inputFeedback" required id="locality-input"/>
                                                                <div id="locality-inputFeedback" class="invalid-feedback">
                                                                    Please fill in this
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-3">
                                                            <label for="postal_code-input" class="form-label m-0">Zip/Postal Code</label>
                                                            <input class="form-control" type="text" class="half-input" placeholder="Zip/Postal code" id="postal_code-input"/>
                                                        </div>
                                                        <div class="mt-3">
                                                            <label for="administrative_area_level_1-input" class="form-label m-0">Detail address</label>
                                                            <input class="form-control" maxlength="255" id="location-input" aria-describedby="location-inputFeedback" required type="text-area" placeholder="Street Name, Building, House No."/>
                                                            <div id="location-inputFeedback" class="invalid-feedback">
                                                                Please provide your detailed address
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div>
                                                    <!-- control for map -->
                                                    <div class="mb-1" id="map-control-box">
                                                        <input id="place-search" type="text" class="form-control" placeholder="Seach location" aria-label="address" aria-describedby="basic-addon1">
                                                        <button class="btn btn-dark" id="current-location">Pan to current location</button>
                                                    </div>
                                                    <!-- comment -->
                                                    <div style="height: 85%;" class="map" id="coza-map">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button onclick="saveChangeInfo()" type="button" class="btn btn-outline-dark">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- address field -->

                        <!-- voucher -->
                        <button style="width: 100%" class="p-2 mt-5" id="voucher-field" data-bs-toggle="modal" data-bs-target="#voucherModal">
                            <p>add Coza Voucher </p>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Coza voucher</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="d-flex align-items-center flex-row">
                                            <input id ="voucherinput" class="m-3" style="width: 100%" placeholder="Type Coza Voucher" type="text">
                                            <button onclick="applyVoucher(document.getElementById('voucherinput').value, 0)" type="button" class="btn btn-secondary">Apply</button>
                                        </div>
                                        <div class="m-3">
                                            <h3 class="modal-title fs-5 mb-3">Common voucher :</h3>
                                            <div style=" position: relative; max-height: 600px; overflow: scroll;">
                                                <c:forEach items="${requestScope.vlist}" var="v">
                                                    <div style="background: #edcdda; border-radius: 10px;" class="p-2 mb-3 d-flex align-items-center justify-content-between">
                                                        <div class="d-flex justify-content-center" style="width:100px; height: 100px; background: black; border-radius: 10px;">
                                                            <p style="position: absolute;width: 100px; color:white; padding: 10px;">${v.describe}</p>
                                                            <i style="font-size: 4rem; position: absolute; color: #ffffff3d;" class="bi bi-pass-fill"></i>
                                                        </div>
                                                        <div style="margin-left: 10px">
                                                            <h4 class="modal-title fs-5">$${v.discount} discount</h4>
                                                            <h6>For order from $${v.min_condition}</h6>
                                                        </div>
                                                        <button onclick="applyVoucher('${v.code}', ${v.min_condition})" data-bs-dismiss="modal" type="button" class="btn btn-secondary">Apply</button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- voucher -->
                        <!-- payment -->
                        <div class="p-2 mt-5" id="payment-field">
                            <p style="font-weight: bold">Payment method</p>
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                                <label class="btn btn-outline-dark" for="btnradio1">Cash on delivery</label>
                                <!--
                                                                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                                                <label class="btn btn-outline-dark" for="btnradio2">Digital wallet</label>-->
                            </div>
                            <p id="description" class="pt-2 pb-3">Cash on delivery: You will pay when you receive the order</p>
                            <div id="price-final-info">
                                <div class="price-final-detail">
                                    <p>Merchandise Subtotal: </p>
                                    <p price="0" id="merchandise-subtotal">$</p>
                                </div>
                                <!--                                <div class="price-final-detail">
                                                                    <p>Shipping Total: </p>
                                                                    <p price="1" id="shipping-total">$1</p>
                                                                </div>-->
                                <div class="price-final-detail">
                                    <p>Coza voucher: </p>
                                    <p price="0" id="coza-voucher">-$0</p>
                                </div>
                                <div class="price-final-detail">
                                    <p>Total payment: </p>
                                    <p id="total-payment">$0</p>
                                </div>
                                <form id="form-master-place-order" action="CartCompletion" method="post">
                                    <input id="total-payment-master" style="display: none" type="text" name="total" value="">
                                    <input id="name-input-master" style="display: none" type="text" name="fullname" value="">
                                    <input id="phone-input-master" style="display: none" type="text" name="phone" value="">
                                    <input id="address-input-master" style="display: none" type="text" name="Address" value="">
                                    <input id="voucher-input-master" style="display: none" type="text" name="Voucher" value="">
                                    <button onclick="location.href = 'GotoCart'" type="button" class="btn btn-secondary btn-md">Go back to cart</button>
                                    <button onclick="placeOrder(event)" type="submit" class="btn btn-outline-dark">Place order</button>
                                </form>
                            </div>
                        </div>
                        <!-- payment -->
                    </div>
                    <div class="col-7 m-3" style="background: white">
                        <table class="table table-light table-striped caption-top">
                            <caption>Chosen products</caption>
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
                            <c:forEach items="${sessionScope.orderSession}" var="item">
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
                            <tr>
                                <td price="" id="total-price">Total: $</td>
                            </tr>
                            <script>
                                totalPrice();
                                totalPayment();
                                function totalPayment() {
                                    let subTotal = Number(document.getElementById("total-price").getAttribute("price"));
                                    //let shipping = Number(document.getElementById("shipping-total").getAttribute("price"));
                                    let voucher = Number(document.getElementById("coza-voucher").getAttribute("price"));
                                    let totalPayment = document.getElementById("total-payment");
                                    let total = subTotal - voucher;
                                    totalPayment.innerHTML = "$" + total;
                                    document.getElementById("total-payment-master").value = total.toFixed(2);
                                }
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
                </div>
            </div>
        </div>
        <style>
            .modal-backdrop{
                z-index: 20;
            }
            .pac-container{
                z-index: 2000;
            }
        </style>
        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->
        <script src="vendor/sweetalert/sweetalert.min.js"></script>
        <script src="js/cartContact.js"></script>
    </body>
</html>
