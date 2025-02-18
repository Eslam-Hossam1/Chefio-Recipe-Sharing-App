import 'package:chefio_app/core/utils/env_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: kIsWeb ? null : EnvConfig.webClientId,
    clientId: kIsWeb ? null : EnvConfig.webClientId,
  );

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    return googleUser;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
