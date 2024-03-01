<%-- 
    Document   : marketing_dashboard
    Created on : May 25, 2023, 1:14:46 AM
    Author     : Drag
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marketing Dashboard</title>
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            html, body {
                margin: 0;
                padding: 0;
            }

            .content {
                background-color: #e8e9ef;
                width: 100%;
            }

            .container {
                margin: 0 !important;
                width: 100% !important;
                max-width: 100% !important;
            }

            .content-container {
                padding: 20px
            }

            .widget-item {
                box-sizing: border-box !important;
                background-color: white;
                padding: 20px;
                margin: 10px 20px;
                width: 47%;
                border-radius: 15px
            }

            .ageChart {
                width: 48%
            }

        </style>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="../components/leftBar.jsp"%>
            <div class="content w-100 p-0">
                <%@include file="../components/topbar.jsp"%>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
                <div class="container"  >
                    <div class="row" style="justify-content: space-between">
                        <div class="widget-item">
                            <ion-icon name="newspaper-sharp"></ion-icon> Post
                            <p>Number of post by 
                                <select name="time_range" id="timeRange" onchange="updatePostTotal()"> 
                                    <option value="0" selected="">All time</option>
                                    <option value="3">This month</option>
                                    <option value="1">Last month</option>
                                    <option value="2">Last 6 months</option>
                                </select> : <span class="numPost">${sessionScope.numPost}</span></p>
                            <div class="canva">
                                <h3 style="text-align: center">Number of post by categories</h3>
                                <canvas id="postChart"></canvas>
                            </div>
                        </div>
                        <div class="widget-item">
                            <ion-icon name="people-sharp"></ion-icon> Customer
                            <p>Number of active Customer: ${sessionScope.userCount}</p>
                            <div style="display: flex; justify-content: space-between">
                                <div class="ageChart">
                                    <h4 style="text-align: center">Number of user by age groups</h4>
                                    <canvas id="ageChart"></canvas>
                                </div>
                                <div class="ageChart">
                                    <h4 style="text-align: center">Number of user by gender</h4>
                                    <canvas id="genderChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="justify-content: space-between">
                        <div class="widget-item">
                            <ion-icon name="chatbox-ellipses-sharp"></ion-icon> Feedback
                            <p>Average rating by 
                                <select name="time_range_feedback" id="timeRange_feedback" onchange="updateFeedbackTotal()"> 
                                    <option value="0" selected="">All time</option>
                                    <option value="3">This month</option>
                                    <option value="1">Last month</option>
                                    <option value="2">Last 6 months</option>
                                </select> : <span class="numFeedback">${sessionScope.feedbackAverage}</span><i class ="fa-regular fa-star" style="color: gold"></i></p>
                            <h3 style="text-align: center">Number of feedback by ratings</h3>
                            <canvas id="feedbackChart"></canvas>
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
        </div>        
    </body>
    <script>
        var ctx = document.getElementById('postChart').getContext('2d');
        var labels = [];
        <c:forEach items="${sessionScope.categories}" var="category">
        labels.push("${category}");
        </c:forEach>

        var data = [];
        <c:forEach items="${sessionScope.postCounts}" var="count">
        data.push(${count});
        </c:forEach>
        // Create chart
        var postChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: '# of posts',
                        data: data
                    }]
            }
        });

        var dataLastMonth = [];
        <c:forEach items="${sessionScope.postCountsLastMonth}" var="count">
        dataLastMonth.push(${count});
        </c:forEach>
        var dataLast6Months = [];
        <c:forEach items="${sessionScope.postCountsLast6Months}" var="count">
        dataLast6Months.push(${count});
        </c:forEach>
        var dataThisMonth = [];
        <c:forEach items="${sessionScope.postCountsCurrentMonth}" var="count">
        dataThisMonth.push(${count});
        </c:forEach>
        function updatePostTotal() {
            let timeRange = document.getElementById("timeRange").value;
            if (timeRange === "1") {
                let numPostLastMonth = ${sessionScope.numPostLastMonth};
                document.querySelector(".numPost").textContent = numPostLastMonth;
                postChart.data.datasets[0].data = dataLastMonth; // Update the chart data
            } else if (timeRange === "2") {
                let numPostLast6Months = ${sessionScope.numPostLast6Months};
                document.querySelector(".numPost").textContent = numPostLast6Months;
                postChart.data.datasets[0].data = dataLast6Months;
            } else if (timeRange === "3") {
                let numPostCurrentMonth = ${sessionScope.numPostCurrentMonth};
                document.querySelector(".numPost").textContent = numPostCurrentMonth;
                postChart.data.datasets[0].data = dataThisMonth;
            } else {
                let numPost = ${sessionScope.numPost};
                document.querySelector(".numPost").textContent = numPost;
                postChart.data.datasets[0].data = data; // Update the chart data
            }

            postChart.update(); // Update the chart
        }
    </script>
    <script>
        var ctxFeedback = document.getElementById('feedbackChart').getContext('2d');
        var labels = ["1", "2", "3", "4", "5"];
        var dataFeedback = [];
        <c:forEach items="${sessionScope.feedbackCounts}" var="count">
        dataFeedback.push(${count});
        </c:forEach>
        // Create chart
        var feedbackChart = new Chart(ctxFeedback, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: '# of ratings',
                        data: dataFeedback,
                        backgroundColor: 'rgb(106, 90, 205)'
                    }]
            }
        });

        var dataFeedbackLastMonth = [];
        <c:forEach items="${sessionScope.feedbackCountsLastMonth}" var="count">
        dataFeedbackLastMonth.push(${count});
        </c:forEach>
        var dataFeedbackLast6Months = [];
        <c:forEach items="${sessionScope.feedbackCountsLast6Months}" var="count">
        dataFeedbackLast6Months.push(${count});
        </c:forEach>
        var dataFeedbackThisMonth = [];
        <c:forEach items="${sessionScope.feedbackCountsThisMonth}" var="count">
        dataFeedbackThisMonth.push(${count});
        </c:forEach>
        function updateFeedbackTotal() {
            let timeRange = document.getElementById("timeRange_feedback").value;
            if (timeRange === "1") {
                let feedbackAverageLastMonth = ${sessionScope.feedbackAverageLastMonth};
                document.querySelector(".numFeedback").textContent = feedbackAverageLastMonth;
                feedbackChart.data.datasets[0].data = dataFeedbackLastMonth; // Update the chart data
            } else if (timeRange === "2") {
                let feedbackAverageLast6Months = ${sessionScope.feedbackAverageLast6Months};
                document.querySelector(".numFeedback").textContent = feedbackAverageLast6Months;
                feedbackChart.data.datasets[0].data = dataFeedbackLast6Months;
            } else if (timeRange === "3") {
                let feedbackAverageThisMonth = ${sessionScope.feedbackAverageThisMonth};
                document.querySelector(".numFeedback").textContent = feedbackAverageThisMonth;
                feedbackChart.data.datasets[0].data = dataFeedbackThisMonth;
            } else {
                let feedbackAverage = ${sessionScope.feedbackAverage};
                document.querySelector(".numFeedback").textContent = feedbackAverage;
                feedbackChart.data.datasets[0].data = dataFeedback; // Update the chart data
            }

            feedbackChart.update(); // Update the chart
        }
    </script>
    <script>
        var ctx = document.getElementById('ageChart').getContext('2d');

        var labels = ["<18", "18-24", "25-34", "35-44", "45-54", "55+"];
        var dataAge = [];
        <c:forEach var="count" items="${sessionScope.ageGroups}">
        dataAge.push(${count});
        </c:forEach>
        console.log(dataAge);

// Create pie chart  
        var ageChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: dataAge
                    }]
            }
        });
    </script>
    <script>
        var ctx = document.getElementById('genderChart').getContext('2d');

        var labels = ["Male", "Female"];
        var genderAge = [];
        <c:forEach var="count" items="${sessionScope.genderGroups}">
        genderAge.push(${count});
        </c:forEach>
        console.log(genderAge);

// Create pie chart  
        var ageChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: genderAge
                    }]
            }
        });
    </script>
</html>
