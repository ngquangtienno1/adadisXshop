<?php

class DonHangController {

    // Kết nối model DonHang
    public $modelDonHang;

    public function __construct() {
        $this->modelDonHang = new DonHang();
    }

    // Liệt kê tất cả đơn hàng
    public function listDonHang() {
        $donHang = $this->modelDonHang->getAll();  // Lấy tất cả đơn hàng

        // Chuyển kết quả đến view
        require_once './views/DonHang/listDonHang.php';
    }

    // Tìm kiếm đơn hàng theo mã và trạng thái
    public function searchDonHang() {

      // var_dump($_POST);
      // Lấy các tham số từ POST thay vì GET
      $search = isset($_POST['search']) ? $_POST['search'] : '';
      $status = isset($_POST['status']) ? $_POST['status'] : '';

      // Gọi model để tìm kiếm đơn hàng
      $donHang = $this->modelDonHang->searchOrders($search, $status);




      // Hiển thị kết quả tìm kiếm
      require_once './views/DonHang/listDonHang.php';
  }

}
?>
