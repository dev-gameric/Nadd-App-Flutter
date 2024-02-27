import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class CabecalhoNadd extends StatelessWidget {
  final String titulo;
  const CabecalhoNadd({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: altura * 0.25,
          width: largura,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [amarelo, amarelo]),
          ),
          child: Center(
            child: Container(
              height: altura * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logoSemFundo.png'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Texto.titulo(titulo, corTexto: azulLogo, tamanho: 26),
        ),
      ],
    );
  }
}
