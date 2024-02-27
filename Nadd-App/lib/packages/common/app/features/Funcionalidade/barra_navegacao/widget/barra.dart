import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class Barra extends StatelessWidget {
  final Rx<int> index;
  final PageController pageController;

  const Barra({super.key, required this.index, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        item(icone: Icons.home, nome: 'Home', indexItem: 0),
        item(icone: Icons.pageview, nome: 'Projetos', indexItem: 1),
        item(icone: Icons.person, nome: 'Atendimentos', indexItem: 2),
        item(icone: Icons.person, nome: 'Perfil', indexItem: 3),
      ],
    );
  }

  // widget para fazer a animação e controle do icones e transição de página
  Widget item(
      {required IconData icone, required String nome, required int indexItem}) {
    return Obx(() => InkWell(
          onTap: () {
            //controle de página, tempo e transição.
            index.value = indexItem;
            pageController.animateToPage(index.value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut);
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            //alterar a cor do ícone em relação ao index da tela.
            Icon(icone, color: index.value == indexItem ? preto : azulLogo),
            //altera o nome relacionado ao ícone em relação ao index da tela.
            index.value == indexItem
                ? Texto.simples(
                    nome,
                    peso: 9,
                    corTexto: preto,
                  )
                : Texto.simples(nome, peso: 9, corTexto: azulLogo),
          ]),
        ));
  }
}
