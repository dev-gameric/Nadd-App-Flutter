import "dart:convert";

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/atendentes.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Server/api_config.dart';

//Listar Atendentes
class ListarAtendentesServices {
  Future<List<DadosDeAtendentes>> obterAtendentes() async {
    final resposta = await http.get(Uri.parse('$host/atendentes'));

    if (resposta.statusCode == 200) {
      final List<dynamic> dados = json.decode(resposta.body);
      return dados
          .map((atendentes) => DadosDeAtendentes.fromJson(atendentes))
          .toList();
    } else {
      throw Exception('Falha ao carregar atendentes');
    }
  }
}

//cadastrar Atendentes
Future<bool> cadastrarAtendentes(
  nomeController,
) async {
  bool resposta;
  resposta = false;

  var response = await http.post(
    Uri.parse('$host/atendentes'),
    headers: {'content-Type': 'application/json'},
    body: jsonEncode({
      'nome': nomeController.text,
    }),
  );

  if (response.statusCode == 201) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Concluído',
        'Atendente cadastrado com sucesso',
        colorText: amarelo);
    resposta = true;
  }
  if (response.statusCode == 400) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Erro',
        'Erro ao cadastrar o(a) Atendente: ${response.statusCode}',
        colorText: amarelo);
    resposta = true;
  }

  return resposta;
}
