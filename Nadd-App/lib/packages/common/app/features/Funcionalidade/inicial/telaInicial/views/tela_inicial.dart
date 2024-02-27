import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/cadastro/views/cadastro_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  Rx<bool> imagemGrande = false.obs;

  @override
  void initState() {
    Timer(Duration.zero, () {
      imagemGrande.value = true;
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      imagemGrande.value = !imagemGrande.value;
    });
    //timer de transição de tela
    Timer(const Duration(seconds: 5), () {
      Get.to(const CadastroPage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      child: Container(
        height: altura,
        width: largura,
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: [amarelo, amarelo])),
        child: Center(
          child: Obx(
            () => AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: imagemGrande.value ? altura * 0.5 : altura * 0.2,
                width: largura,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logoSemFundo.png')))),
          ),
        ),
      ),
    );
  }
}
