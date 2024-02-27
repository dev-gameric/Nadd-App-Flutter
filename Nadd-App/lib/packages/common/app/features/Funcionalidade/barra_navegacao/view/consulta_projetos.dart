import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/listar_dados_api.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/projetos_services.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/cabecalho_nadd.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class ConsultaProjetos extends StatefulWidget {
  const ConsultaProjetos({super.key});

  @override
  State<ConsultaProjetos> createState() => _ConsultaProjetosState();
}

class _ConsultaProjetosState extends State<ConsultaProjetos> {
  final projetoController = TextEditingController();
  Rxn<List<Map<String, dynamic>>> informacoesProjeto = Rxn();
  bool carregando = false;

  @override
  void initState() {
    super.initState();
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
            const CabecalhoNadd(
              titulo: 'Consultar Projetos',
            ),

            //função reativa de consulta projeto
            Obx(
              () => Column(
                children: [
                  //Pegar o valor a ser buscado
                  Formulario(
                    tipo: 'projeto',
                    editingController: projetoController,
                  ),
                  InkWell(
                    onTap: () async {
                      if (!carregando) {
                        informacoesProjeto.value = null;
                        //Busca o projeto
                        List<Map<String, dynamic>> projetos =
                            await BuscarProjetoNome()
                                .getProjeto(projetoController.text);
                        if (projetos.isNotEmpty) {
                          informacoesProjeto.value = projetos;
                        } else {
                          informacoesProjeto.value = null;
                          Get.snackbar(
                              backgroundColor: azulLogo,
                              'Erro',
                              'Erro ao localizar o projeto: Não Existe',
                              colorText: amarelo);
                        }
                        setState(() {
                          carregando = false;
                        });
                      }
                    },
                    //botão de Buscar Consultas
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                          color: amarelo,
                          borderRadius: BorderRadius.circular(15)),
                      child: Texto.padrao('Buscar', corTexto: azulLogo),
                    ),
                  ),

                  //Função para listar os projetos buscados
                  //InformacoesApiMap(
                  //    informacoesDadosApi: informacoesProjeto.value)

                  //Função para listar os projetos buscados
                  ListarDadosApi(
                    dadosApi: informacoesProjeto.value,
                    mapeamentoCampos: const {'nome': 'Nome'},
                    mostrarDialogCallback:
                        (BuildContext context, Map<String, dynamic> dados) {
                      DateTime dataInicio = DateTime.parse(dados['dataInicio']);
                      DateTime dataFim = DateTime.parse(dados['dataFim']);

                      String dataInicioFormatada =
                          DateFormat('dd/MM/yyyy ').format(dataInicio);
                      String dataFimFormatada =
                          DateFormat('dd/MM/yyyy ').format(dataFim);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Detalhes do Projeto'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nome: ${dados['nome']}'),
                                  Text('Data inicio: $dataInicioFormatada'),
                                  Text('Data Fim: $dataFimFormatada'),
                                  Text('Proponente: ${dados['proponente']}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Fechar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
