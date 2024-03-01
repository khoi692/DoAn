<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/logo.png" rel="icon">
  <title>RuangAdmin - UI Colors</title>
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
      <li class="nav-item active">
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
            <h1 class="h3 mb-0 text-gray-800">UI Colors</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">UI Colors</li>
            </ol>
          </div>

          <div class="row">
            <!-- General Colors-->
            <div class="col-lg-6">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">General Colors</h6>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-primary text-white">
                        <div class="card-body">
                          Primary
                          <div class="text-white-50 small">#6777EF</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-success text-white">
                        <div class="card-body">
                          Success
                          <div class="text-white-50 small">#66bb6a</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-info text-white">
                        <div class="card-body">
                          Info
                          <div class="text-white-50 small">#3abaf4</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-warning text-white">
                        <div class="card-body">
                          Warning
                          <div class="text-white-50 small">#ffa426</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-danger text-white">
                        <div class="card-body">
                          Danger
                          <div class="text-white-50 small">#fc544b</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-secondary text-white">
                        <div class="card-body">
                          Secondary
                          <div class="text-white-50 small">#757575</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Background Gradient Utilities -->
            <div class="col-lg-6">
              <div class="card sm mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Background Gradient Utilities</h6>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-primary text-white">
                        <div class="card-body">
                          Gradient Primary
                          <div class="text-white-50 small">.bg-gradient-primary</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-success text-white">
                        <div class="card-body">
                          Gradient Success
                          <div class="text-white-50 small">.bg-gradient-success</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-info text-white">
                        <div class="card-body">
                          Gradient Info
                          <div class="text-white-50 small">.bg-gradient-info</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-warning text-white">
                        <div class="card-body">
                          Gradient Warning
                          <div class="text-white-50 small">.bg-gradient-warning</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-danger text-white">
                        <div class="card-body">
                          Gradient Danger
                          <div class="text-white-50 small">.bg-gradient-danger</div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                      <div class="card bg-gradient-secondary text-white">
                        <div class="card-body">
                          Gradient Secondary
                          <div class="text-white-50 small">.bg-gradient-secondary</div>
                        </div>
                      </div>
                    </div>
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
                  <a href="login.jsp" class="btn btn-primary">Logout</a>
                </div>
              </div>
            </div>
          </div>

          <!--Row-->
        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by
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
  <script src="../js/ruang-admin.min.js"></script>

</body>

</html>