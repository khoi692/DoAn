<%-- 
    Document   : home
    Created on : May 13, 2023, 10:18:07 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Coza Store</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/util.css">
        <link rel="stylesheet" href="css/home.css">
        <script src="js/home.js"></script>
    </head>
    <body class="animsition">
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->
        <div id="main-content-bound" class="container-fluid" style="padding:0;">
            <!-- desktop main post -->
            <div id="main-post-bound" class="container-fluid" style="background-image: url('images/page/slide-01.jpg');">   
                <div class="col-lg-6 container" id="main-post">
                    <div  id="main-show-info">
                        <a style="display: flex;flex-direction: column;align-items: center;" class="nav-link" href="bloglist">
                            <h1 class="nav-link" id="main-blog-title">${requestScope.year} FASHION</h1>
                            DISCOVER BLOGS >>
                        </a>
                    </div>
                    <div id="shop-now-button">
                        <a id="shop-now-link" class="nav-link" href="product">SHOP NOW</a>
                    </div>
                    <div class="row">
                        <div class="jump-button col-12 col-sm-4">
                            <a class="nav-link" href="#trendy-jump-label">TRENDY CLOTHES</a>
                        </div>
                        <div class="jump-button col-12 col-sm-4">
                            <a class="nav-link" href="#frenzy-sale-jump-label">FRENZY SALE</a>
                        </div>
                        <div class="jump-button col-12 col-sm-4">
                            <a class="nav-link" href="#product-over-view-jump-label">PRODUCT OVERVIEW</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
            </div>
            <!------------------------->
            <!--main product show-->
            <!-- -------------- season product feature ----------------t -->
            <div id="trendy-jump-label" style="padding-top: 100px;" class="container">
                <div class="container row" style="padding: 0;margin: 0;">
                    <div style="display: flex; flex-direction: column; justify-content: space-between; padding: 0;" class="col-xl-9">
                        <div class="main-content-section container">
                            <div class="row" id="season-product">
                                <div class="col-12 col-xl-2" id="season-product-title">
                                    <h2>TOP<br>${requestScope.season}<br>CLOTHES</h2>
                                </div>
                                <!-- product item  -->
                                <div id="season-product-show" class="container col-12 col-xl-10 row">
                                    <!-- a card -->
                                    <c:forEach var="item" items="${requestScope.slist}">
                                        <c:set var="discount" value="${item.discount}"></c:set>
                                        <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                            <a href="product-detail?id=${item.productId}" class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                            <c:if test="${discount != 0}">
                                                <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                            </c:if>
                                            <!-- Block2 -->
                                            <div class="block2">
                                                <div class="block2-pic hov-img0">
                                                    <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                                    <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                        View
                                                    </div>
                                                </div>
                                                <div class="block2-txt flex-w flex-t p-t-14">
                                                    <div class="block2-txt-child1 flex-col-l ">
                                                        <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                            ${item.productName}
                                                        </div>
                                                        <div>
                                                            <span class="stext-105 cl3 newprice">
                                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                            </span>
                                                            <c:if test="${discount != 0}">
                                                                <span class="stext-105 cl3 price">
                                                                    $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                                </span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <!---------------------------------------->
                            </div>
                        </div>  
                        <!------trendy clothes-------->
                        <div class="main-content-section container">
                            <div class="row" id="year-product">
                                <div class="col-12 col-xl-2" id="year-product-title">
                                    <h2>${requestScope.year}<br>TRENDY<br>FASHION</h2>
                                </div>
                                <!-- product item  -->
                                <div id="year-product-show" class="container col-12 col-xl-10 row">
                                    <!-- a card -->
                                    <c:forEach var="item" items="${requestScope.ylist}">
                                        <c:set var="discount" value="${item.discount}"></c:set>
                                        <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                            <a href="product-detail?id=${item.productId}" class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                            <c:if test="${discount != 0}">
                                                <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                            </c:if>
                                            <!-- Block2 -->
                                            <div class="block2">
                                                <div class="block2-pic hov-img0">
                                                    <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                                    <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                        View
                                                    </div>
                                                </div>
                                                <div class="block2-txt flex-w flex-t p-t-14">
                                                    <div class="block2-txt-child1 flex-col-l ">
                                                        <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                            ${item.productName}
                                                        </div>
                                                        <div>
                                                            <span class="stext-105 cl3 newprice">
                                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                            </span>
                                                            <c:if test="${discount != 0}">
                                                                <span class="stext-105 cl3 price">
                                                                    $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                                </span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <!---------------------------------------->
                            </div>
                        </div>
                    </div>
                    <!-- blog slide show -->
                    <div  class="col-xl-3 carousel slide carousel-fade" style="overflow: hidden; padding-right: 0;" id="carouselExampleCaptions" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div style="height: 700px;" class="carousel-inner" data-bs-interval="3000">
                            <div>
                                <h5 id="blog-section-cap">LATEST BLOGS</h5>
                            </div>
                            <c:forEach var="item" items="${requestScope.blist}">
                                <a href="bloglist" style="display: flex; justify-content: center;" class="carousel-item" data-bs-interval="3000">
                                    <img src="${item.thumbnail}" class="d-block" alt="${item.title}">
                                    <div style="width: 100%;left:0;right:0; background: #00000099;" class="carousel-caption d-none d-md-block">
                                        <h5>${item.title}</h5>
                                        <p>${item.summary}</p>
                                    </div>
                                </a>
                            </c:forEach>
                            <script>
                                document.querySelector(".carousel-item").classList.add("active");
                            </script>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <!-- slide -show -above -->
                </div>
            </div>
            <!-------------------------->

            <!-- big sale -->

            <div id="frenzy-sale-jump-label" class="container" style="padding-top: 100px;">
                <div class="container row" style="margin: 0; position: relative;padding: 0;">
                    <img src="images/page/sale-background.jpg" style="position: absolute;z-index: -1;padding: 0; height: 100%;">
                    <div class="col-12 col-xl-4">
                        <div id="left-box-sale">
                            <div id="sale-title-box">
                                <p class="sale-title">F R E N Z Y</p>
                                <p class="sale-title">S A L E</p>
                            </div>
                        </div>
                    </div>
                    <div id="sale-items" class="col-12 col-xl-8 row">
                        <c:forEach var="item" items="${requestScope.discountlist}">
                            <c:set var="discount" value="${item.discount}"></c:set>
                            <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                <div class="col-sm-6 col-md-4 col-lg-4 p-b-35">
                                    <a href="product-detail?id=${item.productId}" class="isotope-item">
                                    <c:if test="${discount != 0}">
                                        <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                    </c:if>
                                    <!-- Block2 -->
                                    <div class="block2" style="overflow: hidden;">
                                        <div class="product-save-mark-bound">
                                            <div class="product-save-mark">
                                                <div>SAVE</div>
                                                <div style="font-size: 1.25rem;">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price - newprice} "/></div>
                                            </div>
                                        </div>
                                        <div class="block2-pic hov-img0">
                                            <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                            <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                View
                                            </div>
                                        </div>
                                        <div class="block2-txt flex-w flex-t p-t-14">
                                            <div class="block2-txt-child1 flex-col-l ">
                                                <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                    ${item.productName}
                                                </div>
                                                <div>
                                                    <span class="stext-105 cl3 newprice">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                    </span>
                                                    <c:if test="${discount != 0}">
                                                        <span class="stext-105 cl3 price">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- offer ends -->
                                        <c:set var="now" value="<%= new java.util.Date() %>"/>
                                        <fmt:formatDate var="formattedNow" value="${now}" pattern="yyyy-MM-dd"/> 
                                        <fmt:parseDate var="parsedDate" value="${item.endDiscount}" pattern="yyyy-MM-dd HH:mm:ss.S"/> <!--String to DATE-->
                                        <fmt:formatDate var="formattedDate" value="${parsedDate}" pattern="yyyy-MM-dd"/> 
                                        <div>
                                            offer ends on: ${formattedDate}
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div style="display: flex;height: 30px;background: black; align-items: center;justify-content: center;">
                    <p style="color:white; margin: 0;font-weight: bold">Get fancy clothes with biggest discount ever !</p>
                </div>
            </div>

            <!-- comment -->
            <!------product overview-------->
            <div id="product-over-view-jump-label" style="padding-top: 100px;" class="flex-w flex-sb-m p-b-52">
                <div class="main-content-section container">
                    <div id="product-over-view-nav-bar" class="p-b-10">
                        <h3 class="ltext-103 cl5">
                            Product Overview
                        </h3>
                        <a id="go-to-shop-overview-nav" href="product" class="nav-link">
                            GO SHOPPING >>
                        </a>
                    </div>

                    <!-- fuction bar below -->
                    <div class="flex-w flex-sb-m p-b-52">
                        <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                            <button id="newpro-but" onclick="newpro()" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1">
                                New Products
                            </button>

                            <button id="men-but" onclick="men()" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
                                Men
                            </button>

                            <button id="women-but"  onclick="women()" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
                                Women
                            </button>

                            <button id="unisex-but"  onclick="unisex()" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">
                                Unisex
                            </button>
                        </div>
                        <!-- product item  -->
                        <div class="row isotope-grid">
                            <!-- new product review -->
                            <c:forEach var="item" items="${requestScope.plist}">
                                <c:set var="discount" value="${item.discount}"></c:set>
                                <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                    <a href="product-detail?id=${item.productId}" class="newpro col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                    <c:if test="${discount != 0}">
                                        <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                    </c:if>
                                    <!-- Block2 -->
                                    <div class="block2">
                                        <div class="block2-pic hov-img0">
                                            <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                            <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                View
                                            </div>
                                        </div>
                                        <div class="block2-txt flex-w flex-t p-t-14">
                                            <div class="block2-txt-child1 flex-col-l ">
                                                <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                    ${item.productName}
                                                </div>
                                                <div>
                                                    <span class="stext-105 cl3 newprice">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                    </span>
                                                    <c:if test="${discount != 0}">
                                                        <span class="stext-105 cl3 price">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                            <!-- man product review -->
                            <c:forEach var="item" items="${requestScope.manlist}">
                                <c:set var="discount" value="${item.discount}"></c:set>
                                <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                    <a href="product-detail?id=${item.productId}" class="man col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                    <c:if test="${discount != 0}">
                                        <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                    </c:if>
                                    <!-- Block2 -->
                                    <div class="block2">
                                        <div class="block2-pic hov-img0">
                                            <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                            <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                View
                                            </div>
                                        </div>
                                        <div class="block2-txt flex-w flex-t p-t-14">
                                            <div class="block2-txt-child1 flex-col-l ">
                                                <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                    ${item.productName}
                                                </div>
                                                <div>
                                                    <span class="stext-105 cl3 newprice">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                    </span>
                                                    <c:if test="${discount != 0}">
                                                        <span class="stext-105 cl3 price">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                            <!-- women product review -->
                            <c:forEach var="item" items="${requestScope.womenlist}">
                                <c:set var="discount" value="${item.discount}"></c:set>
                                <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                    <a href="product-detail?id=${item.productId}" class="women col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                    <c:if test="${discount != 0}">
                                        <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                    </c:if>
                                    <!-- Block2 -->
                                    <div class="block2">
                                        <div class="block2-pic hov-img0">
                                            <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                            <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                View
                                            </div>
                                        </div>
                                        <div class="block2-txt flex-w flex-t p-t-14">
                                            <div class="block2-txt-child1 flex-col-l ">
                                                <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                    ${item.productName}
                                                </div>
                                                <div>
                                                    <span class="stext-105 cl3 newprice">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                    </span>
                                                    <c:if test="${discount != 0}">
                                                        <span class="stext-105 cl3 price">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                            <!-- unisex product review -->
                            <c:forEach var="item" items="${requestScope.unisexlist}">
                                <c:set var="discount" value="${item.discount}"></c:set>
                                <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                    <a href="product-detail?id=${item.productId}" class="unisex col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item">
                                    <c:if test="${discount != 0}">
                                        <div class="product-discount-mark"><fmt:formatNumber type="number" maxFractionDigits="2" value="${discount} "/>% OFF</div>
                                    </c:if>
                                    <!-- Block2 -->
                                    <div class="block2">
                                        <div class="block2-pic hov-img0">
                                            <img src="${item.productImageDefault}" alt="IMG-PRODUCT">
                                            <div class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                                                View
                                            </div>
                                        </div>
                                        <div class="block2-txt flex-w flex-t p-t-14">
                                            <div class="block2-txt-child1 flex-col-l ">
                                                <div href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                                    ${item.productName}
                                                </div>
                                                <div>
                                                    <span class="stext-105 cl3 newprice">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                    </span>
                                                    <c:if test="${discount != 0}">
                                                        <span class="stext-105 cl3 price">
                                                            $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                            <!------------------->
                        </div>
                        <!---------------------------------------->
                    </div>
                    <!-------------------------->
                </div>
            </div>
        </div>
        <!-- comment -->
        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->
    </body>
</html>
