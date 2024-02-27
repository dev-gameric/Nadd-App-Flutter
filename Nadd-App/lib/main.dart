import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/navegacao.dart';
import 'package:nadd/packages/common/app/features/config/services/config.dart';
import 'package:nadd/packages/common/app/features/tema/tema.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  iniciarConfiguracoes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NADD',
      theme: Tema().tema,
      home: const Navegacao(),
    );
  }
}
