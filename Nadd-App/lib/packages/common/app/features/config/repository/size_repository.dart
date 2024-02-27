import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/sp.dart';

class SizeRepository {
  double _altura = 0;
  double _largura = 0;

  Future<void> setSizes(double altura, double largura) async {
    _altura = altura;
    _largura = largura;
    SharedPreferences sp = await Sp().sp;
    await sp.setDouble('altura', altura);
    await sp.setDouble('largura', largura);
  }

  Future<void> init(BuildContext context) async {
    SharedPreferences sp = await Sp().sp;
    if (sp.containsKey('altura')) {
      _altura = sp.getDouble('altura')!;
      _largura = sp.getDouble('largura')!;
    } else {
      // ignore: use_build_context_synchronously
      _altura = MediaQuery.of(context).size.height;
      // ignore: use_build_context_synchronously
      _largura = MediaQuery.of(context).size.width;
      await setSizes(_altura, _largura);
    }
  }

  double get altura => _altura;
  double get largura => _largura;

  static final SizeRepository instance = SizeRepository._();
  SizeRepository._();

  factory SizeRepository() => SizeRepository.instance;
}
