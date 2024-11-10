<?php
class SanPham{
    public $conn;
    public function __construct()
    {
        $this->conn = connectDB();
    }
    public function getAllSanPham()
    {
        try {
            $sql = 'SELECT san_phams.*, danh_muc_san_phams.ten_danh_muc
            FROM san_phams
            INNER JOIN danh_muc_san_phams ON san_phams.danh_muc_id  = danh_muc_san_phams.id_danh_muc
            ';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            echo 'Lỗi: ' . $e->getMessage();
        }
    }
    public function insertSanPham(
        $ten_san_pham,
        $mo_ta_dai,
        $mo_ta_ngan,
        $gia_ban,
        $gia_nhap,
        $gia_khuyen_mai,
        $so_luong,
        $ngay_nhap,
        $danh_muc_id,
        $trang_thai,
        
        $hinh_anh
    ) {
        try {
            $sql = 'INSERT INTO san_phams(ten_san_pham,
    mo_ta_dai,
    mo_ta_ngan,
    gia_ban,
    gia_nhap,
    gia_khuyen_mai,
    so_luong,
    ngay_nhap,
    danh_muc_id,
    trang_thai,
    hinh_anh)
            VALUES (:ten_san_pham,
    :mo_ta_dai,
    :mo_ta_ngan,
    :gia_ban,
    :gia_nhap,
    :gia_khuyen_mai,
    :so_luong,
    :ngay_nhap,
    :danh_muc_id,
    :trang_thai,
    :hinh_anh)';
            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':ten_san_pham' => $ten_san_pham,
                ':mo_ta_dai' => $mo_ta_dai,
                ':mo_ta_ngan' => $mo_ta_ngan,
                ':gia_ban' => $gia_ban,
                ':gia_nhap' => $gia_nhap,
                ':gia_khuyen_mai' => $gia_khuyen_mai,
                ':so_luong' => $so_luong,
                ':ngay_nhap' => $ngay_nhap,
                ':danh_muc_id' => $danh_muc_id,
                ':trang_thai' => $trang_thai,
                ':hinh_anh' => $hinh_anh
            ]);
            //lấy id sản phẩm vừa thêm
            return true;
        } catch (PDOException $e) {
            echo 'Lỗi: ' . $e->getMessage();
        }
    }
    public function updateSanpham( $san_pham_id,
        $ten_san_pham,
        $mo_ta_dai,
        $mo_ta_ngan,
        $gia_ban,
        $gia_nhap,
        $gia_khuyen_mai,
        $so_luong,
        $ngay_nhap,
        $danh_muc_id,
        $trang_thai,
        
        $hinh_anh
    ) {
        try {
            $sql = 'UPDATE san_phams SET ten_san_pham = :ten_san_pham,
                     mo_ta_dai = :mo_ta_dai,
                     mo_ta_ngan = :mo_ta_ngan,
                     gia_ban = :gia_ban,
                     gia_nhap = :gia_nhap,
                     gia_khuyen_mai = :gia_khuyen_mai,
                     so_luong = :so_luong,
                     ngay_nhap = :ngay_nhap,
                     danh_muc_id = :danh_muc_id,
                     trang_thai = :trang_thai,
                     hinh_anh = :hinh_anh WHERE id =:id' ;
                    //  var_dump($sql);die();
            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':ten_san_pham' => $ten_san_pham,
                ':mo_ta_dai' => $mo_ta_dai,
                ':mo_ta_ngan' => $mo_ta_ngan,
                ':gia_ban' => $gia_ban,
                ':gia_nhap' => $gia_nhap,
                ':gia_khuyen_mai' => $gia_khuyen_mai,
                ':so_luong' => $so_luong,
                ':ngay_nhap' => $ngay_nhap,
                ':danh_muc_id' => $danh_muc_id,
                ':trang_thai' => $trang_thai,
                ':hinh_anh' => $hinh_anh,
                ':id' => $san_pham_id
            ]);
            //lấy id sản phẩm vừa thêm
            return true;
        } catch (PDOException $e) {
            echo 'Lỗi: ' . $e->getMessage();
        }
    }
    public function getDetailSanPham($id)
    {
        try {
            $sql = 'SELECT san_phams.*, danh_muc_san_phams.ten_danh_muc
            FROM san_phams
            INNER JOIN danh_muc_san_phams ON san_phams.danh_muc_id  = danh_muc_san_phams.id_danh_muc
            WHERE san_phams.id = :id
            ';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return $stmt->fetch();
        } catch (Exception $e) {
            echo 'Lỗi' . $e->getMessage();
        }
    }
    public function destroySanPham($id)
    {
        try {
            $sql = 'DELETE FROM san_phams WHERE id = :id';


            $stmt = $this->conn->prepare($sql);

            $stmt->execute([

                ':id' => $id
            ]);

            return true;
        } catch (Exception $e) {
            echo 'Lỗi' . $e->getMessage();
        }
    }
}