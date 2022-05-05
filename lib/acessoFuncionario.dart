// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';
import 'DetalhesFuncionario.dart';
import 'CadastroFuncionario.dart';

Funcionario funcFromJson(String str) => Funcionario.fromJson(json.decode(str));

String funcToJson(Funcionario data) => json.encode(data.toJson());

class Funcionario {
  Funcionario({
    required this.nome,
    required this.codOng,
    required this.rg,
    required this.cpf,
    required this.telefone,
    required this.endereco,
  });
  late String nome;
  late int? codOng;
  late String rg;
  late int? cpf;
  late String telefone;
  late String endereco;

  factory Funcionario.fromJson(Map<String, dynamic> json) => Funcionario(
        nome: json["Nome"],
        codOng: json["fk_ONGs_COD_ONG"],
        rg: json["RG"],
        cpf: json["CPF_FUNCIONARIO"],
        telefone: json["Telefone"],
        endereco: json["Endereco"],
      );

  Map<String, dynamic> toJson() => {
        "Nome": nome,
        "fk_ONGs_COD_ONG": codOng,
        "RG": rg,
        "CPF_FUNCIONARIO": cpf,
        "Telefone": telefone,
        "Endereco": endereco,
      };
}

class AcessoFuncionario extends StatefulWidget {
  const AcessoFuncionario({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<AcessoFuncionario> {
  late List<Funcionario> funcionarioList = [];
  Future<List<Funcionario>> getOng() async {
    var response = await http.get(urlFuncionarios);

    var json = jsonDecode(response.body);
    print(json);
    funcionarioList = (json["funcionarios"] as List)
        .map((i) => Funcionario.fromJson(i))
        .toList();
    return funcionarioList;
  }

  @override
  Widget build(BuildContext context) {
    getOng();
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: FutureBuilder(
            future: getOng(),
            builder: (context, AsyncSnapshot<List<Funcionario>> snapshot) {
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
                                    builder: (_) => MyDetailsFunc(
                                          funcionarios: snapshot.data![index],
                                        )));
                          },
                        ),
                      ));
            }));
  }
}
