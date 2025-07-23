import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninWithGoogle {
    static final GoogleSignIn googleSignin = GoogleSignIn.instance;
  static bool inistialized = false;



    static Future<void> initSignInWithGoogle() async {
    if (!inistialized) {
      await googleSignin.initialize(
        clientId:
            '479868314043-v5um73fmmqufjnk2q6cvdvkgs613s12g.apps.googleusercontent.com',
      );
    }
    inistialized = true;
  }



    Future<User> signInWithGoogle() async {
    initSignInWithGoogle();
    final GoogleSignInAccount? account = await googleSignin.authenticate();
    if (account == null) {
      throw FirebaseAuthException(
        code: 'ERROR ABORTED BY USER',
        message: 'Sign in incompleted because user EXIT',
      );
    }

    final idToken = account.authentication.idToken;
    final authClient = account.authorizationClient;
    GoogleSignInClientAuthorization? auth = await authClient
        .authorizationForScopes(['email', 'profile']);

    final accessToken = auth?.accessToken;
    if (accessToken == null) {
      final auth2 = await authClient.authorizationForScopes([
        'email',
        'profile',
      ]);

      if (auth2?.accessToken == null) {
        throw FirebaseAuthException(
          code: 'No Access Token',
          message: 'fail to retrieve access token',
        );
      }
    auth = auth2;
    }

final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential))
        .user!;
  }
}