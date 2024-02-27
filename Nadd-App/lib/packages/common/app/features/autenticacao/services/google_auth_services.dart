

import 'package:google_sign_in/google_sign_in.dart';

import '../models/info_google_model.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> loginComGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      return googleSignInAccount;
    } catch (error) {
      return null;
    }
  }

  Future<void> sairDoGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      rethrow;
    }
  }

  Future<InfoGoogleModel?> cadastroComGoogle(
      GoogleSignInAccount googleSignInAccount) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      return InfoGoogleModel(
          accessToken: googleAuth.accessToken!,
          idToken: googleAuth.idToken!,
          userName: googleSignInAccount.displayName ?? '',
          userEmail: googleSignInAccount.email,
          userAvatarUrl: googleSignInAccount.photoUrl ?? '');

      // Aqui você pode criar uma nova conta no seu sistema usando as informações do usuário
    } catch (error) {
      return null;
    }
  }
}
