import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokoku/seller/add_product.dart';
import 'package:tokoku/seller/detail_produk.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Future<List> getDataBelanja() async {
    final response =
        await http.get("http://127.0.0.1/tokoku/api/showBelanja.php");
    return jsonDecode(response.body);
  }

  Future<List> getDataBarang() async {
    final response =
        await http.get("http://127.0.0.1/tokoku/api/showBarang.php");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Panel Admin'),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "Data Pembelian",
                ),
                Tab(
                  icon: Icon(Icons.desktop_windows),
                  text: "Data Barang",
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddProduct(),
                  ))),
          body: TabBarView(
            children: <Widget>[
              Scaffold(
                body: FutureBuilder<List>(
                  future: getDataBelanja(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? BeliList(
                            b_list: snapshot.data,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              Scaffold(
                body: FutureBuilder<List>(
                  future: getDataBarang(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? BarangList(
                            s_list: snapshot.data,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BeliList extends StatelessWidget {
  final List b_list;
  BeliList({this.b_list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: b_list == null ? 0 : b_list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: ListTile(
              title: Text(b_list[i]['pembeli']),
              subtitle: Text(
                  "Id Barang: B_${b_list[i]['idBarang']}\n${b_list[i]['qty']} pcs"),
            ),
          ),
        );
      },
    );
  }
}

class BarangList extends StatelessWidget {
  final List s_list;
  BarangList({this.s_list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: s_list == null ? 0 : s_list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        list: s_list,
                        index: i,
                      )),
            ),
            child: Card(
              child: ListTile(
                title: Text(s_list[i]['nama']),
                subtitle: Text("Rp.${s_list[i]['harga']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
