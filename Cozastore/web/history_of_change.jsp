<%-- 
    Document   : history_of_change
    Created on : Jun 18, 2023, 6:05:42 PM
    Author     : Drag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History of change</title>
    </head>

    <style>
        .content {
            padding: 20px;
            background-color: #e8e9ef;
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
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/619ea8ba83.js" crossorigin="anonymous"></script>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="components/leftBarAdminForHistory.jsp"%>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="components/topbar.jsp"%>
                    <div class="content">
                        <div class="flist container-fluid">
                            <h2 style="margin-bottom: 20px">History of change</h2>
                            <div class="row">
                                <div class="col-8">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td>Id</td>
                                                <td>Action</td>
                                                <td>Object</td>
                                                <td>Detail</td>
                                                <td>Time <i class="fa-solid fa-sort" data-sort="rating"></i></td>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach items="${sessionScope.alist}" var="a">
                                                <tr>
                                                    <td>
                                                        ${a.getId()}
                                                    </td>
                                                    <td>
                                                        ${a.getAction()}
                                                    </td>
                                                    <td>
                                                        ${a.getObject()}
                                                    </td>
                                                    <td>
                                                        ${a.getDetail()}
                                                    </td>
                                                    <td>
                                                        ${a.getTime()}
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="pagination" style="margin-top: 10px"></div>
                                </div>
                                <div class="col-4" hidden="">
                                    <div style="border: 1px black solid; padding: 10px">
                                        <h4>Filter</h4>
                                        <label for="action">Action Name: </label>
                                        <select name="action">
                                            <option value="" selected>Select action name</option>
                                            <c:forEach items="${sessionScope.actionlist}" var="p">
                                                <option value="${p}">${p}</option>
                                            </c:forEach>
                                        </select>
                                        <br/><br/>
                                        <label for="object">Object Name: </label>
                                        <select name="object">
                                            <option value="" selected>Select object name</option>
                                            <c:forEach items="${sessionScope.objectlist}" var="c">
                                                <option value="${c}">${c}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <script>
        // Get sort icons
        const sortIcons = document.querySelectorAll('.fa-sort');

// Track sort column and direction
        let sortColumn = 'time';
        let sortDirection = 'desc';

// Add click event to sort icons
        sortIcons.forEach(icon => {

            icon.addEventListener('click', () => {

                // Get current column
                const column = icon.dataset.sort;

                // If same column, toggle direction
                if (column === sortColumn) {
                    sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
                } else {
                    // New sort column, set asc
                    sortColumn = column;
                    sortDirection = 'asc';
                }

                // Get array of rows
                const rows = Array.from(tableBody.querySelectorAll('tr'));

                // Sort rows
                rows.sort((a, b) => {

                    let valueA, valueB;

                    // Get values based on column
                    if (column === 'id') {
                        valueA = parseInt(a.cells[0].textContent);
                        valueB = parseInt(b.cells[0].textContent);
                    } else if (column === 'action') {
                        valueA = a.cells[1].textContent;
                        valueB = b.cells[1].textContent;
                    } else if (column === 'object') {
                        // ...
                    }

                    // Compare values and sort
                    if (sortDirection === 'asc') {
                        return valueA > valueB ? 1 : -1;
                    } else {
                        return valueA < valueB ? 1 : -1;
                    }

                });

                // Append sorted rows 
                rows.forEach(row => tableBody.appendChild(row));

            });

        });

// Initial sort
        sortColumn = 'time';
        sortDirection = 'desc';

// Sort on first load
        const rows = Array.from(tableBody.querySelectorAll('tr'));

        // Sort rows
        rows.sort((a, b) => {

            const valueA = new Date(a.cells[4].textContent);
            const valueB = new Date(b.cells[4].textContent);

            if (sortDirection === 'asc') {
                return valueA > valueB ? 1 : -1;
            } else {
                return valueA < valueB ? 1 : -1;
            }

        });
        rows.forEach(row => tableBody.appendChild(row));
    </script>

    <script>
        const actionSelect = document.querySelector('select[name="action"]');
        const objectSelect = document.querySelector('select[name="object"]');
        const startTime = document.querySelector('input[name="start-time"]');
        const endTime = document.querySelector('input[name="end-time"]');
        const tableRows = tableBody.querySelectorAll('tr');
        const pagination = document.querySelector('#pagination');

        let currentPage = 1;
        const rowsPerPage = 15;

        function parseDate(dateString) {
            const [day, month, yearTime] = dateString.split('/');
            const [year, time] = yearTime.split(' ');
            const [hour, minute, second] = time.split(':');
            return new Date(year, month - 1, day, hour, minute, second);
        }


        function filterRows() {
            const selectedAction = actionSelect.value.trim().toLowerCase();
            const selectedObject = objectSelect.value.trim().toLowerCase();
            const selectedStartTime = new Date(startTime.value);
            let selectedEndTime = new Date(endTime.value);

            // Add one day to selected end time
            if (!isNaN(selectedEndTime.valueOf())) {
                selectedEndTime.setDate(selectedEndTime.getDate() + 1);
            }

            let visibleRows = [];

            tableRows.forEach(row => {
                const actionName = row.querySelector('td:nth-child(2)').textContent.trim().toLowerCase();
                const objectName = row.querySelector('td:nth-child(3)').textContent.trim().toLowerCase();
                const timeString = row.querySelector('td:nth-child(5)').textContent;
                const time = parseDate(timeString);

                if ((selectedAction === '' || actionName === selectedAction) &&
                        (selectedObject === '' || objectName === selectedObject) &&
                        (isNaN(selectedStartTime.valueOf()) || time >= selectedStartTime) &&
                        (isNaN(selectedEndTime.valueOf()) || time < selectedEndTime)) {
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

        actionSelect.addEventListener('change', filterRows);
        objectSelect.addEventListener('change', filterRows);
        startTime.addEventListener('change', filterRows);
        endTime.addEventListener('change', filterRows);

        filterRows();
    </script>

</html>
