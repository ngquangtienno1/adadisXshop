<?php

class DonHang
{

  public $conn;

  // Kết nối cơ sở dữ liệu
  public function __construct()
  {
    $this->conn = connectDB();  // Giả sử connectDB() là một hàm kết nối cơ sở dữ liệu đã được định nghĩa ở nơi khác
  }

  // Lấy tất cả đơn hàng
  public function getAll()
  {
    try {
      $sql = "SELECT don_hangs.*, trang_thai_don_hangs.trang_thai
                    FROM don_hangs
                    JOIN trang_thai_don_hangs ON don_hangs.trang_thai_don_hang = trang_thai_don_hangs.id";
      $stmt = $this->conn->prepare($sql);
      $stmt->execute();
      return $stmt->fetchAll();
    } catch (PDOException $e) {
      echo "Error: " . $e->getMessage();
    }
  }

  // Tìm kiếm đơn hàng theo mã đơn và trạng thái
  public function searchOrders($search, $status)
  {

    $query = "SELECT don_hangs.*, trang_thai_don_hangs.trang_thai FROM don_hangs JOIN trang_thai_don_hangs ON don_hangs.trang_thai_don_hang = trang_thai_don_hangs.id ";

    if ($search) {
      $query .= " AND id_don_hang LIKE :search";
    }
    if ($status) {
      $query .= " AND trang_thai = :status";
    }

    $stmt = $this->conn->prepare($query);

    if ($search) {
      $stmt->bindValue(':search', "%$search%");
    }
    if ($status) {
      $stmt->bindValue(':status', $status);
    }

    $stmt->execute();

    return $stmt->fetchAll();  // Trả về kết quả tìm kiếm
  }
}
