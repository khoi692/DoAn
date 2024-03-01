<%-- 
    Document   : about
    Created on : May 22, 2023, 4:39:13 PM
    Author     : khois
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body class="animsition">

        <!-- Header -->
        <%@include file="components/header.jsp"%>
        <!-- Title page -->
        <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/page/bg-01.jpg');">
            <h2 class="ltext-105 cl0 txt-center">
                About
            </h2>
        </section>	


        <!-- Content page -->
        <section class="bg0 p-t-75 p-b-120">
            <div class="container">
                <div class="row p-b-148">
                    <div class="col-md-7 col-lg-8">
                        <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
                            <h3 class="mtext-111 cl2 p-b-16">
                                Our Story
                            </h3>

                            <p class="stext-113 cl6 p-b-26">
                                "CozaStore - Where Confidence and Style Meet"
                            </p>

                            <p class="stext-113 cl6 p-b-26">
                                CozaStore is a unique fashion store located in the old town, attracting customers with its bright and colorful space. It is not just a shopping destination but also a source of inspiration for personal style.
                            </p>

                            <p class="stext-113 cl6 p-b-26">
                                With a diverse range of products from everyday wear to party outfits, CozaStore caters to every customer's needs. The dedicated staff provides attentive advice and helps customers find suitable items.
                            </p>
                            
                            <p class="stext-113 cl6 p-b-26">
                                CozaStore also organizes fashion events and workshops for customers to interact with fashion experts. What sets it apart is the commitment to environmental protection and sustainable development.
                            </p>
                            
                            <p class="stext-113 cl6 p-b-26">
                                CozaStore is more than just a store; it is a community of style enthusiasts who respect the environment. That's the special thing about CozaStore, where people not only shop but also find passion and confidence in expressing their own unique style.
                            </p>
                        </div>
                    </div>

                    <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
                        <div class="how-bor1 ">
                            <div class="hov-img0">
                                <img src="images/about/about-01.jpg" alt="IMG">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="order-md-2 col-md-7 col-lg-8 p-b-30">
                        <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
                            <h3 class="mtext-111 cl2 p-b-16">
                                Our Mission
                            </h3>

                            <p class="stext-113 cl6 p-b-26">
                                Providing diverse choices: CozaStore is committed to offering a wide range of fashion products, from everyday wear to party outfits, helping customers find items that suit their style and personal preferences.
                            <br/><br/>
                                Style and trend consultation: CozaStore's staff members are fashion advisors who are ready to assist customers in selecting clothing and creating a unique style. They provide information on the latest fashion trends and suggest suitable outfits.
                            <br/><br/>
                                Enjoying customer care services: CozaStore creates a friendly and professional environment where customers are treated with utmost care. The staff members are always ready to listen and meet the needs of customers, ensuring that every shopping experience is smooth and comfortable.
                            <br/><br/>
                                Promoting sustainable fashion: CozaStore is committed to supporting sustainable fashion brands and choosing products that have environmentally-friendly origins and production methods, optimizing resources. This helps customers contribute to environmental protection and build a more responsible fashion industry.
                            </p>

                            <div class="bor16 p-l-29 p-b-9 m-t-22">
                                <p class="stext-114 cl6 p-r-40 p-b-11">
                                    Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn't really do it, they just saw something. It seemed obvious to them after a while.
                                </p>

                                <span class="stext-111 cl8">
                                    - Steve Job’s 
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
                        <div class="how-bor2">
                            <div class="hov-img0">
                                <img src="images/about/about-02.jpg" alt="IMG">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	



        <!-- Footer -->
        <%@include file="components/footer.jsp"%>
        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>

        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            })
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false,
                });

                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
