// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalhesProduto.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';

Produto produtoFromJson(String str) => Produto.fromJson(json.decode(str));

String produtoToJson(Produto data) => json.encode(data.toJson());

class Produto {
  Produto({
    required this.codProduto,
    required this.nome,
    required this.fornecedor,
    required this.lote,
    required this.perecivel,
  });

  late int? codProduto;
  late String nome;
  late String fornecedor;
  late String lote;
  late bool perecivel;
  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        codProduto: json["COD_PRODUTO"],
        nome: json["Nome"],
        fornecedor: json["Fornecedor"],
        lote: json["Lote"],
        perecivel: json["Perecivel"]["data"][0] == 1,
      );
  Map<String, dynamic> toJson() => {
        "COD_PRODUTO": codProduto,
        "Nome": nome,
        "Fornecedor": fornecedor,
        "Lote": lote,
        "Perecivel": perecivel,
      };
}

class AcessoProdutos extends StatefulWidget {
  const AcessoProdutos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<AcessoProdutos> {
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
                      ));
            }));
  }
}
