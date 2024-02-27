import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/perfil_page.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/barra.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/listar_atendimentos.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/listar_projetos.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/home_page.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class Navegacao extends StatefulWidget {
  const Navegacao({super.key});

  @override
  State<Navegacao> createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  List<Widget> paginas = [
    const HomePage(),
    const ListarProjetos(),
    const ListarAtendimentos(),
    const PerfilPage(),
  ];
  late PageController pageController;
  Rx<int> index = 0.obs;

  @override
  void initState() {
    pageController = PageController(initialPage: index.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      corTopBar: azulLogo,
      bottom: Barra(
        pageController: pageController,
        index: index,
      ),
      child: PageView(
        controller: pageController,
        children: paginas,
        onPageChanged: (indexPagina) {
          index.value = indexPagina;
        },
      ),
    );
  }
}
