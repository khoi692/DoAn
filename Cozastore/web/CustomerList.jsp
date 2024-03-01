<%-- 
    Document   : CustomerList
    Created on : Jun 6, 2023, 10:03:03 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marketing Dashboard</title>
        <link rel="stylesheet" type="text/css" href="./css/admin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
            #wrapper {
                display: flex;
            }
            .content {
                flex-grow: 1;
            }
            .content-margin {
                margin: 20px;
            }
        </style>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="../components/leftBar.jsp"%>
            <div class="content" style=" background-color: #e8e9ef"">
                <%@include file="../components/topbar.jsp"%>
                <div class="content-margin">
                    <div style="background-color: #FFF; padding: 0px 16px 0px 16px">
                        <div class="statistic">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>Full name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <!--<th>Status</th>-->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="i">
                                        <tr>
                                            <td>${i.name}</td>
                                            <td>${i.email}</td>
                                            <td>${i.gender eq 1? 'Male' : 'Female'}</td>
                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Detail" id="show-emp" data-toggle="modal"
                                                        data-target="#ModalUP" onclick="getData('${i.userID}')"><i class="fas fa-edit"></i></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tr>
                                </tr>
                            </table>
                        </div>
                        <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                             data-keyboard="false">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">

                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="form-group  col-md-12">
                                                <span class="thong-tin-thanh-toan">
                                                    <h5>User Information</h5>
                                                </span>
                                            </div>
                                        </div>
                                        <div id="updatesp">

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="./js/jquery-3.2.1.min.js"></script>
        <script src="./js/popper.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="./js/plugins/dataTables.bootstrap.min.js"></script>

        <script>
                                                        var table;
                                                        var list = ['Username', 'Email',
                                                            'Gender'];
                                                        $(document).ready(function () {
                                                            $('#sampleTable thead tr').clone(true)
                                                                    .addClass('filters')
                                                                    .appendTo('#sampleTable thead');
                                                            table = $('#sampleTable').DataTable(
                                                                    {
                                                                        "bDestroy": true,
                                                                        orderCellsTop: true,
                                                                        fixedHeader: true,
                                                                        initComplete: function () {
                                                                            var api = this.api();
                                                                            api
                                                                                    .columns()
                                                                                    .eq(0)
                                                                                    .each(function (colIdx) {
                                                                                        var cell = $('.filters th').eq(
                                                                                                $(api.column(colIdx).header()).index()
                                                                                                );
                                                                                        var title = $(cell).text();
                                                                                        if (colIdx < 2) {
                                                                                            $(cell).html('<input type="text" placeholder="' + title + '" \n\
                                                                                                id="' + list[colIdx] + '" style="width: 200px" onchange="searchProduct()"/>');
                                                                                        }
                                                                                        if (colIdx === 2) {
                                                                                            $(cell).html('<select style="width: 100px; height: 28px" id="gender" onchange="searchProduct()"> \n' +
                                                                                                    '<option selected></option>' +
                                                                                                    '<option value="1">Male</option>' +
                                                                                                    '<option value="2">Female</option>' +
                                                                                                    '</select>'
                                                                                                    );
                                                                                        }
//                                                                                    if (colIdx === 3) {
//                                                                                        $(cell).html('<select style="width: 100px; height: 28px" id="status" onchange="searchProduct()" > \n' +
//                                                                                                '<option selected></option>' +
//                                                                                                '<option value="1">Active</option>' +
//                                                                                                '<option value="2">Deactive</option>' +
//                                                                                                '</select>'
//                                                                                                );
//                                                                                    }
                                                                                    });
                                                                        }
                                                                    }
                                                            )
                                                        });
                                                        window.onload = function () {
                                                            sortTable(3, 'desc');
                                                        };

                                                        oTable = $('#sampleTable').dataTable();
                                                        function sortTable(columnIndex, order) {
                                                            var table, rows, switching, i, x, y, shouldSwitch;
                                                            table = document.querySelector("table");
                                                            switching = true;
                                                            while (switching) {
                                                                switching = false;
                                                                rows = table.rows;
                                                                for (i = 1; i < (rows.length - 1); i++) {
                                                                    shouldSwitch = false;
                                                                    x = rows[i].getElementsByTagName("TD")[columnIndex];
                                                                    y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                                                                    if (!isNaN(x.innerHTML) && !isNaN(y.innerHTML)) {
                                                                        // Compare as numbers
                                                                        if (order === 'asc' && Number(x.innerHTML) > Number(y.innerHTML)) {
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        } else if (order === 'desc' && Number(x.innerHTML) < Number(y.innerHTML)) {
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        }
                                                                    } else {
                                                                        // Compare as strings
                                                                        if (order === 'asc' && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        } else if (order === 'desc' && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        }
                                                                    }
                                                                }
                                                                if (shouldSwitch) {
                                                                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                                                                    switching = true;
                                                                }
                                                            }
                                                        }


        </script>

        <script>
            const ctx = document.getElementById('myChart');

            function getData(i) {
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/getUserByID',
                    data: {
                        id: i
                    },
                    success: function (data, textStatus, jqXHR) {
                        $('#updatesp').html(data);
                    }
                })
            }


            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
                    datasets: [{
                            label: 'Revenue by day',
                            data: [${sessionScope.weekRevenue.get(0)},
            ${sessionScope.weekRevenue.get(1)},
            ${sessionScope.weekRevenue.get(2)},
            ${sessionScope.weekRevenue.get(3)},
            ${sessionScope.weekRevenue.get(4)}],
//            ${sessionScope.weekRevenue.get(5)},
//            ${sessionScope.weekRevenue.get(6)}],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            function searchProduct() {
                var username = $('#Username').val();
                var email = $('#Email').val();
                var gender = $('#gender').val();
//                var status = $('#status').val();
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/UserListController',
                    data: {
                        username: username,
                        email: email,
//                        status: status,
                        gender: gender
                    },
                    dataType: "json",
                    success: function (data, textStatus, jqXHR) {
                        table.clear();
                        for (let idx = 0; idx < data.length; idx++) {
                            table.row.add({
                                0: data[idx].name,
                                1: data[idx].email,
                                2: '<span>' + (data[idx].gender > 0 ? 'Male' : 'Female') + '</span>',
//                                3: '<span>' + (data[idx].status > 0 ? 'Active' : 'Deactive') + '</span>',
                                3: '<button class="btn btn-primary btn-sm edit" type="button" title="Detail" id="show-emp" data-toggle="modal" data-target="#ModalUP" onclick="getData(' + data[idx].userID + ')"><i class="fas fa-edit"></i></button>'
                            })
                        }
                        table.draw(false)
                    }
                })
            }
        </script>
    </body>
</html>
