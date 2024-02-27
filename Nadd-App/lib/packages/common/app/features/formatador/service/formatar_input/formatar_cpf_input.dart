import 'package:flutter/services.dart';

class FormatarCpfInput extends TextInputFormatter {
  String _inserirTP(String text) {
    String newText = '';

    for (var i = 0; i < text.length; i++) {
      newText += text[i];

      if (i == 2 || i == 5) {
        newText += '.';
      } else if (i == 8) {
        newText += '-';
      }
    }
    if(newText.isNotEmpty){
       if (newText[newText.length - 1] == '.' ||
        newText[newText.length - 1] == '-') {
      newText = newText.replaceRange(newText.length - 1, null, '');
    }
    }
   
    return newText;
  }

  static const int cpfLength = 11;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length > cpfLength) {
      return oldValue;
    }

    var newText = _inserirTP(text);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
