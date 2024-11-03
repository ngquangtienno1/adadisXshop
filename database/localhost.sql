-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 02, 2024 lúc 10:25 PM
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
CREATE DATABASE IF NOT EXISTS `adadisshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `adadisshop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id_admin` int NOT NULL,
  `ten_dang_nhap` varchar(50) NOT NULL,
  `mat_khau` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ngay_tao_tai_khoan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vai_tro` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `banner_id` int NOT NULL,
  `tieu_de` varchar(255) DEFAULT NULL,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `lien_ket` varchar(255) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Cấu trúc bảng cho bảng `danh_muc_san_phams`
--

CREATE TABLE `danh_muc_san_phams` (
  `id_danh_muc` int NOT NULL,
  `ten_danh_muc` varchar(50) DEFAULT NULL,
  `mo_ta` text,
  `trang_thai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc_san_phams`
--

INSERT INTO `danh_muc_san_phams` (`id_danh_muc`, `ten_danh_muc`, `mo_ta`, `trang_thai`) VALUES
(1, 'Giày Nam', NULL, 1),
(2, 'Giày Nữ 2', '', 1),
(3, 'Giày Thể Thao', '', 1),
(4, 'Giày Vải', NULL, 0);

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
  `ma_khuyen_mai` varchar(50) DEFAULT NULL,
  `mo_ta` text,
  `ngay_bat_dau` datetime DEFAULT NULL,
  `ngay_ket_thuc` datetime DEFAULT NULL,
  `trang_thai` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_hes`
--

CREATE TABLE `lien_hes` (
  `id` int NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(12) DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL
) 


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dungs`
--

CREATE TABLE `nguoi_dungs` (
  `id_nguoi_dung` int NOT NULL,
  `ten_dang_nhap` varchar(50) DEFAULT NULL,
  `mat_khau` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ngay_tao_tai_khoan` timestamp NULL DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_san_pham` int NOT NULL,
  `ten_san_pham` varchar(100) DEFAULT NULL,
  `id_danh_muc` int DEFAULT NULL,
  `mo_ta` text,
  `gia` decimal(10,2) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `id_thuong_hieu` int DEFAULT NULL,
  `kich_thuoc` varchar(50) DEFAULT NULL,
  `mau_sac` varchar(50) DEFAULT NULL,
  `trang_thai_san_pham` enum('active','inactive') DEFAULT NULL,
  `danh_gia_san_pham` decimal(2,1) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `ngay_them_san_pham` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int NOT NULL,
  `ho_ten` varchar(50) DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `ngay_sinh` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `gioi_tinh` tinyint(1) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `chuc_vu_id` int DEFAULT NULL,
  `trang_thai` int DEFAULT NULL
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
  `tieu_de` varchar(255) DEFAULT NULL,
  `noi_dung` text,
  `tac_gia` varchar(255) DEFAULT NULL,
  `ngay_xuat_ban` date DEFAULT NULL,
  `ngay_tao` timestamp NULL DEFAULT NULL,
  `banner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banner_id`);

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
-- Chỉ mục cho bảng `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  ADD PRIMARY KEY (`id_danh_muc`);

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
  ADD PRIMARY KEY (`lien_he_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Chỉ mục cho bảng `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  ADD PRIMARY KEY (`id_nguoi_dung`);

--
-- Chỉ mục cho bảng `noi_dungs`
--
ALTER TABLE `noi_dungs`
  ADD PRIMARY KEY (`noi_dung_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Chỉ mục cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `fk_san_phams_danh_muc_san_phams` (`id_danh_muc`);

--
-- Chỉ mục cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`);

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
  ADD PRIMARY KEY (`tin_tuc_id`),
  ADD KEY `banner_id` (`banner_id`);

--
-- Chỉ mục cho bảng `van_chuyen`
--
ALTER TABLE `van_chuyen`
  ADD PRIMARY KEY (`id_ma_van_chuyen`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `banner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id_binh_luan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id_chi_tiet_don_hang` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_san_phams`
--
ALTER TABLE `chi_tiet_san_phams`
  MODIFY `id_chi_tiet_san_pham` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_gia_san_phams`
--
ALTER TABLE `danh_gia_san_phams`
  MODIFY `id_danh_gia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danh_muc_san_phams`
--
ALTER TABLE `danh_muc_san_phams`
  MODIFY `id_danh_muc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `dia_chis`
--
ALTER TABLE `dia_chis`
  MODIFY `id_dia_chi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id_don_hang` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khuyen_mais`
--
ALTER TABLE `khuyen_mais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  MODIFY `lien_he_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoi_dungs`
--
ALTER TABLE `nguoi_dungs`
  MODIFY `id_nguoi_dung` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `noi_dungs`
--
ALTER TABLE `noi_dungs`
  MODIFY `noi_dung_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id_san_pham` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thanh_toans`
--
ALTER TABLE `thanh_toans`
  MODIFY `id_thanh_toan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `tin_tuc_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `van_chuyen`
--
ALTER TABLE `van_chuyen`
  MODIFY `id_ma_van_chuyen` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD CONSTRAINT `binh_luans_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `binh_luans_ibfk_2` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_binh_luans_nguoi_dungs` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_binh_luans_san_phams` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD CONSTRAINT `chi_tiet_don_hangs_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hangs` (`id_don_hang`),
  ADD CONSTRAINT `chi_tiet_don_hangs_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `fk_chi_tiet_don_hangs_san_phams` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `chi_tiet_san_phams`
--
ALTER TABLE `chi_tiet_san_phams`
  ADD CONSTRAINT `chi_tiet_san_phams_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `fk_chi_tiet_san_phams_san_phams` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `danh_gia_san_phams`
--
ALTER TABLE `danh_gia_san_phams`
  ADD CONSTRAINT `danh_gia_san_phams_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `danh_gia_san_phams_ibfk_2` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_danh_gia_san_phams_nguoi_dungs` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_danh_gia_san_phams_san_phams` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `dia_chis`
--
ALTER TABLE `dia_chis`
  ADD CONSTRAINT `dia_chis_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_dia_chis_nguoi_dungs` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`);

