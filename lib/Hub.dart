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
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context,
                '/Cadastro'); //Por algum motivo o back button não está aparecendo
          },
          child: const Text('Cadastrar ONG'),
        ),
      ),
    );
  }
}
