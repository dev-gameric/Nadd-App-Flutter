import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendente_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class CadastrarAtendentes extends StatefulWidget {
  const CadastrarAtendentes({super.key});

  @override
  State<CadastrarAtendentes> createState() => _CadastrarAtendentesState();
}

class _CadastrarAtendentesState extends State<CadastrarAtendentes> {
  final chaveformulario = GlobalKey<FormState>();
  final nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      appBar: AppBar(
        title: Texto.cabecalho('Voltar', tamanho: 22),
        foregroundColor: branco,
        backgroundColor: azulLogo,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //cabeçalho
            Container(
              height: altura * 0.25,
              width: largura,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [amarelo, amarelo])),
              child: Center(
                  child: Container(
                height: altura * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logoSemFundo.png'))),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Texto.titulo('Cadastro de Atendentes',
                  corTexto: azulLogo, tamanho: 26),
            ),
            Form(
                key: chaveformulario,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Formulario(
                          chave: 'nome',
                          icone: Icons.play_circle_rounded,
                          tipo: 'Nome Atendente',
                          editingController: nomeController),
                    ],
                  ),
                )),

            //botão cadastrar projeto
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: InkWell(
                onTap: () async {
                  if (chaveformulario.currentState!.validate()) {
                    cadastrarAtendentes(nomeController);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: amarelo, borderRadius: BorderRadius.circular(15)),
                  child: Texto.subtitulo('Cadastrar Atendente',
                      corTexto: azulLogo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
