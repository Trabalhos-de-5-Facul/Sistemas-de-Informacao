// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AcessoProdutos extends StatefulWidget {
  const AcessoProdutos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<AcessoProdutos> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
    );
  }
}
