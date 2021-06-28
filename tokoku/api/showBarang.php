<?php 
    include '../config/conn.php';

    $response = array();

    $sql = mysqli_query($connect, "SELECT * FROM tb_list_barang");

    while ($a = mysqli_fetch_array($sql)) {
         $b['id']               = $a['id'];
         $b['nama']             = $a['nama'];
         $b['harga']            = $a['harga'];
         $b['qty']              = $a['qty'];
         $b['catatanPenjual']   = $a['catatanPenjual'];
    array_push($response, $b);
    }

    
    echo json_encode($response);