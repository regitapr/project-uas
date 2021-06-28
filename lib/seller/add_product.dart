import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoku/seller/first_screen.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerQty = TextEditingController();
  TextEditingController controllerCatatan = TextEditingController();

  void addData() {
    var url = "http://127.0.0.1/tokoku/api/addBarang.php";
    http.post(url, body: {
      "nama": controllerNama.text,
      "harga": controllerHarga.text,
      "qty": controllerQty.text,
      "catatanPenjual": controllerCatatan.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controllerNama,
              decoration: InputDecoration(
                  hintText: "Masukkan nama produk", labelText: "Nama Produk"),
            ),
            TextField(
              controller: controllerHarga,
              decoration: InputDecoration(
                  hintText: "Masukkan harga produk", labelText: "Harga Produk"),
            ),
            TextField(
              controller: controllerQty,
              decoration: InputDecoration(
                  hintText: "Masukkan jumlah stok",
                  labelText: "Stok Produk"),
            ),
            TextField(
              controller: controllerCatatan,
              decoration: InputDecoration(
                  hintText: "Masukkan catatan penjual",
                  labelText: "Catatan Penjual"),
            ),
            Padding(padding: const EdgeInsets.all(10)),
            RaisedButton(
                child: Text(
                  "Tambahkan",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  addData();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FirstScreen()));
                })
          ],
        ),
      ),
    );
  }
}
