import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class InformacoesApiList extends StatelessWidget {
  final Map<String, dynamic>? informacoesDadosApi;

  const InformacoesApiList({super.key, required this.informacoesDadosApi});

  @override
  Widget build(BuildContext context) {
    return informacoesDadosApi != null
        ? SizedBox(
            height: altura,
            child: Padding(
              //espaçamento da borda preta
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                child: ListView.builder(
                  itemCount: informacoesDadosApi!.length,
                  itemBuilder: (BuildContext context, index) {
                    final chave = informacoesDadosApi!.keys.elementAt(index);
                    final valor = informacoesDadosApi![chave];

                    return valor.toString().isNotEmpty
                        ? Column(
                            children: [
                              Padding(
                                //espaçamento do caixote cinza
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: InkWell(
                                    onTap: () {
                                      _mostrarDialog(context, chave, valor);
                                    },
                                    child: Row(
                                      children: [
                                        ListTile(
                                          title: Texto.simples(
                                            chave.toString().toUpperCase(),
                                            corTexto: verde,
                                          ),
                                          subtitle: Texto.simples(
                                            valor.toString().toLowerCase(),
                                            corTexto: azulLogo,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(),
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  void _mostrarDialog(BuildContext context, String chave, dynamic valor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            chave.toString().toUpperCase(),
          ),
          content: Text(valor.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Voltar'),
            ),
          ],
        );
      },
    );
  }
}
