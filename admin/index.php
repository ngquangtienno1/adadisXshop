<?php

session_start();

// Require file Common
require_once '../commons/env.php'; // Khai báo biến môi trường
require_once '../commons/function.php'; // Hàm hỗ trợ

// Require toàn bộ file Controllers
require_once 'controllers/DashboardController.php';
require_once 'controllers/DanhMucController.php';
require_once 'controllers/LienHeController.php';
require_once 'controllers/KhuyenMaiController.php';

// Require toàn bộ file Models
require_once './models/DanhMuc.php';
require_once 'models/LienHe.php';
require_once 'models/KhuyenMai.php';

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

     //Quản lý liên hệ
     'lien-he'           => (new LienHeController())->index(),
     'form-add-lien-he'  => (new LienHeController())->create(),
     'them-lien-he'      => (new LienHeController())->store(),
     'form-update-lien-he'      => (new LienHeController())->edit(),
     'sua-lien-he'       => (new LienHeController())->update(),
     'xoa-lien-he'       => (new LienHeController())->destroy(),

     //quản lí khuyến mãi
     'khuyen-mai'                   => (new KhuyenMaiController())->index(),
     'form-add-khuyen-mai'          => (new KhuyenMaiController())->create(),
     'them-khuyen-mai'              => (new KhuyenMaiController())->store(),
     'form-update-khuyen-mai'       => (new KhuyenMaiController())->edit(),
     'sua-khuyen-mai'               => (new KhuyenMaiController())->update(),
     'xoa-khuyen-mai'               => (new KhuyenMaiController())->destroy(),
 
};
