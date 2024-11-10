<?php


class BannerController
{
  //kết nối đến file model
  public $modelBanner;
  public function __construct()
  {
    $this->modelBanner = new Banner();
  }
  //hàm hiển thị danh sách
  public function index()
  {
    // require_once "./views/dashboard.php";
    // echo "hello";
    //lấy ra dữ liệu danh mục banner
    $banNers = $this->modelBanner->getAll();
    // var_dump($banNers);
    //đưa dữ liệu ra views
    require_once './views/banner/list_banner.php';
  }
  //hàm hiển thị form thêm
  public function create()
  {
    require_once './views/banner/create_banner.php';
  }
  //hàm xử lý thêm vào csdl
  public function store()
  {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      //lấy ra dữ liệu
      $ten_danh_muc_banner = $_POST['ten_danh_muc_banner'];


      $ngay_tao = $_POST['ngay_tao'];
      $trang_thai = $_POST['trang_thai'];

      $link_hinh_anh = $_FILES['link_hinh_anh'];

      //lưu hình ảnh

      // var_dump($link_hinh_anh);die();



      $errors = [];
      if (empty($ten_danh_muc_banner)) {
        $errors['ten_danh_muc_banner'] = 'Tên sản phẩm không được để trống';
      }

      if (empty($ngay_tao)) {
        $errors['ngay_tao'] = 'giá khuyến mãi không được để trống';
      }
      if (empty($trang_thai)) {
        $errors['trang_thai'] = 'trang thái phải chọn';
      }


      $_SESSION['errors'] = $errors;

      if (empty($errors)) {
        // var_dump('ac');die;
        //nếu k có lỗi tiến hành thên banner vào csdl
        $this->modelBanner->postData($ten_danh_muc_banner, $ngay_tao, $trang_thai, uploadFile($link_hinh_anh, './uploads/'));

        // var_dump($san_pham_id);die();
        unset($_SESSION['errors']);
        //  echo"theem thanh cong";                        
        header("Location: ?act=banners");
        exit();
      } else {
        //trả lỗi

        //đặt chỉ thị xóa session sau khi hiển thị form
        $_SESSION['errors'] = $errors;
        header("Location: ?act=form-them-banner");
        exit();
      }
    }
  }
  //hàm xử lý form sửa
  public function edit()
  {
    //lấy id
    $id = $_GET['id_danh_muc_banner'];
    // var_dump($id);die();
    // lấy thông tin chi tiết của danh mục
    $banNerw = $this->modelBanner->DetailUpdate($id);
    require_once './views/banner/update_banner.php';
    // var_dump($banNerw);
  }
  //hàm xử lý cập nhật vào csdl
  public function update()
  {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $id = $_POST['id'];

      $banNerOld = $this->modelBanner->getDetailBanNer($id);
      $old_file = $banNerOld['link_hinh_anh']; //lấy ảnh cũ để phục vụ sửa ảnh

      $ten_danh_muc_banner = $_POST['ten_danh_muc_banner'];
      $link_hinh_anh = $_FILES['link_hinh_anh'];

      $ngay_tao = $_POST['ngay_tao'];
      $trang_thai = $_POST['trang_thai'];


      // var_dump($trang_thai);die();


      //Validate

      $errors = [];
      if (empty($ten_danh_muc_banner)) {
        $errors['ten_danh_muc_banner'] = 'Tên sản phẩm không được để trống';
      }

      if (empty($ngay_tao)) {
        $errors['ngay_tao'] = 'ngày tạo không được để trống';
      }
      if (empty($trang_thai)) {
        $errors['trang_thai'] = 'trang thái phải chọn';
      }


      if ($link_hinh_anh['error'] !== 0) {
        $errors['link_hinh_anh'] = 'phải chọn ảnh sản phẩm';
      }

      $_SESSION['error'] = $errors;
      //logic sửa ảnh
      if (isset($link_hinh_anh) && $link_hinh_anh['error'] == UPLOAD_ERR_OK) {
        //upload ảnh mới lên
        $new_file = uploadFile($link_hinh_anh, './uploads/');
        if (!empty($old_file)) { //nếu có ảnh cũ thì xóa đi
          deleteFile($old_file);
        }
      } else {
        $new_file = $old_file;
      }


      if (empty($errors)) {
        $this->modelBanner->UpdateCate($id, $ten_danh_muc_banner, $link_hinh_anh, $ngay_tao,  $trang_thai, $new_file);
        unset($_SESSION['error']);
        header('Location: ?act=banners');
        exit();
      } else {
        $_SESSION['error'] = $errors;
        // $_SESSION['flash'] = true;
        header('Location: ?act=form-sua-banner&id_danh_muc_banner=' . $id); // Sửa lại khoảng trắng
        exit();
      }
    }
  }
  //hàm xóa dữ liệu trong csdl
  public function destroy()
  {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $id = $_POST['id_danh_muc_banner'];
      // var_dump($id);

      $this->modelBanner->deleteData($id);
      header('Location: ?act=banners'); // Sửa lại khoảng trắng
      exit();
    }
  }
}
