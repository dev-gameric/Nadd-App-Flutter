import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/projetos.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/projetos_services.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/cabecalho_nadd.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class ListarProjetos extends StatefulWidget {
  const ListarProjetos({super.key});

  @override
  State<ListarProjetos> createState() => _ListarProjetosState();
}

class _ListarProjetosState extends State<ListarProjetos> {
  final ListarProjetosServices listarProjetosServices =
      ListarProjetosServices();
  late Future<List<DadosDoProjeto>> futureProjetos;
  Rxn<List<Map<String, dynamic>>> informacoesAtendimento = Rxn();

  @override
  void initState() {
    super.initState();
    futureProjetos = listarProjetosServices.obterProjetos();
  }

  Future<void> _mostrarDetalhes(DadosDoProjeto projeto) async {
    DateTime dataInicio = DateTime.parse(projeto.dataInicio);
    String dataInicioFormatada =
        DateFormat('dd/MM/yyyy HH:mm').format(dataInicio);

    DateTime dataFim = DateTime.parse(projeto.dataFim);
    String dataFimFormatada = DateFormat('dd/MM/yyyy HH:mm').format(dataFim);
    print('data inicio: $dataInicio');
    print('data inicio formatada: $dataInicioFormatada');
    print('data fim: $dataFim');
    print('data fim formatada: $dataFimFormatada');

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Projeto'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome: ${projeto.nome}'),
                Text('Proponente: ${projeto.proponente}'),
                Text('Data Inicio: $dataInicioFormatada'),
                Text('Data Fim: $dataFimFormatada'),
                Text('Status: ${projeto.statusProjetoEnum}'),
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
                // Navigator.of(context).pop();
                DeletarProjetoService deletarProjetoService =
                    DeletarProjetoService();

                int projetoID = 10;

                await deletarProjetoService.deleteProjeto(projetoID);
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
      corFundo: branco,
      appBar: AppBar(
        title: Texto.cabecalho('Lista de Projetos', tamanho: 22),
        foregroundColor: branco,
        backgroundColor: azulLogo,
      ),
      child: Column(
        children: [
          const CabecalhoNadd(titulo: 'Projetos'),
          Expanded(
            child: FutureBuilder<List<DadosDoProjeto>>(
              future: futureProjetos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DadosDoProjeto> projetos = snapshot.data!;
                  return ListView.builder(
                    itemCount: projetos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: azulLogo.withOpacity(0.7),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(width: 1, color: azulLogo)),
                          child: InkWell(
                            onTap: () async {
                              _mostrarDetalhes(projetos[index]);
                            },
                            child: ListTile(
                              title: Texto.titulo(
                                projetos[index].nome,
                                corTexto: preto,
                              ),
                              subtitle: Texto.subtitulo(
                                projetos[index].proponente,
                                corTexto: amarelo,
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

/*Obx(() {
              if (informacoesProjeto.value == null) {
                // Exibir lista de projetos
                return FutureBuilder<List<DadosDoProjeto>>(
                  future: futureProjetos,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else {
                      List<DadosDoProjeto> projetos = snapshot.data ?? [];
                      return Column(
                        children: [
                          // ... Adicione outros widgets conforme necessário ...

                          Expanded(
                            child: ListView.separated(
                              itemCount: projetos.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(), // Adicione um Divider entre os itens
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(projetos[index].nome),
                                  subtitle: Text(projetos[index].proponente),
                                  // Adicione mais detalhes conforme necessário
                                );
                              },
                            ),
                          ),
                        ], 
                      );
                    }
                  },
                );
              } else {
                // Exibir resultados da busca
                return const Column(
                  children: [
                    // ... Código anterior ...
                  ],
                );
              }
            }),*/
