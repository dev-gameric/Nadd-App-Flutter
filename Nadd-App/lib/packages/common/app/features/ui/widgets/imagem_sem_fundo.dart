import 'package:flutter/widgets.dart';

Widget imagemSemFundo(
    {required String urlImagem,
    required double altura,
    required double largura}) {
  return Container(
    height: altura,
    width: largura,
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(urlImagem), fit: BoxFit.cover),
    ),
  );
}
