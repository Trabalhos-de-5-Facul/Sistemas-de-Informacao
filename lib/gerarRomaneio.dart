// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GerarRomaneio extends StatefulWidget {
  const GerarRomaneio({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<GerarRomaneio> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
    );
  }
}
