import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/consulta_atendimentos.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/consulta_projetos.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/widget/listar_atendentes.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/views/cadastrar_atendentes.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/views/cadastrar_atendimento.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/inicial/homepage/views/cadastrar_projeto.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/tamanho/sizes.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';

class AtalhosHome extends StatelessWidget {
  const AtalhosHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        botaoAtalho(
          texto: 'Cadastrar \nProjetos',
          imagem: 'images/icons/cadastro.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastrarProjetoAtalho()));
          },
        ),
        botaoAtalho(
          texto: 'Cadastrar \nAtendimentos',
          imagem: 'images/icons/consultas.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastrarAtendimento()));
          },
        ),
        botaoAtalho(
          texto: 'Cadastrar\nAtendentes',
          imagem: 'images/icons/eventos.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastrarAtendentes()));
          },
        ),
        botaoAtalho(
          texto: 'Consultar \nProjetos',
          imagem: 'images/icons/consultas2.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConsultaProjetos()));
          },
        ),
        botaoAtalho(
          texto: 'Consultar \nAtendimentos',
          imagem: 'images/icons/consultas3.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConsultaAtendimentos()));
          },
        ),
        botaoAtalho(
          texto: 'Consultar \nAtendentes',
          imagem: 'images/icons/home.png',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListarAtendentes()));
          },
        ),
      ],
    );
  }

  Widget botaoAtalho({
    required String texto,
    required String imagem,
    required VoidCallback onTap,
  }) {
    return Container(
      alignment: Alignment.center,
      height: largura * 0.33,
      width: largura * 0.33,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            // container das imagens de atalho
            Container(
              alignment: Alignment.center,
              height: largura * 0.13,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagem)),
              ),
            ),
            // Nomes dos atalhos
            Texto.titulo(
              texto,
              corTexto: azul,
              peso: 5,
              tamanho: 18,
            ),
          ],
        ),
      ),
    );
  }
}
