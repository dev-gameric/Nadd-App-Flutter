import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/atendentes.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/atendente_service.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/cabecalho_nadd.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class ListarAtendentes extends StatefulWidget {
  const ListarAtendentes({super.key});

  @override
  State<ListarAtendentes> createState() => _ListarAtendentesState();
}

class _ListarAtendentesState extends State<ListarAtendentes> {
  final ListarAtendentesServices listarAtendentesServices =
      ListarAtendentesServices();
  late Future<List<DadosDeAtendentes>> futureAtendentes;
  Rxn<List<Map<String, dynamic>>> informacoesAtendimento = Rxn();

  @override
  void initState() {
    super.initState();
    futureAtendentes = listarAtendentesServices.obterAtendentes();
  }

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      corFundo: branco,
      appBar: AppBar(
        title: Texto.cabecalho('Lista de Atendentes', tamanho: 22),
        foregroundColor: branco,
        backgroundColor: azulLogo,
      ),
      child: Column(
        children: [
          const CabecalhoNadd(titulo: 'Atendentes'),
          Expanded(
            child: FutureBuilder<List<DadosDeAtendentes>>(
              future: futureAtendentes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DadosDeAtendentes> atendentes = snapshot.data!;
                  return ListView.builder(
                    itemCount: atendentes.length,
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
                            onTap: () async {},
                            child: ListTile(
                              title: Texto.titulo(
                                atendentes[index].nome,
                                corTexto: preto,
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
