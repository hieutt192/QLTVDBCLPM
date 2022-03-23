<%-- 
    Document   : SupplierImport
    Created on : Mar 19, 2022, 7:44:41 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.ImportBook"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="models.Supplier"%>
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
            /*            .btn-save{
                            position: absolute;
                            top:220px;
                            left:410px
                        }*/
            .btn-export{
                position: absolute;
                top:220px;
                left:410px
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
            Supplier sup = (Supplier) session.getAttribute("sup");
//            List<ImportBook> addBook = new ArrayList<ImportBook>();
//            session.setAttribute("addBook", addBook);
             List<ImportBook> listBook = new ArrayList<ImportBook>();
             if(session.getAttribute("listBook") == null){
                 listBook=new ArrayList<ImportBook>();
             }else{
                 listBook = (ArrayList)session.getAttribute("listBook");
             }
             
             
            int id = sup.getId();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date importingDate = new Date();
            Calendar myCal = Calendar.getInstance();
            myCal.setTime(importingDate);
            
            
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
                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <a class="nav-link" href="BookBorrowingUI.jsp">
                        <i class="fas fa-book-reader"></i>
                        <span>Borrow book</span></a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="SupplierImport.jsp.jsp">
                        <i class="fas fa-book-reader"></i>
                        <span> Import book </span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link" href="BookStatisticUI.jsp">
                        <i class="fas fa-book"></i>
                        <span>Statistic book</span></a>
                </li>



                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link" href="StatisticSupplier1.jsp">
                        <i class="fas fa-database"></i>
                        <span>Statistic Supplier</span></a>
                </li>



                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link" href="StatisticSupplier1.jsp">
                        <i class="fas fa-database"></i>
                        <span>Statistic Supplier</span></a>
                </li>



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
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Nhập sách</h1>


                        <!-- DataTales Example -->
                        <div class="card-body">

                            <div class="row">

                                <div class="col-lg-6 mb4 form-group">
                                    <form action = "doImportBook.jsp" method="post">
                                        <label for="idBook">ID Book</label>
                                        <input type="text" class="form-control" id="idBook" name="idBook" value="" >
                                        <label for="title">Title</label>
                                        <input type="text" class="form-control" id="title" name="title" value="">
                                        <label for="importDate">Importing date</label>
                                        <input type="text" class="form-control" id="importDate" name="importDate" value="<%=sdf.format(importingDate)%>" readonly >
                                        <label for="quantity">Quantity</label>
                                        <input type="text" class="form-control" id="quantity" name="quantity" value="">
                                        <label for="Price">Price</label>
                                        <input type="text" class="form-control" id="Price" name="Price" value="">
                                        <div class="input-group">

                                            <!--                                            <div class="input-group-append">
                                                                                            <input type="text" class="form-control" id="barcode" name="barcode">
                                                                                        </div>-->
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
                                                <th>Title</th>
                                               
                                                <th>Quantity</th>
                                                <th>Price</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int stt = 0;
                                                for (ImportBook copy : listBook) {
                                                    stt++;
                                                    

                                            %>
                                            <tr>
                                                <td><%=stt%></td>
                                                <td><%=copy.getTitle()%></td>
                                                
                                                <td><%=copy.getQuantity()%></td>
                                                <td><%=copy.getTotal()%></td>
                                                
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <hr>

                        <div class="row justify-content-center">
                            <a href="submitImportBook.jsp"><button type="submit" class="btn-danger rounded-pill border-danger">Submit</button></a>
                        </div>
                        <div class="row justify-content-center">
                            <a href="submitCallCard.jsp"><button type="submit" class="btn-danger btn-google">Export</button></a>
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
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script src="process/addRow.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
