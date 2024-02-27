// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cores/cores.dart';
import '../tamanho/sizes.dart';
import '../texto/textos.dart';

class Cabecalho  {

  
  static Widget padrao({
    required  Widget rotaHelp,
    required String titulo,
  }){
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: largura * 0.01),
      height: altura*0.07,
      width: largura,
      decoration: BoxDecoration(color: preto, boxShadow: [
        BoxShadow(
            color: preto.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 4,
            offset: Offset.zero)
      ]),
      child: Stack(
        children: [
          Center(
            child: Texto.cabecalho(titulo),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: altura*0.07,
                width: altura*0.07,
                child: IconButton(
                    color: branco,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
               SizedBox(
             height: altura*0.07,
                width: altura*0.07,
            child: IconButton(
                color: branco,
                onPressed: () {
                  Get.to(rotaHelp);
                },
                icon: const Icon(Icons.help_outline)),
          ),
            ],
          ),
          
         
        ],
      ),
    );
  }

  static Widget personalizado({
    required  Widget? prefixo,
    required  Widget? sufixo,
    required Widget titulo,
  }){
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: largura * 0.01),
      height: altura*0.07,
      width: largura,
      decoration: BoxDecoration(color: preto, boxShadow: [
        BoxShadow(
            color: preto.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 4,
            offset: Offset.zero)
      ]),
      child: Stack(
        children: [
          Center(
            child: titulo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: altura*0.07,
           //     width: altura*0.07,
                child: prefixo),
               sufixo??const SizedBox()
          
            ],
          ),
          
         
        ],
      ),
    );
  }
}
