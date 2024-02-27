import 'package:flutter/services.dart';

class FormatarEmailInput extends TextInputFormatter {
  String _removerEspacos(String text) {
    if (text.isNotEmpty) {
      if (text.contains(' ')) {
        String espaco = ' ';
        text = text.replaceAll(RegExp(espaco), '');
      }
    }

    return text;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    var newText = _removerEspacos(text);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
