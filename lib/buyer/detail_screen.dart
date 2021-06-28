import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void buyProduct() {
    var url = "http://127.0.0.1/tokoku/api/addBelanja.php";
    http.post(url, body: {
      "pembeli": "regita@undiksha.ac.id",
      "idBarang": "${widget.list[widget.index]['id']}",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DETAIL PRODUK")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${widget.list[widget.index]['nama']}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                  ),
                  Text(
                    "Harga : Rp.${widget.list[widget.index]['harga']}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                  ),
                  Text(
                    "Stok :${widget.list[widget.index]['qty']}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                  ),
                  Text(
                    "Keterangan: \n${widget.list[widget.index]['catatanPenjual']}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                      ),
                      RaisedButton(
                          child: Container(
                            width: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "PESAN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.blue[600],
                          onPressed: () {
                            buyProduct();
                            Navigator.pop(context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