--
-- Các ràng buộc cho bảng `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD CONSTRAINT `don_hangs_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `don_hangs_ibfk_2` FOREIGN KEY (`id_ma_van_chuyen`) REFERENCES `van_chuyen` (`id_ma_van_chuyen`),
  ADD CONSTRAINT `fk_don_hangs_nguoi_dungs` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`);

--
-- Các ràng buộc cho bảng `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD CONSTRAINT `fk_gio_hangs_nguoi_dungs` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `fk_gio_hangs_san_phams` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `gio_hangs_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dungs` (`id_nguoi_dung`),
  ADD CONSTRAINT `gio_hangs_ibfk_2` FOREIGN KEY (`id_san_pham`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD CONSTRAINT `fk_hinh_anh_san_phams_san_phams` FOREIGN KEY (`san_pham_id`) REFERENCES `san_phams` (`id_san_pham`),
  ADD CONSTRAINT `hinh_anh_san_phams_ibfk_1` FOREIGN KEY (`san_pham_id`) REFERENCES `san_phams` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  ADD CONSTRAINT `lien_hes_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`banner_id`);

--
-- Các ràng buộc cho bảng `noi_dungs`
--
ALTER TABLE `noi_dungs`
  ADD CONSTRAINT `noi_dungs_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`banner_id`);

--
-- Các ràng buộc cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD CONSTRAINT `fk_san_phams_danh_muc_san_phams` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc_san_phams` (`id_danh_muc`),
  ADD CONSTRAINT `san_phams_ibfk_1` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc_san_phams` (`id_danh_muc`);

--
-- Các ràng buộc cho bảng `thanh_toans`
--
ALTER TABLE `thanh_toans`
  ADD CONSTRAINT `thanh_toans_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hangs` (`id_don_hang`);

