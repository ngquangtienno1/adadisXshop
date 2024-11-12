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
require_once 'controllers/TinTucController.php';
require_once 'controllers/BannerController.php';
require_once 'controllers/DonHangController.php';

require_once 'controllers/SanPhamController.php';
require_once 'controllers/TrangThaiController.php';
require_once 'controllers/NguoiDungController.php';





// Require toàn bộ file Models
require_once './models/DanhMuc.php';
require_once 'models/LienHe.php';
require_once 'models/KhuyenMai.php';
require_once 'models/TinTuc.php';
require_once 'models/Banner.php';
require_once 'models/DonHang.php';

require_once 'models/SanPham.php';
require_once 'models/TrangThai.php';
require_once 'models/NguoiDung.php';






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

     // Quản lý tin tức
    'tin-tucs' => (new TinTucController())->ListTinTuc(),
    'form-add-tin-tuc' => (new TinTucController())->Cre(),
    'them-tin-tuc' => (new TinTucController())->handleCre(),
    'form-update-tin-tuc' => (new TinTucController())->ShowUpdate(),
    'cap-nhat' => (new TinTucController())->handleUpdate(),
    'xoa-tin-tuc' => (new TinTucController())->Delete(),

    //quản lý banner
    'banners' => (new BannerController())->index(),
    'form-them-banner' => (new BannerController())->create(),
    'them-banner' => (new BannerController())->store(),
    'form-sua-banner' => (new BannerController())->edit(),
    'sua-banner' => (new BannerController())->update(),
    'xoa-banner' => (new BannerController())->destroy(),

    //quản lý sản phẩm
    'san-phams' =>(new SanPhamController())->danhSachSanPham(),
    'form-them-san-pham' =>(new SanPhamController())->formAddSanPham(),
    'them-san-pham' =>(new SanPhamController())->postAddSanPham(),
    'form-sua-san-pham' =>(new SanPhamController())->formEditSanPham(),
    'sua-san-pham' =>(new SanPhamController())->postEditSanPham(),
    'sua-album-anh-san-pham' =>(new SanPhamController())->postEditAnhSanPham(),
    'xoa-san-pham' =>(new SanPhamController())->deleteSanPham(),

    ///Quản lý trạng thái
    'trang-thai'           => (new TrangThaiController())->index(),
    'form-add-trang-thai'  => (new TrangThaiController())->create(),
    'them-trang-thai'      => (new TrangThaiController())->store(),
    'form-update-trang-thai'      => (new TrangThaiController())->edit(),
    'sua-trang-thai'       => (new TrangThaiController())->update(),
    'xoa-trang-thai'       => (new TrangThaiController())->destroy(),

    ///Quản lý người dùng
    'nguoi-dung'           => (new NguoiDungController())->index(),
    'form-add-nguoi-dung'  => (new NguoiDungController())->create(),
    'them-nguoi-dung'      => (new NguoiDungController())->store(),
    'form-update-nguoi-dung'      => (new NguoiDungController())->edit(),
    'sua-nguoi-dung'       => (new NguoiDungController())->update(),
    'xoa-nguoi-dung'       => (new NguoiDungController())->destroy(),


    // Quan ly don hang
    'searchDonHang' => (new DonHangController())->searchDonHang(),
    'don-hang'  => (new DonHangController())->listDonHang(),
    'delete-don-hang'  => (new DonHangController())->Delete(),
    'form-sua-don-hang'  => (new DonHangController())->ShowUpdate(),
    'sua-don-hang'  => (new DonHangController())->handleUpdate(),


};
