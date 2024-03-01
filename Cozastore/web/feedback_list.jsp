<%-- 
    Document   : feedback_list
    Created on : Jun 18, 2023, 5:26:54 PM
    Author     : Drag
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback List</title>
        <style>
            .content {
                background-color: #e8e9ef;
                height: 100%;
            }

            .flist {
                background-color: white;
                padding: 20px;
            }

            table {
                width: 100%;
            }

            table tr td {
                border: 1px black solid;
            }

            td {
                padding: 5px;
            }

            tr td:nth-child(3) {
                width: 200px;
            }

            .view:hover {
                background-color: lightgreen!important;
                text-decoration: underline!important;
            }

            .fa-star {
                color: gold;
            }

            #fModal {
                margin-top: 70px!important;
                background: rgba(128, 128, 128, 0.4)
            }
            .content-list {
                padding: 40px;
            }

        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="components/leftBar.jsp"%>
            <div id="content-wrapper" class="d-flex flex-column">
                <div class="content">
                    <%@include file="components/topbar.jsp"%>
                    <div class="content-list">
                        <div class="flist container-fluid">
                            <h2 style="margin-bottom: 20px">Feedback List</h2>
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input style="margin-bottom: 20px; width: 30%; padding: 5px" type="text" id="searchBox" placeholder="Search for product or customer...">
                            <div class="row">
                                <div class="col-8">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td>Id <i class="fa-solid fa-sort" data-sort="id"></i></td>
                                                <td>Product Name <i class="fa-solid fa-sort" data-sort="productName"></i></td>
                                                <td>Customer Name <i class="fa-solid fa-sort" data-sort="customerName"></i></td>
                                                <td>Rating <i class="fa-solid fa-sort" data-sort="rating"></i></td>
                                                <td>Time <i class="fa-solid fa-sort" data-sort="time"></i></td>
                                                <td>Status</td>
                                                <td>Detail</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach items="${sessionScope.flist}" var="f">
                                                <tr>
                                                    <td>${f.getFeadbackId()}</td>
                                                    <td>${f.getProductName()}</td>
                                                    <td>${f.getFullName()}</td>
                                                    <td data-rating = "${f.getRating()}"></td>
                                                    <td>${f.getTime()}</td>
                                                    <td>
                                                        <c:if test="${f.isStatus()}">
                                                            <span style="color: green">Available</span>
                                                        </c:if>
                                                        <c:if test="${!f.isStatus()}">
                                                            <span style="color: red">Hidden</span>
                                                        </c:if>
                                                    </td>
                                                    <td><a style="padding: 3px 6px; background-color: lightblue; border-radius: 4px" class="view" data-feedback-detail="${f.getContent()}">View</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="pagination" style="margin-top: 10px"></div>
                                </div>
                                <div class="col-4">
                                    <div style="border: 1px black solid; padding: 10px">
                                        <h4>Filter</h4>
                                        <label for="product">Product Name: </label>
                                        <select name="product">
                                            <option value="" selected>Select product name</option>
                                            <c:forEach items="${sessionScope.plist}" var="p">
                                                <option value="${p}">${p}</option>
                                            </c:forEach>
                                        </select>
                                        <br/><br/>
                                        <label for="customer">Customer Name: </label>
                                        <select name="customer">
                                            <option value="" selected>Select customer name</option>
                                            <c:forEach items="${sessionScope.clist}" var="c">
                                                <option value="${c}">${c}</option>
                                            </c:forEach>
                                        </select>
                                        <br/><br/>
                                        <label for="rating">Rating: </label>
                                        <select name="rating" class="fa">
                                            <option value="" selected></option>
                                            <option value="1" class="fa fa-star">★</option>
                                            <option value="2" class="fa fa-star">★★</option>
                                            <option value="3" class="fa fa-star">★★★</option>
                                            <option value="4" class="fa fa-star">★★★★</option>
                                            <option value="5" class="fa fa-star">★★★★★</option>
                                        </select>
                                        <br/><br/>
                                        <label for="start-time">Start Time: </label>
                                        <input type="date" id="start-time" name="start-time">
                                        <br/><br/>
                                        <label for="end-time">End Time: </label>
                                        <input type="date" id="end-time" name="end-time">
                                        <br/><br/>
                                        <label for="status">Status </label>
                                        <select name="status">
                                            <option value="" selected>Select status</option>
                                            <option value="Available">Available</option>
                                            <option value="Hidden">Hidden</option>
                                        </select>
                                    </div>
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
        </div>

        <!-- Modal -->
        <div class="modal" id="fModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Feedback Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/cozastore/feedback/detail" method="post">
                            <!-- Feedback information fields -->
                            <div class="mb-3">
                                <label for="id" class="form-label">Id:</label>
                                <input type="text" class="form-control" id="id" name="id" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name:</label>
                                <input type="text" class="form-control" id="productName" name="productName" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="customerName" class="form-label">Customer Name:</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" readonly>
                            </div>
                            <div class= "mb-3">
                                <label for= "rating"class= "form-label">Rating:</label>
                                <div id= "rating"></div>
                            </div>
                            <div class= "mb-3">
                                <label for= "time"class= "form-label">Time:</label>
                                <input type= "text"class= "form-control"id= "time"name= "time"readonly>
                            </div>

                            <!-- Status select field -->
                            <div class= "mb-3">
                                <label for= "status"class= "form-label">Status:</label>
                                <select id= "status" name= "status" class= "form-select">
                                    <option value=""disabled selected>Select status</option>
                                    <option value= "Available">Available</option>
                                    <option value= "Hidden">Hidden</option>
                                </select>

                                <!-- Feedback detail field -->
                            </div><div class= "mb-3">
                                <label for= "feedbackDetail"class= "form-label">Feedback Detail:</label>
                                <textarea readonly id= "feedbackDetail"name= "feedbackDetail"class= "form-control"></textarea>

                                <!-- Update status button -->
                            </div><input type= "submit"value= "Update Status"class= "btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
        const rows = tableBody.querySelectorAll('tr');

        rows.forEach(row => {
            const ratingCell = row.querySelector('td:nth-child(4)');
            const rating = parseInt(ratingCell.dataset.rating);

            for (let i = 1; i <= 5; i++) {
                if (i <= rating) {
                    ratingCell.innerHTML += '<i class="fa-solid fa-star"></i>';
                } else {
                    ratingCell.innerHTML += '<i class="fa-regular fa-star"></i>';
                }
            }
        });
    </script>

    <script>
        const startTime = document.querySelector('#start-time');
        const endTime = document.querySelector('#end-time');

        startTime.addEventListener('change', () => {
            endTime.min = startTime.value;
        });
    </script>

    <script>
        const sortIcons = document.querySelectorAll('.fa-sort');

        let sortColumn = null;
        let sortDirection = 'asc';

        sortIcons.forEach(icon => {
            icon.addEventListener('click', () => {
                const column = icon.dataset.sort;

                if (column === sortColumn) {
                    sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
                } else {
                    sortColumn = column;
                    sortDirection = 'asc';
                }

                const rows = Array.from(tableBody.querySelectorAll('tr'));

                rows.sort((a, b) => {
                    let valueA;
                    let valueB;

                    switch (sortColumn) {
                        case 'id':
                            valueA = parseInt(a.querySelector('td:nth-child(1)').textContent);
                            valueB = parseInt(b.querySelector('td:nth-child(1)').textContent);
                            break;
                        case 'productName':
                            valueA = a.querySelector('td:nth-child(2)').textContent;
                            valueB = b.querySelector('td:nth-child(2)').textContent;
                            break;
                        case 'customerName':
                            valueA = a.querySelector('td:nth-child(3)').textContent;
                            valueB = b.querySelector('td:nth-child(3)').textContent;
                            break;
                        case 'rating':
                            valueA = a.querySelectorAll('td:nth-child(4) .fa-solid').length;
                            valueB = b.querySelectorAll('td:nth-child(4) .fa-solid').length;
                            break;
                        case 'time':
                            valueA = new Date(a.querySelector('td:nth-child(6)').textContent);
                            valueB = new Date(b.querySelector('td:nth-child(6)').textContent);
                            break;
                    }

                    if (sortDirection === 'asc') {
                        return valueA > valueB ? 1 : -1;
                    } else {
                        return valueA < valueB ? 1 : -1;
                    }
                });

                rows.forEach(row => tableBody.appendChild(row));
            });
        });
        sortColumn = 'time';
        sortDirection = 'desc';

        const rowss = Array.from(tableBody.querySelectorAll('tr'));

        rowss.sort((a, b) => {
            const valueA = new Date(a.querySelector('td:nth-child(6)').textContent);
            const valueB = new Date(b.querySelector('td:nth-child(6)').textContent);

            return valueA < valueB ? 1 : -1;
        });

        rowss.forEach(row => tableBody.appendChild(row));
    </script>

    <!-- JavaScript to display modal and populate fields -->
    <script>
        // Get the modal
        var modal = document.getElementById("fModal");

        // Get the view buttons
        var viewBtns = document.getElementsByClassName("view");

        // Loop through view buttons and add event listener
        for (var i = 0; i < viewBtns.length; i++) {
            viewBtns[i].addEventListener("click", function () {
                // Get table row data
                var row = this.closest("tr");
                var id = row.cells[0].innerHTML;
                var productName = row.cells[1].innerHTML;
                var customerName = row.cells[2].innerHTML;
                var rating = parseInt(row.cells[3].dataset.rating);
                var time = row.cells[4].innerHTML;
                var status = row.cells[5].querySelector("span").innerHTML;
                var feedbackDetail = row.cells[6].querySelector("a").dataset.feedbackDetail;

// Populate modal fields with table row data
                document.getElementById("id").value = id;
                document.getElementById("productName").value = productName;
                document.getElementById("customerName").value = customerName;
                document.getElementById("status").defaultValue = status;

                const ratingDiv = document.getElementById("rating");
                ratingDiv.innerHTML = "";

                for (let i = 1; i <= 5; i++) {
                    if (i <= rating) {
                        ratingDiv.innerHTML += '<i class ="fa-solid fa-star"></i>';
                    } else {
                        ratingDiv.innerHTML += '<i class ="fa-regular fa-star"></i>';
                    }
                }

                document.getElementById("time").value = time;
                document.getElementById("status").value = status;
                document.getElementById("feedbackDetail").value = feedbackDetail;

                // Display the modal
                modal.style.display = "block";

                // Get the status select field and update status button
                var statusSelect = document.getElementById("status");
                var updateStatusBtn = document.querySelector("input[type='submit']");

// Add event listener to status select field
                statusSelect.addEventListener("change", function () {
                    // Check if status has changed
                    console.log(this.value);
                    console.log(this.defaultValue);
                    if (this.value !== this.defaultValue) {
                        // Status has changed, enable update status button
                        updateStatusBtn.disabled = false;
                    } else {
                        // Status has not changed, disable update status button
                        updateStatusBtn.disabled = true;
                    }
                });

// Set initial state of update status button to disabled
                updateStatusBtn.disabled = true;
            });
        }

        // Get the close button
        var closeBtn = document.querySelector(".btn-close");

