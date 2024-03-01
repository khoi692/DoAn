<%-- 
    Document   : add-new-voucher
    Created on : Jun 17, 2023, 9:23:25 AM
    Author     : pc
--%>

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
                    <div class="container-fluid">
                        <h1 class="p-5 pb-2 pt-2">Add new vouchers</h1>
                        <div class="m-5 card text-center">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" aria-current="true" href="voucherManagement">Voucher list</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="voucherManagement?direct=voucher-add-new" class="nav-link active">Add new voucher</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="row card-body">
                                <div class="col-4">
                                    Choose a type: 
                                    <div style="width: 100%" class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input onchange="switchType();" type="radio" class="btn-check" name="btnradio" id="btnradio1" checked autocomplete="off">
                                        <label class="btn btn-outline-primary" for="btnradio1">Public voucher</label>

                                        <input onclick="switchType();" type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="btnradio2">Hidden voucher</label>
                                    </div>
                                    <div style="width: 100%" class="btn-group pt-3" role="group" aria-label="Basic checkbox toggle button group">
                                        <input onchange="changeTitleCheck()" type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                                        <label id="titleGenerate" class="btn btn-outline-primary" for="btncheck1">Auto generate voucher: OFF</label>
                                        <input disabled style="width: 70px" maxlength="4" onchange="AutoGenerate(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g,'');" id="numVoucher" type="text" name="number" placeholder="num">
                                    </div>
                                </div>
                                <script>
                                    var numberInputVoucher = document.getElementById('numVoucher');
                                    var target = document.getElementById("btncheck1");
                                    var prefix = "PUBLIC";
                                    function AutoGenerate(num) {
                                        if (isNaN(num))
                                            num = 0;
                                        if (num === "")
                                            num = 0;
                                        numberInputVoucher.value = num; //update number
                                        var xhttp;
                                        xhttp = new XMLHttpRequest();
                                        xhttp.onreadystatechange = function () {
                                            if (this.readyState == 4 && this.status == 200) {
                                                document.getElementById("autogeneratefield").innerHTML = this.responseText;//gen input
                                                genMultiCode(); //gen code to those inputs
                                            }
                                        };
                                        xhttp.open("get", "AutoGenerateVoucher?num=" + num, true);
                                        xhttp.send();
                                    }
                                    function changeTitleCheck() { //change title on autogenerate voucher button
                                        let title = document.getElementById("titleGenerate");
                                        if (target.checked) {
                                            title.innerHTML = "Auto generate voucher: ON";
                                            numberInputVoucher.removeAttribute("disabled");
                                        } else {
                                            title.innerHTML = "Auto generate voucher: OFF";
                                            numberInputVoucher.setAttribute("disabled", true);
                                            AutoGenerate(0); //if disabled , generate 0
                                        }
                                    }
                                    function switchType() { //handle event when user switch type
                                        let public = document.getElementById("btnradio1");
                                        let hidden = document.getElementById("btnradio2");
                                        let voucherPreview = document.getElementById("0");
                                        if (hidden.checked) {
                                            document.getElementById("3").setAttribute("disabled", true);
                                            voucherPreview.value = "COZA";
                                            prefix = "COZA";
                                            numberInputVoucher.removeAttribute("disabled");
                                            target.removeAttribute("disabled");
                                            changeTitleCheck();
                                            createPreview();
                                        }
                                        if (public.checked) {
                                            document.getElementById("3").removeAttribute("disabled");
                                            voucherPreview.value = "PUBLIC";
                                            prefix = "PUBLIC";
                                            createPreview();
                                            let min = document.getElementById(3).value;
                                            voucherPreview.value += ("__MIN" + min);
                                            numberInputVoucher.value = 0;
                                            numberInputVoucher.setAttribute("disabled", true);
                                            target.checked = false;
                                            changeTitleCheck();
                                            target.setAttribute("disabled", true);
                                            AutoGenerate(0);//if disabled , generate 0
                                        }
                                        numberInputVoucher.setAttribute("disable", true);
                                    }
                                    function changeMin() { //change min condition value 
                                        let input = document.getElementById("3").value;
                                        let code_e = document.getElementById("0");
                                        let code = code_e.value;
                                        code_e.removeAttribute("readonly");
                                        let minIndex = code.indexOf("MIN") + 3;
                                        code = code.substring(0, minIndex);
                                        code_e.value = code + input;
                                        AutoGenerate(numberInputVoucher.value);
                                    }
                                    function generateRandomString(length) {
                                        var result = '';
                                        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                                        var charactersLength = characters.length;
                                        for (var i = 0; i < length; i++) {
                                            result += characters.charAt(Math.floor(Math.random() * charactersLength));
                                        }
                                        return result;
                                    }
                                    function createPreview() {
                                        let voucherPreview = document.getElementById("0");
                                        voucherPreview.value += generateRandomString(8);
                                    }
                                    function genMultiCode() { //gen multiple set of code
                                        let codeGen = document.getElementsByClassName("code-generated");
                                        let voucherPreview = document.getElementById("0").value;
                                        for (let i = 0; i < codeGen.length; i++) {
                                            //long statement below is for repace the random part of a code
                                            codeGen[i].value = voucherPreview.substring(0, prefix.length) + generateRandomString(8) + voucherPreview.substring(prefix.length + 8, voucherPreview.length);
                                        }
                                    }
                                    function availCode(event) { // validate and un-disable the code to send to server
                                        //swal("Add successfull","New voucher has been added", "success");
                                        let voucherPreview = document.getElementById("0");
                                        voucherPreview.removeAttribute("disabled");
                                    }
                                </script>
                                <div class="col-8 mt-2" id="content">
                                    <form id="form-prime" method="post" action="voucherManagement">

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-describe">Voucher code preview</span>
                                            <input readonly disabled id="0" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-describe" name="code">
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-describe">Describe</span>
                                            <input  id="1" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-describe" required name="describe" >
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-end">Discount</span>
                                            <span style="font-size: large" class="badge bg-secondary">$</span>
                                            <input  id="2" type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" required name="discount" >
                                        </div>

                                        <!-- condition -->
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-end">Min payment condition</span>
                                            <span style="font-size: large" class="badge bg-secondary">$</span>
                                            <input onkeyup="changeMin()" id="3" type="text" oninput="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" required name="min" >
                                        </div>
                                        <!-- condition -->

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-start">Start</span>
                                            <input  id="4"  type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" required name="start" >
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-end">End</span>
                                            <input  id="5" type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end"  required name="end" >
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-end">Quantity</span>
                                            <span style="font-size: large" class="badge bg-secondary"></span>
                                            <input id="6" type="text" oninput="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-end" required name="quantity" >
                                        </div>    
                                        <!--auto generate-->
                                        <div id="autogeneratefield">

                                        </div>
                                        <!--auto generate-->
                                        <input style="display: none" name="method" value="create">
                                        <button type="button" onclick="location = ('voucherManagement')" class="btn btn-secondary">CANCEL</button>
                                        <button type="submit" onclick="availCode(event)" class="btn btn-primary">Create</button>
                                    </form>
                                    <style>
                                        .input-group-text{
                                            width: 25ch;
                                        }
                                    </style>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>switchType();</script>
                    <script src="vendor/sweetalert/sweetalert.min.js"></script>
                </div>
            </div>
        </div>
    </body>
</html>
