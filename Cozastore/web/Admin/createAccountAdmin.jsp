
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Create Account</title>
        <link rel="stylesheet" href="css/admin/edit.css" />
        <link href="img/icons8-admin-settings-male-16.png" rel="icon" />
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/product-manage.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Symbols+Outlined" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link rel="stylesheet" href="css/style.css" />
        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />

        <style>
            .jnotification {
                position: absolute;
                z-index: 10000;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                top: 70px;
                right: 0px;
            }

        </style>

    </head>
    <body id="page-top">
        <div  id="wrapper">
            <%@include file="../components/leftBarAdmin.jsp"%>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content" style="background-color: #e8e9ef; padding: 10px;">
                    <%@include file="../components/topbar.jsp"%>
                    <div class="container-fluid pos-relative" id="container-wrapper">
                        <h1>Create Account</h1>

                        <div class="recent-orders">
                            <form action="create-account" method="post" onsubmit="checkValidation(event)">
                                <label for="">Create account for</label>
                                <select name="roles">
                                    <c:forEach items="${roles}" var="r">
                                        <option value="${r.roleId}" ${selectedId==r.roleId?"selected":""}>${r.roleName}
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="form row" style="margin-top: 24px"> 
                                    <div class="col-md-12">
                                        <input type="text" id="fullname" name="FullName" placeholder="Full Name" required />
                                    </div>

                                    <div class="col-md-6">
                                        <input type="text" title="Phone numbers to start with '0' and consist of 10 numbers" pattern="0\d{9}"
                                               id="phone" name="phone" placeholder="Phone" required />
                                    </div>
                                    <div class="col-md-6">
                                        <input oninput="blankAlert(this.value)" type="email" name="email" placeholder="Email" required>
                                    </div>
                                    <div class="col-md-6">
                                        <div style="margin-left: 20px; text-align: left; font-size: 1rem; height: 58px; line-height: 58px; display: flex; align-items: center;">
                                            <label style="display: flex; align-items: center; margin-right: 20px;">
                                                <input type="radio" name="gender" value="Male" checked>
                                                <span style="margin-left: 5px;">Male</span>
                                            </label>
                                            <label style="display: flex; align-items: center;">
                                                <input type="radio" name="gender" value="Female">
                                                <span style="margin-left: 5px;">Female</span>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <input type="text" id="address" name="address" placeholder="Address" required />
                                    </div>
                                    <div class="col-md-6">
                                        <input type="password" placeholder="Password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])\S{8,}$" 
                                               title="Please enter a password that includes at least one uppercase letter, one lowercase letter, one number, no spaces, and is a minimum of 8 characters long" id="password" name="password" required>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="password" placeholder="Confirm your Password" id="repassword" name="repassword" required >

                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn-submit" type="submit">Create</button>
                                    </div>
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
                </div>
            </div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/wow/wow.min.js"></script>
        <script src="js/easing/easing.min.js"></script>
        <script src="js/waypoints/waypoints.min.js"></script>
        <script src="js/counterup/counterup.min.js"></script>
        <script src="js/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/app.js"></script>
        <script type="text/javascript">
                                $(document).ready(function () {
                                    var i = '${requestScope.error}';
                                    if (i.length > 0) {
                                        jSuites.notification({
                                            error: 1,
                                            name: 'Error message',
                                            message: i,
                                        })
                                    }
                                });

                                function passIdentical(repass, pass) {
                                    if (repass === pass) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }

                                function checkValidation(e) {
                                    const passInputValue = document.getElementById("password").value;
                                    const repassInputValue = document.getElementById("repassword").value;
                                    if (passIdentical(passInputValue, repassInputValue) === false) {
                                        jSuites.notification({
                                            error: 1,
                                            name: 'Error message',
                                            message: 'Confirm password does not match.',
                                        });
                                        e.preventDefault();
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }
        </script>
    </body>
</html>
