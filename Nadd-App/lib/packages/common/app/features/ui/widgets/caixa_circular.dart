import 'package:flutter/widgets.dart';

import '../cores/cores.dart';


Widget caixaCircular({required double largura, required Widget widget}) {
  return Container(
      //height: altura,
      width: largura,
      decoration: BoxDecoration(
          color: preto.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: preto.withOpacity(0.03),
                offset: const Offset(0, 3),
                blurRadius: 7,
                spreadRadius: 5)
          ]),
      child: widget);
}
