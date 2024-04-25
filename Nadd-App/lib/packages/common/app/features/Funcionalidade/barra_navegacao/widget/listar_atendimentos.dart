import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/atendimento.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendimento_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/cabecalho_nadd.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class ListarAtendimentos extends StatefulWidget {
  const ListarAtendimentos({super.key});

  @override
  State<ListarAtendimentos> createState() => _ListarAtendimentosState();
}

class _ListarAtendimentosState extends State<ListarAtendimentos> {
  final ListarAtendimentoServices listarAtendimentoServices =
      ListarAtendimentoServices();
  late Future<List<DadosDeAtendimento>> futureAtendimentos;

  @override
  void initState() {
    super.initState();
    futureAtendimentos = listarAtendimentoServices.obterAtendimentos();
  }

  Future<void> _mostrarDetalhes(DadosDeAtendimento atendimento) async {
    int idAtendimentoSelecionado = atendimento.id;
    DateTime dataHora = DateTime.parse(atendimento.dataHora);
    String dataHoraFormatada = DateFormat('dd/MM/yyyy HH:mm').format(dataHora);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Atendimento'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paciente: ${atendimento.pessoa.nome}'),
                Text('Data: $dataHoraFormatada'),
                Text('Atendente: ${atendimento.atendentes.nome}'),
                Text('Como Começou: ${atendimento.comoComecou}'),
                Text('Ocorrência: ${atendimento.ocorrencia}'),
                Text('Sintomas: ${atendimento.sintomas}'),
                Text('Observação: ${atendimento.observacao}'),
                Text(
                    'Tipo atendimento: \n   ${atendimento.tipoAtendimento.individualColetivoEnum} \n   ${atendimento.tipoAtendimento.normalEmergencialEnum}'),
                Text('Queixa principal: ${atendimento.queixaPrincipal}'),
                Text('Progressão: ${atendimento.repentinoGradualEnum}'),
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
            TextButton(
              onPressed: () async {
                DeletarAtendimentoService deletarAtendimentoService =
                    DeletarAtendimentoService();
                await deletarAtendimentoService
                    .deleteAtendimento(idAtendimentoSelecionado);
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      child: Column(
        children: [
          const CabecalhoNadd(titulo: 'Atendimentos'),
          Expanded(
            child: FutureBuilder<List<DadosDeAtendimento>>(
              future: futureAtendimentos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DadosDeAtendimento> atendimentos = snapshot.data!;
                  return ListView.builder(
                    itemCount: atendimentos.length,
                    itemBuilder: (context, index) {
                      DateTime dataHora =
                          DateTime.parse(atendimentos[index].dataHora);
                      String dataHoraFormatada =
                          DateFormat('dd/MM/yyyy HH:mm').format(dataHora);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            _mostrarDetalhes(atendimentos[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: azulLogo.withOpacity(0.7),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(width: 1, color: azulLogo),
                            ),
                            child: ListTile(
                              title: Texto.titulo(
                                'Paciente: ${atendimentos[index].pessoa.nome}',
                                corTexto: preto,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Texto.subtitulo(
                                    'Data: $dataHoraFormatada',
                                    corTexto: amarelo,
                                  ),
                                  Texto.subtitulo(
                                    'Atendente: ${atendimentos[index].atendentes.nome}',
                                    corTexto: amarelo,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Erro: ${snapshot.error}"),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          //padding no fim da screen para evitar sobreposição da barra
          const Padding(padding: EdgeInsets.only(bottom: 33))
        ],
      ),
    );
  }
}
