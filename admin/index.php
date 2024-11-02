<?php

session_start();

// Require file Common
require_once '../commons/env.php'; // Khai báo biến môi trường
require_once '../commons/function.php'; // Hàm hỗ trợ

// Require toàn bộ file Controllers
require_once 'controllers/DashboardController.php';
require_once 'controllers/DanhMucController.php';

// Require toàn bộ file Models
require_once './models/DanhMuc.php';

// Route
$act = $_GET['act'] ?? '/';

// Kiểm tra giá trị của $act
// echo "Value of \$act: " . $act . "<br>";

match ($act) {
    '/'           => (new DashboardController())->index(),
    'danh-mucs'   => (new DanhMucController())->ListCate(),
    'form-danh-muc' => (new DanhMucController())->Cre(),
    'them-danh-muc' => (new DanhMucController())->handleCre(),
    'form-sua-danh-muc' => (new DanhMucController())->ShowUpdate(),
    'sua-danh-muc' => (new DanhMucController())->handleUpdate(),
    'xoa-danh-muc' => (new DanhMucController())->Delete(),

    // Default cho các trường hợp không khớp
    // default => throw new Exception("Unhandled case for action: $act"),
};
