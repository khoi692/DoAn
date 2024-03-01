<%-- 
    Document   : dashboard_header.jsp
    Created on : Jun 1, 2023, 12:12:57 PM
    Author     : Drag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
        <style>

            a:visited {
                text-decoration:  none;
                color: inherit; /* Change this to the desired color */
            }

            a {
                color: black;
                cursor: pointer;
                text-decoration:  none;
            }

            html, body {
                margin: 0;
                padding: 0;
            }

            header {
                position: fixed;
                display: flex;
                width: 100%;
                height: 70px;
                background-color: #6777ef;
                top: 0;
                z-index: 9999;
            }

            header .left {
                width: 15.3%;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #4c60da;

            }

            header .right {
                min-width: 12%;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-left: auto;
                color: white;
            }

            header .left img {
                display: block;
            }

            .profile-pic {
                display: inline-block;
                height: 50%;
            }

            .profile-pic img {
                border: 1px solid white;
                border-radius: 50%;
            }

            /* The Modal (background) */
            .myModal {
                display: none;  /*Hidden by default */
                position: absolute; /* Position absolutely relative to the profile picture */
                z-index: 1; /* Sit on top */
                right: 0; /* Align to the right of the profile picture */
                top: 70px; /* Position below the header */
                right: 50px;
                border: 2px solid black;
                border-radius: 15px;
                text-align: left;
                padding: 10px;
                background-color: white;
                position: fixed;
            }

            .myModal-content div {
                padding: 10px 0;
            }

            .myNav {
                margin-top: 70px;
                position: fixed;
                float: left;
                width: 15.3%;
                height: 100vh;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
                top: 0;
                background-color: white;
            }

            .myNav a{
                display: flex;
                height: 50px;
                width: 100%;
                justify-content: left;
                align-items: center;
                font-size: 17px;
                box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
            }

            .myNav i {
                padding-left: 10px;
                margin-right: 10px;
            }

            .myNav a:hover, .myNav a.active {
                color: white !important;
                background-color: #6777ef;
            }

            .content {
                margin-top: 70px;
                margin-left: 15.3%;
                width: calc(100% - 15.3%);
                height: 100vh;
            }

        </style>
    </head>
    <body>
        <header>
            <a href="" class="left">
                <img src="${pageContext.request.contextPath}/images/icons/logo-02.png" alt="alt"/>
            </a>
            <div class="right">
                <div class="profile-pic">
                    <a><img src="${pageContext.request.contextPath}/images/users/3.jpg" alt="alt" style="height: 100%"/> </a>
                </div>
                <div style="padding-left: 10px">
                    ${sessionScope.u.getName()}
                </div>
            </div>
        </header>
        <div class="myNav">
            <a href="/cozastore/marketing">
                <i class="fa-solid fa-chalkboard"></i>
                Dashboard
            </a>
            <a href="/cozastore/post">
                <i class="fa-solid fa-pen-to-square"></i>
                Post Management
            </a>
            <a href="/cozastore/UserListController">
                <i class="fa-solid fa-user"></i>
                Customer Management
            </a>
            <a href="table-product">
                <i class="fa-solid fa-shirt"></i>
                Product Management
            </a>
            <a href="/cozastore/feedback">
                <i class="fa-solid fa-comment"></i>
                Feedback Management
            </a>
            <a href="/cozastore/voucherManagament">
                <i class="bi bi-cash"></i>
                Voucher management
            </a>
        </div>

    </div>
    <!-- The Modal -->
    <div id="myModal" class="myModal">
        <!-- Modal content -->
        <div class="myModal-content">
            <div>
                <a>
                    <i class="fa-solid fa-user"></i>
                    User Profile
                </a>
            </div>
            <div>
                <a>
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Log out
                </a>
            </div>
        </div>
    </div>
    <script>
        // Get the myModal
        var myModal = document.getElementById("myModal");

// Get the image that opens the myModal
        var img = document.querySelector(".profile-pic img");

// When the user clicks on the image, open the myModal
        img.onclick = function (event) {
            event.stopPropagation();
            myModal.style.display = "block";
        };

// When the user clicks anywhere outside of the myModal, close it
        window.onclick = function (event) {
            if (!myModal.contains(event.target)) {
                myModal.style.display = "none";
            }
        };

    </script>

    <script>
        // Get all navigation links
        var navLinks = document.querySelectorAll('.myNav a');

// Loop through all navigation links
        for (var i = 0; i < navLinks.length; i++) {
            // Check if the href attribute of the link matches the current page URL
            if (navLinks[i].href === window.location.href) {
                // If it does, add the 'active' class to the link
                navLinks[i].classList.add('active');
            }
        }
    </script>

</body>
</html>
