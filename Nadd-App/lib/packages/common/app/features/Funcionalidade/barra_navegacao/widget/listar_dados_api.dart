import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class ListarDadosApi extends StatelessWidget {
  final List<Map<String, dynamic>>? dadosApi;
  final List<String>? camposEspecificos;
  final Map<String, String>? mapeamentoCampos;
  final void Function(BuildContext, Map<String, dynamic>)?
      mostrarDialogCallback;

  const ListarDadosApi({
    Key? key,
    required this.dadosApi,
    this.camposEspecificos,
    this.mapeamentoCampos,
    this.mostrarDialogCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dadosApi != null
        ? SizedBox(
            height: altura,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView.builder(
                itemCount: dadosApi!.length,
                itemBuilder: (BuildContext context, index) {
                  final dado = dadosApi![index];
                  return _buildItem(context, dado);
                },
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildItem(BuildContext context, Map<String, dynamic> dado) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: azulLogo.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2.5, color: azul),
        ),
        child: Column(
          children: _getCamposWidgets(context, dado),
        ),
      ),
    );
  }

  List<Widget> _getCamposWidgets(
      BuildContext context, Map<String, dynamic> dado) {
    if (camposEspecificos != null) {
      return [_listarCamposEspecificos(context, dado)];
    } else if (mapeamentoCampos != null) {
      return [_listarCamposMapeados(context, dado)];
    } else {
      return [_listarTodosCampos(context, dado)];
    }
  }

  Widget _listarCamposEspecificos(
      BuildContext context, Map<String, dynamic> dado) {
    return Column(
      children: camposEspecificos!
          .map((campo) => _buildCampoWidget(context, dado, campo))
          .whereType<Widget>()
          .toList(),
    );
  }

  Widget _listarCamposMapeados(
      BuildContext context, Map<String, dynamic> dado) {
    return Column(
      children: mapeamentoCampos!.entries
          .map((entry) =>
              _buildCampoWidget(context, dado, entry.key, entry.value))
          .whereType<Widget>()
          .toList(),
    );
  }

  Widget _listarTodosCampos(BuildContext context, Map<String, dynamic> dado) {
    return Column(
      children: dado.entries
          .map((entry) =>
              _buildCampoWidget(context, dado, entry.key, entry.value))
          .whereType<Widget>()
          .toList(),
    );
  }

  Widget? _buildCampoWidget(
      BuildContext context, Map<String, dynamic> dado, String campo,
      [String? nomeExibicao]) {
    dynamic valorCampo = _obterValorCampo(dado, campo);

    if (valorCampo != null) {
      final nomeExibicaoFinal = nomeExibicao ?? campo;
      return Container(
        decoration: const BoxDecoration(),
        child: InkWell(
          onTap: () {
            if (mostrarDialogCallback != null) {
              mostrarDialogCallback!(context, dado);
            } else {
              _mostrarDialog(context, dado);
            }
          },
          child: ListTile(
            title: Texto.simples(
                '${nomeExibicaoFinal.toUpperCase()}: ${valorCampo.toString()}',
                corTexto: amarelo,
                peso: 9),
            subtitle: null,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  dynamic _obterValorCampo(Map<String, dynamic> dado, String campo) {
    var partesCampo = campo.split('.');
    dynamic valor = dado;

    for (var parte in partesCampo) {
      if (valor is Map<String, dynamic> && valor.containsKey(parte)) {
        valor = valor[parte];
      } else {
        return null;
      }
    }

    return valor;
  }

  void _mostrarDialog(BuildContext context, Map<String, dynamic> dados) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Informações',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: //const Column(),

              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: dados.entries.map((entry) {
              return Text(
                '${entry.key}: ${entry.value}',
                style: const TextStyle(fontSize: 16),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Voltar'),
            ),
            TextButton(
              onPressed: () {
                // Implemente a lógica de atualização aqui
                Navigator.of(context).pop();
              },
              child: const Text('Atualizar'),
            ),
            TextButton(
              onPressed: () {
                // Implemente a lógica de exclusão aqui
                Navigator.of(context).pop();
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
  }
}
