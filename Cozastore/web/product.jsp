<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product</title>
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
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link
            <!--===============================================================================================-->
        <style>
            body a {
                text-decoration: none;
            }
            .active-paging {
                border-color: #222;
                background-color: #222;
                color: #fff;
            }
            .product-discount-mark{
                position: absolute;
                z-index: 2;
                color:white;
                background-color: crimson;
                padding: 2px 5px;
                border: 1px dotted brown;
            }
            .price{
                text-decoration: line-through;
                color: #9f9f9f;
            }
            .newprice{
                font-weight: bold;
            }
            .product-soldout-mark {
                position: absolute;
                z-index: 2;
                color:white;
                background-color: grey;
                padding: 2px 5px;
                border: 1px dotted grey;
                top: 0;
                right: 11.25px;
            }
        </style>
    </head>
    <body class="animsition">

        <!-- Header -->
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->



        <!-- Product -->
        <div class="bg0 p-b-140">
            <div class="container">
                <div class="flex-w flex-sb-m p-b-52">
                    <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                        <button onclick="gender(this.value)" class="gender stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"  value="default">
                            All Products
                        </button>
                        <button onclick="gender(this.value)" class="gender stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"  value="man">
                            Man
                        </button>
                        <button onclick="gender(this.value)" class="gender stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"  value="women">
                            Women
                        </button> 
                        <button onclick="gender(this.value)" class="gender stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"  value="unisex">
                            Unisex
                        </button>

                    </div>

                    <div class="flex-w flex-c-m m-tb-10">
                        <select class="flex-c-m stext-106 cl6 size-104 bor4 pointer trans-04 m-r-8 m-tb-4" onchange="handleSort(this.value)">
                            <option value="default">Sort</option>
                            <option value="popularity">Popularity</option>
                            <option value="newest">Newnest</option>
                            <option value="lowToHigh">Price: Low to High</option>
                            <option value="highToLow">Price: High to Low</option>
                        </select>

                        <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                            <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                            <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                            Search
                        </div>
                    </div>

                    <!-- Search product -->
                    <form class="dis-none panel-search w-full p-t-10 p-b-15">
                        <div class="bor8 dis-flex p-l-15">
                            <button  class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                                <i class="zmdi zmdi-search"></i>
                            </button>

                            <input oninput="searchByName(this)" class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="searchProduct" placeholder="Search">
                        </div>	
                    </form>

                    


                </div>
                <div class="row">
                    <div class="  col-xs-12 col-lg-3 col-md-3 col-sm-12  col-lg-pull-9 col-md-pull-9">
                        <div class=" p-r-15 p-b-27 ">
                            <div class="mtext-102 cl2 p-b-15 w-100">
                                Price
                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)" class="price-range" checked type="radio" name="price-range" value="none" >  
                                <p class="m-l-10 m-b-0">None</p>

                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)" class="price-range"  type="radio" name="price-range" value="0">  
                                <p class="m-l-10 m-b-0">$0.00 - $50.00</p>

                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)"  class="price-range"  type="radio" name="price-range" value="50">  
                                <p class="m-l-10 m-b-0">$50.00 - $100.00</p>

                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)"  class="price-range"  type="radio" name="price-range" value="100">  
                                <p class="m-l-10 m-b-0">$100.00 - $150.00</p>

                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)"  class="price-range"  type="radio" name="price-range" value="150">  
                                <p class="m-l-10 m-b-0">$150.00 - $200.00</p>

                            </div>
                            <div class=" stext-106 trans-04 d-flex p-b-15">
                                <input onclick="price(this.value)" class="price-range"  type="radio" name="price-range" value="200">  
                                <p class="m-l-10 m-b-0"> $200.00+</p>

                            </div>
                        </div>

                        <div class=" p-r-15 p-b-27">
                            <div class="mtext-102 cl2 p-b-15">
                                Color
                            </div>
                            <div class="p-b-6 d-flex">
                                <input onclick="color(this.value)" class="color" type="radio" checked name="color" value="none"/> 
                                <span class=" m-l-10 m-b-0">None</span>
                            </div>
                            <c:forEach items="${requestScope.colorList}" var="color">
                                <div class="p-b-6 d-flex">
                                    <input onclick="color(this.value)" class="color" type="radio" name="color" value="${color}"/> 
                                    <span class=" m-l-10 m-b-0">${color}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class=" col-lg-9 col-md-9 col-sm-12 col-lg-push-3 col-md-push-3">
                        <div id="content">
                            <div  class="row isotope-grid " >

                                <c:forEach items="${requestScope.productList}" var="product">
                                    <c:set var="newprice" value="${product.price *(100 - product.discount)/100}"></c:set>

                                        <div class="product col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${product.categoryGender}">
                                        <c:if test="${product.discount != 0}">
                                            <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${product.discount} "/>% OFF</div>
                                        </c:if>
                                        <c:if test="${product.totalQuantity == 0}">
                                            <div class="product-soldout-mark">Sold out</div>
                                        </c:if>

                                        <!-- Block2 -->
                                        <div class="block2">
                                            <div class="block2-pic hov-img0">
                                                <img src="${product.productImageDefault}" alt="IMG-PRODUCT">

                                                <a href="product-detail?id=${product.productId}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 ">
                                                    View Details
                                                </a>
                                            </div>

                                            <div class="block2-txt flex-w flex-t p-t-14">
                                                <div class="block2-txt-child1 flex-col-l ">
                                                    <a href="product-detail?id=${product.productId}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="text-decoration: none;">
                                                        ${product.productName}
                                                    </a>

                                                    <div>
                                                        <span class="stext-105 cl3 newprice">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                        </span>
                                                        <c:if test="${product.discount != 0}">
                                                            <span class="stext-105 cl3 price">
                                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${product.price}"/>
                                                            </span>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <div class="block2-txt-child2 flex-r p-t-3">
                                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                                        <img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
                                                        <img class="icon-heart2 dis-block trans-04 ab-t-l " src="images/icons/icon-heart-02.png" alt="ICON">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>


                            <c:set var="page" value="${sessionScope.page}" />
                            <div class="flex-c-m flex-w w-full p-t-38">
                                <c:forEach begin="${1}" end="${sessionScope.number}" var="i">
                                    <button onclick="loadMore(${i})" class="paging flex-c-m stext-101 cl5  bg2 bor1 hov-btn1 p-all-15 trans-04 m-all-15 ${i==page?"active-paging":""} " style="height: 46px; width: 46px">
                                        ${i}
                                    </button>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
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




        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>

        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/parallax100/parallax100.js"></script>
        <script>
                                        $('.parallax100').parallax100();
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <script>
                                        $('.gallery-lb').each(function () { // the containers for all your galleries
                                            $(this).magnificPopup({
                                                delegate: 'a', // the selector for gallery item
                                                type: 'image',
                                                gallery: {
                                                    enabled: true
                                                },
                                                mainClass: 'mfp-fade'
                                            });
                                        });
        </script>
        <!--===============================================================================================-->
        <script src="vendor/isotope/isotope.pkgd.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/sweetalert/sweetalert.min.js"></script>
        <script>
                                        $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
                                            e.preventDefault();
                                        });

                                        $('.js-addwish-b2').each(function () {
                                            var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
                                            $(this).on('click', function () {
                                                swal(nameProduct, "is added to wishlist !", "success");

                                                $(this).addClass('js-addedwish-b2');
                                                $(this).off('click');
                                            });
                                        });

                                        $('.js-addwish-detail').each(function () {
                                            var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

                                            $(this).on('click', function () {
                                                swal(nameProduct, "is added to wishlist !", "success");

                                                $(this).addClass('js-addedwish-detail');
                                                $(this).off('click');
                                            });
                                        });

                                        /*---------------------------------------------*/

                                        $('.js-addcart-detail').each(function () {
                                            var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
                                            $(this).on('click', function () {
                                                swal(nameProduct, "is added to cart !", "success");
                                            });
                                        });

        </script>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                                        //                            function activePaging(buttonNumber) {
                                        //                                var buttons = document.querySelectorAll('.active-paging');
                                        //
                                        //                                buttons.forEach(function (button) {
                                        //                                    button.classList.remove('active-paging');
                                        //                                });
                                        //
                                        //                                var selectedButton = document.querySelector('.paging:nth-child(' + buttonNumber + ')');
                                        //                                selectedButton.classList.add('active-paging');
                                        //
                                        //                            }

                                        function loadMore(pageNumber) {
                                            var listPrice = document.querySelectorAll('.price-range');
                                            var priceRange;

                                            listPrice.forEach(function (input) {
                                                if (input.checked) {
                                                    priceRange = input.value;
                                                }
                                            });

                                            var listColor = document.querySelectorAll('.color');
                                            var color;

                                            listColor.forEach(function (input) {
                                                if (input.checked) {
                                                    color = input.value;
                                                }
                                            });

                                            $.ajax({
                                                url: "/cozastore/loadmore",
                                                type: "get",
                                                data: {
                                                    price: priceRange,
                                                    color: color,
                                                    number: pageNumber
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }

                                        function searchByName(param) {
                                            var search = param.value;
                                            $.ajax({
                                                url: "/cozastore/searchajax",
                                                type: "get",
                                                data: {
                                                    productName: search,
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }


                                        function handleSort(type) {
                                            $.ajax({
                                                url: "/cozastore/sortajax",
                                                type: "get",
                                                data: {
                                                    type: type,
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }
                                        function price() {
                                            var listColor = document.querySelectorAll('.color');
                                            var color;

                                            listColor.forEach(function (input) {
                                                if (input.checked) {
                                                    color = input.value;
                                                }
                                            });

                                            var listPrice = document.querySelectorAll('.price-range');
                                            var priceRange;

                                            listPrice.forEach(function (input) {
                                                if (input.checked) {
                                                    priceRange = input.value;
                                                }
                                            });
                                            var gender = document.querySelector(".how-active1").value;

                                            $.ajax({
                                                url: "/cozastore/filterprice",
                                                type: "get",
                                                data: {
                                                    priceRange: priceRange,
                                                    color: color,
                                                    gender: gender,
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }
                                        function color() {
                                            var listColor = document.querySelectorAll('.color');
                                            var color;

                                            listColor.forEach(function (input) {
                                                if (input.checked) {
                                                    color = input.value;
                                                }
                                            });

                                            var listPrice = document.querySelectorAll('.price-range');
                                            var priceRange;

                                            listPrice.forEach(function (input) {
                                                if (input.checked) {
                                                    priceRange = input.value;
                                                }
                                            });
                                            var gender = document.querySelector(".how-active1").value;

                                            $.ajax({
                                                url: "/cozastore/filtercolor",
                                                type: "get",
                                                data: {
                                                    priceRange: priceRange,
                                                    color: color,
                                                    gender: gender,
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }
                                        $('.gender').on('click', function () {


                                            if ($('.js-show-filter').hasClass('show-filter')) {
                                                $('.js-show-filter').removeClass('show-filter');
                                                $('.panel-filter').slideUp(400);
                                            }
                                        });
                                        $('.gender').on('click', function () {


                                            if ($('.js-show-search').hasClass('show-search')) {
                                                $('.js-show-search').removeClass('show-search');
                                                $('.panel-search').slideUp(400);
                                            }
                                        });
                                        function gender(value) {
                                            var listColor = document.querySelectorAll('.color');
                                            var color;

                                            listColor.forEach(function (input) {
                                                if (input.value !== "none") {
                                                    document.querySelector('.color[value="none"]').checked = true;
                                                }
                                            });

                                            var listPrice = document.querySelectorAll('.price-range');
                                            var priceRange;

                                            listPrice.forEach(function (input) {
                                                if (input.value !== "none") {
                                                    document.querySelector('.price-range[value="none"]').checked = true;
                                                }
                                            });

                                            $.ajax({
                                                url: "/cozastore/genderajax",
                                                type: "get",
                                                data: {
                                                    gender: value,

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },

                                            });
                                        }
        </script>
    </body>
</html>