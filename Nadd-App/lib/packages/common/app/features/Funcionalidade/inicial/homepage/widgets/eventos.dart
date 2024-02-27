import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/views/eventos_list.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

@immutable
class Eventos extends StatelessWidget {
  Eventos({super.key});

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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: largura * 0.02),
          child: Center(
              child: CarouselSlider.builder(
                  itemCount: nomesEventos.length,
                  itemBuilder: (context, index, realIdex) {
                    return eventoswidget(
                        imagem: imagensEventos[index],
                        nome: nomesEventos[index]);
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      reverse: true,
                      height: altura * 0.2))),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: altura * 0.02,
              left: largura * 0.03,
              right: altura * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Texto.titulo('Eventos', corTexto: preto, peso: 9),
              InkWell(
                child: Texto.subtitulo('Ver mais', corTexto: azul, peso: 9),
                onTap: () {
                  Get.to(() => const EventosList());
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget eventoswidget({
    required String imagem,
    required String nome,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: largura * 0.02),
      child: SizedBox(
        height: altura * 0.2,
        child: InkWell(
          child: Stack(
            children: [
              Container(
                height: altura * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imagem))),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: altura * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: amarelo),
                  child: Texto.titulo('  $nome  ', corTexto: azul, peso: 7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
