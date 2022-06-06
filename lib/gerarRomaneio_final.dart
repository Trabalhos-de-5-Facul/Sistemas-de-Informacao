// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalhesProduto.dart';
import 'package:http/http.dart' as http;
import 'acessoProdutos.dart';
import 'cadastroRemessa.dart';
import 'ip.dart';

class GerarRomaneioFinal extends StatefulWidget {
  const GerarRomaneioFinal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<GerarRomaneioFinal> {
  late List<Produto> produtoList = [];
  Future<List<Produto>> getProduto() async {
    var response = await http.get(urlProdutos);

    var json = jsonDecode(response.body);
    produtoList =
        (json["produtos"] as List).map((i) => Produto.fromJson(i)).toList();
    return produtoList;
  }

  @override
  Widget build(BuildContext context) {
    getProduto();
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: FutureBuilder(
            future: getProduto(),
            builder: (context, AsyncSnapshot<List<Produto>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, index) => InkWell(
                    child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(snapshot.data![index].nome),
                        subtitle: Text("${snapshot.data![index].codProduto}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MyDetailsProd(
                                      produto: snapshot.data![index])));
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => cadastroRemessa()))
                              .then((_) => setState(() {}));
                        },
                        child: Text("+"))
                  ],
                )),
              );
            }));
  }
}
