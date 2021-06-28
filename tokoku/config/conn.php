<?php 

$connect = new mysqli("localhost","root","","tokoku");

if ($connect) {
    // echo "Connection Success";
} else {
    echo "Connection Failed";
    exit();
}