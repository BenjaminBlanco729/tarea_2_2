import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: const Center(
        child: Text(
          'Bienvenido, has iniciado sesión correctamente',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}