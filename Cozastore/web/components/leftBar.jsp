<%-- 
    Document   : leftBar
    Created on : Jun 14, 2023, 7:53:28 PM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
    </head>
    <body>
        <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" style="background-color:#fff " href="marketing">
                <div class="sidebar-brand-icon">
                    <img src="images/icons/logo-01.png">
                </div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="marketing">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Manage
            </div>
            <li class="nav-item manage-list">
                <a class="nav-link " href="post">
                    <ion-icon name="newspaper-sharp"></ion-icon>
                    <span>Post Management</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="UserListController">
                    <ion-icon name="people-sharp"></ion-icon>
                    <span>Customer Management</span>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="feedback">
                    <ion-icon name="chatbox-ellipses-sharp"></ion-icon>
                    <span>Feedback Management</span>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="voucherManagement">
                    <ion-icon name="pricetags-outline"></ion-icon>
                    <span>Voucher Management</span>
                </a>
            </li>
        </ul>
        <script>
            // Get all navigation links
            var navLinks = document.querySelectorAll('.nav-item a');
            var navItem = document.querySelectorAll('.nav-item');
            for (var i = 0; i < navLinks.length; i++) {
                
                if (navLinks[i].href === window.location.href) {
                    navItem[i].classList.add('active');
                }
            }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
