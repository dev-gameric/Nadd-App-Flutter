import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';

class CabecalhoHomePage extends StatelessWidget {
  const CabecalhoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura * 0.2,
      width: largura,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/cabecalho.jpg'))),
      child: Container(
        color: preto.withOpacity(0.7),
        child: Center(
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                border: Border.all(width: 3, color: azulLogo),
                image: const DecorationImage(
                    image: AssetImage('images/logo.jpg'))),
          ),
        ),
      ),
    );
  }
}
