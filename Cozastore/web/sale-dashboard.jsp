<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="images/icons/favicon.png" rel="icon">
        <title>RuangAdmin - Dashboard</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
    </head>
    <style>
        .pointer {
            cursor: pointer;
            color: white !important;
        }
    </style>
    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="components/saleLeftBar.jsp"%>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="components/topbar.jsp"%>
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <div>
                                <a href="download" class="btn btn-primary pointer"> <i class="fa fa-download"></i>  Product Excel</a>
                                <a href="downloadorder" class="btn btn-primary pointer"> <i class="fa fa-download"></i>  Order Excel</a>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Revenue (Monthly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$${requestScope.revenue}</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <c:if test="${requestScope.compareRevenue >= 0}">
                                                        <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> ${requestScope.compareRevenue}%</span>
                                                        <span>Since last month ($${requestScope.revenueLastMonth})</span>
                                                    </c:if>
                                                    <c:if test="${requestScope.compareRevenue < 0}">
                                                        <span class="text-danger mr-2"><i class="fa fa-arrow-down"></i> ${requestScope.compareRevenue}%</span>
                                                        <span>Since last month ($${requestScope.revenueLastMonth})</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earnings (Annual) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Profits (Monthly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$${requestScope.profit}</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <c:if test="${requestScope.compareProfit >= 0}">
                                                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> ${requestScope.compareProfit}%</span>
                                                        <span>Since last month ($${requestScope.profitLastMonth})</span>
                                                    </c:if>
                                                    <c:if test="${requestScope.compareProfit < 0}">
                                                        <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> ${requestScope.compareProfit}%</span>
                                                        <span>Since last month ($${requestScope.profitLastMonth})</span>
                                                    </c:if>

                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-money-bill fa-2x text-success"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- New User Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Sold (Monthly)</div>
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${requestScope.numberOrder}</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <c:if test="${requestScope.compareOrderCheck >= 0}">
                                                        <span class="text-success mr-2">More than last month ${requestScope.compareOrder}</span>
                                                        <span>Since last month (${requestScope.numberOrderLastMonth})</span>
                                                    </c:if>
                                                    <c:if test="${requestScope.compareOrderCheck < 0}">
                                                        <span class="text-danger mr-2">Less than last month ${requestScope.compareOrder}</span>
                                                        <span>Since last month (${requestScope.numberOrderLastMonth})</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-cart-plus fa-2x text-info"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-uppercase mb-1">Pending Requests</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.numberPending}</div>
                                                <div class="mt-2 mb-0 text-muted text-xs">
                                                    <span class="text-danger mr-2"> There are ${requestScope.numberPending} orders without processing</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-warning"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Monthly Recap Report (${requestScope.year})</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area" >
                                            <canvas id="myAreaChart" style="width: 100%; height: 100%;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Order In Month (${requestScope.time})</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area" >
                                            <canvas id="myPieChart" style="width: 100%; height: 100%;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Invoice Example -->
                            <div class="col-xl-8 col-lg-7 mb-4">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Products Sold</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle btn btn-primary btn-sm" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                ${requestScope.productSoldType != "year" ? "Month":"This Year"} <i class="fas fa-chevron-down"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Select Periode</div>
                                                <a class="dropdown-item ${requestScope.productSoldType != "year" ? "active":""}" href="sale-dashboard">Month</a>
                                                <a class="dropdown-item ${requestScope.productSoldType == "year" ? "active":""}" href="sale-dashboard?productSold=year">This Year</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body" id="topProduct">
                                        <c:set value="${requestScope.totalQuantityInMonth}" var="totalQuantityInMonth"></c:set>
                                        <c:forEach items="${requestScope.products}" var="product">
                                            <div class="mb-3 product">
                                                <div class="small text-gray-500">${product.productName}
                                                    <div class="small float-right"><b>${product.totalQuantity} of ${totalQuantityInMonth} Items</b></div>
                                                </div>
                                                <div class="progress" style="height: 12px;">
                                                    <div class="progress-bar bg-info" role="progressbar" style="width: ${(product.totalQuantity/totalQuantityInMonth)*100}%" aria-valuenow="${(product.totalQuantity/totalQuantityInMonth)*100}"
                                                         aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="card-footer text-center">
                                        <a class="m-0 small text-primary card-link" onclick="viewMore()" style="cursor: pointer;">View More <i
                                                class="fas fa-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--Row-->


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
                    <!---Container Fluid-->
                </div>

            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>


        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/ruang-admin.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        
        
        <script>
                                            const ctx = document.getElementById('myAreaChart');
                                            const labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                                            const data = {
                                            labels: labels,
                                                    datasets: [
                                                    {
                                                    label: 'Revenue',
                                                            data: [<c:forEach items="${requestScope.revenueChart}" var="money">
                ${money},
            </c:forEach>],
                                                            borderColor: "rgb(255, 99, 132)",
                                                            backgroundColor: "rgba(255, 99, 132,0)",
                                                    },
                                                    {
                                                    label: 'Profit',
                                                            data: [<c:forEach items="${requestScope.profitChart}" var="money">
                ${money},
            </c:forEach>]
                                                            ,
                                                            borderColor: "rgb(54, 162, 235)",
                                                            backgroundColor: "rgba(54, 162, 235, 0)",
                                                    }
                                                    ]
                                            };
                                            new Chart(ctx, {
                                            type: 'line',
                                                    data: data,
                                                    options: {
                                                    responsive: true,
                                                            plugins: {
                                                            legend: {
                                                            position: 'top',
                                                            },
                                                                    title: {
                                                                    display: true,
                                                                            text: 'Chart.js Line Chart'
                                                                    }
                                                            }
                                                    },
                                            });
        </script>  
        <script>
            const ctx2 = document.getElementById('myPieChart');
            const data2 = {
            labels: [
                    'Successfull',
                    'Fail',
                    'Pending',
                    'Preparing',
                    'Shipping'
            ],
                    datasets: [{
                    label: 'My First Dataset',
                            data: [<c:forEach items="${requestScope.orderPieChart}" var="order">
                ${order},
            </c:forEach>],
                            backgroundColor: [
                                    'rgb(61, 237, 152)',
                                    'rgb(255, 99, 132)',
                                    'rgb(255, 205, 86)',
                                    'rgb(54, 162, 235)',
                                    'rgb(129, 66, 255)',
                            ],
                            hoverOffset: 4
                    }]
            };
            new Chart(ctx2, {
                    type: 'pie',
                    data: data2,
            })
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
            function viewMore() {
            var amount = document.getElementsByClassName("product").length;
            $.ajax({
            url: "/cozastore/dashboard-view-more",
                    type: "get",
                    data: {
                    amount: amount,
                            totalQuantityInMonth: ${requestScope.totalQuantityInMonth},
                            productSold: "${requestScope.productSoldType}",
                    },
                    success: function (data) {
                    var row = document.getElementById("topProduct");
                    row.innerHTML += data;
                    },
            });
            }
        </script>
    </body>

</html>