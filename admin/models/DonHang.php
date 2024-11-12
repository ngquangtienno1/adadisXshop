<?php 

class DonHang{

    public $conn;


    // Connect database 

    public function __construct()
    {
        $this->conn= connectDB();
    }

    public function getAll(){
        try{
            $sql = "SELECT don_hangs.*, trang_thai_don_hangs.trang_thai 
            FROM don_hangs 
            JOIN trang_thai_don_hangs ON don_hangs.trang_thai_don_hang = trang_thai_don_hangs.id";
            $stmt = $this->conn->prepare($sql);

            $stmt->execute();

            return $stmt->fetchAll();

        }
        catch(PDOException $e){
            echo "Error".$e->getMessage();
        }
    }




}


?>