--
-- Các ràng buộc cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD CONSTRAINT `tin_tucs_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`banner_id`);
--
-- Cơ sở dữ liệu: `databse_web108`
--
CREATE DATABASE IF NOT EXISTS `databse_web108` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `databse_web108`;
--
-- Cơ sở dữ liệu: `ecommerce_data`
--
CREATE DATABASE IF NOT EXISTS `ecommerce_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `ecommerce_data`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `admin_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `role` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_user`, `admin_type`, `admin_status`, `created_at`, `updated_at`, `role`) VALUES
(2, 'admin', '1', 'active', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `Bill_id` int NOT NULL,
  `User_id` int NOT NULL,
  `Products_id` int NOT NULL,
  `Total_price` decimal(10,2) NOT NULL,
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'paid / pending / cancelled',
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billpro`
--

CREATE TABLE `billpro` (
  `id` int NOT NULL,
  `bill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pttt` tinyint NOT NULL DEFAULT '0' COMMENT '0 chuyển khoản , 1 nhận hàng rồi chuyển ',
  `ngaydat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '0' COMMENT '0 Đơn hàng mới , 1 Đang xử lý , 2 Đang giao hàng , 3 đã giao hàng',
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `Bill_details_id` int NOT NULL,
  `Bill_id` int NOT NULL,
  `Products_id` int NOT NULL,
  `Products_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Total_price` decimal(10,2) NOT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `Cart_id` int NOT NULL,
  `Products_id` int NOT NULL,
  `Products_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_id` int NOT NULL,
  `Quantity` int NOT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartdetail`
--

CREATE TABLE `cartdetail` (
  `CartDetail_id` int NOT NULL,
  `Cart_id` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Total_price` decimal(10,2) NOT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `Thumbnail`, `Description`) VALUES
(16, 'ÁO KHOÁC', 'img', 'img'),
(17, 'ÁO THUN', 'img', 'img'),
(19, 'QUẦN SHORT', 'img', 'img'),
(20, 'SƠ MI', 'img', 'img'),
(21, 'QUẦN DÀI', 'img', 'img');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_id` int NOT NULL,
  `Products_id` int NOT NULL,
  `User_id` int NOT NULL,
  `Star` int NOT NULL,
  `Reviews` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`Feedback_id`, `Products_id`, `User_id`, `Star`, `Reviews`, `CreatedAt`) VALUES
(7, 20, 1, 2, '5saosao', '2024-09-20'),
(8, 22, 15, 5, 'ahahhahaahhaha', '2024-08-07'),
(9, 22, 15, 1, 'chào em nha', '2024-08-07'),
(10, 23, 1, 4, 'saosao\r\n', '2024-08-18'),
(11, 20, 1, 5, 'ssss', '2024-08-20'),
(13, 20, 16, 3, 'ok', '2024-08-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `ImageID` int NOT NULL,
  `Products_id` int NOT NULL,
  `Thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`ImageID`, `Products_id`, `Thumbnail`) VALUES
