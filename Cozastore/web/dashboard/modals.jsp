<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="img/logo/logo.png" rel="icon">
        <title>RuangAdmin - Modals</title>
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
                <li class="nav-item active">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
                       aria-expanded="true" aria-controls="collapseBootstrap">
                        <i class="far fa-fw fa-window-maximize"></i>
                        <span>Bootstrap UI</span>
                    </a>
                    <div id="collapseBootstrap" class="collapse show" aria-labelledby="headingBootstrap"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Bootstrap UI</h6>
                            <a class="collapse-item" href="alerts.jsp">Alerts</a>
                            <a class="collapse-item" href="buttons.jsp">Buttons</a>
                            <a class="collapse-item" href="dropdowns.jsp">Dropdowns</a>
                            <a class="collapse-item active" href="modals.jsp">Modals</a>
                            <a class="collapse-item" href="popovers.jsp">Popovers</a>
                            <a class="collapse-item" href="progress-bar.jsp">Progress Bars</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
                       aria-controls="collapseForm">
                        <i class="fab fa-fw fa-wpforms"></i>
                        <span>Forms</span>
                    </a>
                    <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Forms</h6>
                            <a class="collapse-item" href="form_basics.jsp">Form Basics</a>
                            <a class="collapse-item" href="form_advanceds.jsp">Form Advanceds</a>
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
                            <h1 class="h3 mb-0 text-gray-800">Modals</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Bootstrap UI</li>
                                <li class="breadcrumb-item active" aria-current="page">Modals</li>
                            </ol>
                        </div>

                        <!-- Row -->
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Modal basic -->
                                <div class="card mb-4">
                                    
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                                                id="#myBtn">
                                            Launch demo modal
                                        </button>
                                </div>
                                <!-- modal vertically centered -->
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Modal Vertically Centered</h6>
                                    </div>
                                    <div class="card-body">
                                        <p>Add <code>.modal-dialog-centered</code> to <code>.modal-dialog</code> to vertically center the
                                            modal.</p>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
                                                id="#modalCenter">Launch Modal Vertically Centered</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <!-- Modal with scrolling long content -->
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Modal with scrolling long content</h6>
                                    </div>
                                    <div class="card-body">
                                        <p>When modals become too long for the user’s viewport or device, they scroll independent of the page
                                            itself. Try the demo below to see what we mean.</p>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong"
                                                id="#modalLong">Launch Modal Long</button>

                                        <p class="mt-3">You can also create a scrollable modal that allows scroll the modal body by adding
                                            <code class="highlighter-rouge">.modal-dialog-scrollable</code> to <code
                                                class="highlighter-rouge">.modal-dialog</code>.</p>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#exampleModalScrollable" id="#modalScroll">Launch Modal Srollable Title</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Row -->

                        <!-- Documentation Link -->
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <p>For more documentations you can visit<a href="http://localhost/templatedev/ruangadmin/modals.jsp"
                                                                           target="_blank"> bootstrap modals documentations.</a></p>
                            </div>
                        </div>


                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>You Content</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Long -->
                        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Modal Long</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="font-weight-bold">Title</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                                            et dolore magna aliqua. Ac orci phasellus egestas tellus rutrum tellus. Suspendisse sed nisi lacus
                                            sed. Erat pellentesque adipiscing commodo elit at imperdiet dui. Eget dolor morbi non arcu risus
                                            quis varius quam. Elit ullamcorper dignissim cras tincidunt. At risus viverra adipiscing at in
                                            tellus integer feugiat. Dictum non consectetur a erat nam at lectus urna. Est velit egestas dui id.
                                            Sed id semper risus in hendrerit. Malesuada fames ac turpis egestas maecenas pharetra convallis
                                            posuere. Pretium vulputate sapien nec sagittis aliquam. In hendrerit gravida rutrum quisque non.
                                            Neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing. Lacus luctus accumsan
                                            tortor posuere. Urna molestie at elementum eu facilisis. Neque egestas congue quisque egestas diam.
                                            Turpis egestas integer eget aliquet nibh praesent. Egestas dui id ornare arcu odio ut.</p>
                                        <h5 class="font-weight-bold">Title</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                                            et dolore magna aliqua. Lacinia quis vel eros donec. Nec tincidunt praesent semper feugiat nibh sed
                                            pulvinar proin gravida. Urna cursus eget nunc scelerisque viverra mauris in. Risus sed vulputate
                                            odio ut enim blandit volutpat maecenas. Etiam sit amet nisl purus in mollis nunc. Aliquet bibendum
                                            enim facilisis gravida neque convallis a. Aliquam id diam maecenas ultricies mi eget mauris. Et
                                            malesuada fames ac turpis egestas sed. Venenatis cras sed felis eget.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Scrollable -->
                        <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalScrollableTitle">Modal scrollable title</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="font-weight-bold">Title</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                                            et dolore magna aliqua. Ac orci phasellus egestas tellus rutrum tellus. Suspendisse sed nisi lacus
                                            sed. Erat pellentesque adipiscing commodo elit at imperdiet dui. Eget dolor morbi non arcu risus
                                            quis varius quam. Elit ullamcorper dignissim cras tincidunt. At risus viverra adipiscing at in
                                            tellus integer feugiat. Dictum non consectetur a erat nam at lectus urna. Est velit egestas dui id.
                                            Sed id semper risus in hendrerit. Malesuada fames ac turpis egestas maecenas pharetra convallis
                                            posuere. Pretium vulputate sapien nec sagittis aliquam. In hendrerit gravida rutrum quisque non.
                                            Neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing. Lacus luctus accumsan
                                            tortor posuere. Urna molestie at elementum eu facilisis. Neque egestas congue quisque egestas diam.
                                            Turpis egestas integer eget aliquet nibh praesent. Egestas dui id ornare arcu odio ut.</p>
                                        <h5 class="font-weight-bold">Title</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                                            et dolore magna aliqua. Lacinia quis vel eros donec. Nec tincidunt praesent semper feugiat nibh sed
                                            pulvinar proin gravida. Urna cursus eget nunc scelerisque viverra mauris in. Risus sed vulputate
                                            odio ut enim blandit volutpat maecenas. Etiam sit amet nisl purus in mollis nunc. Aliquet bibendum
                                            enim facilisis gravida neque convallis a. Aliquam id diam maecenas ultricies mi eget mauris. Et
                                            malesuada fames ac turpis egestas sed. Venenatis cras sed felis eget.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Center -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Modal Vertically Centered</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Your Content
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
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
                            <span>copyright &copy; <script> document.write(new Date().getFullYear());</script> - developed by <b><a href="https://indrijunanda.gitlab.io/"
                                                                                                                                     target="_blank">indrijunanda</a></b> </span>
                        </div>
                    </div>
                </footer>

            </div>
        </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="../js/ruang-admin.min.js"></script>
    </body>

</html>