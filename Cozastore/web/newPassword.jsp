<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Muhamad Nauval Azhar">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="This is a login page template based on Bootstrap 5">
        <title>Forgot</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <!-- reCAPTCHA Libary -->
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.2/dist/sweetalert2.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <!-- Handle form submission with jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                        <div class="text-center my-5">
                            <img src="https://th.bing.com/th/id/OIP.7ZwiAXnbCHgp29gyunHFTgHaHa?pid=ImgDet&rs=1" alt="logo" width="100">
                        </div>
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">New Password</h1>
                                <form action="resetnewpass" method="POST">
                                    <div class="mb-3">
                                        <input id="email" type="email" class="form-control" name="email" value="${sessionScope.email}" hidden="">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2" for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])\S{8,}$" title="Please enter a password that includes at least one uppercase letter, one lowercase letter, one number, no spaces, and is a minimum of 8 characters long." value="<c:if test="${not empty retainData.password}">${retainData.password}</c:if>"required autofocus>
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2" for="repassword">Confirm Password</label>
                                        <input id="repassword" type="password" class="form-control" name="repassword" value="<c:if test="${not empty retainData.password}">${retainData.repassword}</c:if>"required>
                                         
                                    </div>
                                    <div class="g-recaptcha"
                                         data-sitekey="6LfouzsmAAAAAJDQaLntSewKP-T6XU_ikVnd-YbX"></div>
                                    <br>
                                    <div class="d-flex align-items-center">
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Reset password	
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <script src="assets/js/login.js"></script>
        <% String message = (String) request.getAttribute("errorString"); %>
        <% if (message != null) {%>
        <script>
            Swal.fire({
                title: '<%= message%>',
                icon: 'error'
            });
        </script>
        <% }%>
</html>
