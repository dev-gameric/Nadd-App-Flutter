import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/listar_dados_api.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendimento_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/cabecalho_nadd.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class ConsultaAtendimentos extends StatefulWidget {
  const ConsultaAtendimentos({super.key});

  @override
  State<ConsultaAtendimentos> createState() => _ConsultaAtendimentosState();
}

class _ConsultaAtendimentosState extends State<ConsultaAtendimentos> {
  final atendimentosController = TextEditingController();
  Rxn<List<Map<String, dynamic>>> informacoesAtendimentos = Rxn();
  bool carregando = false;

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
              titulo: 'Consultar Atendimentos',
            ),

            //função reativa de consulta atendimentos
            Obx(
              () => Column(
                children: [
                  //Pegar o valor a ser buscado
                  Formulario(
                    tipo: 'atendimento',
                    editingController: atendimentosController,
                  ),
                  InkWell(
                    onTap: () async {
                      if (!carregando) {
                        informacoesAtendimentos.value = null;
                        //Busca o atendimento
                        List<Map<String, dynamic>> atendimentos =
                            await BuscarAtendimentosNome()
                                .getAtendimentos(atendimentosController.text);
                        if (atendimentos.isNotEmpty) {
                          informacoesAtendimentos.value = atendimentos;
                        } else {
                          informacoesAtendimentos.value = null;
                          Get.snackbar(
                              backgroundColor: azulLogo,
                              'Erro',
                              'Erro ao localizar o Atendimento: Não Existe',
                              colorText: amarelo);
                        }
                        setState(() {
                          carregando = false;
                        });
                      }
                    },
                    //botão de Buscar Atendimentos
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                          color: amarelo,
                          borderRadius: BorderRadius.circular(15)),
                      child: Texto.padrao('Buscar', corTexto: azulLogo),
                    ),
                  ),
                  const SizedBox(height: 16),

                  //Função para listar o Atendimento buscados
                  ListarDadosApi(
                    dadosApi: informacoesAtendimentos.value,
                    mapeamentoCampos: const {
                      'pessoa.nome': 'Nome',
                      'dataHora': 'Data'
                    },
                    mostrarDialogCallback:
                        (BuildContext context, Map<String, dynamic> dados) {
                      DateTime dataHora = DateTime.parse(dados['dataHora']);
                      String dataHoraFormatada =
                          DateFormat('dd/MM/yyyy HH:mm').format(dataHora);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Detalhes do Atendimento'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Paciente: ${dados['pessoa']['nome']}'),
                                  Text('Data: $dataHoraFormatada'),
                                  Text(
                                      'Atendente: ${dados['atendentes']['nome']}'),
                                  Text('Como Começou: ${dados['comoComecou']}'),
                                  Text('Ocorrência: ${dados['ocorrencia']}'),
                                  Text('Sintomas: ${dados['sintomas']}'),
                                  Text('Observação: ${dados['observacao']}'),
                                  Text(
                                      'Tipo atendimento: \n   ${dados['tipoAtendimento']['individualColetivoEnum']} \n   ${dados['tipoAtendimento']['normalEmergencialEnum']}'),
                                  Text(
                                      'Queixa principal: ${dados['queixaPrincipal']}'),
                                  Text(
                                      'Progressão: ${dados['repentinoGradualEnum']}'),
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
