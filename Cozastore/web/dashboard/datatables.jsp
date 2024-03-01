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
        <title>Product Table</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
            <%@include file="../components/saleLeftBar.jsp"%>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <%@include file="../components/topbar.jsp"%>
                    <!-- Topbar -->
                    <!-- Container Fluid-->
                    <div class="container-fluid pos-relative" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Product List</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Tables</li>
                                <li class="breadcrumb-item active" aria-current="page">Product</li>
                            </ol>
                        </div>

                        <!-- Row -->
                        <div class="row">
                            <!-- Datatables -->
                            <div class="col-lg-12">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
                                        <div>
                                            <button onclick="download()" class="btn btn-primary pointer"> Excel
                                                <i class="fas fa-download"></i>
                                            </button>
                                            <a  class="btn btn-primary pointer" style="color: #FFF" href="addnewproduct"> Add New
                                                <i class="fas fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="table-responsive p-3">
                                        <table class="table align-items-center table-flush" id="dataTable">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Image</th>
                                                    <th>Selling price (USD)</th>
                                                    <th>Cost price (USD)</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.productList}" var="product">
                                                    <tr>
                                                        <td>${product.productId}</td>
                                                        <td>${product.productName}</td>
                                                        <td><img src="${product.productImageDefault}" alt="IMG-PRODUCT" style="width: 100px" /> </td>
                                                        <td>${product.price}</td>
                                                        <td>${product.entryPrice}</td>
                                                        <td>
                                                            <c:if test="${product.totalQuantity == 0}">
                                                                <button type="button" class="btn btn-secondary mb-1" data-toggle="tooltip" title="The warehouse has been out of stock">Sold Out</button><br/>
                                                            </c:if>
                                                            <c:if test="${product.totalQuantity > 0 && !product.quantitySizeColor}" >
                                                                <button type="button" class="btn btn-warning mb-1" data-toggle="tooltip" title="Size is out of stock, click to view details">Some sizes <br/>out of stock</button> <br/>
                                                                </c:if>
                                                                <c:if test="${product.totalQuantity > 0 && product.quantitySizeColor}" >
                                                                <button type="button" class="btn btn-success mb-1" data-toggle="tooltip" title="The warehouse has sufficient stock">In Stock</button> <br/>
                                                            </c:if>



                                                        </td>
                                                        <td>
                                                            <a href="product-detail-manage?id=${product.productId}" class=" btn btn-info btn-sm" data-toggle="tooltip" title="View and update" >
                                                                <i class="fas fa-info-circle"></i>
                                                            </a>
                                                            <button onclick="displayModal('${product.productId}')" class="btn btn-danger btn-sm" data-toggle="tooltip" title="Delete" style="cursor: pointer;">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </td>
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
            function displayModal(productName) {
                if (confirm("Do you want delete " + productName + "?")) {
                    window.location = "delete-product?id=" + productName;
                }
            }

            function download() {
                window.location= "download"
            }
        </script>

    </body>

</html>