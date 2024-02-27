
import 'package:flutter/services.dart';

import 'formatar_cpf_input.dart';
import 'formatar_data_input.dart';
import 'formatar_email_input.dart';

class FormatarInput {
  static List<TextInputFormatter> cpf() {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      FilteringTextInputFormatter.digitsOnly,
      FormatarCpfInput(),
    ];
  }

  static List<TextInputFormatter> digitos() {
    return [

      FilteringTextInputFormatter.digitsOnly,
    ];
  }
  static List<TextInputFormatter> data() {
    return [
            FilteringTextInputFormatter.singleLineFormatter,
      FilteringTextInputFormatter.digitsOnly,
      FormatarDataInput()
    ];
  }
  static List<TextInputFormatter> email() {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      FormatarEmailInput()
    ];
  }


  static List<TextInputFormatter> automatico(String chave) {
    switch (chave) {
      case 'cpf':
        return cpf();
      case 'email':
        return email();
      case 'dataNasc':
        return data();
      case 'data':
        return data();
      default:
        return [
          FilteringTextInputFormatter.singleLineFormatter,
        ];
    }
  }
}
