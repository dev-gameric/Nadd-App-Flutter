import 'package:google_sign_in/google_sign_in.dart';

import '../../models/info_google_model.dart';
import '../google_auth_services.dart';

class CadastroGoogle {
  final _googleAuthService = GoogleAuthService();

  Future<InfoGoogleModel?> iniciar() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleAuthService.loginComGoogle();
    if (googleSignInAccount != null) {
      return await _googleAuthService.cadastroComGoogle(googleSignInAccount);
    }
    return null;
  }
}
