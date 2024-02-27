import 'package:flutter/material.dart';
import '../cores/cores.dart';
import 'tamanho_texto.dart';

class Texto {
  static Widget cabecalho(
    String texto, {
    Color? corTexto,
    int peso = 6,
    double? tamanho,
    bool underline = false,
  }) {
    corTexto ??= branco;
    tamanho ??= muitoGrande;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }

  static Widget titulo(
    String texto, {
    Color? corTexto,
    int peso = 6,
    double? tamanho,
    bool underline = false,
  }) {
    corTexto ??= preto;
    tamanho ??= grande;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }

  static Widget subtitulo(
    String texto, {
    Color? corTexto,
    int peso = 6,
    double? tamanho,
    bool underline = false,
  }) {
    corTexto ??= preto;
    tamanho ??= medio;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }

  static Widget padrao(
    String texto, {
    Color? corTexto,
    int peso = 6,
    double? tamanho,
    bool underline = false,
  }) {
    corTexto ??= preto;
    tamanho ??= pequeno;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }

  static Widget paraLink(
    String texto, {
    Color? corTexto,
    int peso = 5,
    double? tamanho,
    bool underline = true,
  }) {
    corTexto ??= azul;
    tamanho ??= pequeno;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          decorationColor: corTexto,
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }

  static Widget simples(
    String texto, {
    Color? corTexto,
    int peso = 5,
    double? tamanho,
    bool underline = false,
  }) {
    corTexto ??= preto;
    tamanho ??= muitoPequeno;
    FontWeight weight = _peso(peso);
    return Text(
      texto,
      style: TextStyle(
          color: corTexto,
          fontSize: tamanho,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }
}

FontWeight _peso(int peso) {
  switch (peso) {
    case 1:
      return FontWeight.w100;
    case 2:
      return FontWeight.w200;

    case 3:
      return FontWeight.w300;

    case 4:
      return FontWeight.w400;

    case 5:
      return FontWeight.w500;

    case 6:
      return FontWeight.w600;

    case 7:
      return FontWeight.w700;

    case 8:
      return FontWeight.w800;

    case 9:
      return FontWeight.w900;

    default:
      return FontWeight.normal;
  }
}
