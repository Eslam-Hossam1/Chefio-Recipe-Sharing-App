import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      serverClientId:
          '533415898037-1vqqv6c9i3p010pvbkoh25h21qbhoq2h.apps.googleusercontent.com');

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    return googleUser;
  }

   Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
