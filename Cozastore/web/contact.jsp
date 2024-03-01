<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact</title>
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
        <style>
            /* toast */
            .toast{
                position: fixed;
                top: 32px;
                right: 32px;
                animation: slide ease 1s, fadeOut linear 1s 4s forwards;
            }

            .toast-message{
                align-items: center;
                justify-content: space-between;
                background-color: white;
                border-radius: 2px;
                padding: 10px 0px;
                min-width: 350px;
                max-width: 400px;

            }

            .toast-message + .toast-message{
                margin-top: 10px;
            }

            .toast-icon,
            .toast-close {
                font-size: 24px;
                padding: 0 16px;
            }

            .toast-body{
                flex-grow: 1;
            }

            .title{
                font-size: 18px;
                margin-bottom: 5px;
                color: #000;
            }

            .message{
                font-size: 16px;
                opacity: 0.8;
                color: #000;
            }

            .toast-close {
                color: #000;
                cursor: pointer;
            }

            .toast-success {
                border-left: 4px solid rgb(71, 240, 71);
                color: rgb(71, 240, 71);
            }

            .toast-failure {
                border-left: 4px solid #8aff73;
                color: #8aff73;
            }

            @keyframes slide {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            @keyframes fadeOut {
                to{
                    opacity: 0;
                }
            }
            .sold-out{
                opacity: 0.5;
            }
            .no-click {
                cursor: not-allowed !important;
            }
        </style>
    </head>
    <body class="animsition">

        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->

        <!-- Cart -->
        <div class="wrap-header-cart js-panel-cart">
            <div class="s-full js-hide-cart"></div>

            <div class="header-cart flex-col-l p-l-65 p-r-25">
                <div class="header-cart-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Your Cart
                    </span>

                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>

                <div class="header-cart-content flex-w js-pscroll">
                    <ul class="header-cart-wrapitem w-full">
                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-01.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    White Shirt Pleat
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $19.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-02.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Converse All Star
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $39.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-03.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Nixon Porter Leather
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $17.00
                                </span>
                            </div>
                        </li>
                    </ul>

                    <div class="w-full">
                        <div class="header-cart-total w-full p-tb-40">
                            Total: $75.00
                        </div>

                        <div class="header-cart-buttons flex-w w-full">
                            <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                                View Cart
                            </a>

                            <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                                Check Out
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Title page -->
        <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/background/bg-02.jpg');">
            <h2 class="ltext-105 cl0 txt-center">
                Contact
            </h2>
        </section>	


        <!-- Content page -->
        <section class="bg0 p-t-104 p-b-116">
            <div class="container">
                <div class="flex-w flex-tr">
                    <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                        <h3 style="color: red;">${requestScope.message}</h3>
                        <form action="contact" method="post">
                            <h4 class="mtext-105 cl2 txt-center p-b-30">
                                Send Us A Message
                            </h4>
                            <div class="bor8 m-b-30">
                                <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="How Can We Help?"></textarea>
                            </div>

                            <button type="${requestScope.user == 0 ? "":"submit"}" class="flex-c-m stext-101 cl0 size-121 bg3 bor1  p-lr-15 trans-04 ${requestScope.user == 0 ? "sold-out":"hov-btn3 pointer"} text-white" >
                                Submit
                            </button>
                        </form>
                    </div>
                                <form>
                                    <a type="" ></a>
                                </form>
                    <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
                        <div class="flex-w w-full p-b-42">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-map-marker"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl2">
                                    Address
                                </span>

                                <p class="stext-115 cl6 size-213 p-t-18">
                                    FPT University, Hoa Lac hightech, Thach That, Hanoi, Vietnam
                                </p>
                            </div>
                        </div>

                        <div class="flex-w w-full p-b-42">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-phone-handset"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl2">
                                    Lets Talk
                                </span>

                                <p class="stext-115 cl1 size-213 p-t-18">
                                    0984068859
                                </p>
                            </div>
                        </div>

                        <div class="flex-w w-full">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-envelope"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl2">
                                    Sale Support
                                </span>

                                <p class="stext-115 cl1 size-213 p-t-18">
                                    laingoclam3112@gmail.com
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	


        <!-- Map -->
        <div class="map">
            <div class="size-303" id="google_map" data-map-x="40.691446" data-map-y="-73.886787" data-pin="images/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div>
        </div>



        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->


        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>

        <!-- Toast -->
        <div class="toast" style="display: ${requestScope.flex};">
            <!-- Success -->
            <div class="toast-message toast-failure"  style="display: flex;">
                <div class="toast-icon">
                    <ion-icon name="alert-circle-sharp"></ion-icon>
                </div>
                <div class="toast-body">
                    <h3 class="title">Success</h3>
                    <p class="message">Your message has been saved!</p>
                </div>
                <div class="toast-close">
                    <ion-icon name="close-outline"></ion-icon>
                </div>
            </div>
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
            $('.sold-out').on('click', function () {
                return false;
            });

            $('.sold-out').on('mouseenter', function () {
                $(this).addClass('no-click');
            }).on('mouseleave', function () {
                $(this).removeClass('no-click');
            });
        </script>
        <!--===============================================================================================-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
        <script src="js/map-custom.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
</html>