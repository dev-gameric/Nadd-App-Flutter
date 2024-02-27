import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class InformacoesApiMap extends StatelessWidget {
  final Map<String, dynamic>? informacoesDadosApi;

  const InformacoesApiMap({super.key, required this.informacoesDadosApi});

  @override
  Widget build(BuildContext context) {
    return informacoesDadosApi != null
        ? SizedBox(
            height: altura,
            child: ListView.builder(
              itemCount: informacoesDadosApi!.length,
              itemBuilder: (BuildContext context, index) {
                final chave = informacoesDadosApi!.keys.elementAt(index);
                final valor = informacoesDadosApi![chave];

                return valor.toString().isNotEmpty
                    ? ListTile(
                        title:
                            Texto.simples(chave.toString(), corTexto: amarelo),
                        subtitle:
                            Texto.simples(valor.toString(), corTexto: azulLogo),
                      )
                    : const SizedBox();
              },
            ),
          )
        : const SizedBox();
  }
}
