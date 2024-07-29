import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
      ),
      body: Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text('Especialidades'),
          Text('Medicos'),
          Text('Realizacion de COnsultas'),
        ],),
      ),
    );
  }
}