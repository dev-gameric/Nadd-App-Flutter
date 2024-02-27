import 'package:flutter/material.dart';

class TecladoService {
  static bool tecladoAtivo(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    if (keyboardHeight > 0) {
      return true;
    } else {

      return false;
    }
  }
}
