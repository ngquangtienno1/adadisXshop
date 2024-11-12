-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 11, 2024 lúc 09:34 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `adadisshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id_binh_luan` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `diem_danh_gia` int DEFAULT NULL,
  `binh_luan` text,
  `thoi_gian_binh_luan` datetime DEFAULT NULL,
  `trang_thai` enum('approved','pending','rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id_chi_tiet_don_hang` int NOT NULL,
  `id_don_hang` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_san_phams`
--

CREATE TABLE `chi_tiet_san_phams` (
  `id_chi_tiet_san_pham` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `mau_sac` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `chat_lieu_san_pham` varchar(100) DEFAULT NULL,
  `so_luong` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia_san_phams`
--

CREATE TABLE `danh_gia_san_phams` (
  `id_danh_gia` int NOT NULL,
  `id_san_pham` int DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `diem_danh_gia` int DEFAULT NULL,
  `binh_luan` text,
  `ngay_danh_gia` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_banners`
--

CREATE TABLE `danh_muc_banners` (
  `id` int NOT NULL,
  `ten_danh_muc_banner` varchar(255) NOT NULL,
  `link_hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_tao` date DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc_banners`
--

INSERT INTO `danh_muc_banners` (`id`, `ten_danh_muc_banner`, `link_hinh_anh`, `ngay_tao`, `trang_thai`) VALUES
(24, 'Giày adidă', './uploads/1731092707anh-chill-buon-yodyvn2.png', '2024-11-10', 1),
(25, 'Giày adidă', './uploads/1731092718anh-chill-buon-yodyvn2.png', '2024-11-10', 1),
(26, 'Giày adidas', './uploads/1731092905z5919221356837_07deb62ce2ad65e907196903add7459f.jpg', '2024-11-10', 1),
(27, 'Giày adidas', 'Array', '2024-11-10', 1),
(28, 'Giày adidasaaaaaaa', NULL, '2024-11-09', 1),
(29, 'Giày adidasaaaaaaa', NULL, '2024-11-01', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_san_phams`
--

CREATE TABLE `danh_muc_san_phams` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(50) DEFAULT NULL,
  `mo_ta` text,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc_san_phams`
--

INSERT INTO `danh_muc_san_phams` (`id`, `ten_danh_muc`, `mo_ta`, `trang_thai`) VALUES
(1, 'Giày Nam', 'Siêu sale lớn nhất năm', 1),
(2, 'Giày Nữ 2', 'Sale 50%', 1),
(3, 'Giày Thể Thao', 'Siêu sale lớn nhất năm', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dia_chis`
--

CREATE TABLE `dia_chis` (
  `id_dia_chi` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `dia_chi1` varchar(255) DEFAULT NULL,
  `dia_chi2` varchar(255) DEFAULT NULL,
  `thanh_pho` varchar(100) DEFAULT NULL,
  `quan_huyen` varchar(100) DEFAULT NULL,
  `xa_phuong` varchar(100) DEFAULT NULL,
  `quoc_gia` varchar(100) DEFAULT NULL,
  `dia_chi_mac_dinh` tinyint(1) DEFAULT NULL,
  `dia_chi_thanh_toan_mac_dinh` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id_don_hang` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_ma_van_chuyen` int DEFAULT NULL,
  `ngay_dat_hang` timestamp NULL DEFAULT NULL,
  `trang_thai_don_hang` enum('pending','completed','cancelled') DEFAULT NULL,
  `tong_tien` decimal(10,2) DEFAULT NULL,
  `dia_chi_giao_hang` text,
  `id_dia_chi_thanh_toan` int DEFAULT NULL,
  `tong_tien_don_hang` decimal(10,2) DEFAULT NULL,
  `phuong_thuc_thanh_toan` varchar(50) DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int NOT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_san_pham` int DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `gia_tien` decimal(10,2) DEFAULT NULL,
  `khuyen_mai` varchar(50) DEFAULT NULL,
  `phi_van_chuyen` int DEFAULT NULL,
  `trang_thai` int DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `ghi_chu` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int DEFAULT NULL,
  `link_hinh_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyen_mais`
--

CREATE TABLE `khuyen_mais` (
  `id` int NOT NULL,
  `ten_khuyen_mai` varchar(255) DEFAULT NULL,
  `ma_khuyen_mai` varchar(50) DEFAULT NULL,
  `gia_tri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `mo_ta` text,
  `trang_thai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khuyen_mais`
--

INSERT INTO `khuyen_mais` (`id`, `ten_khuyen_mai`, `ma_khuyen_mai`, `gia_tri`, `ngay_bat_dau`, `ngay_ket_thuc`, `mo_ta`, `trang_thai`) VALUES
(1, 'Siêu sale 11/11', '11111111111', '11%', '2024-11-11', '2024-11-12', 'Siêu sale lớn nhất năm', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_hes`
--

CREATE TABLE `lien_hes` (
  `id` int NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(12) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lien_hes`
--

INSERT INTO `lien_hes` (`id`, `ten`, `email`, `so_dien_thoai`, `ngay_tao`, `trang_thai`) VALUES
(1, 'Nguyễn Quang Tiến', 'tiennqph51552@gmail.com', '0966484924', '2024-11-09 19:29:00', 1),
(2, 'Nguyễn Trung Quân', 'ronaldo@gmail.com', '0123456789', '2024-11-17 16:21:00', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dungs`
--

CREATE TABLE `nguoi_dungs` (
  `id` int NOT NULL,
  `ten_nguoi_dung` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nữ','Khác') DEFAULT 'Khác',
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vai_tro` tinyint(1) NOT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `ngay_cap_nhat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dungs`
--

INSERT INTO `nguoi_dungs` (`id`, `ten_nguoi_dung`, `email`, `sdt`, `dia_chi`, `mat_khau`, `ngay_sinh`, `gioi_tinh`, `avatar`, `vai_tro`, `trang_thai`, `ngay_tao`, `ngay_cap_nhat`) VALUES
(15, 'Tiến', 'ronaldo@gmail.com', '0123456789', 'Bồ Đào Nha', '2313213', '2024-11-02', 'Nam', './uploads/1731262312anh-chill-buon-yodyvn2.png', 1, 2, '2024-11-07', '2024-11-08'),
(16, 'hahaha', 'ngquangtien04@gmail.com', '0986996943', 'Bồ Đào Nha', '12232312', '2024-11-13', 'Nam', './uploads1731309438anh-chill-buon-yodyvn2.png', 1, 1, '2024-11-11', '2024-11-11'),
(17, 'Hồng Hài Nhi', 'ngthanhtung04@gmail.com', '2131231231', '21321321', '12312321', '2024-11-11', 'Nam', './uploads1731317030370574474_313405907891305_1218098477409806486_n.jpg', 1, 1, '2024-11-09', '2024-11-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noi_dungs`
--

CREATE TABLE `noi_dungs` (
  `noi_dung_id` int NOT NULL,
  `tieu_de` varchar(255) DEFAULT NULL,
  `noi_dung` text,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL,
  `banner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `mo_ta_dai` text,
  `mo_ta_ngan` text,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `gia_ban` decimal(10,2) NOT NULL,
  `gia_nhap` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `ngay_nhap` date NOT NULL,
  `so_luong` int DEFAULT '0',
  `hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `danh_muc_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanh_toans`
--

CREATE TABLE `thanh_toans` (
  `id_thanh_toan` int NOT NULL,
  `id_don_hang` int DEFAULT NULL,
  `phuong_thuc_thanh_toan` enum('credit_card','paypal','cash_on_delivery') DEFAULT NULL,
  `so_tien_da_thanh_toan` decimal(10,2) DEFAULT NULL,
  `ngay_thanh_toan` timestamp NULL DEFAULT NULL,
  `trang_thai_thanh_toan` enum('paid','unpaid','pending') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_tucs`
--

CREATE TABLE `tin_tucs` (
  `tin_tuc_id` int NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_xuat_ban` date DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tin_tucs`
--

INSERT INTO `tin_tucs` (`tin_tuc_id`, `tieu_de`, `noi_dung`, `hinh_anh`, `ngay_xuat_ban`, `trang_thai`) VALUES
(8, 'aaaaaaaaaa', 'aaaaaaaaaa', 'uploads/369526173_1652615675207851_5978458808966020895_n.jpg', '2024-11-08', 1),
(9, 'Siêu sale bùng nổ tháng 11', 'sadsadasdsadsa', 'uploads/z5919221356837_07deb62ce2ad65e907196903add7459f.jpg', '2024-11-10', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int NOT NULL,
  `trang_thai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '''Chờ xác nhận'',''Đã xác nhận,''''Đang vận chuyển'',''Đã giao hàng'',''Giao hàng thất bại'',''Đã hủy'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `trang_thai`) VALUES
(12, 'Đã xác nhận'),
(13, 'Đang vận chuyển'),
(14, 'Chờ xác nhận'),
(15, 'Chờ xác nhận');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `van_chuyen`
--

CREATE TABLE `van_chuyen` (
  `id_ma_van_chuyen` int NOT NULL,
  `phuong_thuc_van_chuyen` varchar(50) DEFAULT NULL,
  `phi_van_chuyen` decimal(10,2) DEFAULT NULL,
  `ngay_du_kien_giao_hang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id_binh_luan`),
  ADD KEY `fk_binh_luans_nguoi_dungs` (`id_nguoi_dung`),
  ADD KEY `fk_binh_luans_san_phams` (`id_san_pham`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id_chi_tiet_don_hang`),
  ADD KEY `id_don_hang` (`id_don_hang`),
  ADD KEY `fk_chi_tiet_don_hangs_san_phams` (`id_san_pham`);

--
-- Chỉ mục cho bảng `chi_tiet_san_phams`
--
ALTER TABLE `chi_tiet_san_phams`
  ADD PRIMARY KEY (`id_chi_tiet_san_pham`),
  ADD KEY `fk_chi_tiet_san_phams_san_phams` (`id_san_pham`);

--
-- Chỉ mục cho bảng `danh_gia_san_phams`
--
ALTER TABLE `danh_gia_san_phams`
  ADD PRIMARY KEY (`id_danh_gia`),
  ADD KEY `fk_danh_gia_san_phams_nguoi_dungs` (`id_nguoi_dung`),
  ADD KEY `fk_danh_gia_san_phams_san_phams` (`id_san_pham`);

--
-- Chỉ mục cho bảng `danh_muc_banners`
--
ALTER TABLE `danh_muc_banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dia_chis`
--
ALTER TABLE `dia_chis`
  ADD PRIMARY KEY (`id_dia_chi`),
  ADD KEY `fk_dia_chis_nguoi_dungs` (`id_nguoi_dung`);

--
-- Chỉ mục cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id_don_hang`),
  ADD KEY `id_ma_van_chuyen` (`id_ma_van_chuyen`),
  ADD KEY `fk_don_hangs_nguoi_dungs` (`id_nguoi_dung`);

--
-- Chỉ mục cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gio_hangs_nguoi_dungs` (`id_nguoi_dung`),
  ADD KEY `fk_gio_hangs_san_phams` (`id_san_pham`);

--
-- Chỉ mục cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hinh_anh_san_phams_san_phams` (`san_pham_id`);

--
-- Chỉ mục cho bảng `khuyen_mais`
--
ALTER TABLE `khuyen_mais`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `noi_dungs`
--
ALTER TABLE `noi_dungs`
  ADD PRIMARY KEY (`noi_dung_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Chỉ mục cho bảng `thanh_toans`
--
ALTER TABLE `thanh_toans`
  ADD PRIMARY KEY (`id_thanh_toan`),
  ADD KEY `id_don_hang` (`id_don_hang`);

--
-- Chỉ mục cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD PRIMARY KEY (`tin_tuc_id`);

--
-- Chỉ mục cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `van_chuyen`
--
ALTER TABLE `van_chuyen`
  ADD PRIMARY KEY (`id_ma_van_chuyen`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danh_muc_banners`
--
ALTER TABLE `danh_muc_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `khuyen_mais`
--
ALTER TABLE `khuyen_mais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `tin_tuc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
