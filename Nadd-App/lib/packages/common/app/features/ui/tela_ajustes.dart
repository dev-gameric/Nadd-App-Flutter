import 'package:flutter/material.dart';

import 'cores/cores.dart';
import 'tamanho/sizes.dart';

class TelaAjustes extends StatefulWidget {
  const TelaAjustes({super.key});

  @override
  State<TelaAjustes> createState() => _TelaAjustesState();
}


class _TelaAjustesState extends State<TelaAjustes> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      backgroundColor: preto,
      body: Container(
        height: altura,
        width: largura,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage('https://i.pinimg.com/736x/ed/ff/40/edff40910eea154cb1eb389d960b8dab.jpg'))
        ),
      ),
    ));
  }
}
