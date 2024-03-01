<%-- 
    Document   : blog
    Created on : May 20, 2023, 4:56:32 PM
    Author     : pc
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.BlogDAO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blog</title>
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
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/bloglist.css">
        <!--===============================================================================================-->
        <script src="js/blogList.js"></script>
    </head>
    <body>
        <!-- Header -->
        <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
        <!------------------------------------------------------------------------->
        <!-- Title page -->
        <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/page/bg-02.jpg');">
            <h2 style="color:black" class="ltext-105 cl0 txt-center">
                BLOG
            </h2>
        </section>	

        <!-- Content page -->
        <section class="bg0 p-t-62 p-b-60">
            <div class="container">
                <div class="row">
                    <!-- left part -->
                    <%
                        BlogDAO bd = new BlogDAO();
                        List<Integer> cate_list = bd.getBlogCategoryList();
                    %>
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <h2 id="h2-title-blog" style="font-size: 2rem;" class="mtext-112 p-b-5">
                            Latest posts
                        </h2>
                        <p id="row-show-text">
                            <!-- Display 1-5 out of ... results -->
                        </p>
                        <div class="m-r-45" id="blog-query-box">
                            <div style="display: flex; align-items: center; justify-content: space-around;" class="row p-l-10 p-t-10 p-b-10">
                                <form id="top-query-blog" class="col-12 col-lg-5" action="bloglist" method="get">
                                    <div>
                                        <h5 class="mtext-60 cl2 p-b-5">
                                            Categories
                                        </h5>
                                        <select id="cateid-select" onchange="showQueryBlog(1, this.value, document.getElementById('order-by-select').value, document.getElementById('inputField-search').value)" class="form-select form-select-lg mb-3" name="cateId">
                                            <option value="0">
                                                All
                                            </option>
                                            <%
                                                for(int i=0;i<cate_list.size();i++){
                                                int cate_id = cate_list.get(i);
                                            %>
                                            <option value="<%=cate_id%>">
                                                <%=bd.getBlogCateById(cate_id)%>
                                            </option>
                                            <%  
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div>
                                        <h5 class="mtext-60 cl2 p-b-5">
                                            Order by
                                        </h5>
                                        <select id="order-by-select" onchange="showQueryBlog(1, document.getElementById('cateid-select').value, this.value, document.getElementById('inputField-search').value)" class="form-select form-select-lg mb-3" name="orderby">
                                            <option value="desc">
                                                Latest
                                            </option>
                                            <option value="asc">
                                                Earliest
                                            </option>
                                        </select>
                                    </div>
                                </form>
                                <div class="col-12 col-lg-2"></div>
                                <div class="col-12 col-lg-5">
                                    <form onsubmit="event.preventDefault(); showQueryBlog(1, document.getElementById('cateid-select').value, document.getElementById('order-by-select').value, document.getElementById('inputField-search').value)"  style="border:1px solid #00000054; width: 90%;" class="bor17 of-hidden pos-relative">
                                        <input id="inputField-search" name="key" class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" placeholder="Enter key words to search">
                                        <button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
                                            <i class="zmdi zmdi-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- comment -->
                        <div style="margin-left: calc(var(--bs-gutter-x) * .5);" class="p-r-45 p-r-0-lg">
                            <div id="show-blog-list">
                                <!-- item blog -->
                                <script>
                                    showQueryBlog(1, 0, "desc", ""); //categoryId= 0 , order by desc
                                </script>
                                <!-- item blog -->
                            </div>
                        </div>
                    </div>
                    <!-- right part -->
                    <div class="col-md-4 col-lg-3 p-b-80">
                        <div class="side-menu">
                            <!-- product -->
                            <div class="p-t-65">
                                <h4 class="mtext-112 cl2 p-b-33">
                                    New Products
                                </h4>
                                <ul>
                                    <c:forEach var="item" items="${requestScope.plist}">
                                        <li class="flex-w flex-t p-b-30">
                                            <a class="small-product-item-side" href="product-detail?id=${item.productId}">
                                                <div style="text-decoration: none;" href="#" class="wrao-pic-w size-214 m-r-20">
                                                    <img style="width: 100%;" src="${item.productImageDefault}" alt="PRODUCT">
                                                </div>
                                                <div class="size-215 flex-col-t p-t-8">
                                                    <p class="stext-116 cl8 hov-cl1 trans-04">
                                                        ${item.productName}
                                                    </p>
                                                    <span class="stext-116 cl6 p-t-20">
                                                        $ ${item.price}
                                                    </span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- blog slide show -->
                            <div>
                                <h4 class="mtext-112 cl2 p-b-33">
                                    Big Sale
                                </h4>
                            </div>
                            <div  class="carousel slide carousel-fade" style="overflow: hidden; padding-right: 0;" id="carouselExampleCaptions" data-bs-ride="carousel">

                                <div style="height: 700px;" class="carousel-inner" data-bs-interval="3000">
                                    <c:forEach var="item" items="${requestScope.discountlist}">
                                        <c:set var="discount" value="${item.discount}"></c:set>
                                        <c:set var="newprice" value="${item.price *(100 - discount)/100}"></c:set>
                                            <a href="product-detail?id=${item.productId}" style="display: flex; justify-content: center;" class="carousel-item" data-bs-interval="3000">
                                                <div style="height:100%;padding:0;font-size: 3rem;top:0;width: 100%;left:0;right:0; background: #0000004f;" class="carousel-caption d-md-block">
                                                    <p><fmt:formatNumber type="number" value="${discount}"/> % OFF</p>
                                                    <p>${item.productName}</p>
                                                $<fmt:formatNumber type="number" maxFractionDigits="2" value="${newprice} "/>
                                                <c:if test="${discount != 0}">
                                                    <p style="text-decoration: line-through; font-size: 2rem; color: #ffffffa8;">
                                                        $<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/>
                                                    </p>
                                                </c:if>
                                            </div>
                                            <img src="${item.productImageDefault}" class="d-block" alt="${item.productName}">
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
                </div>
            </div>
        </section>	

        <!-- Footer -->

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
                                        });
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
                                                wheelPropagation: false
                                            });

                                            $(window).on('resize', function () {
                                                ps.update();
                                            });
                                        });
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <!------------------------------header including--------------------------->
        <%@include file="components/footer.jsp"%>
        <!------------------------------------------------------------------------->
    </body>
</html>
