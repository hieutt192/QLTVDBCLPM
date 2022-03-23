<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         import = "models.*, dao.*, java.util.*, java.text.SimpleDateFormat"    
         %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>My Library management system</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <%
            List<BookCopy> addedBooks = (List<BookCopy>) session.getAttribute("addedBooks");
            User user = (User) session.getAttribute("user");
            String name = user.getName();
            CallCardDAO dao = new CallCardDAO();
            int callCardid = dao.generateCallCardId();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date borrowingDate = new Date();
            Calendar myCal = Calendar.getInstance();
            myCal.setTime(borrowingDate);
            myCal.add(Calendar.MONTH, +6);
            Date dueDate = myCal.getTime();
            String libcardId = (String) session.getAttribute("libcardId");
            session.setAttribute("borrowingDate", borrowingDate);
            session.setAttribute("dueDate", dueDate);
            session.setAttribute("callcardId", callCardid);

        %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-secondary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">My Library</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="MainManagerUI.jsp">
                        <i class="fas fa-home"></i>
                        <span>Homepage</span></a>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <a class="nav-link" href="BookBorrowingUI.jsp">
                        <i class="fas fa-book-reader"></i>
                        <span>Borrow book</span></a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="SupplierImport.jsp">
                        <i class="fas fa-book-reader"></i>
                        <span> Import book </span></a>
                </li>

                <!--                 Divider 
                                <hr class="sidebar-divider">
                
                                <li class="nav-item">
                                    <a class="nav-link" href="BookStatisticUI.jsp">
                                        <i class="fas fa-book"></i>
                                        <span>Statistic book</span></a>
                                </li>
                
                
                
                                 Divider 
                                <hr class="sidebar-divider">
                
                                <li class="nav-item">
                                    <a class="nav-link" href="StatisticSupplier1.jsp">
                                        <i class="fas fa-database"></i>
                                        <span>Statistic Supplier</span></a>
                                </li>-->



            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>



                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=name%></span>
                                    <img class="img-profile rounded-circle"
                                         src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="LoginUI.jsp">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container">


                        <!-- Content Row -->
                        <div class="row">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="font-weight-bold text-center text-black-50 ">Borrow requirements</h6>
                                    <%
                                    String err = (String) request.getParameter("err");
                                    if (err != null && err.equals("invalid_libcardId")) { %>
                                    <h6 class="text-center text-danger">Invalid library card ID</h6>
                                    <%} else if (err != null && err.equals("empty_libcardId")) { %>
                                    <h6 class="text-center text-danger">Empty library card ID, please fulfill and save it</h6>
                                    <%} else if (err != null && err.equals("unavailable_bookcopy")) { %>
                                    <h6 class="text-center text-danger">Unavailable book copy</h6>
                                    <%}%>
                                </div>
                                <div class="card-body">

                                    <div class="row">

                                        <div class="col-lg-6 mb4 form-group">
                                            <form action = "doBookBorrowingUI.jsp" method="post">
                                                <label for="callCardId">Call card ID</label>
                                                <input type="text" class="form-control" id="callCardId" name="callCardId" value="<%=callCardid%>" readonly>
                                                <label for="libCardId">Library card ID</label>
                                                <input type="text" class="form-control" id="libCardId" name="libCardId" value="<%=libcardId%>">
                                                <label for="borrowingDate">Borrowing date</label>
                                                <input type="text" class="form-control" id="borrowingDate" name="borrowingDate" value="<%=sdf.format(borrowingDate)%>" readonly>
                                                <label for="dueDate">Due date</label>
                                                <input type="text" class="form-control" id="dueDate" name="dueDate" value="<%=sdf.format(dueDate)%>" readonly>
                                                <label for="barcode">Enter barcode</label>
                                                <div class="input-group">

                                                    <div class="input-group-append">
                                                        <input type="text" class="form-control" id="barcode" name="barcode">
                                                    </div>
                                                    <div>
                                                        <button class="ml-2 rounded-sm">save</button>
                                                    </div>

                                            </form> 
                                        </div>
                                    </div>

                                    <div class="col-lg-6 mb-4">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" width="100%" id="borrowTable" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Book title</th>
                                                        <th>Bar code</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        int stt = 0;
                                                        for (BookCopy copy : addedBooks) {
                                                            stt++;
                                                            String title = copy.getBookInfo().getTitle();
                                                            int bcode = copy.getBarcode();

                                                    %>
                                                    <tr>
                                                        <td><%=stt%></td>
                                                        <td><%=title%></td>
                                                        <td><%=bcode%></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>

                                <hr>

                                <div class="row justify-content-center">
                                    <a href="submitCallCard.jsp"><button type="submit" class="btn-success rounded-pill border-success">Submit</button></a>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>