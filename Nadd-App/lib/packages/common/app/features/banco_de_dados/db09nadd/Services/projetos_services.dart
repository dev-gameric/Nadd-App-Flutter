import "dart:convert";

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/projetos.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Server/api_config.dart';

//buscar projetos pelo id
class BuscarProjetoId {
  Future<Map<String, dynamic>> getProjeto(String projeto) async {
    Map<String, dynamic> data = {};

    final request = await http.get(Uri.parse('$host/projetos/$projeto'));
    if (request.statusCode == 200) {
      data = jsonDecode(request.body);
    }
    return data;
  }
}

//buscar projetos pelo nome
class BuscarProjetoNome {
  Future<List<Map<String, dynamic>>> getProjeto(String projeto) async {
    List<Map<String, dynamic>> data = [];

    final request =
        await http.get(Uri.parse('$host/projetos/BuscarPeloNome/$projeto'));
    if (request.statusCode == 200) {
      data = List<Map<String, dynamic>>.from(jsonDecode(request.body));
    }
    return data;
  }
}

// Lista todos os projetos existentes
class ListarProjetosServices {
  Future<List<DadosDoProjeto>> obterProjetos() async {
    final resposta = await http.get(Uri.parse('$host/projetos'));

    if (resposta.statusCode == 200) {
      final List<dynamic> dados = json.decode(resposta.body);
      return dados.map((projeto) => DadosDoProjeto.fromJson(projeto)).toList();
    } else {
      throw Exception('Falha ao carregar projetos');
    }
  }
}

//cadastrar projetos
Future<bool> cadastrarProjeto(DadosDoProjeto dados) async {
  bool resposta;
  resposta = false;

  final response = await http.post(
    Uri.parse('$host/projetos'),
    headers: {'content-Type': 'application/json'},
    body: jsonEncode({
      'nome': dados.nome,
      'proponente': dados.proponente,
      'dataInicio': dados.dataInicio,
      'dataFim': dados.dataFim,
      'statusProjetoEnum': dados.statusProjetoEnum,
    }),
  );

  if (response.statusCode == 201) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Concluído',
        'Projeto cadastrado com sucesso',
        colorText: amarelo);
    resposta = true;
  }
  if (response.statusCode == 400) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Erro',
        'Erro ao cadastrar projeto: ${response.statusCode}',
        colorText: amarelo);
    resposta = true;
  }

  return resposta;
}
