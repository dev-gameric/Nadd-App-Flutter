// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../cores/cores.dart';
import '../texto/textos.dart';

class NovaTela extends StatelessWidget {
  Widget? child;
  Widget? drawer;
  Widget? bottom;
  Color? corFundo;
  Color? corTopBar;
  PreferredSizeWidget? appBar;

  NovaTela({
    Key? key,
    this.child,
    this.drawer,
    this.bottom,
    this.corFundo,
    this.appBar,
    this.corTopBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corTopBar,
      appBar: appBar,
      bottomSheet: bottom,
      body: SafeArea(
          child: Scaffold(
        drawer: drawer,
        //appBar: appBar,
        backgroundColor: corFundo ?? branco,
        body: child ??= Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Texto.cabecalho('Em breve...', corTexto: preto),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Texto.paraLink('Voltar', tamanho: 25),
              )
            ],
          ),
        ),
      )),
    );
  }
}
