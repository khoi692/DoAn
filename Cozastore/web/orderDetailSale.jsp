<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="images/icons/favicon.png" rel="icon">
        <title>Order Detail</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.19/sweetalert2.min.css" integrity="sha512-yX1R8uWi11xPfY7HDg7rkLL/9F1jq8Hyiz8qF4DV2nedX4IVl7ruR2+h3TFceHIcT5Oq7ooKi09UZbI39B7ylw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>

            .pos-relative {
                position: relative;
            }
            .pos-absolute {
                width: 25%;
                position: absolute;
                top:0;
                right: 0;
                animation: slide ease 1s, fadeOut linear 1s 4s forwards;
            }
            .pointer{
                cursor: pointer;
            }
            @keyframes slide {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            @keyframes fadeOut {
                to{
                    opacity: 0;
                }
            }
        </style>

    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="components/saleLeftBar.jsp"%>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <%@include file="components/topbar.jsp"%>
                    <!-- Topbar -->
                    <!-- Container Fluid-->
                    <div class="container-fluid pos-relative" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Order ID: ${requestScope.id}</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Order</li>
                                <li class="breadcrumb-item active" aria-current="page">Order Detail ${requestScope.id}</li>
                            </ol>
                        </div>
                        <!-- Row -->
                        <div class="row">
                            <!-- Datatables -->
                            <div class="col-lg-12">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h5 class="mr-5 font-weight-bold text-primary">TOTAL: $${requestScope.total}</h5>
                                        <div>
                                            <span class="font-weight-bold text-primary">Order Status: </span>
                                            <select
                                                onchange="changeStatus(${requestScope.id}, event)"
                                                id="statusSelect"
                                                >
                                                <c:forEach 
                                                    items="${requestScope.orderStatus}" 
                                                    var="status" 
                                                    >
                                                    <option ${status.name.equalsIgnoreCase(requestScope.status) ? "selected" : "" }
                                                        value="${status.id}"
                                                        >${status.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="table-responsive p-3">
                                        <table class="table align-items-center table-flush" id="dataTable">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Product Name</th>
                                                    <th>Image</th>
                                                    <th>Color</th>
                                                    <th>Size</th>
                                                    <th>Quantity</th>
                                                    <th>Total Price (USD)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.orderDetail}" var="od">
                                                    <tr>
                                                        <td>${od.productId}</td>
                                                        <td>${od.productName}</td>
                                                        <td><img src="${od.image}" alt="Product Image" style="width: 100px" /></td>
                                                        <td>${od.color}</td>
                                                        <td>${od.size}</td>
                                                        <td>${od.quantity}</td>
                                                        <td>$${od.quantity * od.price}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!--Row-->


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
                                        <a href="login.jsp" class="btn btn-primary">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Alerts -->
                        <!-- Success -->
                        <div class="alert alert-success alert-dismissible pos-absolute d-none ${requestScope.success}" role="alert">
                            <button type="button" class="close pointer" data-dismiss="alert" aria-label="Close" style="cursor: pointer;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h6><i class="fas fa-check"></i><b> Success!</b></h6>
                            Deleted success!
                        </div>

                        <!-- Warning -->
                        <div class="alert alert-warning alert-dismissible pos-absolute d-none ${requestScope.warning}" role="alert">
                            <button type="button" class="close pointer" data-dismiss="alert" aria-label="Close" style="cursor: pointer;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h6><i class="fas fa-exclamation-triangle"></i><b> Warning!</b></h6>
                            Access denined!
                        </div>

                        <!-- Error -->    
                        <div class="alert alert-danger alert-dismissible pos-absolute d-none ${requestScope.error}" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="cursor: pointer;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h6><i class="fas fa-ban"></i><b> Error!</b></h6>
                            Product does not exist!
                        </div>
                        <!-- Alerts -->
                    </div>
                    <!---Container Fluid-->
                </div>



            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/ruang-admin.min.js"></script>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.19/sweetalert2.min.js" integrity="sha512-zHKwhWCHqpmDbi6d/5Fnuwr7JKmzmpXErmoVE0OX2i0TRLlJy+19j1YzRRzD/CnpjGMSD3P0XVo+ca6v4tbn4A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Page level custom scripts -->
        <script>
                                                    $(document).ready(function () {
                                                        $('#dataTable').DataTable(); // ID From dataTable 
                                                        $('#dataTableHover').DataTable(); // ID From dataTable with Hover
                                                    });
                                                    $(document).ready(function () {
                                                        $('[data-toggle="tooltip"]').tooltip();
                                                    });
        </script>
        <script>
            let orderStatusId = ${requestScope.statusId}
            console.log(orderStatusId);

            let status = document.getElementById('statusSelect').value;
            if (status === '3') { // If 'Pending' is selected
                hideOption(statusSelect, '3'); // Hide 'Pending'
                hideOption(statusSelect, '5'); // Hide 'Shipping'
                hideOption(statusSelect, '1'); // Hide 'Successfull'
            } else if (status === '4') { // If 'Preparing order' is selected
                hideOption(statusSelect, '4'); // Hide 'Preparing'
                hideOption(statusSelect, '1'); // Hide 'Successful'
                hideOption(statusSelect, '2'); // Hide 'Fail'
                hideOption(statusSelect, '3'); // Hide 'Pending'
            } else if (status === '5') { // If 'Shipping' is selected
                hideOption(statusSelect, '4'); // Hide 'Preparing order'
                hideOption(statusSelect, '5'); // Hide 'Shipping'
                hideOption(statusSelect, '3'); // Hide 'Pending'
            } else { // If 'Successful' or 'Fail' is selected
                hideOption(statusSelect, '1'); // Hide 'Successful'
                hideOption(statusSelect, '2'); // Hide 'Fail'
                hideOption(statusSelect, '3'); // Hide 'Pending'
                hideOption(statusSelect, '4'); // Hide 'Preparing order'
                hideOption(statusSelect, '5'); // Hide 'Shipping'
            }


            function changeStatus(orderId, event) {
                Swal.fire({
                    title: 'Do you want to change status?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                }).then((result) => {
                    if (result.isConfirmed) {
                        const statusId = event.target.value;
                        const statusSelect = document.getElementById('statusSelect');

                        // Reset all options to be visible
                        for (let i = 0; i < statusSelect.options.length; i++) {
                            statusSelect.options[i].style.display = 'block';
                        }

                        // Hide options based on the selected value
                        if (statusId === '3') { // If 'Pending' is selected
                            hideOption(statusSelect, '3'); // Hide 'Pending'
                            hideOption(statusSelect, '5'); // Hide 'Shipping'
                            hideOption(statusSelect, '1'); // Hide 'Successfull'
                        } else if (statusId === '4') { // If 'Preparing order' is selected
                            hideOption(statusSelect, '4'); // Hide 'Preparing'
                            hideOption(statusSelect, '1'); // Hide 'Successful'
                            hideOption(statusSelect, '2'); // Hide 'Fail'
                            hideOption(statusSelect, '3'); // Hide 'Pending'
                        } else if (statusId === '5') { // If 'Shipping' is selected
                            hideOption(statusSelect, '4'); // Hide 'Preparing order'
                            hideOption(statusSelect, '5'); // Hide 'Shipping'
                            hideOption(statusSelect, '3'); // Hide 'Pending'
                        } else { // If 'Successful' or 'Fail' is selected
                            hideOption(statusSelect, '1'); // Hide 'Successful'
                            hideOption(statusSelect, '2'); // Hide 'Fail'
                            hideOption(statusSelect, '3'); // Hide 'Pending'
                            hideOption(statusSelect, '4'); // Hide 'Preparing order'
                            hideOption(statusSelect, '5'); // Hide 'Shipping'
                        }

                        $.ajax({
                            url: "/cozastore/change-status",
                            type: "get",
                            data: {
                                orderId: orderId,
                                statusId: statusId,
                                oldStatusId: orderStatusId
                            },
                            dataType: "json",
                            success: function (data) {
                                Swal.fire('Some product have\'t enough quantity', data.notify, 'error');
                                event.target.value = orderStatusId;
                                const statusSelect = document.getElementById('statusSelect');
                                // Reset all options to be visible
                                for (let i = 0; i < statusSelect.options.length; i++) {
                                    statusSelect.options[i].style.display = 'block';
                                }
                                if (orderStatusId == '3') { // If 'Pending' is selected
                                    console.log(orderStatusId == '3');
                                    hideOption(statusSelect, '3'); // Hide 'Pending'
                                    hideOption(statusSelect, '5'); // Hide 'Shipping'
                                    hideOption(statusSelect, '1'); // Hide 'Successfull'
                                } else if (orderStatusId == '4') { // If 'Preparing order' is selected
                                    hideOption(statusSelect, '4'); // Hide 'Preparing'
                                    hideOption(statusSelect, '1'); // Hide 'Successful'
                                    hideOption(statusSelect, '2'); // Hide 'Fail'
                                    hideOption(statusSelect, '3'); // Hide 'Pending'
                                } else if (orderStatusId == '5') { // If 'Shipping' is selected
                                    hideOption(statusSelect, '4'); // Hide 'Preparing order'
                                    hideOption(statusSelect, '5'); // Hide 'Shipping'
                                    hideOption(statusSelect, '3'); // Hide 'Pending'
                                } else { // If 'Successful' or 'Fail' is selected
                                    hideOption(statusSelect, '1'); // Hide 'Successful'
                                    hideOption(statusSelect, '2'); // Hide 'Fail'
                                    hideOption(statusSelect, '3'); // Hide 'Pending'
                                    hideOption(statusSelect, '4'); // Hide 'Preparing order'
                                    hideOption(statusSelect, '5'); // Hide 'Shipping'
                                }
                            },
                            error: function () {
                                Swal.fire('Change success!', '', 'success');
                                orderStatusId = statusId;
                            }
                        });

                    }
                });

            }

            function hideOption(selectElement, optionValue) {
                for (let i = 0; i < selectElement.options.length; i++) {
                    const option = selectElement.options[i];
                    if (option.value === optionValue) {
                        option.style.display = 'none';
                        break;
                    }
                }
            }

        </script>

    </body>

</html>