(3, 15, 'pro1.jpg'),
(4, 15, 'pro2.jpg'),
(5, 15, 'pro3.jpg'),
(6, 15, 'pro4.jpg'),
(7, 15, 'pro5.jpg'),
(8, 16, 'pro6.jpg'),
(11, 16, 'pro7.jpg'),
(12, 16, 'pro8.jpg'),
(13, 16, 'pro9.jpg'),
(14, 16, 'pro10.jpg'),
(15, 22, 'sp20.jpg'),
(16, 22, 'sp21.jpg'),
(17, 22, 'sp22.jpg'),
(18, 22, 'sp23.jpg'),
(19, 22, 'sp24.jpg'),
(20, 17, 'sp27.jpg'),
(21, 17, 'sp28.jpg'),
(22, 17, 'sp29.jpg'),
(23, 17, 'sp30.jpg'),
(24, 18, 'sp27.jpg'),
(25, 18, 'sp33.jpg'),
(26, 18, 'sp34.jpg'),
(28, 19, 'sp5.jpg'),
(29, 19, 'sp36.jpg'),
(30, 19, 'sp37.jpg'),
(31, 19, 'sp39.jpg'),
(32, 20, 'sp40.jpg'),
(33, 20, 'sp41.jpg'),
(34, 20, 'sp42.jpg'),
(36, 21, 'sp47.jpg'),
(37, 21, 'sp48.jpg'),
(38, 21, 'sp49.jpg'),
(39, 21, 'sp50.jpg'),
(40, 21, 'sp51.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetail_id` int NOT NULL,
  `OrderID` int NOT NULL,
  `Products_id` int NOT NULL,
  `Products_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `User_id` int NOT NULL,
  `OrderDate` datetime NOT NULL,
  `ShippingAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `OrderStatus` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymentinfo`
--

CREATE TABLE `paymentinfo` (
  `Paymentinfo_id` int NOT NULL,
  `User_id` int NOT NULL,
  `Card_number` int NOT NULL,
  `Card_holder_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created_at` date DEFAULT NULL,
  `Updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdiscount`
--

CREATE TABLE `productdiscount` (
  `ProductDiscount_id` int NOT NULL,
  `ProductDiscount_percent` decimal(5,2) NOT NULL,
  `ProductDiscount_start_date` datetime NOT NULL,
  `ProductDiscount_end_date` datetime NOT NULL,
  `ProductDiscount_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_id` int NOT NULL,
  `Created_at` datetime DEFAULT NULL,
  `Updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `Products_id` int NOT NULL,
  `Products_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_price` int NOT NULL,
  `Products_category` int NOT NULL,
  `Products_quantity` int NOT NULL DEFAULT '0',
  `Products_img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_Sold` int NOT NULL,
  `Products_brand` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Products_Feedback` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Created_at` date DEFAULT NULL,
  `Updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`Products_id`, `Products_name`, `Products_description`, `Products_price`, `Products_category`, `Products_quantity`, `Products_img`, `Products_sku`, `Products_Sold`, `Products_brand`, `Products_Feedback`, `Created_at`, `Updated_at`) VALUES
(15, 'Áo Khoác Nỉ Có Nón Regular AKN0116', 'Áo khoác thun nỉ, đơn giản và năng động. Túi ngoài có dây kéo, mặt trong có túi tiện dụng. Mặc đi nắng hoặc trời se lạnh cực tốt. Phiên bản mới cải tiến với form dáng Regular rộng rãi, bo thun cotton ở cổ tay và eo tăng thêm sự thoải mái khi mặc.', 35, 16, 100, 'sp1.jpg', 'AKN0116MMXĐ', 2000, 'KENTA', 'OK', '2024-07-24', '2024-07-31'),
(16, 'Áo Khoác Dù Phối 2 Lớp AKD0036', 'Áo khoác Dù phối cá tính và năng động, dây kéo ở nhiều vị trí, để vật dụng kín đáo. Nón to và có mũ che nắng tiện dụng', 35, 16, 100, 'sp55.jpg', 'AKD0036MMXĐ', 1000, 'KENTA', 'OK', '2024-07-24', '2024-07-31'),
(17, 'Áo Thun Polo Cotton 100% ATP0043', 'Ra mắt dòng áo thun Polo chất liệu cotton 100%, co giãn 4 chiều, bo cổ dệt kim cao cấp. Đảm bảo thoáng mát và thoải mái cả ngày dài. Form slimfit vừa vặn, mix match theo nhiều phong cách và item khác nhau, đến Kenta thử ngay để cảm nhận chất liệu.', 25, 17, 100, 'sp3.jpg', 'ATP0043MMDE', 1000, 'KENTA', 'OK', '2024-07-24', '2024-07-31'),
(18, 'Áo Thun Polo Cotton 100% ATP0042', 'Ra mắt dòng áo thun Polo chất liệu cotton 100%, co giãn 4 chiều, bo cổ dệt kim cao cấp. Đảm bảo thoáng mát và thoải mái cả ngày dài. Form slimfit vừa vặn, mix match theo nhiều phong cách và item khác nhau, đến Kenta thử ngay để cảm nhận chất liệu.', 50, 17, 100, 'sp4.jpg', 'ATP0042MMDE', 900, 'KENTA', 'OK', '2024-07-24', '2024-07-31'),
(19, 'Quần Short Kaki Nam QSK0065', 'Mô tả Quần Short Kaki nam năng động trẻ trung, from slim vừa vặn tôn dáng và không quá ôm sát, tạo sự thoải mái cho người mặc.', 35, 19, 100, 'sp5.jpg', 'QSK006529DE', 1000, 'KENTA', 'OK', '2024-07-24', '2024-07-25'),
(20, 'Quần Short Kaki Nam QSK0065', 'Quần Short Kaki nam năng động trẻ trung, from slim vừa vặn tôn dáng và không quá ôm sát, tạo sự thoải mái cho người mặc', 25, 19, 1000, 'sp6.jpg', 'QSK006529XĐ', 100, 'KENTA', 'OK', '2024-07-24', '2024-07-27'),
(21, 'Sơ Mi Nam Trắng Vải Lụa Dày SMD0089', 'Mô tả Sơ mi tay dài luôn sang trọng, lịch lãm. Chất vải lụa dày mango thoáng mát và chất lượng, thấm hút cực tốt, định lượng vải dày dặn chất lượng nhưng mặc lên cực mát. Đường may cuốn sườn tinh tế, form cực chuẩn. Chất vải ít nhăn, mềm mại tuyệt đối, hạn chế nhăn ra co rút và kháng khuẩn. Form dáng Slimfit ôm nhẹ, vừa vặn và tôn dáng tối đa khi mặc. ', 100, 20, 1000, 'sp7.jpg', 'SMD0089MMTA', 100, 'KENTA', 'OK', '2024-07-24', '2024-07-25'),
(22, 'Sơ Mi Cotton Tay Dài SMD0097', 'Sơ mi dài tay với chất vải cotton thoáng khí và mềm mại, thoải mái cả ngày dài.', 30, 20, 1000, 'sp8.jpg', 'SMD0097MMRV', 100, 'KENTA', 'OK', '2024-07-24', '2024-07-30'),
(23, 'Áo Khoác Dù Trắng Phối Xéo AKD0041', 'Áo khoác vải dù phối xéo, thiết kế form rộng, chất liệu vải dù trượt nước và mềm mịn', 351, 16, 101, 'pro6.jpg', 'AKD0041MMTA', 100, 'KENTAass', 'OKa', '2024-08-24', '2024-08-24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `Role_id` int NOT NULL,
  `Role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_id` int NOT NULL,
  `Supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Supplier_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Supplier_phone` int NOT NULL,
  `Supplier_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Supplier_thumbnail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Supplier_Followers` int DEFAULT NULL,
  `Supplier_ChatFeedback` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Supplier_Desc_longtext` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Supplier_Status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`Supplier_id`, `Supplier_name`, `Supplier_address`, `Supplier_phone`, `Supplier_email`, `Supplier_thumbnail`, `Supplier_Followers`, `Supplier_ChatFeedback`, `Supplier_Desc_longtext`, `Supplier_Status`) VALUES
