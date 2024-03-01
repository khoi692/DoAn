<%-- 
    Document   : login
    Created on : May 16, 2023, 5:51:46 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Playfair+Display:wght@600;700&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
              rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="js/animate/animate.min.css" rel="stylesheet">
        <link href="js/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link rel="stylesheet" href="css/style.css">
        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
        <style>
            .jnotification {
                position: absolute;
                z-index: 10000;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                top: 0px;
                right: 0px;
            }
        </style>
    </head>

    <body class="bo">
        <!-- Header -->
        <header>
            <div>
                <a href="home">
                    <img class="logo_login" style="padding: 50px 50px 25px 50px" src="./assets/images/logo-01.png" alt="Logo"/>
                </a>
            </div>
        </header>

        <!-- Spinner Start -->
        <div id="spinner"
             class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>

        </div>
        <!-- Spinner End -->

        <div class="container-xxl py-6 mt-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="row img-twice position-relative h-100">
                            <div class="col-6">
                                <img class="img-fluid rounded" src="./images/login/about-1.jpg" alt="" />
                            </div>
                            <div class="col-6 pt-6">
                                <img class="img-fluid rounded" src="./images/login/about-2.jpg" alt="" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1 wow fadeInUp" data-wow-delay="0.5s"></div>
                    <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="h-100">
                            <span class="navbar-brand ms-4 ms-lg-0">
                                <h1 class=" m-0 text-center">Welcome Back</h1>
                            </span>
                            <p style="text-align: center"><b>Good to see you again!</b></p>
                            <form action="login" method="post">
                                <div class="row g-2">

                                    <div class="col-12">
                                        <div class="gradient-border" id="box"></div>
                                        <div class="form-floating">
                                            <input type="email" class="form-control text-primary" id="email"
                                                   placeholder="Your Email" name="email">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="gradient-border" id="box"></div>
                                         <div class="form-floating">
                                            <input id="password" type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])\S{8,}$" title="Please enter a password that includes at least one uppercase letter, one lowercase letter, one number, no spaces, and is a minimum of 8 characters long" class="form-control text-primary" name="passWord" placeholder="Your password" required />
                                            <label for="password">Password</label>
                                        </div>
                                    </div>

                                    <!-- Capcha -->
                                    <div class="g-recaptcha" 
                                         data-sitekey="6LfouzsmAAAAAJDQaLntSewKP-T6XU_ikVnd-YbX"></div>
                                    <br/>

                                    <br> <br>

                                    <p class="forget">Forgot Password ? <a href="resetpassword">Click
                                            Here</a></p>
                                    <p class="forget">Don't have an account ? <a href="register">Sign up</a>
                                    </p>

                                    <div class="col-12 text-center">
                                        <div class="gradient-border" id="box"></div>
                                        <button class="btn btn-primary rounded-pill py-3 px-5"
                                                type="submit">Login</button>
                                    </div>
                                </div>
                            </form>
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
        <script src="js/mainLRR.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var i = '${requestScope.mess}';
                if (i.length > 0) {
                    jSuites.notification({
                        error: 1,
                        name: 'Error message',
                        message: '${requestScope.mess}',
                    })
                }
            })
        </script>
</html>
