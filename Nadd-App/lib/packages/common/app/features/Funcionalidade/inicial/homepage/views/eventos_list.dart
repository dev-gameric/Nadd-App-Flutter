import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class EventosList extends StatefulWidget {
  const EventosList({super.key});

  @override
  State<EventosList> createState() => _EventosState();
}

class _EventosState extends State<EventosList> {
  final List<String> imagensEventos = [
    'images/eventos/1.jpg',
    'images/eventos/2.jpg',
    'images/eventos/3.jpg',
    'images/eventos/4.jpg',
  ];

  final List<String> nomesEventos = [
    'evento 1',
    'evento 2',
    'evento 3',
    'evento 4',
  ];

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      corFundo: amarelo.withOpacity(0.8),
      corTopBar: azulLogo,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: largura * 0.89,
                height: altura * 0.43,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    border: Border.all(width: 2, color: azul),
                    image: const DecorationImage(
                        image: AssetImage('images/eventos/1.jpg'))),
              ),
              Container(
                width: largura * 0.89,
                decoration: BoxDecoration(
                    color: azulLogo.withOpacity(0.8),
                    border: Border.all(color: azul, width: 2),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Texto.cabecalho('Nome Evento', corTexto: preto, peso: 9),
                    Texto.simples('Descrição Evento', corTexto: preto, peso: 9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