(1, 'admin', '168 Nguyễn Trọng Tuyển, P8, Phú Nhuận', 73006200, 'admin@vn.com', 'img', 123, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `User_id` int NOT NULL,
  `User_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role_id` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`User_id`, `User_name`, `Email`, `Password`, `Role_id`) VALUES
(1, 'admin', 'admin@vn.com', 'vuivui', 1),
(13, 'cscsccsaaa', 'scssscsscssccscsaaa', 'scsccaaaa', 1),
(15, 'vuivuivui123', 'vuivuivui123', 'vuivuivui123', 0),
(16, 'vuivui12345', 'vuivui12345@gmail.com', 'vuivui12345', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userproductviews`
--

CREATE TABLE `userproductviews` (
  `View_id` int NOT NULL,
  `User_id` int NOT NULL,
  `Product_id` int NOT NULL,
  `View_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `role` (`role`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Products_id` (`Products_id`);

--
-- Chỉ mục cho bảng `billpro`
--
ALTER TABLE `billpro`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`Bill_details_id`),
  ADD KEY `products_bill_details` (`Products_id`),
  ADD KEY `Bill_id` (`Bill_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_id`),
  ADD KEY `cart_products` (`Products_id`);

--
-- Chỉ mục cho bảng `cartdetail`
--
ALTER TABLE `cartdetail`
  ADD PRIMARY KEY (`CartDetail_id`),
  ADD KEY `Cart_id` (`Cart_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_id`),
  ADD KEY `Products_id` (`Products_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `Products_id` (`Products_id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetail_id`),
  ADD KEY `orderdetail_orderid` (`OrderID`),
  ADD KEY `Products_id` (`Products_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `User_id` (`User_id`);

--
-- Chỉ mục cho bảng `paymentinfo`
--
ALTER TABLE `paymentinfo`
  ADD PRIMARY KEY (`Paymentinfo_id`),
  ADD UNIQUE KEY `Card_number` (`Card_number`),
  ADD KEY `User_id` (`User_id`);

--
-- Chỉ mục cho bảng `productdiscount`
--
ALTER TABLE `productdiscount`
  ADD PRIMARY KEY (`ProductDiscount_id`),
  ADD KEY `Products_id` (`Products_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Products_id`),
  ADD UNIQUE KEY `Products_sku` (`Products_sku`),
  ADD KEY `Products_category` (`Products_category`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_id`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Role_id` (`Role_id`);

--
-- Chỉ mục cho bảng `userproductviews`
--
ALTER TABLE `userproductviews`
  ADD PRIMARY KEY (`View_id`),
  ADD KEY `userproductviews_products` (`Product_id`),
  ADD KEY `User_id` (`User_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `Bill_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `billpro`
--
ALTER TABLE `billpro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `Bill_details_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cartdetail`
--
ALTER TABLE `cartdetail`
  MODIFY `CartDetail_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Feedback_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `ImageID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetail_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `paymentinfo`
--
ALTER TABLE `paymentinfo`
  MODIFY `Paymentinfo_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `productdiscount`
--
ALTER TABLE `productdiscount`
  MODIFY `ProductDiscount_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `Products_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `Role_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `userproductviews`
--
ALTER TABLE `userproductviews`
  MODIFY `View_id` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`);

--
-- Các ràng buộc cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `bill_details_ibfk_1` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Bill_id`),
  ADD CONSTRAINT `products_bill_details` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_products` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cartdetail`
--
ALTER TABLE `cartdetail`
  ADD CONSTRAINT `cartdetail_ibfk_1` FOREIGN KEY (`Cart_id`) REFERENCES `cart` (`Cart_id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`);

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`),
  ADD CONSTRAINT `orderdetail_orderid` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orderdetail_products` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Các ràng buộc cho bảng `paymentinfo`
--
ALTER TABLE `paymentinfo`
  ADD CONSTRAINT `paymentinfo_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Các ràng buộc cho bảng `productdiscount`
--
ALTER TABLE `productdiscount`
  ADD CONSTRAINT `productdiscount_ibfk_1` FOREIGN KEY (`Products_id`) REFERENCES `products` (`Products_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`Products_category`) REFERENCES `category` (`CategoryID`);

--
-- Các ràng buộc cho bảng `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_admin` FOREIGN KEY (`Role_id`) REFERENCES `admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `role_user` FOREIGN KEY (`Role_id`) REFERENCES `user` (`User_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `userproductviews`
--
ALTER TABLE `userproductviews`
  ADD CONSTRAINT `userproductviews_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `userproductviews_products` FOREIGN KEY (`Product_id`) REFERENCES `products` (`Products_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Cơ sở dữ liệu: `yame_shop`
--
CREATE DATABASE IF NOT EXISTS `yame_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `yame_shop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `img` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `sold` int NOT NULL DEFAULT '0',
  `view` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
