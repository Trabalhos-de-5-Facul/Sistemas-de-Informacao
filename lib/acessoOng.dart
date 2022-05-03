// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AcessoONG extends StatefulWidget {
  const AcessoONG({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

Future<Map> getOng() async {
  var url = Uri.parse("http://192.168.15.45:3000/ongs");
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
}

Future printOng() async {
  final json = await getOng();
  print(json);
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
