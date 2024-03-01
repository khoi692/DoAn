<%-- 
    Document   : post_list
    Created on : May 25, 2023, 1:14:46 AM
    Author     : Drag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Management</title>
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
        <style>
            html, body {
                margin: 0;
                padding: 0;
            }

            .content {
                background-color: #e8e9ef;
                width: 100%
            }

            .content-margin {
                margin: 0 20px;
            }

            .statistic {
                background-color: #e8e9ef;
                min-height: 100vh;
            }

            .widget {
                display: flex;
                justify-content: space-evenly;
            }

            .widget-icon {
                display: inline-block;
                background-color: white;
                padding: 15px;
                margin: 10px;
                width: 33.3333333%;
                height: 100px;
                font-size: 30px;
            }

            .widget-wrapper {
                display: flex;
                align-items: center;
            }

            .widget-icon i {
                margin: 20px;
            }

            .statistic-number div:nth-child(2){
                font-size: 15px;
            }

            .revenue_chart , .order_table{
                max-width: 100%;
            }

            .revenue_chart, .order_table {
                height: auto;
                background-color: white;
                margin: 10px 0;
                padding-bottom: 10px;
            }

            .title {
                padding: 10px;
                font-weight: 600;
                font-size: 25px;
                display: inline-block;
            }

            .chart_content, .table_content {
                height: 90%;
            }

            table {
                width: 100%;

            }

            table tr {
                max-height: 60px;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
            }

            table tr:first-child {
                height: 40px;
            }

            table tr td {
                padding:0 10px;
            }

            table tr td:nth-child(3) {
                width: 120px;
            }

            table tr td:first-child {
                width: 120px;
            }

            table tr td:last-child{
                width: 70px;
            }

            table img {
                width: 50%;
                padding: 10px;
            }

            table i {
                cursor: pointer;
                color: black;
                display: inline-block;
            }

            .sort-icons {
                display: inline-block
            }

        </style>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="../components/leftBar.jsp"%>
            <div class="content">
                <%@include file="../components/topbar.jsp"%>
                <div class="content-margin">
                    <div class="statistic">
                        <div class="order_table col-xl-12">
                            <div class="title" style="padding: 20px 10px">
                                Post List
                            </div>

                            <div style="margin-bottom: 10px;">
                                <div style="display: inline-block">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    <input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search by title..." style="height: 20px; font-size: 15px; padding: 15px;">
                                </div>
                                <br/><br/>
                                <p>
                                <div id="filterForm" hidden="">
                                    <label for="authorFilter">Author:</label>
                                    <select id="authorFilter">
                                        <option value="">All</option>
                                        <c:forEach items="${sessionScope.alist}" var="a">
                                            <option value="${a}">${a}</option>
                                        </c:forEach>
                                    </select>
                                    <span>|</span>
                                    <label for="dateFilterFrom">From</label>
                                    <input type="date" id="dateFilterFrom">
                                    <label for="dateFilterTo">To</label>
                                    <input type="date" id="dateFilterTo">
                                    <span>|</span>
                                    <label for="availabilityFilter">Status</label>
                                    <select name="availabilityFilter">
                                        <option value="Available">Available</option>
                                        <option value="Hidden">Hidden</option>
                                    </select>
                                </div>
                                </p>
                                <div style="display: inline-block; float: right">
                                    <a href="/cozastore/post/add">
                                        <div>
                                            <i class="fa-regular fa-square-plus"></i>
                                            <span>
                                                Add Post
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="table_content">
                                <table>
                                    <tr style="background-color: #e8e9ef; color: #868e96">
                                        <td>
                                            Blog ID
                                            <div class="sort-icons">
                                                <i class="fa-solid fa-arrow-down-short-wide" onclick="sortTable(0, 'asc')"></i>
                                                <i class="fa-solid fa-arrow-up-wide-short" onclick="sortTable(0, 'desc')"></i>
                                            </div>
                                        </td>
                                        <td>
                                            Title
                                            <div class="sort-icons">
                                                <i class="fa-solid fa-arrow-down-short-wide" onclick="sortTable(1, 'asc')"></i>
                                                <i class="fa-solid fa-arrow-up-wide-short" onclick="sortTable(1, 'desc')"></i>
                                            </div>
                                        </td>
                                        <td>
                                            Author
                                            <div class="sort-icons">
                                                <i class="fa-solid fa-arrow-down-short-wide" onclick="sortTable(2, 'asc')"></i>
                                                <i class="fa-solid fa-arrow-up-wide-short" onclick="sortTable(2, 'desc')"></i>
                                            </div>
                                        </td>
                                        <td>
                                            Time
                                            <div class="sort-icons">
                                                <i class="fa-solid fa-arrow-down-short-wide" onclick="sortTable(3, 'asc')"></i>
                                                <i class="fa-solid fa-arrow-up-wide-short" onclick="sortTable(3, 'desc')"></i>
                                            </div>
                                        </td>
                                        <td>
                                            Summary
                                            <div class="sort-icons">
                                                <i class="fa-solid fa-arrow-down-short-wide" onclick="sortTable(4, 'asc')"></i>
                                                <i class="fa-solid fa-arrow-up-wide-short" onclick="sortTable(4, 'desc')"></i>
                                            </div>
                                        </td>
                                        <td>
                                            Thumbnail
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                    </tr>
                                    <c:forEach items="${sessionScope.blist}" var="b">
                                        <tr>
                                            <td>
                                                ${b.getBlogId()}
                                            </td>
                                            <td>
                                                <a href="/cozastore/post/detail?blogId=${b.getBlogId()}">${b.getTitle()}</a>
                                            </td>
                                            <td>
                                                ${b.getAuthor()}
                                            </td>
                                            <td>
                                                ${b.getTime()}
                                            </td>
                                            <td>
                                                ${b.getSummary()}
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${b.getThumbnail()}" onerror="this.src='./images/blog_thumbnail/err_message.jpg'"  alt="thumbnail"/>
                                            </td>
                                            <td>
                                                <c:if test="${b.isStatus()}">
                                                    <span style="color: green">Available</span>
                                                </c:if>
                                                <c:if test="${!b.isStatus()}">
                                                    <span style="color: red">Hidden</span>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <!-- Modal Logout -->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to logout?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                    <a href="logout" class="btn btn-primary">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>

        <script>
            window.onload = function () {
                sortTable(3, 'desc');
            };

            function sortTable(columnIndex, order) {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.querySelector("table");
                switching = true;
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[columnIndex];
                        y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                        if (!isNaN(x.innerHTML) && !isNaN(y.innerHTML)) {
                            // Compare as numbers
                            if (order === 'asc' && Number(x.innerHTML) > Number(y.innerHTML)) {
                                shouldSwitch = true;
                                break;
                            } else if (order === 'desc' && Number(x.innerHTML) < Number(y.innerHTML)) {
                                shouldSwitch = true;
                                break;
                            }
                        } else {
                            // Compare as strings
                            if (order === 'asc' && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            } else if (order === 'desc' && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }


        </script>

        <script>
            function searchFunction() {
                let input, filter, table, tr, td, i;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase();
                table = document.querySelector("table");
                tr = table.getElementsByTagName("tr");
                for (i = 1; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || filter.trim() === "") {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

        </script>
    </body>
</html>
