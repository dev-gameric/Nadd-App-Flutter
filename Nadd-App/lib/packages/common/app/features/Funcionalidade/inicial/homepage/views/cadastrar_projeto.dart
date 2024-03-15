import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/projetos.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/projetos_services.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class CadastrarProjetoAtalho extends StatefulWidget {
  const CadastrarProjetoAtalho({super.key});

  @override
  State<CadastrarProjetoAtalho> createState() => _CadastrarProjetoAtalhoState();
}

class _CadastrarProjetoAtalhoState extends State<CadastrarProjetoAtalho> {
  final chaveformulario = GlobalKey<FormState>();
  TextEditingController dataInicioController = TextEditingController();
  TextEditingController dataFimController = TextEditingController();
  TextEditingController proponenteController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController statusProjetoController = TextEditingController();
  String? dropdownValue;

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
              child: Texto.titulo('Cadastro de Projeto',
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
                          tipo: 'Nome Projeto',
                          editingController: nomeController),
                      Formulario(
                          chave: 'nome',
                          icone: Icons.play_circle_rounded,
                          tipo: 'Proponente',
                          editingController: proponenteController),
                      Formulario(
                          chave: 'data',
                          icone: Icons.calendar_month,
                          tipo: 'Data Inicio',
                          editingController: dataInicioController),
                      Formulario(
                          chave: 'data',
                          icone: Icons.calendar_month,
                          tipo: 'Data Fim',
                          editingController: dataFimController),
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Andamento', 'Planejado', 'Encerrado']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isExpanded: true,
                      ),
                    ],
                  ),
                )),

            //botão cadastrar projeto
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: InkWell(
                onTap: () async {
                  if (chaveformulario.currentState!.validate()) {
                    final dados = DadosDoProjeto(
                      nome: nomeController.text,
                      proponente: proponenteController.text,
                      dataInicio: formatarData(dataInicioController.text),
                      dataFim: formatarData(dataFimController.text),
                      statusProjetoEnum: dropdownValue != null
                          ? dropdownValue!.toUpperCase()
                          : '',
                    );

                    await cadastrarProjeto(dados);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: amarelo, borderRadius: BorderRadius.circular(15)),
                  child:
                      Texto.subtitulo('Cadastrar Projeto', corTexto: azulLogo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
