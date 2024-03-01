<%-- 
    Document   : DashBoard
    Created on : Jun 18, 2023, 3:41:36 PM
    Author     : pc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Management</title>
        <link href="img/icons8-admin-settings-male-16.png" rel="icon" />
        <link rel="stylesheet" href="css/admin/manage.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet" />
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- VERTICAL NAVBAR -->
            <%@include file="../components/leftBarAdmin.jsp"%>

            <!-- MAIN SECTION -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content" style="background-color: #e8e9ef; padding: 10px;">
                    <!-- TopBar -->
                    <%@include file="../components/topbar.jsp"%>
                    <div class="container-fluid pos-relative" id="container-wrapper">

                        <h1>Manage Accounts</h1>

                        <!-- USER TABLE -->
                        <div class="recent-orders">
                            <form action="manageAdmin" method="post">
                                <select name="roles" onchange="this.form.submit()">
                                    <option value="0" ${selectedId==r.roleId?"selected":""}>All account</option>
                                    <c:forEach items="${listRole}" var="r">
                                        <option value="${r.roleId}" ${selectedId==r.roleId?"selected":""}>
                                            ${r.roleName}
                                        </option>
                                    </c:forEach>
                                </select>
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">Account ID</th>
                                            <th style="text-align: center">Email</th>
                                            <th style="text-align: center">Status</th>
                                            <th colspan="2" style="text-align: center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUser}" var="a">
                                            <tr>
                                                <td>${a.userID}</td>
                                                <td>${a.email}</td>
                                                <td>
                                                    <c:if test="${a.status == true}">
                                                        Active
                                                    </c:if>
                                                    <c:if test="${a.status == false}">
                                                        Inactive
                                                    </c:if>
                                                </td>
                                                <td class="primary cta-btn"><a
                                                        href="editaccount?aid=${a.userID}">View</a></td>
                                                <td class="" style="width: 7rem">
                                                    <c:if test="${!a.status}">
                                                        <a href="updatestatus?aid=${a.userID}&status=1"
                                                           style="color: #41f1b6">Authorize</a>
                                                    </c:if>
                                                    <c:if test="${a.status}">
                                                        <a href="updatestatus?aid=${a.userID}&status=0"
                                                           style="color: #fc515f">Unauthorize</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
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
                                        <a href="login.jsp" class="btn btn-primary">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <script src="js/seller.js"></script> -->
                    </body>
                    </html>
