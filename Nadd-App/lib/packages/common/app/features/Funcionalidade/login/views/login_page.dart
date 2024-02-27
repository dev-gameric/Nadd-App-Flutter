import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/cadastro/views/cadastro_page.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/login/views/redes_sociais.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Services/login_controller.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/botao.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/formulario.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final chaveformulario = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

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
                  gradient: LinearGradient(colors: [
                amarelo.withOpacity(0.5),
                amarelo.withOpacity(0.5)
              ])),
              child: Center(
                  child: Container(
                height: altura * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logoSemFundo.png'))),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Texto.titulo('Login', corTexto: azulLogo, tamanho: 26),
            ),

            Form(
                key: chaveformulario,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Formulario(
                          chave: 'email',
                          icone: Icons.email,
                          tipo: 'Email',
                          editingController: emailController),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, top: 5),
                        child: Obx(
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
                      ),
                    ],
                  ),
                )),

            //botão esqueceu a senha.
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 0, bottom: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //Get.to(const ); tela de recuperação de senha.
                    },
                    child: Texto.paraLink('Esqueceu a senha?',
                        peso: 7, corTexto: preto),
                  ),
                ],
              ),
            ),

            //botão login
            Padding(
              padding: const EdgeInsets.all(15),
              child: Botao.redondo(
                  funcao: () {
                    if (chaveformulario.currentState!.validate()) {
                      realizarAutenticacao(emailController, senhaController);
                    }
                  },
                  altura: altura * 0.08,
                  largura: largura * 0.5,
                  corFundo: amarelo,
                  corTexto: azulLogo,
                  texto: 'Login'),
            ),

            //botão cadastre-se
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texto.padrao('Não possui uma conta? ', peso: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => const CadastroPage());
                  },
                  child: Texto.paraLink('Cadastre-se', peso: 7),
                )
              ],
            ),

            const RedesSociais()
          ],
        ),
      ),
    );
  }
}
