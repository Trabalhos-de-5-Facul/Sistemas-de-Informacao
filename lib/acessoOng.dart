// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';
import 'DetalhesONG.dart';

Ong ongFromJson(String str) => Ong.fromJson(json.decode(str));

String ongToJson(Ong data) => json.encode(data.toJson());

class Ong {
  Ong({
    required this.nome,
    required this.codOng,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.nomeDiretora,
  });
  late String nome;
  late int? codOng;
  late String rua;
  late int? numero;
  late String bairro;
  late String cidade;
  late String estado;
  late String cep;
  late String nomeDiretora;

  factory Ong.fromJson(Map<String, dynamic> json) => Ong(
        nome: json["Nome"],
        codOng: json["COD_ONG"],
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
        "COD_ONG": codOng,
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

class InitState extends State<AcessoONG> {
  late List<Ong> ONGList = [];
  Future<List<Ong>> getOng() async {
    var response = await http.get(urlOngs);

    var json = jsonDecode(response.body);
    ONGList = (json["ongs"] as List).map((i) => Ong.fromJson(i)).toList();
    return ONGList;
  }

  @override
  Widget build(BuildContext context) {
    getOng();
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: FutureBuilder(
            future: getOng(),
            builder: (context, AsyncSnapshot<List<Ong>> snapshot) {
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
                          subtitle: Text("${snapshot.data![index].codOng}"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MyDetails(
                                          ongs: snapshot.data![index],
                                        )));
                          },
                        ),
                      ));
            }));
  }
}
