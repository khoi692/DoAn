<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Feedback" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Detail</title>
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
        <!--===============================================================================================-->
        <style>
            .bread-crumb a {
                text-decoration: none;
            }
            .sold-out{
                opacity: 0.5;
            }
            .no-click {
                cursor: not-allowed;
            }
            .product-soldout-mark {
                position: absolute;
                z-index: 2;
                color: white;
                background-color: grey;
                padding: 2px 5px;
                border: 1px dotted grey;
                width: 90px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .price{
                text-decoration: line-through;
                color: #9f9f9f;
                font-size: 15px;
            }
            .newprice{
                font-weight: bold;
                padding-right: 15px;
                font-size: 20px;
            }
        </style>

    </head>
    <body class="animsition">

        <!-- Header -->
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->

        <!-- Product Detail -->
        <section class="sec-product-detail bg0 p-t-120 p-b-40">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-7 p-b-30">
                        <div class="p-l-25 p-r-30 p-lr-0-lg">
                            <div class="wrap-slick3 flex-sb flex-w">
                                <div class="wrap-slick3-dots"></div>
                                <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                                <div class="slick3 gallery-lb">
                                    <c:forEach items="${requestScope.images}" var="image">
                                        <div id="small-img" class=" item-slick3" data-thumb="${image.image}">
                                            <div class="wrap-pic-w pos-relative">
                                                <c:if test="${requestScope.totalQuantity == 0}">
                                                    <div class="product-soldout-mark">Sold out</div>
                                                </c:if>
                                                <img id="myImage" src="${image.image}" alt="IMG-PRODUCT">

                                                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${image.image}">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-5 p-b-30">
                        <div class="p-r-50 p-t-5 p-lr-0-lg">
                            <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                                ${requestScope.productName}
                            </h4>

                            <c:set var="newprice" value="${requestScope.price *(100 - requestScope.discount)/100}"></c:set>
                                <span class="mtext-106 cl2 newprice">
                                    $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                            </span>
                            <c:if test="${requestScope.discount != 0}">
                                <span class="mtext-106 cl2 price">
                                    $<fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.price}"/>
                                </span>
                            </c:if>



                            <p class="stext-102 cl3 p-t-23">
                                ${requestScope.descibe}
                            </p>

                            <!--  -->
                            <div class="p-t-33">
                                <div class="flex-w flex-r-m p-b-10">
                                    <div class="size-203 flex-c-m respon6">
                                        Size
                                    </div>

                                    <div class="size-204 respon6-next">
                                        <div class="rs1-select2 bor8 bg0">
                                            <select class="js-select2" name="size">
                                                <c:forEach items="${requestScope.productSize}" var="size">
                                                    <option value="${size}">${size} </option>
                                                </c:forEach>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex-w flex-r-m p-b-10">
                                    <div class="size-203 flex-c-m respon6">
                                        Color
                                    </div>

                                    <div class="size-204 respon6-next">
                                        <div class="rs1-select2 bor8 bg0">
                                            <select id="mySelect" class="js-select2" name="color" onchange="changeImage(${requestScope.productId})">
                                                <c:forEach items="${requestScope.images}" var="productColor">
                                                    <option value="${productColor.colorId}">${productColor.colorId}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex-w flex-r-m p-b-10">
                                    <div class="size-204 flex-w flex-m respon6-next">
                                        <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>
                                        </div>
                                        <input name="proId" type="text" style="display: none;" value="${requestScope.productId}">
                                        <button onclick="addToCart()" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 p-lr-15 trans-04 ${requestScope.totalQuantity == 0 ? "sold-out":"hov-btn1 pointer"}  text-white ">
                                            Add to cart
                                        </button>
                                        <script>
                                            function addToCart(event) {
                                                //event.preventDefault();
                                                const color = document.getElementsByName('color')[0].value;
                                                const size = document.getElementsByName('size')[0].value;
                                                const proid = document.getElementsByName('proId')[0].value;
                                                const number = document.getElementsByName('num-product')[0].value;
                                                let cartInfo = document.getElementById("item-quantity");
                                                var xhttp;
                                                xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function () {
                                                    if (this.readyState == 4 && this.status == 200) {
                                                        let status = this.responseText;
                                                        if (status == 0) {
                                                            swal("Added to cart", "Now you can see this product in your cart. Log-in to save your cart for later use", "success");
                                                            cartInfo.innerHTML = Number(cartInfo.innerHTML) + 1;
                                                        }
                                                        if (status == 1) {
                                                            swal("Added to cart", "Now you can see this product in your cart", "success");
                                                            cartInfo.innerHTML = Number(cartInfo.innerHTML) + 1;
                                                        }
                                                        if (status == -1) {
                                                            swal("Can not add to cart", "You have already added this product!", "error");
                                                        }

                                                    }
                                                };
                                                let data = "proId=" + proid + "&size=" + size + "&color=" + color + "&num-product=" + number;
                                                xhttp.open("get", "AddToCart?" + data, true);
                                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xhttp.send(data);
                                            }

                                        </script>   
                                    </div>
                                </div>	
                            </div>
                            <!--  -->

                        </div>
                    </div>
                </div>

                <div class="bor10 m-t-20 p-t-43 p-b-40">
                    <!-- Tab01 -->
                    <div class="tab01">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item p-b-10">
                                <a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
                            </li>


                            <li class="nav-item p-b-10">
                                <a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews (${requestScope.numberFeedback})</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content p-t-43">
                            <!-- - -->
                            <div class="tab-pane fade show active" id="description" role="tabpanel">
                                <div class="how-pos2 p-lr-15-md">
                                    <p class="stext-102 cl6">
                                        ${requestScope.descibe}
                                    </p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                <div class="row">
                                    <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                                        <div class="p-b-30 m-lr-15-sm">
                                            <!-- Review -->
                                            <%
                                                List<Feedback> feedbacks = (List<Feedback>)request.getAttribute("feedbacks");
                                                for(int i = 0; i< feedbacks.size(); i++){ 
                                                    int rating = feedbacks.get(i).getRating();
                                                    String content = feedbacks.get(i).getContent();
                                            %>
                                            <div class="flex-w flex-t p-b-68">


                                                <div class="size-207">
                                                    <div class="flex-w flex-sb-m p-b-17">
                                                        <span class="mtext-107 cl2 p-r-20">
                                                            <%= feedbacks.get(i).getFullName() %>
                                                        </span>

                                                        <span class="fs-18 cl11">
                                                            <%
                                                            for(int j=0; j<rating; j++){
                                                            %>
                                                            <i class="zmdi zmdi-star"></i>
                                                            <%
                                                                }
                                                            for(int j=0; j<(5-rating); j++){
                                                            %>
                                                            <i class="zmdi zmdi-star-border"></i>
                                                            <%
                                                            }
                                                            %>
                                                        </span>
                                                    </div>

                                                    <p class="stext-102 cl6">
                                                        <%=content%>
                                                    </p>
                                                </div>
                                            </div>
                                            <%
                                        }
                                            %>

                                        </div>

                                        <!-- Add review -->
                                        ${requestScope.html}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
            <span class="stext-107 cl6 p-lr-25">
                ID: ${requestScope.productId}
            </span>

            <span class="stext-107 cl6 p-lr-25">
                Categories: ${requestScope.productGender}
            </span>
        </div>
    </section>

    <!-- Related Products -->
    <section class="sec-relate-product bg0 p-t-45 p-b-105">
        <div class="container">
            <div class="p-b-45">
                <h3 class="ltext-106 cl5 txt-center">
                    Related Products
                </h3>
            </div>

            <!-- Slide2 -->
            <div class="wrap-slick2">
                <div class="slick2">
                    <c:forEach items="${requestScope.relatedProduct}" var="product">
                        <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                            <!-- Block2 -->
                            <div class="block2">
                                <div class="block2-pic hov-img0">
                                    <img src="${product.productImageDefault}" alt="IMG-PRODUCT">

                                    <a href="product-detail?id=${product.productId}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                        View Detail
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <a href="product-detail?id=${product.productId}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${product.productName}
                                        </a>

                                        <span class="stext-105 cl3">
                                            $${product.price}
                                        </span>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>


    <!-- Footer -->
    <!------------------------------footer including--------------------------->
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
    <script>
                                            $(".js-select2").each(function () {
                                                $(this).select2({
                                                    minimumResultsForSearch: 20,
                                                    dropdownParent: $(this).next('.dropDownSelect2')
                                                });
                                            })
    </script>
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
                                                    swal(nameProduct, "is added to cart !", "error");
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
    <script>
        function changeImage(productId) {
            var image = document.getElementById("myImage");
            var selectBox = document.getElementById("mySelect");
            var selectedValue = selectBox.options[selectBox.selectedIndex].value;
            var id = productId;
            console.log("images/product/" + id + "/" + "black.jpg");
        <c:forEach items="${requestScope.images}" var="productColor">
            if (selectedValue == "${productColor.colorId}") {
                let color = "${productColor.colorId}".toLowerCase();
                let source = "images/product/" + id + "/" + color + ".jpg";
                image.src = source;
            }
        </c:forEach>

        }
    </script>
    <script>
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
    <script src="js/main.js"></script>

</body>
</html>