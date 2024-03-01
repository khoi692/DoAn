<%-- 
    Document   : voucher-detail
    Created on : Jun 17, 2023, 9:23:58 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Bootstrap down here -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <!-- ----------------------->
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../components/leftBar.jsp"%>
            <div class="content container-fluid">
                <%@include file="../components/topbar.jsp"%>
                <div>
                    <script>
                        function deleteVoucher(code) {
                            var result = confirm("Are you sure you want to delete this item?");
                            if (result) {
                                var xhttp;
                                xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        window.alert("Deleted");
                                        window.location = "/cozastore/voucherManagement";
                                    }
                                };
                                xhttp.open("get", "voucherManagement?direct=voucher-delete&code=" + code, true);
                                xhttp.send();
                            }
                        }
                    </script>
                    <h1 class="p-5 pb-2 pt-2">Voucher: ${item.code}</h1>
                <div class="m-5 card text-center">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="true" href="voucherManagement">Voucher list</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Voucher detail</a>
                            </li>
                            <li class="nav-item">
                                <a href="voucherManagement?direct=voucher-add-new" class="nav-link">Add new voucher</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="container">
                                <c:set value="${item.status}" var="status"></c:set>
                                <c:if test="${status == 1}">
                                    <c:set value="success" var="theme"></c:set>
                                    <c:set value="available" var="sttName"></c:set>
                                </c:if>
                                <c:if test="${status == 0}">
                                    <c:set value="warning" var="theme"></c:set>
                                    <c:set value="waiting" var="sttName"></c:set>
                                </c:if>
                                <c:if test="${status == -1}">
                                    <c:set value="danger" var="theme"></c:set>
                                    <c:set value="expired-unavailable" var="sttName"></c:set>
                                </c:if>
                                <c:if test="${status == -2}">
                                    <c:set value="danger" var="theme"></c:set>
                                    <c:set value="run-out-unavailable" var="sttName"></c:set>
                                </c:if>
                                <form method="post" action="voucherManagement">
                                    <button type="button" style="float:left;" class="btn btn-primary">
                                        Type: ${item.type}
                                    </button>
                                    <button onclick="deleteVoucher('${item.code}')" type="button" style="float:left;" class="btn btn-danger">
                                        Delete<i class="m-2 bi bi-trash3"></i>
                                    </button>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-code">Code
                                        </span>
                                        <input style="display: none" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-code" name="code" value="${item.code}">
                                        <input disabled id="0" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-code" name="new_code" value="${item.code}">
                                        <button type="button" style="color:white" class="btn btn-${theme}"> ${sttName}
                                            <span class="position-absolute top-0 start-100 translate-middle p-2 bg-${theme} border border-light rounded-circle"></span>
                                        </button>

                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-describe">Describe</span>
                                        <input disabled type="text" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-describe" name="describe" value="${item.describe}">

                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-end">Discount</span>
                                        <span style="font-size: large" class="badge bg-secondary">$</span>
                                        <input disabled  type="number" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" name="discount" value="${item.discount}">

                                    </div>
                                    <!-- condition -->
                                    <c:if test="${item.type eq 'PUBLIC'}">
                                        <!-- condition -->
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-end">Min payment condition</span>
                                            <span style="font-size: large" class="badge bg-secondary">$</span>
                                            <input disabled  oninput="this.value=this.value.replace(/[^0-9]/g,'');" onkeyup="changeMin()" type="text" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" name="min" value="${item.min_condition}">

                                        </div>
                                        <!-- condition -->
                                    </c:if>
                                    <!-- condition -->
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-start">Start</span>
                                        <input disabled   type="datetime-local" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" name="start" value="${item.start_voucher}">

                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-end">End</span>
                                        <input disabled  type="datetime-local" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" name="end" value="${item.end_voucher}">

                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-end">Quantity</span>
                                        <span style="font-size: large" class="badge bg-secondary"></span>
                                        <input disabled oninput="this.value=this.value.replace(/[^0-9]/g,'');"  type="text" class="form-control prime-field" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" name="quantity" value="${item.quantity}">

                                    </div>    

                                    <input style="display: none" name="method" value="modify">
                                    <div id="modify-button">
                                        <button onclick="modify()" type="button" class="btn btn-secondary">Modify
                                            <i class="bi bi-brush-fill"></i></button>
                                    </div>
                                    <div style="display: none" id="function-Button-szz">
                                        <button type="button" onclick="Cancel()" class="btn btn-secondary">CANCEL</button>
                                        <button onclick="enableAll()" type="submit" class="btn btn-primary">SAVE</button>
                                    </div>
                                </form>
                                <style>
                                    .input-group-text{
                                        width: 25ch;
                                    }
                                </style>
                                <script>
                                    function modify() {
                                        let items = document.getElementsByClassName("prime-field");
                                        for (let i = 0; i < items.length; i++) {
                                            items[i].removeAttribute("disabled");
                                        }
                                        document.getElementById("function-Button-szz").style.display = "block";
                                        document.getElementById("modify-button").style.display = "none";
                                    }
                                    function Cancel() {
                                        let items = document.getElementsByClassName("prime-field");
                                        for (let i = 0; i < items.length; i++) {
                                            items[i].setAttribute("disabled", true);
                                        }
                                        document.getElementById("modify-button").style.display = "block";
                                        document.getElementById("function-Button-szz").style.display = "none";
                                    }
                                    function enableAll() {
                                        var inputs = document.getElementsByTagName('input');
                                        for (var i = 0; i < inputs.length; i++) {
                                            inputs[i].disabled = false;
                                        }
                                        window.alert("Update successfully");
                                    }
                                    function changeMin() { //change min condition value 
                                        let input = document.getElementById("3").value;
                                        let code_e = document.getElementById("0");
                                        let code = code_e.value;
                                        code_e.removeAttribute("readonly");
                                        let minIndex = code.indexOf("MIN") + 3;
                                        code = code.substring(0, minIndex);
                                        console.log(code);
                                        code_e.value = code + input;
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="vendor/sweetalert/sweetalert.min.js"></script>
    </body>
</html>
