<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable" data-theme="default" data-theme-colors="default">


<!-- Mirrored from themesbrand.com/velzon/html/master/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 29 Oct 2024 07:29:52 GMT -->

<head>

    <meta charset="utf-8" />
    <title>Thêm người dùng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />

    <!-- CSS -->
    <?php
    require_once "views/layouts/libs_css.php";
    ?>

</head>

<body>

    <!-- Begin page -->
    <div id="layout-wrapper">

        <!-- HEADER -->
        <?php
        require_once "views/layouts/header.php";

        require_once "views/layouts/siderbar.php";
        ?>

        <!-- Left Sidebar End -->
        <!-- Vertical Overlay-->
        <div class="vertical-overlay"></div>

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between bg-galaxy-transparent">
                                <h4 class="mb-sm-0">Quản lý người dùng</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                                        <li class="breadcrumb-item active">người dùng</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col">

                            <div class="h-100">
                                <!-- Striped Rows -->
                                <div class="card">
                                    <div class="card-header align-items-center d-flex">
                                        <h4 class="card-title mb-0 flex-grow-1">Thêm người dùng</h4>

                                    </div><!-- end card header -->

                                    <div class="card-body">
                                        <div class="live-preview">
                                            <form action="?act=them-nguoi-dung" method="POST" enctype="multipart/form-data">
                                                <div class="row">
                                                    <!--end col-->
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="compnayNameinput" class="form-label">Tên người dùng</label>
                                                            <input type="text" class="form-control" placeholder="Nhập tên người dùng" name="ten_nguoi_dung">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['ten_nguoi_dung']) ? $_SESSION['errors']['ten_nguoi_dung'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!--end col-->
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="phonenumberInput" class="form-label">Số điện thoại</label>
                                                            <input type="tel" class="form-control" placeholder="+(245) 451 45123" name="sdt">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['sdt']) ? $_SESSION['errors']['sdt'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!--end col-->
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="emailidInput" class="form-label">Email </label>
                                                            <input type="email" class="form-control" placeholder="example@gamil.com" name="email">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['email']) ? $_SESSION['errors']['email'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!--end col-->
                                                    <div class="col-md-6">
                                                        <div>
                                                            <label for="inputPassword4" class="form-label">Mật khẩu</label>
                                                            <input type="password" class="form-control" name="mat_khau" placeholder="Password">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['mat_khau']) ? $_SESSION['errors']['mat_khau'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="" class="form-label">Ngày sinh </label>
                                                            <input type="date" class="form-control" placeholder="Enter your date" name="ngay_sinh">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['ngay_sinh']) ? $_SESSION['errors']['ngay_sinh'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="inputAddress" class="form-label">Địa chỉ </label>
                                                            <input type="text" class="form-control" placeholder="1234 Main St" name="dia_chi">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['dia_chi']) ? $_SESSION['errors']['dia_chi'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="gioi_tinh">Giới tính</label>
                                                            <select name="gioi_tinh" id="gioi_tinh" class="form-control">
                                                                <option value="" disabled selected>Chọn giới tính</option>
                                                                <option value="Nam">Nam</option>
                                                                <option value="Nữ">Nữ</option>
                                                                <option value="Khác">Khác</option>
                                                            </select>
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['gioi_tinh']) ? $_SESSION['errors']['gioi_tinh'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="avatar">Ảnh đại diện</label>
                                                            <input type="file" name="avatar" id="avatar" class="form-control" >
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['avatar']) ? $_SESSION['errors']['avatar'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="role">Vai trò</label>
                                                            <select name="vai_tro" id="role" class="form-control">
                                                                <option value="" selected disabled>Chọn vai trò</option>
                                                                <option value="1">Quản trị viên</option>
                                                                <option value="2">Người dùng</option>
                                                            </select>
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['vai_tro']) ? $_SESSION['errors']['vai_tro'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                        <label for="created_at">Ngày tạo tài khoản</label>
                                                        <input type="date" name="ngay_tao" id="created_at" class="form-control">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['ngay_tao']) ? $_SESSION['errors']['ngay_tao'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="created_at" class="form-label">Ngày cập nhật tài khoản </label>
                                                            <input type="date" class="form-control"  name="ngay_cap_nhat">
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION['errors']['ngay_cap_nhat']) ? $_SESSION['errors']['ngay_cap_nhat'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="ForminputState" class="form-label">Trạng thái</label>
                                                            <select name="trang_thai" id="ForminputState" class="form-select">
                                                                <option selected disabled>Chọn trạng thái</option>
                                                                <option value="1">Hoạt động </option>
                                                                <option value="2">Không hoạt động</option>
                                                            </select>
                                                            <span class="text-danger">
                                                                <?= !empty($_SESSION["errors"]['trang_thai']) ? $_SESSION["errors"]['trang_thai'] : '' ?>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <!--end col-->

                                                </div> <br>
                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <button type="submit" class="btn btn-primary">Thêm người dùng</button>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                        </div>
                                        <!--end row-->
                                        </form>
                                    </div>

                                </div>
                            </div>
                            <!-- container-fluid -->
                        </div>
                        <!-- End Page-content -->


                    </div>
                    <!-- end main content-->


                </div>
                <!-- END layout-wrapper -->

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>
                                    document.write(new Date().getFullYear())
                                </script> © Adadis.
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end d-none d-sm-block">
                                    Giày thể thao chất lượng cao

                                </div>
                            </div>
                        </div>
                    </div>
                </footer>

                <!--start back-to-top-->
                <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
                    <i class="ri-arrow-up-line"></i>
                </button>
                <!--end back-to-top-->

                <!--preloader-->
                <div id="preloader">
                    <div id="status">
                        <div class="spinner-border text-primary avatar-sm" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </div>

                <div class="customizer-setting d-none d-md-block">
                    <div class="btn-info rounded-pill shadow-lg btn btn-icon btn-lg p-2" data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas">
                        <i class='mdi mdi-spin mdi-cog-outline fs-22'></i>
                    </div>
                </div>

                <!-- JAVASCRIPT -->
                <?php
                require_once "views/layouts/libs_js.php";
                ?>

</body>

</html>