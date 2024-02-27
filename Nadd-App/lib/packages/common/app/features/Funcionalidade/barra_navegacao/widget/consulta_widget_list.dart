import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class InformacoesApiList extends StatelessWidget {
  final List<Map<String, dynamic>>? informacoesDadosApi;

  const InformacoesApiList({super.key, required this.informacoesDadosApi});

  @override
  Widget build(BuildContext context) {
    return informacoesDadosApi != null
        ? SizedBox(
            height: altura,
            child: ListView.builder(
              itemCount: informacoesDadosApi!.length,
              itemBuilder: (BuildContext context, index) {
                final atendimento = informacoesDadosApi![index];

                return ListTile(
                  title: Texto.simples(
                    'ID: ${atendimento['id']}',
                    corTexto: amarelo,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texto.simples(
                        'Nome: ${atendimento['pessoa']['nome']}',
                        corTexto: azulLogo,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : const SizedBox();
  }
}
