import 'package:flutter/material.dart';

import '../cores/cores.dart';


Widget linha(double largura) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: largura * 0.02),
      child: Divider(
        height: 3,
        color: preto.withOpacity(0.2),
      ),
    );
  }