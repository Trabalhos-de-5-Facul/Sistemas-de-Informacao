import 'package:flutter/material.dart';

//essa função é um placeholder
class HubAdmin extends StatelessWidget {
  const HubAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              //Coluna de botões que permitem adições ao BD
              children: [
                const SizedBox(
                  //gerando um padding
                  height: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.35, //35% do espaço horizontal
                  height: 100,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de ONGs
                          '/Cadastro');
                    },
                    child: const Text(
                      'Cadastrar ONG',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  //gerando um padding
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.35, //35% do espaço horizontal
                  height: 100,

                  child: ElevatedButton(
                    // Within the `FirstScreen` widget
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de Produtos
                          '/Cadastro Produto');
                    },
                    child: const Text(
                      'Cadastrar Produto',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  //gerando um padding
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.35, //35% do espaço horizontal
                  height: 100,

                  child: ElevatedButton(
                    // Within the `FirstScreen` widget
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de Motoristas
                          '/Cadastro Motorista');
                    },
                    child: const Text(
                      'Cadastrar Motorista',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              //Coluna de botões que permitem acessos ao BD (Páginas que vão permitir visualização, edição e deleção do BD)
              children: [
                const SizedBox(
                  //gerando um padding
                  height: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.35, //35% do espaço horizontal
                  height: 100,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de ONGs
                          '/Acesso ONGs');
                    },
                    child: const Text('Acessar ONG'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de ONGs
                          '/Acesso Produtos');
                    },
                    child: const Text('Acessar Produto'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, // vai para a tela de cadastro de ONGs
                          '/Gerar Romaneio');
                    },
                    child: const Text(
                      'Cadastrar Romaneio',
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
