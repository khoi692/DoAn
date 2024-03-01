<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="img/logo/logo.png" rel="icon">
        <title>RuangAdmin - Form Advanceds</title>
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!-- Select2 -->
        <link href="../vendor/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css">
        <!-- Bootstrap DatePicker -->  
        <link href="../vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" >
        <!-- Bootstrap Touchspin -->
        <link href="../vendor/bootstrap-touchspin/css/jquery.bootstrap-touchspin.css" rel="stylesheet" >
        <!-- ClockPicker -->
        <link href="../vendor/clock-picker/clockpicker.css" rel="stylesheet">
        <!-- RuangAdmin CSS -->
        <link href="../css/ruang-admin.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon">
                        <img src="img/logo/logo2.png">
                    </div>
                    <div class="sidebar-brand-text mx-3">RuangAdmin</div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Features
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
                       aria-expanded="true" aria-controls="collapseBootstrap">
                        <i class="far fa-fw fa-window-maximize"></i>
                        <span>Bootstrap UI</span>
                    </a>
                    <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Bootstrap UI</h6>
                            <a class="collapse-item" href="alerts.jsp">Alerts</a>
                            <a class="collapse-item" href="buttons.jsp">Buttons</a>
                            <a class="collapse-item" href="dropdowns.jsp">Dropdowns</a>
                            <a class="collapse-item" href="modals.jsp">Modals</a>
                            <a class="collapse-item" href="popovers.jsp">Popovers</a>
                            <a class="collapse-item" href="progress-bar.jsp">Progress Bars</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
                       aria-controls="collapseForm">
                        <i class="fab fa-fw fa-wpforms"></i>
                        <span>Forms</span>
                    </a>
                    <div id="collapseForm" class="collapse show" aria-labelledby="headingForm" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Forms</h6>
                            <a class="collapse-item" href="form_basics.jsp">Form Basics</a>
                            <a class="collapse-item active" href="form_advanceds.jsp">Form Advanceds</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"
                       aria-controls="collapseTable">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tables</span>
                    </a>
                    <div id="collapseTable" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Tables</h6>
                            <a class="collapse-item" href="simple-tables.jsp">Simple Tables</a>
                            <a class="collapse-item" href="datatables.jsp">DataTables</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ui-colors.jsp">
                        <i class="fas fa-fw fa-palette"></i>
                        <span>UI Colors</span>
                    </a>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Examples
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
                       aria-controls="collapsePage">
                        <i class="fas fa-fw fa-columns"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Example Pages</h6>
                            <a class="collapse-item" href="login.jsp">Login</a>
                            <a class="collapse-item" href="register.jsp">Register</a>
                            <a class="collapse-item" href="404.jsp">404 Page</a>
                            <a class="collapse-item" href="blank.jsp">Blank Page</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="charts.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span>
                    </a>
                </li>
                <hr class="sidebar-divider">
                <div class="version" id="version-ruangadmin"></div>
            </ul>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <%@include file="../components/topbar.jsp"%>
                    <!-- Topbar -->

                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Form Advanceds</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Forms</li>
                                <li class="breadcrumb-item active" aria-current="page">Form Advanceds</li>
                            </ol>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Select2 -->
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Select2</h6>
                                    </div>
                                    <div class="card-body">        
                                        <p>Select2 is a jQuery based replacement for select boxes</p>          
                                        <div class="form-group">
                                            <label for="select2Single">Single Select Box</label>
                                            <select class="select2-single form-control" name="state" id="select2Single">
                                                <option value="">Select</option>
                                                <option value="Aceh">Aceh</option>
                                                <option value="Sumatra Utara">Sumatra Utara</option>
                                                <option value="Sumatra Barat">Sumatra Barat</option>
                                                <option value="Riau">Riau</option>
                                                <option value="Kepulauan Riau">Kepulauan Riau</option>
                                                <option value="Jambi">Jambi</option>
                                                <option value="Bengkulu">Bengkulu</option>
                                                <option value="Sumatra Selatan">Sumatra Selatan</option>
                                                <option value="Kepulauan Bangka Belitung">Kepulauan Bangka Belitung</option>
                                                <option value="Lampung">Lampung</option>
                                                <option value="Banten">Banten</option>
                                                <option value="Jawa Barat">Jawa Barat</option>
                                                <option value="Jakarta">Jakarta</option>
                                                <option value="Jawa Tengah">Jawa Tengah</option>
                                                <option value="Yogyakarta">Yogyakarta</option>
                                                <option value="Jawa TImur">Jawa Timur</option>
                                                <option value="Bali">Bali</option>
                                                <option value="Nusa Tenggara Barat">Nusa Tenggara Barat</option>
                                                <option value="Nusa Tenggara Timur">Nusa Tenggara Timur</option>
                                                <option value="Kalimantan Barat">Kalimantan Barat</option>
                                                <option value="Kalimantan Selatan">Kalimantan Selatan</option>
                                                <option value="Kalimantan Tengah">Kalimantan Tengah</option>
                                                <option value="Kalimantan Timur">Kalimantan Timur</option>
                                                <option value="Kalimantan Utara">Kalimantan Utara</option>
                                                <option value="Gorontalo">Gorontalo</option>
                                                <option value="Sulawaesi Barat">Sulawesi Barat</option>
                                                <option value="Sulawesi Selatan">Sulawesi Selatan</option>
                                                <option value="Sulawesi Tengah">Sulawesi Tengah</option>
                                                <option value="Sulawesi Tenggara">Sulawesi Tenggara</option>
                                                <option value="Sulawesi Utara">Sulawesi Utara</option>
                                                <option value="Maluku">Maluku</option>
                                                <option value="Maluku Utara">Maluku Utara</option>
                                                <option value="Papua Barat">Papua Barat</option>
                                                <option value="Papua">Papua</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="select2SinglePlaceholder">Single Select Box with Placeholder</label>
                                            <select class="select2-single-placeholder form-control" name="state" id="select2SinglePlaceholder">
                                                <option value="">Select</option>
                                                <option value="Aceh">Aceh</option>
                                                <option value="Sumatra Utara">Sumatra Utara</option>
                                                <option value="Sumatra Barat">Sumatra Barat</option>
                                                <option value="Riau">Riau</option>
                                                <option value="Kepulauan Riau">Kepulauan Riau</option>
                                                <option value="Jambi">Jambi</option>
                                                <option value="Bengkulu">Bengkulu</option>
                                                <option value="Sumatra Selatan">Sumatra Selatan</option>
                                                <option value="Kepulauan Bangka Belitung">Kepulauan Bangka Belitung</option>
                                                <option value="Lampung">Lampung</option>
                                                <option value="Banten">Banten</option>
                                                <option value="Jawa Barat">Jawa Barat</option>
                                                <option value="Jakarta">Jakarta</option>
                                                <option value="Jawa Tengah">Jawa Tengah</option>
                                                <option value="Yogyakarta">Yogyakarta</option>
                                                <option value="Jawa TImur">Jawa Timur</option>
                                                <option value="Bali">Bali</option>
                                                <option value="Nusa Tenggara Barat">Nusa Tenggara Barat</option>
                                                <option value="Nusa Tenggara Timur">Nusa Tenggara Timur</option>
                                                <option value="Kalimantan Barat">Kalimantan Barat</option>
                                                <option value="Kalimantan Selatan">Kalimantan Selatan</option>
                                                <option value="Kalimantan Tengah">Kalimantan Tengah</option>
                                                <option value="Kalimantan Timur">Kalimantan Timur</option>
                                                <option value="Kalimantan Utara">Kalimantan Utara</option>
                                                <option value="Gorontalo">Gorontalo</option>
                                                <option value="Sulawaesi Barat">Sulawesi Barat</option>
                                                <option value="Sulawesi Selatan">Sulawesi Selatan</option>
                                                <option value="Sulawesi Tengah">Sulawesi Tengah</option>
                                                <option value="Sulawesi Tenggara">Sulawesi Tenggara</option>
                                                <option value="Sulawesi Utara">Sulawesi Utara</option>
                                                <option value="Maluku">Maluku</option>
                                                <option value="Maluku Utara">Maluku Utara</option>
                                                <option value="Papua Barat">Papua Barat</option>
                                                <option value="Papua">Papua</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="select2Multiple">Multiple-Select Boxes (pillbox)</label>
                                            <select class="select2-multiple form-control" name="states[]" multiple="multiple"
                                                    id="select2Multiple">
                                                <option value="">Select</option>
                                                <option value="Aceh">Aceh</option>
                                                <option value="Sumatra Utara">Sumatra Utara</option>
                                                <option value="Sumatra Barat">Sumatra Barat</option>
                                                <option value="Riau">Riau</option>
                                                <option value="Kepulauan Riau" selected>Kepulauan Riau</option>
                                                <option value="Jambi">Jambi</option>
                                                <option value="Bengkulu">Bengkulu</option>
                                                <option value="Sumatra Selatan">Sumatra Selatan</option>
                                                <option value="Kepulauan Bangka Belitung">Kepulauan Bangka Belitung</option>
                                                <option value="Lampung">Lampung</option>
                                                <option value="Banten">Banten</option>
                                                <option value="Jawa Barat" selected>Jawa Barat</option>
                                                <option value="Jakarta">Jakarta</option>
                                                <option value="Jawa Tengah">Jawa Tengah</option>
                                                <option value="Yogyakarta">Yogyakarta</option>
                                                <option value="Jawa TImur">Jawa Timur</option>
                                                <option value="Bali">Bali</option>
                                                <option value="Nusa Tenggara Barat">Nusa Tenggara Barat</option>
                                                <option value="Nusa Tenggara Timur">Nusa Tenggara Timur</option>
                                                <option value="Kalimantan Barat">Kalimantan Barat</option>
                                                <option value="Kalimantan Selatan">Kalimantan Selatan</option>
                                                <option value="Kalimantan Tengah">Kalimantan Tengah</option>
                                                <option value="Kalimantan Timur">Kalimantan Timur</option>
                                                <option value="Kalimantan Utara">Kalimantan Utara</option>
                                                <option value="Gorontalo">Gorontalo</option>
                                                <option value="Sulawaesi Barat">Sulawesi Barat</option>
                                                <option value="Sulawesi Selatan">Sulawesi Selatan</option>
                                                <option value="Sulawesi Tengah">Sulawesi Tengah</option>
                                                <option value="Sulawesi Tenggara">Sulawesi Tenggara</option>
                                                <option value="Sulawesi Utara">Sulawesi Utara</option>
                                                <option value="Maluku">Maluku</option>
                                                <option value="Maluku Utara">Maluku Utara</option>
                                                <option value="Papua Barat">Papua Barat</option>
                                                <option value="Papua">Papua</option>
                                            </select>
                                        </div>
                                        <p>For documentations Select2 you can visit <a href="https://select2.org/"
                                                                                       target="_blank">here.</a></p>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Date Picker</h6>
                                    </div>
                                    <div class="card-body">
                                        <p>Simple and easy select a time for a text input using your mouse.</p>
                                        <div class="form-group" id="simple-date1">
                                            <label for="simpleDataInput">Simple Data Input</label>
                                            <div class="input-group date">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                                </div>
                                                <input type="text" class="form-control" value="01/06/2020" id="simpleDataInput">
                                            </div>
                                        </div>
                                        <div class="form-group" id="simple-date2">
                                            <label for="oneYearView">One Year View</label>
                                            <div class="input-group date">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                                </div>
                                                <input type="text" class="form-control" value="01/06/2020" id="oneYearView">
                                            </div>
                                        </div>
                                        <div class="form-group" id="simple-date3">
                                            <label for="decadeView">Decade View</label>
                                            <div class="input-group date">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                                </div>
                                                <input type="text" class="form-control" value="01/06/2020" id="decadeView">
                                            </div>
                                        </div>
                                        <div class="form-group" id="simple-date4">
                                            <label for="dateRangePicker">Range Select</label>
                                            <div class="input-daterange input-group">
                                                <input type="text" class="input-sm form-control" name="start" />
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">to</span>
                                                </div>
                                                <input type="text" class="input-sm form-control" name="end" />
                                            </div>
                                        </div>
                                        <p>For documentations Bootstrap Datepicker you can visit <a href="https://github.com/uxsolutions/bootstrap-datepicker" target="_blank">here.</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Row-->

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">TouchSpin</h6>
                                    </div>
                                    <div class="card-body">
                                        <p>A mobile and touch friendly input spinner component for Bootstrap 3. It supports the mousewheel and the up/down keys.</p>
                                        <div class="form-group">
                                            <label for="touchSpin1">Simpel TouchSpin</label>
                                            <input id="touchSpin1" type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="touchSpin2">TouchSpin with Prefix</label>
                                            <input id="touchSpin2" type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="touchSpin3">TouchSpin with Vertical Button</label>
                                            <input id="touchSpin3" type="text" class="form-control">
                                        </div>
                                        <p>For documentations TouchSpin you can visit <a href="https://github.com/istvan-ujjmeszaros/bootstrap-touchspin" target="_blank">here.</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">ClockPicker</h6>
                                    </div>
                                    <div class="card-body">
                                        <p>A clock-style timepicker for Bootstrap (or jQuery).</p>
                                        <div class="form-group">
                                            <label for="clockPicker1">Simple ClockPicker</label>
                                            <div class="input-group clockpicker" id="clockPicker1">
                                                <input type="text" class="form-control" value="06:30">                     
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                </div>                      
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="clockPicker2">Simple ClockPicker with Auto Close</label>
                                            <div class="input-group clockpicker" id="clockPicker2">
                                                <input type="text" class="form-control" value="12:30">                     
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                </div>                      
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="clockPicker2">ClockPicker with Auto Check Minutes</label>
                                            <div class="input-group" id="clockPicker3">
                                                <input class="form-control" placeholder="Now" value="">                     
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" id="check-minutes">Check the Minutes</button>
                                                </div>                      
                                            </div>
                                        </div>
                                        <p>For documentations Clockpicker you can visit <a href="http://weareoutman.github.io/clockpicker/" target="_blank">here.</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row -->

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

                    </div>
                    <!---Container Fluid-->
                </div>
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>copyright &copy; <script>
                                document.write(new Date().getFullYear());
                                </script> - developed by
                                <b><a href="https://indrijunanda.gitlab.io/" target="_blank">indrijunanda</a></b>
                            </span>
                        </div>
                    </div>
                </footer>
                <!-- Footer -->
            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Select2 -->
        <script src="../vendor/select2/dist/js/select2.min.js"></script>
        <!-- Bootstrap Datepicker -->
        <script src="../vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <!-- Bootstrap Touchspin -->
        <script src="../vendor/bootstrap-touchspin/js/jquery.bootstrap-touchspin.js"></script>
        <!-- ClockPicker -->
        <script src="../vendor/clock-picker/clockpicker.js"></script>
        <!-- RuangAdmin Javascript -->
        <script src="../js/ruang-admin.min.js"></script>
        <!-- Javascript for this page -->
        <script>
                                $(document).ready(function () {


                                    $('.select2-single').select2();

                                    // Select2 Single  with Placeholder
                                    $('.select2-single-placeholder').select2({
                                        placeholder: "Select a Province",
                                        allowClear: true
                                    });

                                    // Select2 Multiple
                                    $('.select2-multiple').select2();

                                    // Bootstrap Date Picker
                                    $('#simple-date1 .input-group.date').datepicker({
                                        format: 'dd/mm/yyyy',
                                        todayBtn: 'linked',
                                        todayHighlight: true,
                                        autoclose: true,
                                    });

                                    $('#simple-date2 .input-group.date').datepicker({
                                        startView: 1,
                                        format: 'dd/mm/yyyy',
                                        autoclose: true,
                                        todayHighlight: true,
                                        todayBtn: 'linked',
                                    });

                                    $('#simple-date3 .input-group.date').datepicker({
                                        startView: 2,
                                        format: 'dd/mm/yyyy',
                                        autoclose: true,
                                        todayHighlight: true,
                                        todayBtn: 'linked',
                                    });

                                    $('#simple-date4 .input-daterange').datepicker({
                                        format: 'dd/mm/yyyy',
                                        autoclose: true,
                                        todayHighlight: true,
                                        todayBtn: 'linked',
                                    });

                                    // TouchSpin

                                    $('#touchSpin1').TouchSpin({
                                        min: 0,
                                        max: 100,
                                        boostat: 5,
                                        maxboostedstep: 10,
                                        initval: 0
                                    });

                                    $('#touchSpin2').TouchSpin({
                                        min: 0,
                                        max: 100,
                                        decimals: 2,
                                        step: 0.1,
                                        postfix: '%',
                                        initval: 0,
                                        boostat: 5,
                                        maxboostedstep: 10
                                    });

                                    $('#touchSpin3').TouchSpin({
                                        min: 0,
                                        max: 100,
                                        initval: 0,
                                        boostat: 5,
                                        maxboostedstep: 10,
                                        verticalbuttons: true,
                                    });

                                    $('#clockPicker1').clockpicker({
                                        donetext: 'Done'
                                    });

                                    $('#clockPicker2').clockpicker({
                                        autoclose: true
                                    });

                                    let input = $('#clockPicker3').clockpicker({
                                        autoclose: true,
                                        'default': 'now',
                                        placement: 'top',
                                        align: 'left',
                                    });

                                    $('#check-minutes').click(function (e) {
                                        e.stopPropagation();
                                        input.clockpicker('show').clockpicker('toggleView', 'minutes');
                                    });

                                });
        </script>

    </body>

</html>