<%-- 
    Document   : EditAccount
    Created on : Jun 18, 2023, 4:28:32 PM
    Author     : pc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Account</title>
        <link href="img/icons8-admin-settings-male-16.png" rel="icon" />
        <link rel="stylesheet" href="css/admin/edit.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet" />
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- VERTICAL NAVBAR -->
            <%@include file="../components/leftBarAdmin.jsp"%>

            <div id="content-wrapper" class="d-flex ">
                <div id="content" style="background-color: #e8e9ef; padding: 10px;">
                    <!-- TopBar -->
                    <%@include file="../components/topbar.jsp"%>
                    <!-- MAIN SECTION -->
                    <div class="container-fluid pos-relative" id="container-wrapper">
                        <h1>View Account</h1>
                        <button class="btn-submit" type="submit"><a href="userList">Back</a></button>

                        <!-- EDIT USER -->
                        <div class="edit-user">
                            <input type="hidden" name="accountID" value="${user.userID}">
                            <div class="user-info">
                                <div>
                                    <label>Full Name</label>
                                    <input style="background-color: white" type="text" name="name" value="${user.name}" disabled>
                                    <label>Phone</label>
                                    <input style="background-color: white" type="text" name="phone" value="${user.phone}" disabled>
                                </div>
                                <div>
                                    <label>Address</label>
                                    <input style="background-color: white" type="text" name="address" value="${user.address}" disabled>
                                    <label>Email</label>
                                    <input style="background-color: white" type="text" name="email" value="${user.email}" disabled>
                                </div>
                                <div>
                                    <label>Gender</label>
                                    <select name="gender" disabled>
                                        <option value="1" ${user.gender == 1 ? 'checked' : ''}>Female</option>
                                        <option value="0" ${user.gender == 0 ? 'checked' : ''}>Male</option>
                                    </select>
                                    <label>username</label>
                                    <input style="background-color: white" type="text" name="email" value="${user.userName}" disabled>
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
                                        <a href="login.jsp" class="btn btn-primary">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/main.js"></script>
    </body>
</html>
