import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class RedesSociais extends StatelessWidget {
  const RedesSociais({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Texto.titulo('Ou faça login com: '),
        ),
        Container(
          width: largura * 0.35,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //logo google
              Container(
                height: altura * 0.15,
                width: largura * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('images/logos/google_logo.png'),
                  ),
                ),
              ),

              //logo facebook
              Container(
                height: altura * 0.15,
                width: largura * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage('images/logos/facebook_logo.png'))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
