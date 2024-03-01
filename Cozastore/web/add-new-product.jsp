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
        <!-- Select2 -->
        <link href="vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
        <!-- Bootstrap DatePicker -->  
        <link href="vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
        <!-- Bootstrap Touchspin -->
        <link href="vendor/bootstrap-touchspin/css/jquery.bootstrap-touchspin.css" rel="stylesheet" >
        <!-- ClockPicker -->
        <link href="vendor/clock-picker/clockpicker.css" rel="stylesheet">
        <!-- RuangAdmin CSS -->
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/product-manage.css"/>
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
            .back-btn {
                font-size: 24px;
            }
            .back-table {
                text-align: center;
                line-height: 32px;
                text-decoration: none;
            }

            .back-table:hover {
                text-decoration: none;
                color: #000;
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
                        <h2>${requestScope.a}</h2>
                        <div>
                            <a href="table-product" class="back-btn"><ion-icon name="arrow-back-outline"></ion-icon></a>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="container">
                                    <form method="post" action="addnewproduct" enctype="multipart/form-data">
                                        <input  name="productId" hidden/>
                                        <!-- basic information -->
                                        <div class="product-detail">
                                            <div class="title">
                                                <div class="title-form">Basic Information</div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title">
                                                    Product name
                                                </div>
                                                <div class="product-detail-input">
                                                    <input type="text" name="productName" placeholder="Input Product Name"  required/>
                                                </div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title">
                                                    Category
                                                </div>
                                                <div class="product-detail-input">
                                                    <select name="category" class="capitalized-text">
                                                        <c:forEach items="${requestScope.categories}" var="c">
                                                            <option class="capitalized-text" ${requestScope.category == c ? "selected":""}>${c}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title">
                                                    Cost Price (USD)
                                                </div>
                                                <div class="product-detail-input">
                                                    <input type="text" name="costPrice"  required/>
                                                </div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title">
                                                    Selling Price (USD)
                                                </div>
                                                <div class="product-detail-input">
                                                    <input type="text" name="sellingPrice" required/>
                                                </div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title"  style="align-items: normal; ">
                                                    Describe
                                                </div>
                                                <div class="product-detail-input">
                                                    <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="describe" placeholder="Write Describe" required></textarea>
                                                </div>
                                            </div>
                                            <div class="d-flex product-input">
                                                <div class="product-detail-title">
                                                    Discount (%)
                                                </div>
                                                <div class="product-detail-input">
                                                    <input type="text" name="discount" required/>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex product-input" id="simple-date4">
                                                <div for="dateRangePicker" class="product-detail-title">Discount time</div>
                                                <div class="input-daterange product-detail-date  discount">
                                                    <input type="text" class="input-sm form-control" name="startDate"/>
                                                    <span style="padding: 5px;"> to </span>
                                                    <input type="text" class="input-sm form-control" name="endDate" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Size Color Image -->
                                        <div class="product-detail" >
                                            <div id="allRecord" >
                                                <div class="title">
                                                    <div class="title-form">Size Color Image</div>
                                                </div>
                                                <!-- Record -->
                                                <div class="row record">
                                                    <!-- color form -->
                                                    <div class="col-md-3">
                                                        <div class="scp-tittle">
                                                            Color
                                                        </div>
                                                        <div class="scp-detail">
                                                            <div class="form-group" id="color">
                                                                <select class="select2-single-placeholder form-control select2SinglePlaceholder color" onchange="changeValueDefault(this)" name="color" >
                                                                    <c:forEach items="${requestScope.colors}" var="color">
                                                                        <option value="${color}" >${color}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <div class="more-color">
                                                                    <input type="text" class="input-color" placeholder="New color"/>
                                                                    <button onclick="color(this)" class="btn-sm btn-primary pointer add-color ">
                                                                        <i class="fas fa-plus icon-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <!-- size form -->
                                                    <div class="col-md-4">
                                                        <div class="scp-tittle">
                                                            Size
                                                        </div>
                                                        <div class="size-input">
                                                            <c:forEach items="${requestScope.sizes}" var="size">
                                                                <div class="size-input-detail">
                                                                    <div>
                                                                        <input onchange="log(this)" class="checkbox" name="size" checked type="checkbox" value="${size}"/><span class="size-title">${size}</span>
                                                                    </div>
                                                                    <input type="text" class="border1 slide2 input-quantity myInput" pattern="[0-9]+" 
                                                                           placeholder="Enter quantity" 
                                                                           title="Quantity must be natural number." 
                                                                           id="numberInput" name="quantity"  />
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <!-- image form -->
                                                    <div class="col-md-5">
                                                        <div class="img-default">
                                                            <input onchange="checkedImage(this)" type="checkbox"
                                                                   name="defaultImage" checked  class="checkedImage"/><span style="margin-left: 6px;">Default Image</span>
                                                        </div>
                                                        <div class="image">
                                                            <input type="file" name="image" class="file-input" accept="image/*" hidden>
                                                            <div class="img-area " data-img="Choose another Image">
                                                                <i class="fas fa-cloud-upload-alt icon"></i>
                                                                <h3>Upload Image</h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="close-btn" onclick="deleteRecord(this)">
                                                        <ion-icon name="close-outline"></ion-icon>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Add new record -->
                                            <div class="add-new">
                                                <button type="button" onclick="addNewRecord()" class="btn btn-primary pointer"> Add New
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- Submit form -->
                                        <div class="save">
                                            <div class="save-content">
                                                <a href="table-product"  class="back-table save-submit">Cancel</a>
                                                <button type="submit" class="save-submit">Save</button>
                                            </div>
                                        </div>
                                    </form>
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
                        <!-- Success -->
                        <div class="alert alert-success alert-dismissible pos-absolute d-none ${requestScope.success}" role="alert">
                            <button type="button" class="close pointer" data-dismiss="alert" aria-label="Close" style="cursor: pointer;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h6><i class="fas fa-check"></i><b> Success!</b></h6>
                            Updated success!
                        </div>
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
        <!-- Select2 -->
        <script src="vendor/select2/dist/js/select2.min.js"></script>
        <!-- Bootstrap Datepicker -->
        <script src="vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <!-- Bootstrap Touchspin -->
        <script src="vendor/bootstrap-touchspin/js/jquery.bootstrap-touchspin.js"></script>
        <!-- ClockPicker -->
        <script src="vendor/clock-picker/clockpicker.js"></script>
        <!-- RuangAdmin Javascript -->
        <script src="js/ruang-admin.min.js"></script>
        <script src="js/productDetail.js"></script>

        <!-- Javascript for this page -->

        <script>
                                                    var color = document.getElementsByClassName("color");
                                                    var checkedImage = document.getElementsByClassName("checkedImage");
                                                    for (let i = 0, max = 10; i < color.length; i++) {
                                                        checkedImage[i].value = color[i].value;
                                                    }
        </script>

        <script>
            function addNewRecord() {

                $.ajax({
                    url: "/cozastore/addnewrecord",
                    type: "get",
                    data: {

                    },
                    success: function (data) {
                        var row = document.querySelector("#allRecord");
                        row.innerHTML += data;
                        $.getScript('js/productDetail.js', function () {

                        });
                    },

                });
            }

            function redirect() {
                window.location.href = 'table-product';
            }
            function validateInput() {
                var costPriceInput = document.getElementsByName("costPrice")[0];
                var sellingPriceInput = document.getElementsByName("sellingPrice")[0];

                var decimalPattern = /^\d+(\.\d+)?$/;

                costPriceInput.addEventListener("input", function (event) {
                    var inputValue = event.target.value.trim();

                    if (!decimalPattern.test(inputValue) || parseFloat(inputValue) <= 0) {
                        event.target.setCustomValidity("Invalid value. Please enter a decimal number greater than 0.");
                    } else {
                        event.target.setCustomValidity("");
                    }
                });

                sellingPriceInput.addEventListener("input", function (event) {
                    var inputValue = event.target.value.trim();

                    if (!decimalPattern.test(inputValue) || parseFloat(inputValue) <= 0) {
                        event.target.setCustomValidity("Invalid value. Please enter a decimal number greater than 0.");
                    } else {
                        event.target.setCustomValidity("");
                    }
                });

                //valid discount
                var discountInput = document.getElementsByName("discount")[0];

                discountInput.addEventListener("input", function (event) {
                    var inputValue = event.target.value.trim();
                    var floatValue = parseFloat(inputValue);

                    var decimalPattern = /^\d+(\.\d+)?$/;

                    if (!decimalPattern.test(inputValue) || floatValue < 0 || floatValue >= 100) {
                        event.target.setCustomValidity("Invalid value. Please enter a decimal number between 0 and 100.");
                    } else {
                        event.target.setCustomValidity("");
                    }
                });
                // validate describe
                var describeInput = document.getElementsByName("describe")[0];

                describeInput.addEventListener("input", function (event) {
                    var inputValue = event.target.value.trim();
                    var wordCount = inputValue.split(" ").filter(function (word) {
                        return word.length > 0;
                    }).length;

                    if (wordCount < 20) {
                        event.target.setCustomValidity("Please enter at least 20 words.");
                    } else {
                        event.target.setCustomValidity("");
                    }
                });

            }

        </script>


    </body>
</html>