import "dart:convert";

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/atendimento.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Server/api_config.dart';

//buscar atendimentos pelo id
class BuscarAtendimentosId {
  Future<Map<String, dynamic>> getAtendimentos(String atendimentos) async {
    Map<String, dynamic> data = {};

    final request =
        await http.get(Uri.parse('$host/atendimentos/$atendimentos'));
    if (request.statusCode == 200) {
      data = jsonDecode(request.body);
    }
    return data;
  }
}

//buscar projetos pelo nome
class BuscarAtendimentosNome {
  Future<List<Map<String, dynamic>>> getAtendimentos(
      String atendimentos) async {
    List<Map<String, dynamic>> data = [];

    final request = await http
        .get(Uri.parse('$host/atendimentos/BuscarPeloNome/$atendimentos'));
    if (request.statusCode == 200) {
      data = List<Map<String, dynamic>>.from(jsonDecode(request.body));
    }
    return data;
  }
}

//Listar Atendimentos cadastrados
class ListarAtendimentoServices {
  Future<List<DadosDeAtendimento>> obterAtendimentos() async {
    final resposta = await http.get(Uri.parse('$host/atendimentos'));

    if (resposta.statusCode == 200) {
      final List<Map<String, dynamic>> dados =
          (json.decode(resposta.body) as List<dynamic>)
              .cast<Map<String, dynamic>>();
      return dados
          .map((atendimentos) => DadosDeAtendimento.fromJson(atendimentos))
          .toList();
    } else {
      throw Exception('Falha ao carregar projetos');
    }
  }
}

//Requisição a api para cadastrar atendimentos POST
Future<bool> cadastrarAtendimento(
  comoComecouController,
  dataController,
  observacaoController,
  ocorrenciaController,
  queixaPrincipalController,
  dropdownButtonRepentinoGradual,
  sintomasController,
  pessoaID,
  atendenteId,
  tipoAtendimentoId,
) async {
  String dataFormatada = formatarData(dataController.text);
  dropdownButtonRepentinoGradual = dropdownButtonRepentinoGradual.toUpperCase();
  bool resposta;
  resposta = false;

  var response = await http.post(
    Uri.parse('$host/atendimentos'),
    headers: {'content-Type': 'application/json'},
    body: jsonEncode({
      'dataHora': dataFormatada,
      'queixaPrincipal': queixaPrincipalController.text,
      'repentinoGradualEnum': dropdownButtonRepentinoGradual,
      'comoComecou': comoComecouController.text,
      'ocorrencia': ocorrenciaController.text,
      'sintomas': sintomasController.text,
      'observacao': observacaoController.text,
      'atendentes': {'id': atendenteId},
      'tipoAtendimento': {'id': tipoAtendimentoId},
      'pessoa': {'id': pessoaID},
    }),
  );

  // ignore: avoid_print
  print('Código de resposta: ${response.statusCode}');
  // ignore: avoid_print
  print('Corpo da resposta: ${response.body}');

  if (response.statusCode == 201) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Concluído',
        'Atendimento cadastrado com sucesso',
        colorText: amarelo);
    resposta = true;
  }
  if (response.statusCode == 400) {
    Get.snackbar(
        backgroundColor: azulLogo,
        'Erro',
        'Erro ao cadastrar o Atendimento: ${response.statusCode}',
        colorText: amarelo);
    resposta = true;
  }

  return resposta;
}

//deletar Atendimento
class DeletarAtendimentoService {
  Future<void> deleteAtendimento(int idAtendimentoSelecionado) async {
    String url = '$host/atendimentos/$idAtendimentoSelecionado';

    try {
      var response = await http.delete(Uri.parse(url));
      if (response.statusCode == 204) {
        Get.snackbar(
            backgroundColor: azulLogo,
            'Concluído',
            'Atendimento deletado com sucesso',
            colorText: amarelo);
        print('Atendimento deletado com sucesso!');
      } else {
        Get.snackbar(
            backgroundColor: azulLogo,
            'Erro',
            'Falha ao deletar o Atendimento. Código de status: ${response.statusCode}',
            colorText: amarelo);
        print(
            'Falha ao deletar o Atendimento. Código de status: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao realizar a requisição: $e');
    }
  }
}
