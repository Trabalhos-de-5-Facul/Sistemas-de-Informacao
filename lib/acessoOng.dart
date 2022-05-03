// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Ong ongFromJson(String str) => Ong.fromJson(json.decode(str));

String ongToJson(Ong data) => json.encode(data.toJson());

class Ong {
  Ong({
    this.nome,
    this.codOng,
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.nomeDiretora,
  });

  String? nome;
  int? codOng;
  String? rua;
  int? numero;
  String? bairro;
  String? cidade;
  String? estado;
  String? cep;
  String? nomeDiretora;

  factory Ong.fromJson(Map<String, dynamic> json) => Ong(
        nome: json["Nome"],
        codOng: json["Cod_ONG"],
        rua: json["Rua"],
        numero: json["Numero"],
        bairro: json["Bairro"],
        cidade: json["Cidade"],
        estado: json["Estado"],
        cep: json["CEP"],
        nomeDiretora: json["Nome_Diretora"],
      );

  Map<String, dynamic> toJson() => {
        "Nome": nome,
        "Cod_ONG": codOng,
        "Rua": rua,
        "Numero": numero,
        "Bairro": bairro,
        "Cidade": cidade,
        "Estado": estado,
        "CEP": cep,
        "Nome_Diretora": nomeDiretora,
      };
}

class AcessoONG extends StatefulWidget {
  const AcessoONG({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

Future<Map> getOng() async {
  var url = Uri.parse("http://192.168.15.59:3000/ongs");
  var response = await http.get(url);

  var json = jsonDecode(response.body);
  return json;
}

Future printOng() async {
  final resposta = await getOng();
  List<Ong> ONGList =
      (resposta["ongs"] as List).map((i) => Ong.fromJson(i)).toList();
  print(ONGList[1].nome);
}

class InitState extends State<AcessoONG> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: SingleChildScrollView(
            child: GestureDetector(onTap: () => printOng())));
  }
}
