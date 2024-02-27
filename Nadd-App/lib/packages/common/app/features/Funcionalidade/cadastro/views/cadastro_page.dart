import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/navegacao.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/login/views/login_page.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/botao.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final chaveformulario = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senhaConfirmController = TextEditingController();
  final raController = TextEditingController();
  final cargoController = TextEditingController();
  final celularController = TextEditingController();

  Rx<bool> senhaviewer = true.obs;

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //cabeçalho
            Container(
              height: altura * 0.25,
              width: largura,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [amarelo, amarelo])),
              child: Center(
                  child: Container(
                height: altura * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logoSemFundo.png'))),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Texto.titulo('Cadastro', corTexto: azulLogo, tamanho: 26),
            ),
            //botão ja possui conta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texto.padrao('Já possui conta? ', peso: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => const LoginPage());
                  },
                  child: Texto.paraLink('Faça Login', peso: 7),
                )
              ],
            ),
            Form(
                key: chaveformulario,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Formulario(
                          chave: 'nome',
                          icone: Icons.person_add_sharp,
                          tipo: 'Nome',
                          editingController: nomeController),
                      Formulario(
                          chave: 'nome',
                          icone: Icons.person_add_sharp,
                          tipo: 'Sobrenome',
                          editingController: sobrenomeController),
                      Formulario(
                          chave: 'numero',
                          icone: Icons.email,
                          tipo: 'Celular',
                          editingController: celularController),
                      Formulario(
                          chave: 'email',
                          icone: Icons.email,
                          tipo: 'Email',
                          editingController: emailController),
                      Obx(
                        () => Formulario(
                            iconeSufixo: IconButton(
                                onPressed: () {
                                  senhaviewer.value = !senhaviewer.value;
                                },
                                icon: Icon(
                                  senhaviewer.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: azulLogo,
                                )),
                            obscuro: senhaviewer.value,
                            artigo: 'a',
                            chave: 'senha',
                            icone: Icons.password,
                            tipo: 'Senha',
                            editingController: senhaController),
                      ),
                      Obx(
                        () => Formulario(
                            iconeSufixo: IconButton(
                                onPressed: () {
                                  senhaviewer.value = !senhaviewer.value;
                                },
                                icon: Icon(
                                  senhaviewer.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: azulLogo,
                                )),
                            obscuro: senhaviewer.value,
                            artigo: 'a',
                            chave: 'senhaConfirm',
                            icone: Icons.password,
                            tipo: 'Senha',
                            editingController: senhaConfirmController),
                      ),
                      Formulario(
                          chave: 'numero',
                          icone: Icons.comment,
                          tipo: 'Ra/Matricula',
                          editingController: raController),
                      Formulario(
                          chave: 'cargo',
                          icone: Icons.paste,
                          tipo: 'Cargo',
                          editingController: cargoController),
                    ],
                  ),
                )),

            //botão cadastre-se
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Botao.redondo(
                  funcao: () {
                    if (chaveformulario.currentState!.validate()) {
                      if (senhaController.text == senhaConfirmController.text) {
                        Get.to(() => const Navegacao());
                      } else {
                        Get.snackbar(
                            backgroundColor: amarelo,
                            'Erro',
                            'As senhas não coincidem',
                            colorText: azulLogo);
                      }
                    }
                  },
                  altura: altura * 0.08,
                  largura: largura * 0.5,
                  corFundo: amarelo,
                  corTexto: azulLogo,
                  texto: 'Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
