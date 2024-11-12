<?php 

class DonHangController {
    

    //connect models

    public $modelDonHang;

    public function __construct()
    {
        $this->modelDonHang = new DonHang();
    }

    // List don hang 


    public function listDonHang(){
        $donHang = $this->modelDonHang->getAll();

        require_once './views/DonHang/listDonHang.php';
    }
}


?>