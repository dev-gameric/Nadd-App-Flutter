import 'package:flutter/services.dart';

class FormatarDataInput extends TextInputFormatter {
  String _inserirBarra(String text, {required String oldValue}) {
    String newText = '';
    //02112023
    //01234567
    // 1 3
    for (var i = 0; i < text.length; i++) {
      newText += text[i];

      if (i == 1 || i == 3) {
        newText += '/';
      }
    }

    if ( newText.isNotEmpty) {
      if (newText[newText.length - 1] == '/') {
        newText = newText.replaceRange(newText.length - 1, null, '');
      }
    } 

    return newText;
  }

  static const int cpfLength = 8;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length > cpfLength) {
      return oldValue;
    }

    var newText = _inserirBarra(text, oldValue: oldValue.text);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
