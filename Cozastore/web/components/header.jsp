<%-- 
    Document   : header
    Created on : May 13, 2023, 10:19:37 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <!--Bootstrap down here -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <!-- ----------------------->
        <!-- local css file path -->
        <!--        <link rel="stylesheet" href="../css/header.css">-->
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!----------------------- -->
        <script src="js/header.js"></script>
    </head>
    <body style="height: auto">
        <header>
            <div id="top-bar-bound" class="container-fluid">
                <nav class="container row" id="top-bar">
                    <div id="left-bar" class="col-6 col-sm-4 col-md-4 col-xl-7">
                        <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/icons/logo-01.png"></a>
                        <div id="nav-link-bar" class="d-none d-xl-flex">
                            <a class="nav-link header-nav-link" href="${pageContext.request.contextPath}/home">Home</a>
                            <a class="nav-link header-nav-link" href="${pageContext.request.contextPath}/product">Shop</a>
                            <a class="nav-link header-nav-link" href="${pageContext.request.contextPath}/bloglist">Blog</a>
                            <a class="nav-link header-nav-link" href="#home">Q&A</a>
                            <a class="nav-link header-nav-link" href="${pageContext.request.contextPath}/about">About</a>
                            <a class="nav-link header-nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                        </div>
                    </div>

                    <div id="right-bar" class="col-6 col-sm-8 col-md-8 col-xl-5">
                        <!-- search field here -->
                        <div class="right-bar-button d-none d-md-flex" id="search-field">
                            <form id="search-form" action="#" method="get">
                                <input oninput="showBox_header_hzdf()" onkeyup="searchLive_header_hzdf(this.value); makeTitle_header_hzdf()" id="search-input" type="text" name="keyword" placeholder="find products">
                                <button id="search-button" type="submit">
                                    <i style="color: #00000070;" class="bi bi-search"></i>
                                </button>
                                <div  class="row" id="search-result">
                                    <!-- result -->
                                    <h2 id="result-search-title" style="font-size: 1.25rem;" class="mtext-112 p-tb-20">
                                        <!-- title here -->
                                    </h2>
                                    <div class="row" id="products-result"> 
                                        <!-- result here -->
                                    </div>
                                </div>
                            </form>
                        </div>
                        <script>
                            const input_header_hzdf = document.getElementById("search-input");
                            const box_header_hzdf = document.getElementById("search-result");
                            const title_header_hzdf = document.getElementById("result-search-title");
                            function showBox_header_hzdf() {
                                if (input_header_hzdf.value) {
                                    box_header_hzdf.style.display = "block";
                                } else {
                                    box_header_hzdf.style.display = "none";
                                }
                            }
                            function makeTitle_header_hzdf() {
                                title_header_hzdf.innerHTML = 'Search results for "' + input_header_hzdf.value + '"';
                            }
                        </script>
                        <!-- cart button down here -->
                        <div class="right-bar-button" id="cart-field">
                            <a id="cart-link" href ="/cozastore/GotoCart">
                                <div style="width: 1.25rem;
                                     display: flex;
                                     align-items: center;
                                     justify-content: center;">
                                    <i style="position: absolute;" class="bi bi-cart"></i>
                                    <c:if test="${sessionScope.cartInfo != null}">
                                        <p style="transform: translate(7px, -10px);" id="item-quantity">${sessionScope.cartInfo.size()}</p>
                                    </c:if>
                                    <c:if test="${sessionScope.cartInfo == null}">
                                        <p style="transform: translate(7px, -10px);" id="item-quantity">0</p>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                        <!-- login button down here -->
                        <div class="right-bar-button d-none d-md-flex" id="account-field">
                            <c:choose>
                                <c:when test="${sessionScope.account.roleID == null}">
                                    <a id="login-link" href="${pageContext.request.contextPath}/login">
                                        <i class="bi bi-person-circle"></i>
                                        <p id="login-link-title">Log in</p>
                                    </a> 
                                </c:when>
                                <c:when test="${sessionScope.account.roleID >=0}">
                                    <c:set var="name" value="${account.name}"></c:set>
                                        <div id="user-button">
                                            <a id="login-link" href="${pageContext.request.contextPath}/userprofile">
                                            <div class="temp-avatar">
                                                ${name.charAt(0)}
                                            </div>
                                            <p id="login-link-title">${name}</p>
                                        </a> 
                                        <div id="user-drop-bar">
                                            <c:if test="${sessionScope.account.roleID == 2}">
                                                <a class="user-task" href="${pageContext.request.contextPath}/userprofile">Personal Info</a>
                                                <a class="user-task" href="${pageContext.request.contextPath}/mypurchases">My Orders</a>
                                                <a class="user-task" href="${pageContext.request.contextPath}/logout">Log out</a>
                                            </c:if>
                                            <c:if test="${sessionScope.account.roleID != 2}">
                                                <a class="user-task" href="${pageContext.request.contextPath}/GoToAdminPage">Go to Admin Page</a>
                                                <a class="user-task" href="${pageContext.request.contextPath}/userprofile">Personal Info</a>
                                                <a class="user-task" href="${pageContext.request.contextPath}/logout">Log out</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>

                        <!-- button for mobile / tablet device -->
                        <!-- ==================================== -->
                        <!-- ==================================== -->
                        <button onclick="showFunction_Box_header_hzdf()" id="openlist-button" class="d-flex d-xl-none">
                            <i style="font-size: 1.75rem;" class="bi bi-list"></i>
                        </button>
                        <script>
                            function showFunction_Box_header_hzdf() {
                                var x = document.getElementById("function-box");
                                if (x.style.display === "none") {
                                    x.style.display = "block";
                                } else {
                                    x.style.display = "none";
                                }
                            }
                        </script>
                    </div>
                </nav>                 
            </div>
            <div id="function-box" style="display: none;right: 0; min-width:200px;" class="col-11 col-md-7 d-xl-none">
                <!-- search -->
                <!-- search field here -->
                <div class="right-bar-button d-flex d-md-none" style="border: 1px solid #00000070;border-radius: 10px;padding: 2px; margin: 10px;">
                    <form style="display: flex; justify-content: space-between; width: 100%" action="#" method="get">
                        <input style="width: 100%;" type="text" name="keyword" placeholder="find products">
                        <button style="border: none; background: none;" type="submit">
                            <i style="color: #00000070;" class="bi bi-search"></i>
                        </button>
                    </form>
                </div>
                <!-- login-mobile -->
                <div class="right-bar-button d-flex d-md-none" style="margin: 0;align-items: center ; justify-content: center; flex-direction: column; ">
                    <c:choose>
                        <c:when test="${sessionScope.account.roleID == null}">
                            <a id="login-link-m" href="login">
                                <i class="bi bi-person-circle"></i>
                                <p id="login-link-title-m">Log in</p>
                            </a> 
                        </c:when>
                        <c:when test="${sessionScope.account.roleID >=0}">
                            <c:set var="name" value="${account.userName}"></c:set>
                            <c:if test="${sessionScope.account.roleID == 2}">
                                <div style="font-size: 1.5rem; padding: 10px;">
                                    <button onclick="showAccount_Box_header_hzdf()" id="login-link-m">
                                        <div class="temp-avatar-m">
                                            ${name.charAt(0)}
                                        </div>
                                        <p id="login-link-title-m">${name}</p>
                                        <i class="bi bi-caret-down"></i>
                                    </button> 
                                    <div style="display: none;" id="account-functionbox-m">
                                        <a class="user-task-m" href="userprofile">Personal Info</a>
                                        <a class="user-task-m" href="userprofile">My Orders</a>
                                        <a class="user-task-m" href="logout">Log out</a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.account.roleID != 2}">
                                <div style="font-size: 1.5rem; padding: 10px;">
                                    <button onclick="showAccount_Box_header_hzdf()" id="login-link-m">
                                        <div class="temp-avatar-m">
                                            ${name.charAt(0)}
                                        </div>
                                        <p id="login-link-title-m">${name}</p>
                                        <i class="bi bi-caret-down"></i>
                                    </button> 
                                    <div style="display: none;" id="account-functionbox-m">
                                        <a class="user-task-m" href="GoToAdminPage">Go to Admin Page</a>
                                        <a class="user-task-m" href="userprofile">Personal Info</a>
                                        <a class="user-task-m" href="logout">Log out</a>
                                    </div>
                                </div>
                            </c:if>
                            <script>
                                function showAccount_Box_header_hzdf() {
                                    var x = document.getElementById("account-functionbox-m");
                                    if (x.style.display === "none") {
                                        x.style.display = "block";
                                    } else {
                                        x.style.display = "none";
                                    }
                                }
                            </script>
                        </c:when>
                    </c:choose>
                </div>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="home">Home</a>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="product">Shop</a>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="bloglist">Blog</a>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="#home">Q&A</a>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="#home">About</a>
                <a style="color: white;" class="nav-link  mobile-link-home-nav" href="contact">Contact</a>
            </div>
            <!-- ==================================== -->

            <!-- ==================================== -->
        </header>
    </body>
</html>
