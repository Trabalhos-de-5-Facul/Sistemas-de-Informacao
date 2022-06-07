// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalhesProduto.dart';
import 'package:http/http.dart' as http;
import 'acessoProdutos.dart';
import 'cadastroRemessa.dart';
import 'gerarRomaneio.dart';
import 'ip.dart';

class GerarRomaneioFinal extends StatefulWidget {
  final registroRomaneio romaneio;
  const GerarRomaneioFinal({required this.romaneio});

  @override
  State<StatefulWidget> createState() => InitState();
}

class RomaneioFinal {
  late registroRomaneio romaneio;
  List<registroRemessa> remessas = [];
}

RomaneioFinal romaneiofinal = RomaneioFinal();
postRomaneio() async {
  try {
    await http.post(urlRomaneios, body: {
      "numero": romaneiofinal.romaneio.getNumeroRomaneio().toString(),
      "cpf": romaneiofinal.romaneio.getCpfMotorista().toString(),
      "cod_ong": romaneiofinal.romaneio.getCodigoOng().toString()
    });
  } catch (e) {
    print(e);
    return e;
  }
  try {
    for (var r in romaneiofinal.remessas) {
      await http.post(urlRemessas, body: {
        "data_validade": r.data.toString(),
        "qtd": r.quantidade.toString(),
        "cod_produto": r.codProduto.toString(),
        "numero_romaneio": romaneiofinal.romaneio.getNumeroRomaneio().toString()
      });
    }
  } catch (e) {
    print(e);
    return e;
  }
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
    Future<void> _goToRemessa(BuildContext context, var codproduto) async {
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (result) => cadastroRemessa(
                    codProduto: codproduto,
                  )));
      setState(() {
        romaneiofinal.remessas.add(result);
      });
    }

    getProduto();
    romaneiofinal.romaneio = widget.romaneio;

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
              return Center(
                  child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, index) => InkWell(
                        child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(snapshot.data![index].nome),
                            subtitle:
                                Text("${snapshot.data![index].codProduto}"),
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
                            onPressed: () => _goToRemessa(
                                context, snapshot.data![index].codProduto),
                            child: const Text("+"))
                      ],
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    postRomaneio();
                    Navigator.popUntil(
                        context, ModalRoute.withName("/Hub Admin"));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.35,
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                    ),
                    child: const Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ]));
            }));
  }
}
