import 'package:flutter/material.dart';

class DetalhesEvento extends StatelessWidget {
  final String imagem;
  final String nome;

  const DetalhesEvento({super.key, required this.imagem, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Evento'),
      ),
      body: Column(
        children: [
          Image.asset(imagem),
          const SizedBox(height: 20),
          Text(nome,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // Adicione mais detalhes do evento conforme necessário
        ],
      ),
    );
  }
}
