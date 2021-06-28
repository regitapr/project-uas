import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuyScreen extends StatefulWidget {
  final List list;
  final int index;
  BuyScreen({this.index, this.list});

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  TextEditingController controllerIdBarang = TextEditingController();
  TextEditingController controllerQty = TextEditingController();

  void buyProduct() {
    var url = "http://127.0.0.1/tokoku/api/addBelanja.php";
    http.post(url, body: {
      "pembeli": "regita@undiksha.ac.id",
      "idBarang": controllerIdBarang.text,
      "qty": controllerQty.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemesanan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controllerIdBarang,
              decoration: InputDecoration(
                hintText: "Id barang yang dibeli",
                labelText: "Id barang",
              ),
            ),
            TextField(
              controller: controllerQty,
              decoration: InputDecoration(
                hintText: "Jumlah produk yang dibeli",
                labelText: "Jumlah",
              ),
            ),
            Padding(padding: const EdgeInsets.all(10)),
            RaisedButton(
                child: Text(
                  "PESAN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  buyProduct();
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
