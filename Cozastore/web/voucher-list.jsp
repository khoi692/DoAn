<%-- 
    Document   : voucher-list
    Created on : Jun 17, 2023, 9:22:25 AM
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
                        var order = -1;
                        var attr = "quantity";
                        var page = 1;
                        var numPerPage = 20;
                        var status = 10;
                        var type = "";
                        var total_rows = 0;

                        function changeContent() {
                            var xhttp;
                            xhttp = new XMLHttpRequest();
                            xhttp.onreadystatechange = function () {
                                if (this.readyState == 4 && this.status == 200) {
                                    document.getElementById("table-content").innerHTML = this.responseText;
                                    total_rows = document.getElementById("query-row").value;
                                    pagination(total_rows);
                                    //console.log("VoucherAjax?attr=" + attr + "&orderby=" + order + "&page=" + page + "&numPerPage=" + numPerPage + "&status=" + status + "&type=" + type);
                                }
                            };
                            xhttp.open("get", "VoucherAjax?attr=" + attr + "&orderby=" + order + "&page=" + page + "&numPerPage=" + numPerPage + "&status=" + status + "&type=" + type, true);
                            xhttp.send();
                        }

                        function search(key) {
                            type = key;
                            page = 1;
                            changeContent();
                        }

                        function sort(attribute) {
                            attr = attribute;
                            order = order * -1;
                            page = 1;
                            changeContent();
                        }

                        function changeType(tp) {
                            type = tp;
                            page = 1;
                            changeContent();
                        }

                        function changeStatus(stt) {
                            status = stt;
                            page = 1;
                            changeContent();
                        }

                        function changePage(num) {
                            //pagination(rows);
                            page = num;
                            changeContent();
                            pagination(total_rows);
                        }
                        function changePerPage(num) {
                            //pagination(rows);
                            numPerPage = num;
                            page = 1;
                            changeContent();
                            pagination(total_rows);
                        }
                        function pagination(initial_rows) { //create pagination button
                            const myDiv = document.getElementById('pagination');
                            //emty the pagination box
                            myDiv.innerHTML = '';
                            // Create a new button element
                            var number_Per_Page = document.getElementById("numberPerPage").value;
                            var rows = initial_rows;
                            var pages = Math.ceil(rows / number_Per_Page);
                            for (let i = 1; i <= pages; i++) {
                                let button = document.createElement('button');
                                button.classList.add('btn');
                                if (i == page)
                                    button.classList.add('btn-primary');
                                else
                                    button.classList.add('btn-secondary');
                                button.classList.add('col-1');
                                button.addEventListener('click', function () {
                                    changePage(i);
                                });
                                button.innerText = i;
                                myDiv.appendChild(button);
                            }
                        }
                        function deleteVoucher(code) {
                            var result = confirm("Are you sure you want to delete this item?");
                            if (result == true) {
                                var xhttp;
                                xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        document.getElementById("table-content").innerHTML = this.responseText;
                                        total_rows = document.getElementById("query-row").value;
                                        pagination(total_rows);
                                    }
                                };
                                xhttp.open("get", "VoucherAjax?delete=true&code=" + code + "&attr=" + attr + "&orderby=" + order + "&page=" + page + "&numPerPage=" + numPerPage + "&status=" + status + "&type=" + type, true);
                                xhttp.send();
                            }
                        }
                        function deleteAllUnavailableVoucher() {
                            var result = confirm("Are you sure you want to delete all unavailable vouchers?");
                            if (result == true) {
                                var xhttp;
                                xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        document.getElementById("table-content").innerHTML = this.responseText;
                                        total_rows = document.getElementById("query-row").value;
                                        pagination(total_rows);
                                    }
                                };
                                xhttp.open("get", "VoucherAjax?deleteAllUnavail=true&attr=" + attr + "&orderby=" + order + "&page=" + page + "&numPerPage=" + numPerPage + "&status=" + status + "&type=" + type, true);
                                xhttp.send();
                            }
                        }
                    </script>
                    <div class="row">
                        <h1 class="pb-2 pt-2 col-6">Voucher management</h1>
                        <div class="col-6">
                            <div class="input-group mb-3 pb-0">
                                <span class="input-group-text" id="inputGroup-sizing-default">Display</span>
                                <input onchange="changePerPage(this.value)" id="numberPerPage" type="number" value="20" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <span class="input-group-text">Per page</span>
                                <button onclick="deleteAllUnavailableVoucher()" class="btn btn-danger" style="z-index: 1">Delete all unavailable voucher</button>
                            </div>
                            <div style="justify-content: flex-end;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group me-2 p-5 pb-0 pt-0 row" id="pagination" role="group" aria-label="First group">
                                    <script>pagination(${requestScope.rows});</script>
                                    <!--                                    <button type="button" class="btn btn-primary">1</button>
                                                                        <button type="button" class="btn btn-primary">2</button>
                                                                        <button type="button" class="btn btn-primary">3</button>
                                                                        <button type="button" class="btn btn-primary">4</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" card text-center">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="true" href="#">Voucher list</a>
                                </li>
                                <li class="nav-item">
                                    <a href="voucherManagement?direct=voucher-add-new" class="nav-link">Add new voucher</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="inputGroupSelect01">Status</label>
                                <select onchange="changeStatus(this.value)" name ="status" class="form-select" id="inputGroupSelect01">
                                    <option selected value="10">All</option>
                                    <option value="1">Available</option>
                                    <option value="0">On waiting</option>
                                    <option value="-1">Expired</option>
                                    <option value="-2">Used up</option>
                                </select>
                                <label class="input-group-text" for="inputGroupSelect02">Type</label>
                                <select onchange="changeType(this.value)" name="type" class="form-select" id="inputGroupSelect02">
                                    <option value="" selected>All</option>
                                    <option value="PUBLIC">Public</option>
                                    <option value="COZA">Hidden</option>
                                </select>

                                <label class="input-group-text" for="search-by-code">Search</label>
                                <input onkeyup="search(this.value)" name="type" class="form-control" id="search-by-code" placeholder="input code">
                            </div>

                            <table class="table table-bordered border-primary table-striped-columns">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Code
                                            <button onclick="sort('Code')" class="btn btn-outline-dark">
                                                <i class="bi bi-sort-down"></i>
                                            </button>
                                        </th>
                                        <th scope="col">Quantity
                                            <button onclick="sort('quantity')" class="btn btn-outline-dark">
                                                <i class="bi bi-sort-down"></i>
                                            </button>
                                        </th>
                                        <th scope="col">Describe</th>
                                        <th scope="col">Discount
                                            <button onclick="sort('discount')" class="btn btn-outline-dark">
                                                <i class="bi bi-sort-down"></i>
                                            </button>
                                        </th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="table-content">
                                <script>changeContent();</script>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Modal Logout -->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to logout?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                <a href="logout" class="btn btn-primary">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
