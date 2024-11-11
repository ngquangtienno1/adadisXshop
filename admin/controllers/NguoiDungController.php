<?php

class NguoiDungController
{
    //Kết nối file moddel
    public $modelNguoiDung;

    public function __construct()
    {
        $this->modelNguoiDung = new NguoiDung();
    }
    //Hiển thị danh sách liên hệ 
    public function index()
    {
        //Lấy ra dữ liệu liên hệ
        $danhSachNguoiDung = $this->modelNguoiDung->getAllNguoiDung();
        // var_dump($NguoiDung);

        //Đưa dữ liệu ra view
        require_once './views/nguoidung/listnguoidung.php';
    }

    //Hàm hiển thị form thêm
    public function create()
    {
        require_once './views/nguoidung/create_nguoi_dung.php';
    }

    //Hàm xử lý thêm vào csdl
    public function store()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // lấy ra dữ liệu
            $ten_nguoi_dung = $_POST['ten_nguoi_dung'];
            $email = $_POST['email'];
            $sdt = $_POST['sdt'];
            $dia_chi = $_POST['dia_chi'];
            $mat_khau = $_POST['mat_khau'];
            $ngay_sinh = $_POST['ngay_sinh'];
            $gioi_tinh = $_POST['gioi_tinh'];
            $vai_tro = $_POST['vai_tro'];
            $ngay_tao = $_POST['ngay_tao'];
            $ngay_cap_nhat = $_POST['ngay_cap_nhat'];
            $trang_thai = $_POST['trang_thai'];

            $avatar = $_FILES['avatar'] ;

            //lưu hình ảnh

            // var_dump($_FILES);die();  


            // validate
            $errors = [];

            if (empty($ten_nguoi_dung)) {
                $errors['ten_nguoi_dung'] = 'Bạn phải nhập tên nguời dùng';
            }
            if (empty($email)) {
                $errors['email'] = 'Bạn phải nhập email';
            }
            if (empty($sdt)) {
                $errors['sdt'] = 'Bạn phải nhập số điện thoại';
            }
            if (empty($dia_chi)) {
                $errors['dia_chi'] = 'Bạn phải nhập địa chỉ';
            }
            if (empty($mat_khau)) {
                $errors['mat_khau'] = 'Bạn phải nhập mật khẩu';
            }
            if (empty($ngay_sinh)) {
                $errors['ngay_sinh'] = 'Bạn phải nhập ngày sinh';
            }
            // if (empty($avatar)) {
            //     $errors['avatar'] = 'Bạn phải chọn ảnh đại diện';
            // }
            if (empty($vai_tro)) {
                $errors['vai_tro'] = 'Vui lòng chọn vai trò người dùng';
            }
            if (empty($ngay_tao)) {
                $errors['ngay_tao'] = 'Bạn phải nhập ngày tạo nguời dùng';
            }
            if (empty($ngay_cap_nhat)) {
                $errors['ngay_cap_nhat'] = 'Bạn phải nhập ngày cập nhật nguời dùng';
            }
            if (empty($trang_thai)) {
                $errors['trang_thai'] = 'Bạn phải chọn trạng thái';
            }


