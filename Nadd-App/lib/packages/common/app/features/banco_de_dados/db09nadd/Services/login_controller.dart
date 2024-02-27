import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/home_page.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Server/api_config.dart';

Future<void> realizarAutenticacao(emailController, senhaController) async {
  final response = await http.post(
    Uri.parse('$host/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'usuario': emailController.text,
      'senha': senhaController.text,
    }),
  );

  if (response.statusCode == 200) {
    Get.to(() => const HomePage());
    print('Sucesso na autenticação: ${response.statusCode}');
  } else {
    print('Erro na autenticação: ${response.statusCode}');
    print(response.body);
  }
}
