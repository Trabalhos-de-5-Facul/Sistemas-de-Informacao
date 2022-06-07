// ignore_for_file: file_names, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detalhesMotorista.dart';
import 'ip.dart';

Motorista funcFromJson(String str) => Motorista.fromJson(json.decode(str));

String funcToJson(Motorista data) => json.encode(data.toJson());

class Motorista {
  Motorista({
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.telefone,
    required this.endereco,
  });
  late String nome;
  late int? codOng;
  late String rg;
  late int? cpf;
  late String telefone;
  late String endereco;

  factory Motorista.fromJson(Map<String, dynamic> json) => Motorista(
        nome: json["Nome"],
        rg: json["RG"],
        cpf: json["CPF_FUNCIONARIO"],
        telefone: json["Telefone"],
        endereco: json["Endereco"],
      );

  Map<String, dynamic> toJson() => {
        "Nome": nome,
        "RG": rg,
        "CPF_FUNCIONARIO": cpf,
        "Telefone": telefone,
        "Endereco": endereco,
      };
}

int? um = 1;

class AcessoMotorista extends StatefulWidget {
  const AcessoMotorista();

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<AcessoMotorista> {
  late List<Motorista> motoristaList = [];
  Future<List<Motorista>> getMotorista(widget) async {
    var response = await http.get(urlMotoristas);
    if (response.statusCode == 404) {
      motoristaList = [];
      return motoristaList;
    }
    var json = jsonDecode(response.body);
    motoristaList =
        (json["motoristas"] as List).map((i) => Motorista.fromJson(i)).toList();
    return motoristaList;
  }

  @override
  Widget build(BuildContext context) {
    getMotorista(widget);
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: FutureBuilder(
            future: getMotorista(widget),
            builder: (context, AsyncSnapshot<List<Motorista>> snapshot) {
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
                          subtitle: Text("${snapshot.data![index].cpf}"),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MyDetailsMotorista(
                                            motorista: snapshot.data![index])))
                                .then((_) => setState(() {}));
                          },
                        ),
                      ));
            }));
  }
}
