<%-- 
    Document   : userProfile
    Created on : May 20, 2023, 11:52:33 PM
    Author     : khois
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/userprofile.css">

        <style>
            /* CSS */
            .button-59 {
                align-items: center;
                background-color: #fff;
                border: 2px solid #000;
                box-sizing: border-box;
                color: #000;
                cursor: pointer;
                display: inline-flex;
                fill: #000;
                font-family: Inter,sans-serif;
                font-size: 16px;
                font-weight: 600;
                height: 48px;
                justify-content: center;
                letter-spacing: -.8px;
                line-height: 24px;
                min-width: 140px;
                outline: 0;
                padding: 0 17px;
                text-align: center;
                text-decoration: none;
                transition: all .3s;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
            }

            .button-59:focus {
                color: #171e29;
            }

            .button-59:hover {
                border-color: #06f;
                color: #06f;
                fill: #06f;
            }

            .button-59:active {
                border-color: #06f;
                color: #06f;
                fill: #06f;
            }

            @media (min-width: 768px) {
                .button-59 {
                    min-width: 170px;
                }
            }
            /* CSS */
            .button-55 {
                align-self: center;
                background-color: #fff;
                background-image: none;
                background-position: 0 90%;
                background-repeat: repeat no-repeat;
                background-size: 4px 3px;
                border-radius: 15px 225px 255px 15px 15px 255px 225px 15px;
                border-style: solid;
                border-width: 2px;
                box-shadow: rgba(0, 0, 0, .2) 15px 28px 25px -18px;
                box-sizing: border-box;
                color: #41403e;
                cursor: pointer;
                display: flex;
                font-family: Neucha, sans-serif;
                font-size: 1rem;
                line-height: 23px;
                outline: none;
                padding: .75rem;
                text-decoration: none;
                justify-content: center;
                transition: all 235ms ease-in-out;
                border-bottom-left-radius: 15px 255px;
                border-bottom-right-radius: 225px 15px;
                border-top-left-radius: 255px 15px;
                border-top-right-radius: 15px 225px;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
            }

            .button-55:hover {
                box-shadow: rgba(0, 0, 0, .3) 2px 8px 8px -5px;
                transform: translate3d(0, 2px, 0);
            }

            .button-55:focus {
                box-shadow: rgba(0, 0, 0, .3) 2px 8px 4px -6px;
            }
        </style>

    </head>
    <body>
        <!-- Header -->
        <%@include file="components/header.jsp"%>
        <br/>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right"><br/>
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://th.bing.com/th/id/OIP.7ZwiAXnbCHgp29gyunHFTgHaHa?pid=ImgDet&rs=1"><span class="font-weight-bold">${loadprofile.name}</span><span class="text-black-50">${loadprofile.email}</span><span> </span></div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <form action="userprofile" method="post">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Password</label><input type="password" class="form-control"  value="*********" readonly=""></div>
                                <div class="col-md-12"><label class="labels">Full Name*</label><input type="text" name="fullname" class="form-control" placeholder="enter your full name" value="${loadprofile.name}" required=""></div>
                                <div class="col-md-12"><label class="labels" for="Gender">Gender</label></div>
                                <div class="col-md-12"> 
                                    <label class="radio-inline" for="Gender-0">
                                        <input type="radio" name="gender" id="male" value="1" ${loadprofile.gender == '1' ? 'checked' : ''}>
                                        Male
                                    </label><br/>
                                    <label class="radio-inline" for="Gender-1">
                                        <input type="radio" name="gender" id="female" value="0" ${loadprofile.gender == '0' ? 'checked' : ''}>
                                        Female
                                    </label><br/>
                                    <label class="radio-inline" for="Gender-2">
                                        <input type="radio" name="gender" id="other" value="2" ${loadprofile.gender == '2' ? 'checked' : ''}>
                                        Don't want to answer
                                    </label>
                                </div>
                                <div class="col-md-12"><label class="labels">Phone</label><input id="phone" name="phone" type="tel" title="Phone numbers to start with '0' and consist of 10 numbers." pattern="0\d{9}" class="form-control" placeholder="enter your phone number" value="${loadprofile.phone}"></div>
                                <div class="col-md-12"><label class="labels">Address</label><input type="text" name="address" class="form-control" placeholder="enter your address" value="${loadprofile.address}"></div>
                                <div class="col-md-12"><label class="labels">Email*</label><input type="email" name="email" class="form-control" placeholder="enter your email" value="${loadprofile.email}" readonly=""></div>
                            </div>
                            <div class="mt-5 text-center"> <span class="text-black-50">Please tell us the truth, it will be good for you ♥</span></div>
                            <div class="mt-5 text-center"><input class="button-59" type="submit" value="Save Profile"></div>
                            <div class="mt-2 text-center"><a href="home" style="color: grey"><-- Back to home</a></div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <br/><br/><br/><br/><a href="mypurchases" class="button-55" role="button">My Purchases</a>
                        <br/><br/><br/><br/><a class="button-55" role="button">Change Email</a>
                        <br/><br/><br/><br/><a href="changepassword" class="button-55" role="button">Change Password</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="components/footer.jsp"%>
    </body>
</html>
