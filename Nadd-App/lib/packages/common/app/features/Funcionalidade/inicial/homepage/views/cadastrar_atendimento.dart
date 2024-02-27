import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendimento_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class CadastrarAtendimento extends StatefulWidget {
  const CadastrarAtendimento({super.key});

  @override
  State<CadastrarAtendimento> createState() => _CadastrarAtendimentoState();
}

class _CadastrarAtendimentoState extends State<CadastrarAtendimento> {
  final chaveformulario = GlobalKey<FormState>();
  final comoComecouController = TextEditingController();
  final dataController = TextEditingController();
  final observacaoController = TextEditingController();
  final ocorrenciaController = TextEditingController();
  final queixaPrincipalController = TextEditingController();
  final repentinoGradualController = TextEditingController();
  final sintomasController = TextEditingController();
  final pessoaController = TextEditingController();
  final atendenteController = TextEditingController();
  final tipoAtendimentoController = TextEditingController();

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
              child: Texto.titulo('Cadastro de Atendimentos',
                  corTexto: azulLogo, tamanho: 26),
            ),
            Form(
              key: chaveformulario,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      controller: comoComecouController,
                      decoration: const InputDecoration(
                        labelText: 'Como começou',
                        icon: Icon(Icons.play_circle_rounded),
                      ),
                      maxLines:
                          null, // Isso permite que o campo cresça dinamicamente
                    ),
                    Formulario(
                        chave: 'data',
                        icone: Icons.calendar_month,
                        tipo: 'Data',
                        editingController: dataController),
                    TextField(
                      controller: observacaoController,
                      decoration: const InputDecoration(
                        labelText: 'Observação',
                        icon: Icon(Icons.calendar_month),
                      ),
                      maxLines: null,
                    ),
                    TextField(
                      controller: ocorrenciaController,
                      decoration: const InputDecoration(
                        labelText: 'Ocorrência',
                        icon: Icon(Icons.personal_injury_outlined),
                      ),
                      maxLines: null,
                    ),
                    TextField(
                      controller: queixaPrincipalController,
                      decoration: const InputDecoration(
                        labelText: 'Queixa Principal',
                        icon: Icon(Icons.personal_injury_outlined),
                      ),
                      maxLines: null,
                    ),
                    TextField(
                      controller: sintomasController,
                      decoration: const InputDecoration(
                        labelText: 'Sintomas',
                        icon: Icon(Icons.personal_injury_outlined),
                      ),
                      maxLines: null,
                    ),
                    Formulario(
                      chave: 'repentinoGradual',
                      icone: Icons.personal_injury_outlined,
                      tipo: 'Repentino ou Gradual',
                      editingController: repentinoGradualController,
                    ),
                    Formulario(
                      chave: '',
                      icone: Icons.personal_injury_outlined,
                      tipo: 'Atendente',
                      editingController: atendenteController,
                    ),
                    Formulario(
                      chave: '',
                      icone: Icons.personal_injury_outlined,
                      tipo: 'Pessoa',
                      editingController: pessoaController,
                    ),
                    Formulario(
                      chave: '',
                      icone: Icons.personal_injury_outlined,
                      tipo: 'Tipo Atendimento',
                      editingController: tipoAtendimentoController,
                    ),
                  ],
                ),
              ),
            ),

            //botão cadastrar projeto
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: InkWell(
                onTap: () async {
                  if (chaveformulario.currentState!.validate()) {
                    cadastrarAtendimento(
                      comoComecouController,
                      dataController,
                      observacaoController,
                      ocorrenciaController,
                      queixaPrincipalController,
                      repentinoGradualController,
                      sintomasController,
                      pessoaController,
                      atendenteController,
                      tipoAtendimentoController,
                    );
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: amarelo, borderRadius: BorderRadius.circular(15)),
                  child: Texto.subtitulo('Cadastrar Atendimento',
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
