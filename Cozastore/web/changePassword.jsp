<%-- 
    Document   : changePassword
    Created on : May 24, 2023, 12:10:46 PM
    Author     : khois
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change your password</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" id="bootstrap-css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <!-- Handle form submission with jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="css/userprofile.css">
        <style>
            .button-59 {
                align-items: center;
                background-color: #fff;
                border: 2px solid #000;
                box-sizing: border-box;
                color: #000;
                cursor: pointer;
                display: inline-flex;
                fill: #000;
                font-family: Inter,sans-serif;
                font-size: 16px;
                font-weight: 600;
                height: 48px;
                justify-content: center;
                letter-spacing: -.8px;
                line-height: 24px;
                min-width: 140px;
                outline: 0;
                padding: 0 17px;
                text-align: center;
                text-decoration: none;
                transition: all .3s;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
            }

            .button-59:focus {
                color: #171e29;
            }

            .button-59:hover {
                border-color: #06f;
                color: #06f;
                fill: #06f;
            }

            .button-59:active {
                border-color: #06f;
                color: #06f;
                fill: #06f;
            }

            @media (min-width: 768px) {
                .button-59 {
                    min-width: 170px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp"%>
        <br/>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row" style="justify-content: center">
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <form action="changepassword" method="post">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Change Password</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Username</label><input type="text" class="form-control"  value="${sessionScope.account.userName}" readonly=""></div>
                                <div class="col-md-12"><label class="labels">Current Password</label><input type="password" class="form-control" id="current-password" name="current-password" value="<c:if test="${not empty retainData.password}">${retainData.password}</c:if>" required autofocus></div>
                                <div class="col-md-12"><label class="labels">New Password*</label><input type="password" class="form-control" id="new-password" name="new-password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])\S{8,}$" title="Please enter a password that includes at least one uppercase letter, one lowercase letter, one number, no spaces, and is a minimum of 8 characters long." value="<c:if test="${not empty retainData.newPassword}">${retainData.newPassword}</c:if>" required autofocus></div>
                                <div class="col-md-12"><label class="labels">Confirm Password</label><input type="password" class="form-control" id="confirm-password" name="confirm-password" value="<c:if test="${not empty retainData.repassword}">${retainData.repassword}</c:if>" required autofocus></div>
                                    
                                </div><br/>
                                <div class="g-recaptcha" 
                                     data-sitekey="6LfouzsmAAAAAJDQaLntSewKP-T6XU_ikVnd-YbX"></div>
                                <br/>
                                <div class="mt-5 text-center"> <span class="text-black-50">♥After the change you will have to log in again to make sure it's you♥</span></div>
                                <div class="mt-5 text-center"><input class="button-59" type="submit" value="Save Change"></div>
                                <div class="mt-2 text-center"><a href="userprofile" style="color: grey"><-- Back to profile</a></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <% String message = (String) request.getAttribute("error"); %>
        <% if (message != null) {%>
        <script>
            Swal.fire({
                title: '<%= message%>',
                icon: 'error'
            });
        </script>
        <% }%>
        <!-- Footer -->
        <%@include file="components/footer.jsp"%>
    </body>
</html>
