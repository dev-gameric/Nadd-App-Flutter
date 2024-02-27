import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/widgets/atalho.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/widgets/cabecalho_home_page.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/widgets/eventos.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NovaTela(
        appBar: AppBar(
          title: Texto.cabecalho('Nadd', tamanho: 22),
          foregroundColor: amarelo,
          backgroundColor: azulLogo,
        ),
        corFundo: amarelo.withOpacity(0.9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CabecalhoHomePage(),
              Eventos(),
              const AtalhosHome(),
            ],
          ),
        ));
  }
}
