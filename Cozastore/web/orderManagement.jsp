<%-- 
    Document   : CustomerList
    Created on : Jun 6, 2023, 10:03:03 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale Dashboard</title>
        <!--<link rel="stylesheet" type="text/css" href="./css/admin.css">-->
        <!-- or -->
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="components/saleLeftBar.jsp"%>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="components/topbar.jsp"%>
                    <div class="content" style="padding: 40px; background-color: #e8e9ef"">
                        <div style="background-color: #FFF; padding: 16px">
                            <div class="statistic">
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>Order Time</th>
                                            <th>Order ID</th>
                                            <th>User name</th>
                                            <th>Address</th>
                                            <th>Phone</th>
                                            <th>Order Status</th>
                                            <th>Total</th>
                                            <th>Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allorder}" var="i">
                                            <tr>
                                                <td>${i.stringOrderTime}</td>
                                                <td>${i.orderId}</td>
                                                <td>${i.cusName}</td>
                                                <td>${i.address}</td>
                                                <td>${i.phone}</td>
                                                <c:if test="${i.orderStatusId == 1}">
                                                    <td class="btn btn-success">Success</td>
                                                </c:if>
                                                <c:if test="${i.orderStatusId == 2}">
                                                    <td class="btn btn-danger"> Failure </td>
                                                </c:if>
                                                <c:if test="${i.orderStatusId == 3}">
                                                    <td class="btn btn-secondary">Pending</td>
                                                </c:if>
                                                <c:if test="${i.orderStatusId == 4}">
                                                    <td class="btn btn-info">Preparing</td>
                                                </c:if>
                                                <c:if test="${i.orderStatusId == 5}">
                                                    <td class="btn btn-warning">In transit</td>
                                                </c:if>
                                                <td>${i.total}</td>
                                                <td>
                                                    <a class="btn btn-primary btn-sm edit" title="Change Status" href="ordersale?id=${i.orderId}" ><i class="fas fa-edit"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tr>
                                    </tr>
                                </table>
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
                </div>
            </div>
        </div>
        <%--<%@include file="components/dashboard_header.jsp" %>--%>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
            oTable = $('#sampleTable').dataTable({
                order: [[0, "desc"]]
            });

        </script>


    </body>
</html>