// Add event listener to close button
        closeBtn.addEventListener("click", function () {

            // Hide the modal
            modal.style.display = "none";
        });

    </script>

    <script>
        const searchBox = document.querySelector('#searchBox');

        searchBox.addEventListener('input', () => {
            const query = searchBox.value.toLowerCase();

            rows.forEach(row => {
                const productName = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                const customerName = row.querySelector('td:nth-child(3)').textContent.toLowerCase();

                if (productName.includes(query) || customerName.includes(query)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>

    <script>
        const productSelect = document.querySelector('select[name="product"]');
        const customerSelect = document.querySelector('select[name="customer"]');
        const ratingSelect = document.querySelector('select[name="rating"]');
        const statusSelect = document.querySelector('select[name="status"]');
        const tableRows = tableBody.querySelectorAll('tr');
        const pagination = document.querySelector('#pagination');

        let currentPage = 1;
        const rowsPerPage = 5;

        function filterRows() {
            const query = searchBox.value.toLowerCase();
            const selectedProduct = productSelect.value;
            const selectedCustomer = customerSelect.value;
            const selectedRating = parseInt(ratingSelect.value);
            const selectedStartTime = new Date(startTime.value);
            let selectedEndTime = new Date(endTime.value);
            const selectedStatus = statusSelect.value;

            // Add one day to selected end time
            if (!isNaN(selectedEndTime.valueOf())) {
                selectedEndTime.setDate(selectedEndTime.getDate() + 1);
            }

            let visibleRows = [];

            tableRows.forEach(row => {
                const productName = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                const customerName = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                const rating = parseInt(row.querySelector('td:nth-child(4)').dataset.rating);
                const time = new Date(row.querySelector('td:nth-child(5)').textContent);
                const status = row.querySelector('td:nth-child(6) span').textContent.toLowerCase();

                if ((productName.includes(query) || customerName.includes(query)) &&
                        (selectedProduct === '' || productName === selectedProduct.toLowerCase()) &&
                        (selectedCustomer === '' || customerName === selectedCustomer.toLowerCase()) &&
                        (isNaN(selectedRating) || rating === selectedRating) &&
                        (isNaN(selectedStartTime.valueOf()) || time >= selectedStartTime) &&
                        (isNaN(selectedEndTime.valueOf()) || time < selectedEndTime) &&
                        (selectedStatus === '' || status === selectedStatus)) {
                    visibleRows.push(row);
                } else {
                    row.style.display = 'none';
                }
            });

            // Update pagination
            updatePagination(visibleRows.length);

            // Show rows for current page
            showPage(visibleRows, currentPage);
        }


        function updatePagination(totalRows) {
            // Calculate total number of pages
            const totalPages = Math.ceil(totalRows / rowsPerPage);

            // Reset current page to last page if it is greater than total pages
            if (currentPage > totalPages) {
                currentPage = 1;
            }

            // Clear pagination
            pagination.innerHTML = '';

            // Add previous page button
            const prevButton = document.createElement('button');
            prevButton.textContent = 'Prev';
            prevButton.disabled = currentPage === 1;
            prevButton.addEventListener('click', () => {
                currentPage--;
                filterRows();
            });
            pagination.appendChild(prevButton);

            // Add page buttons
            for (let i = 1; i <= totalPages; i++) {
                const pageButton = document.createElement('button');
                pageButton.textContent = i;
                pageButton.disabled = i === currentPage;
                pageButton.addEventListener('click', () => {
                    currentPage = i;
                    filterRows();
                });
                pagination.appendChild(pageButton);
            }

            // Add next page button
            const nextButton = document.createElement('button');
            nextButton.textContent = 'Next';
            nextButton.disabled = currentPage === totalPages;
            nextButton.addEventListener('click', () => {
                currentPage++;
                filterRows();
            });
            pagination.appendChild(nextButton);
        }


        function showPage(rows, page) {
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            rows.forEach((row, index) => {
                if (index >= start && index < end) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        searchBox.addEventListener('input', filterRows);
        productSelect.addEventListener('change', filterRows);
        customerSelect.addEventListener('change', filterRows);
        ratingSelect.addEventListener('change', filterRows);
        startTime.addEventListener('change', filterRows);
        endTime.addEventListener('change', filterRows);
        statusSelect.addEventListener('change', filterRows);

    </script>

    <script>

        searchBox.addEventListener('input', filterRows);
        productSelect.addEventListener('change', filterRows);
        customerSelect.addEventListener('change', filterRows);
        ratingSelect.addEventListener('change', filterRows);
        startTime.addEventListener('change', filterRows);
        endTime.addEventListener('change', filterRows);
        statusSelect.addEventListener('change', filterRows);

// Call filterRows once when the page loads to initialize pagination
        filterRows();

    </script>

</html>
