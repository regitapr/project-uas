<?php 
    include '../config/conn.php';

    $response = array();

    $sql = mysqli_query($connect, "SELECT * FROM tb_pembelian_barang");

    while ($a = mysqli_fetch_array($sql)) {
         $b['id']               = $a['id'];
         $b['pembeli']          = $a['pembeli'];
         $b['idBarang']         = $a['idBarang'];
         $b['qty']              = $a['qty'];
    array_push($response, $b);
    }

    echo json_encode($response);
    