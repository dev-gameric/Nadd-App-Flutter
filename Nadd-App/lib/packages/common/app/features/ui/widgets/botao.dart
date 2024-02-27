// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cores/cores.dart';
import '../texto/textos.dart';

class Botao {
  static Widget rota({
    String? texto,
    required Widget rota,
    required double altura,
    required double largura,
    double? tamanhoTexto,
    bool comBorda = false,
    Widget? titulo,
    Color? corFundo,
    Color? corBorda,
    Color? corTexto,
    double raioBorda = 0,
  }) {
    return padrao(
        titulo: titulo,
        raioBorda: comBorda ? 15 : raioBorda,
        tamanhoTexto: tamanhoTexto,
        texto: texto,
        altura: altura,
        largura: largura,
        funcao: () {
          
          Get.to(rota);
        },
        corBorda: corBorda,
        corTexto: corTexto,
        corFundo: corFundo);
  }

  static Widget redondo({
    String? texto,
    required double altura,
    required double largura,
    double raioBorda = 15,
    void Function()? funcao,
    Widget? titulo,
    double? tamanhoTexto,
    Color? corBorda,
    Color? corTexto,
    Color? corFundo,
  }) {
    return padrao(
        titulo: titulo,
        tamanhoTexto: tamanhoTexto,
        raioBorda: raioBorda,
        texto: texto,
        altura: altura,
        largura: largura,
        funcao: funcao,
        corBorda: corBorda,
        corTexto: corTexto,
        corFundo: corFundo);
  }

  static Widget padrao({
    String? texto,
    required double altura,
    required double largura,
    Color? corBorda,
    Color? corTexto,
    Color? corFundo,
    double? tamanhoTexto,
    double raioBorda = 0,
    Widget? titulo,
    void Function()? funcao,
  }) {
    return SizedBox(
      height: altura,
      width: largura,
      child: InkWell(
        onTap: funcao,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raioBorda),
              color: corFundo ?? preto,
              border:
                  Border.all(color: corBorda ?? corFundo ?? preto, width: 2)),
          child: Center(
            child: titulo ??
                Texto.titulo(texto ?? '',
                    corTexto: corTexto ?? branco, tamanho: tamanhoTexto),
          ),
        ),
      ),
    );
  }

  static Widget visivel(Rx<bool> visivel) {
    return InkWell(
      child: Icon(visivel.value ? Icons.visibility_off : Icons.visibility),
      onTap: () {
        visivel.value = !visivel.value;
      },
    );
  }
}
