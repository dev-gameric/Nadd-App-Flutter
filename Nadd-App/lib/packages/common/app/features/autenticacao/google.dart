import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nadd/packages/common/app/features/Funcionalidade/barra_navegacao/view/navegacao.dart';
import 'package:nadd/packages/common/app/features/autenticacao/services/google_auth_services.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GoogleAuthService _googleAuthService = GoogleAuthService();

  HomeScreen({super.key});

  Future<void> _loginComGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleAuthService.loginComGoogle();

    if (googleSignInAccount != null) {
      // Login bem-sucedido
      await Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Navegacao()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo de Login com Google"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _loginComGoogle(context);
          },
          child: const Text("Login com Google"),
        ),
      ),
    );
  }
}
