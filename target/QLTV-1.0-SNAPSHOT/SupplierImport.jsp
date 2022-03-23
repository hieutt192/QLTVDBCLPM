<%-- 
    Document   : SupplierImport
    Created on : Mar 19, 2022, 7:44:41 PM
    Author     : ADMIN
--%>

<%@page import="models.Supplier"%>
<%@page import="dao.SupplierDAO"%>
<%@page import="models.BookStat"%>
<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <style>
            .button {
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: right;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                margin: 6px 10px;
                cursor: pointer;
                border-radius: 15px;
            }
            .supplier{
                border-radius: 10px;
                margin-left: 20px;
                margin-right: 20px;
            }
            .idbook{
                border-radius: 10px;
                margin-left: 60px;
                margin-right:20px;
            }
            .title{
                border-radius: 10px;
                margin-left:92px
            }
            .author{
                border-radius: 10px;
                margin-left: 74px;
            }
            .genres{
                border-radius: 10px;
                margin-left: 74px;

            }
            .quantity{
                border-radius: 10px;
                margin-left: 60px;

            }
            .price{
                border-radius: 10px;
                margin-left: 87px;

            }
            .btn-submit{
                position: absolute;
                top:150px;
                left:400px
            }
            .btn-save{
                position: absolute;
                top:220px;
                left:410px
            }
            .btn-export{
                position: absolute;
                top:290px;
                left:400px
            }
            .button1 {background-color: #4CAF50;} 
            .button2 {background-color: #008CBA;}
            .button3{background-color:red;}
            .button4{background-color:orange}
        </style>
    </head>

    <body id="page-top">
        <%
            
            User user = (User) session.getAttribute("user");
            String name = user.getName();
//        	session.setAttribute("supplier", null);
            boolean isbelongVendor = false;
            Supplier sup = (Supplier) session.getAttribute("sup");
            int id = 0;
            String supName = "";
            if ((Supplier) session.getAttribute("sup") != null) {
                id = sup.getId();
                isbelongVendor = true;
                supName = sup.getName();
            } else {
                isbelongVendor = false;
            }
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">abc</span>
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
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Import Supplier</h1>


                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <!--                        <form class="ml-4 mt-2"  method="post">
                                                        <label for="supplier">Nhà cung cấp</label>
                                                        <input type="String" name="supplier" class="supplier ">
                                                        <button  class="button button1">Check</button>
                                                        <button class ="button button2">Add</button>
                                                        <button class ="button button3"> <a href="ImportBook.jsp"> Next</button>
                            
                                                    </form>-->
                            <form class="user" action="SupplierProcess.jsp" method="post"> 
                                <div class="form-group">
                                    <input type="text" name="NameofSupplier" class="form-control "
                                           id="NOS" aria-describedby="NameofSupplier"
                                           placeholder="Name of Supplier" value="<%=supName%>">
                                </div>                                       

                        </div>
                        <button type="submit" class="btn btn-primary btn-user btn-block">Check</button>
                        <button type="submit" class=" btn btn-success"　name="button" value="button3"> <a href="ImportBook.jsp?IDSupplier<%=id%>">Next</button>
                        </form>

                        <div >
                            <%=  isbelongVendor%>
                        </div>

<!--                                    <form action="${pageContext.request.contextPath}/myservlet" method="post">
<input type="text" name="NameofSupplier" class="form-control "id="NOS" aria-describedby="NameofSupplier"
            placeholder="Name of Supplier">
<button type="submit" name="button" value="button1">Check</button>
<button type="submit" name="button" value="button2">Add</button>
<button type="submit" name="button" value="button3">Next</button>
</form>
                        -->

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
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>


        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>