            if (empty($errors)) {
                # nếu không có lỗi thì thêm dữ liệu
                $this->modelNguoiDung->postData($ten_nguoi_dung, $email, $sdt, $dia_chi, $mat_khau, $ngay_sinh, $gioi_tinh, $vai_tro, $ngay_tao, $ngay_cap_nhat, $trang_thai, uploadFile($avatar, './uploads'));
                unset($_SESSION['errors']);
                // echo"thêm thành công";
                header('Location: ?act=nguoi-dung');
                exit();
            } else {
                $_SESSION['errors'] = $errors;
                header('Location: ?act=form-add-nguoi-dung');
                exit();
            }
        }
    }

    //Hàm hiển thị form sửa
    public function edit()
    {
        //lấy id
        $id = $_GET['nguoi_dung_id'];
        // lấy thông tin chi tiết của danh mục
        $nguoiDung = $this->modelNguoiDung->getDeltailData($id);
        require_once './views/nguoidung/edit_nguoi_dung.php';
        // var_dump($NguoiDung);die();



    }

    //Hàm xử lý cập nhật dữ liệu vào csdl
    public function update()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // lấy ra dữ liệu
            $id = $_POST['id'];
            $ten_nguoi_dung = $_POST['ten_nguoi_dung'];
            $email = $_POST['email'];
            $sdt = $_POST['sdt'];
            $dia_chi = $_POST['dia_chi'];
            $mat_khau = $_POST['mat_khau'];
            $ngay_sinh = $_POST['ngay_sinh'];
            $gioi_tinh = $_POST['gioi_tinh'];
            $vai_tro = $_POST['vai_tro'];
            $ngay_tao = $_POST['ngay_tao'];
            $ngay_cap_nhat = $_POST['ngay_cap_nhat'];
            $trang_thai = $_POST['trang_thai'];
            $old_file = $_POST['old_file'] ?? null;

            $avatar = $_FILES['avatar'] ;

            // var_dump($_POST);die();
            //3 trường hợp
            //-Lớp chưa có ảnh
            //-Lớp có ảnh và sẽ sửa ảnh
            //-Lớp có ảnh và k sửa ảnh

            if(isset($avatar) && $avatar['error'] == UPLOAD_ERR_OK){//trường hợp upload ảnh mới
                //nếu có ảnh cũ thì sẽ xóa ảnh cũ trước
                if(!empty($old_file)){
                    deleteFile($old_file);
                }
                //sau khi xóa xong sẽ thêm file mới vào
                $file_update = uploadFile($avatar, './uploads/');
            }else{//trường hợp upload ảnh mới
                $file_update = $old_file;
            }

            // var_dump($email)

            // validate
            $errors = [];

            if (empty($ten_nguoi_dung)) {
                $errors['ten_nguoi_dung'] = 'Bạn phải nhập tên nguời dùng';
            }
            if (empty($email)) {
                $errors['email'] = 'Bạn phải nhập email';
            }
            if (empty($sdt)) {
                $errors['sdt'] = 'Bạn phải nhập số điện thoại';
            }
            if (empty($dia_chi)) {
                $errors['dia_chi'] = 'Bạn phải nhập địa chỉ';
            }
            if (empty($mat_khau)) {
                $errors['mat_khau'] = 'Bạn phải nhập mật khẩu';
            }
            if (empty($ngay_sinh)) {
                $errors['ngay_sinh'] = 'Bạn phải nhập ngày sinh';
            }
            // if (empty($avatar)) {
            //     $errors['avatar'] = 'Bạn phải chọn ảnh đại diện';
            // }
            if (empty($vai_tro)) {
                $errors['vai_tro'] = 'Vui lòng chọn vai trò người dùng';
            }
            if (empty($ngay_tao)) {
                $errors['ngay_tao'] = 'Bạn phải nhập ngày tạo nguời dùng';
            }
            if (empty($ngay_cap_nhat)) {
                $errors['ngay_cap_nhat'] = 'Bạn phải nhập ngày cập nhật nguời dùng';
            }
            if (empty($trang_thai)) {
                $errors['trang_thai'] = 'Bạn phải chọn trạng thái';
            }


            if (empty($errors)) {
                # nếu không có lỗi thì thêm dữ liệu
                $this->modelNguoiDung->updateData($id,$ten_nguoi_dung, $email, $sdt, $dia_chi, $mat_khau, $ngay_sinh, $gioi_tinh, $vai_tro, $ngay_tao, $ngay_cap_nhat, $trang_thai, $file_update);
                unset($_SESSION['errors']);
                // echo'theem thanh cong';
                header('Location: ?act=nguoi-dung');
                exit();
            } else {
                $_SESSION['errors'] = $errors;
                header('Location: ?act=form-update-nguoi-dung');
                exit();
            }
        }
    }

    //Hàm xử lý xóa dữ liệu vào csdl
    public function destroy()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $id = $_POST['nguoi_dung_id'];

            //xóa danh mục
            $this->modelNguoiDung->deleteData($id);
            header('Location: ?act=nguoi-dung');
            exit();
        }
    }
}
