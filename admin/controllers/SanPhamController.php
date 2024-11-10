<?php
class SanPhamController
{
  public $modelSanPham;
  public $modelDanhMuc;
  public function __construct()
  {
    $this->modelDanhMuc = new DanhMuc();
    $this->modelSanPham = new SanPham();
  }
  public function danhSachSanPham()
  {
    $listSanPham = $this->modelSanPham->getAllSanPham();

    require_once './views/sanphams/listSanPham.php';
  }
  public function formAddSanPham()
  {
    //dùng để hiển thị form nhập
    $danhMucs = $this->modelDanhMuc->getAll();
    require_once './views/sanphams/create_san_pham.php';
  }
  public function postAddSanPham()
  {
    // var_dump($_POST);
    // dùng để thêm dữ liệu xử lý dữ liệu
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $ten_san_pham = $_POST['ten_san_pham'] ?? '';
      $mo_ta_dai = $_POST['mo_ta_dai'] ?? '';
      $mo_ta_ngan = $_POST['mo_ta_ngan'] ?? '';
      $trang_thai = $_POST['trang_thai'] ?? '';
      $gia_ban = $_POST['gia_ban'] ?? '';
      $gia_nhap = $_POST['gia_nhap'] ?? '';
      $gia_khuyen_mai = $_POST['gia_khuyen_mai'] ?? '';
      $so_luong = $_POST['so_luong'] ?? '';
      $ngay_nhap = $_POST['ngay_nhap'] ?? '';
      $danh_muc_id = $_POST['danh_muc_id'] ?? '';



      $hinh_anh = $_FILES['hinh_anh'] ?? null;

      // //Lưu hình ảnh
      $file_thumb = uploadFile($hinh_anh, './uploads/');


      //logic sửa ảnh




      $errors = [];
      if (empty($ten_san_pham)) {
        $errors['ten_san_pham'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($mo_ta_dai)) {
        $errors['mo_ta_dai'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($mo_ta_ngan)) {
        $errors['mo_ta_ngan'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($trang_thai)) {
        $errors['trang_thai'] = 'trang thái phải chọn';
      }
      if (empty($gia_ban)) {
        $errors['gia_ban'] = 'Tên sản phẩm không được để trống';
      }

      if (empty($gia_nhap)) {
        $errors['gia_nhap'] = 'giá sản phẩm không được để trống';
      }
      if (empty($gia_khuyen_mai)) {
        $errors['gia_khuyen_mai'] = 'giá khuyến mãi không được để trống';
      }
      if (empty($so_luong)) {
        $errors['so_luong'] = 'số lượng không được để trống';
      }
      if (empty($ngay_nhap)) {
        $errors['ngay_nhap'] = 'ngày nhập không được để trống';
      }
      if (empty($danh_muc_id)) {
        $errors['danh_muc_id'] = 'danh mục phải chọn';
      }

      if ($hinh_anh['error'] !== 0) {
        $errors['hinh_anh'] = 'phải chọn ảnh sản ohaamr';
      }

      $_SESSION['error'] = $errors;



      if (empty($errors)) {
        // var_dump('ac');die;
        //nếu k có lỗi tiến hành tên sản phẩm
        $san_pham_id = $this->modelSanPham->insertSanPham(
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

          $file_thumb
        );
        // var_dump($san_pham_id);die();
        //xử lý thêm album ảnh sản phẩm img_array

        header("Location: " . BASE_URL_ADMIN . '?act=san-phams');
        exit();
      } else {
        //trả lỗi

        //đặt chỉ thị xóa session sau khi hiển thị form
        $_SESSION['flash'] = true;
        header("Location: " . BASE_URL_ADMIN . '?act=form-them-san-pham');
        exit();
      }
    }
  }
  public function formEditSanPham()
  {
    //dùng để hiển thị form nhập
    //echo 'hehe';
    //lấy ra thông tin danh mục cần sửa
    $id = $_GET['id_san_pham'];
    $sanPham = $this->modelSanPham->getDetailSanPham($id);

    $danhMucs = $this->modelDanhMuc->getAll();
    // var_dump($SanPham);
    // die();
    if ($sanPham) {
      require_once './views/sanphams/update_san_pham.php';
    } else {
      header("Location: " . BASE_URL_ADMIN . '?act=san-phams');
      exit();
    }
  }
  public function postEditSanPham()
  {
    // var_dump($_POST);
    // dùng để thêm dữ liệu xử lý dữ liệu
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

      //lấy ra dữu liệu
      //lấy ra dữ liệu cũ của sản phẩm

      $san_pham_id = $_POST['id'] ?? '';
      //truy vấn
      $sanPhamOld = $this->modelSanPham->getDetailSanPham($san_pham_id);
      $old_file = $sanPhamOld['hinh_anh']; //lấy ảnh cũ để phục vụ sửa ảnh

      $ten_san_pham = $_POST['ten_san_pham'] ?? '';
      $mo_ta_dai = $_POST['mo_ta_dai'] ?? '';
      $mo_ta_ngan = $_POST['mo_ta_ngan'] ?? '';
      $trang_thai = $_POST['trang_thai'] ?? '';
      $gia_ban = $_POST['gia_ban'] ?? '';
      $gia_nhap = $_POST['gia_nhap'] ?? '';
      $gia_khuyen_mai = $_POST['gia_khuyen_mai'] ?? '';
      $so_luong = $_POST['so_luong'] ?? '';
      $ngay_nhap = $_POST['ngay_nhap'] ?? '';
      $danh_muc_id = $_POST['danh_muc_id'] ?? '';



      $hinh_anh = $_FILES['hinh_anh'] ?? null;




      $errors = [];
      if (empty($ten_san_pham)) {
        $errors['ten_san_pham'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($mo_ta_dai)) {
        $errors['mo_ta_dai'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($mo_ta_ngan)) {
        $errors['mo_ta_ngan'] = 'Tên sản phẩm không được để trống';
      }
      if (empty($trang_thai)) {
        $errors['trang_thai'] = 'trang thái phải chọn';
      }
      if (empty($gia_ban)) {
        $errors['gia_ban'] = 'Tên sản phẩm không được để trống';
      }

      if (empty($gia_nhap)) {
        $errors['gia_nhap'] = 'giá sản phẩm không được để trống';
      }
      if (empty($gia_khuyen_mai)) {
        $errors['gia_khuyen_mai'] = 'giá khuyến mãi không được để trống';
      }
      if (empty($so_luong)) {
        $errors['so_luong'] = 'số lượng không được để trống';
      }
      if (empty($ngay_nhap)) {
        $errors['ngay_nhap'] = 'ngày nhập không được để trống';
      }
      if (empty($danh_muc_id)) {
        $errors['danh_muc_id'] = 'danh mục phải chọn';
      }

      if ($hinh_anh['error'] !== 0) {
        $errors['hinh_anh'] = 'phải chọn ảnh sản ohaamr';
      }

      $_SESSION['error'] = $errors;
      // var_dump($errors);die();


      //logic sửa ảnh
      if (isset($hinh_anh) && $hinh_anh['error'] == UPLOAD_ERR_OK) {
        //upload ảnh mới lên
        $new_file = uploadFile($hinh_anh, './uploads/');
        if (!empty($old_file)) { //nếu có ảnh cũ thì xóa đi
          deleteFile($old_file);
        }
      } else {
        $new_file = $old_file;
      }

      if (empty($errors)) {
        // var_dump('ac');die;
        //nếu k có lỗi tiến hành tên sản phẩm
        $this->modelSanPham->updateSanPham(
          $san_pham_id,
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

          $new_file
        );
        // var_dump($status);die();                                 
        header("Location:  ?act=san-phams");
        exit();
      } else {
        //trả lỗi

        //đặt chỉ thị xóa session sau khi hiển thị form
        $_SESSION['flash'] = true;
        header("Location:  ?act=form-sua-san-pham&id_san_pham=". $san_pham_id);
        exit();
      }
    }
  }
  public function postEditAnhSanPham() {

  }
  public function deleteSanPham()
  {
    $id = $_GET['id_san_pham'];
    $sanPham = $this->modelSanPham->getDetailSanPham($id);

    if ($sanPham) {
      deleteFile($sanPham['hinh_anh']);
      $this->modelSanPham->destroySanPham($id);
    }

    header("Location: " . BASE_URL_ADMIN . '?act=san-phams');
    exit();
  }
}
