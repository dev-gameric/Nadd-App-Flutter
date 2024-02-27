import 'package:flutter/material.dart';
import 'package:nadd/packages/common/app/features/ui/cores/cores.dart';
import 'package:nadd/packages/common/app/features/ui/texto/textos.dart';
import 'package:nadd/packages/common/app/features/ui/widgets/nova_tela.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NovaTela(
      corFundo: amarelo,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/logo.jpg'),
            ),
          ),
          const Text(
            'Perfil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'naad@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Nome'),
            subtitle: const Text('nadd Admin'),
            textColor: preto,
            onTap: () {
              // Ação ao tocar na localização
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Telefone'),
            subtitle: const Text('(98)98567-9616'),
            textColor: preto,
            onTap: () {
              // Ação ao tocar no número de telefone
            },
          ),
          ListTile(
            leading: const Icon(Icons.date_range),
            title: const Text('Data de Nascimento'),
            subtitle: const Text('04/02/1999'),
            textColor: preto,
            onTap: () {
              // Ação ao tocar na data de nascimento
            },
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Ação quando o botão "Editar Perfil" é pressionado
            },
            child:
                Texto.subtitulo('Editar Perfil', peso: 9, corTexto: azulLogo),
          ),
        ],
      ),
    );
  }
}
