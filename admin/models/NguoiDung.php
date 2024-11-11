<?php
class NguoiDung
{
    public $conn;

    //Kết nối csdl
    public function __construct()
    {
        $this->conn = connectDB();
    }

    //Truy cập csdl để lấy ds liên hệ
    public function getAllNguoiDung()
    {
        try {
            $sql = 'SELECT*FROM nguoi_dungs';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute();

            return $stmt->fetchAll();
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }
    public function postData($ten_nguoi_dung, $email, $sdt, $dia_chi, $mat_khau, $ngay_sinh, $gioi_tinh, $vai_tro, $ngay_tao, $ngay_cap_nhat, $trang_thai, $avatar)
    {
        try {
            $sql = 'INSERT INTO nguoi_dungs(ten_nguoi_dung, email, sdt, dia_chi, mat_khau,ngay_sinh, gioi_tinh, vai_tro,ngay_tao,ngay_cap_nhat,trang_thai,avatar) 
            values (:ten_nguoi_dung, :email, :sdt, :dia_chi, :mat_khau,:ngay_sinh,:gioi_tinh,:vai_tro,:ngay_tao,:ngay_cap_nhat,:trang_thai, :avatar) ';

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':ten_nguoi_dung' => $ten_nguoi_dung,
                ':email' => $email,
                ':sdt' => $sdt,
                ':dia_chi' => $dia_chi,
                ':mat_khau' => $mat_khau,
                ':ngay_sinh' => $ngay_sinh,
                ':gioi_tinh' => $gioi_tinh,
                ':vai_tro' => $vai_tro,
                ':ngay_tao' => $ngay_tao,
                ':ngay_cap_nhat' => $ngay_cap_nhat,
                ':trang_thai' => $trang_thai,
                ':avatar' => $avatar
            ]);
            return true;
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }
    //lấy thông tin chi tiết
    public function getDeltailData($id)
    {
        try {
            $sql = 'SELECT * FROM  nguoi_dungs WHERE id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return $stmt->fetch();
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }
    public function updateData($id,$ten_nguoi_dung, $email, $sdt, $dia_chi,  $mat_khau, $ngay_sinh, $gioi_tinh, $avatar, $vai_tro,$trang_thai, $ngay_tao, $ngay_cap_nhat,  )
    {
        try {
            $sql = 'UPDATE nguoi_dungs SET  ten_nguoi_dung = :ten_nguoi_dung, email = :email, sdt = :sdt, dia_chi = :dia_chi,
             mat_khau = :mat_khau, ngay_sinh = :ngay_sinh, gioi_tinh = :gioi_tinh,avatar = :avatar, vai_tro = :vai_tro, ngay_tao = :ngay_tao, ngay_cap_nhat = :ngay_cap_nhat, trang_thai = :trang_thai  WHERE id = :id ';

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                'id' => $id,
                ':ten_nguoi_dung' => $ten_nguoi_dung,
                ':email' => $email,
                ':sdt' => $sdt,
                ':dia_chi' => $dia_chi,
                ':mat_khau' => $mat_khau,
                ':ngay_sinh' => $ngay_sinh,
                ':gioi_tinh' => $gioi_tinh,
                ':avatar' => $avatar,
                ':vai_tro' => $vai_tro,
                ':trang_thai' => $trang_thai,
                ':ngay_tao' => $ngay_tao,
                ':ngay_cap_nhat' => $ngay_cap_nhat,

            ]);

            return true;
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }
    //xóa dữ liệu 
    public function deleteData($id)
    {
        try {
            $sql = 'DELETE from nguoi_dungs WHERE id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return true;
        } catch (PDOException $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }

    //Hủy kết nối csdl
    public function __destruct()
    {
        $this->conn = null;
    }
}
