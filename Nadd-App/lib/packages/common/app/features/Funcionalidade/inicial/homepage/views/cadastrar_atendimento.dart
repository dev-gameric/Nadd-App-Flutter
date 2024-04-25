import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/widgets/dropdown_button.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendimento_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';
import 'package:http/http.dart' as http;

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
  String? dropdownButtonAtendente;
  int? dropdownButtonAtendenteId;
  String? dropdownButtonPessoa;
  int? dropdownButtonPessoaId;
  String? dropdownButtonTipoAtendimento;
  int? dropdownButtonTipoAtendimentoId;
  String? dropdownButtonRepentinoGradual;

  List<dynamic> _dadosDaTabelaPessoa = [];
  List<dynamic> _dadosDaTabelaAtendente = [];
  List<dynamic> _dadosDaTabelaTipoAtendimento = [];

  @override
  void initState() {
    super.initState();
    _buscarDadosDaTabelaPessoa();
    _buscarDadosDaTabelaAtendente();
    _buscarDadosDaTabelaTipoAtendimento();
  }

  Future<void> _buscarDadosDaTabelaPessoa() async {
    var url =
        'http://10.0.2.2:8080/pessoa/p'; // Substitua pela URL da sua API Spring Boot
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _dadosDaTabelaPessoa = jsonDecode(response.body);
      });
    } else {
      print('Erro ao carregar os dados da tabela estrangeira');
    }
  }

  Future<void> _buscarDadosDaTabelaAtendente() async {
    var url =
        'http://10.0.2.2:8080/atendentes/a'; // Substitua pela URL da sua API Spring Boot
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _dadosDaTabelaAtendente = jsonDecode(response.body);
      });
    } else {
      print('Erro ao carregar os dados da tabela estrangeira');
    }
  }

  Future<void> _buscarDadosDaTabelaTipoAtendimento() async {
    var url =
        'http://10.0.2.2:8080/tipo-atendimento/t'; // Substitua pela URL da sua API Spring Boot
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _dadosDaTabelaTipoAtendimento = jsonDecode(response.body);
      });
    } else {
      print('Erro ao carregar os dados da tabela estrangeira');
    }
  }

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
                    DropdownButtonWidget(
                      value: dropdownButtonRepentinoGradual,
                      items: const [
                        'Repentino',
                        'Gradual',
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownButtonRepentinoGradual = newValue;
                        });
                      },
                    ),
                    DropdownButtonWidget(
                      value: dropdownButtonPessoa,
                      items: _dadosDaTabelaPessoa.map<String>((item) {
                        return item['nome'];
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownButtonPessoa = newValue;
                          dropdownButtonPessoaId =
                              _dadosDaTabelaPessoa.firstWhere(
                                  (item) => item['nome'] == newValue)['id'];
                        });
                      },
                    ),
                    DropdownButtonWidget(
                      value: dropdownButtonTipoAtendimento,
                      items: _dadosDaTabelaTipoAtendimento.map<String>((item) {
                        return item['nome'];
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownButtonTipoAtendimento = newValue;
                          dropdownButtonTipoAtendimentoId =
                              _dadosDaTabelaTipoAtendimento.firstWhere(
                                  (item) => item['nome'] == newValue)['id'];
                        });
                      },
                    ),
                    DropdownButtonWidget(
                      value: dropdownButtonAtendente,
                      items: _dadosDaTabelaAtendente.map<String>((item) {
                        return item['nome'];
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownButtonAtendente = newValue;
                          dropdownButtonAtendenteId =
                              _dadosDaTabelaAtendente.firstWhere(
                                  (item) => item['nome'] == newValue)['id'];
                        });
                      },
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
                      dropdownButtonRepentinoGradual,
                      sintomasController,
                      dropdownButtonPessoaId,
                      dropdownButtonAtendenteId,
                      dropdownButtonTipoAtendimentoId,
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
