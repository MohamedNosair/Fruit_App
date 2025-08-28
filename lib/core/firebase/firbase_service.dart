import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_app/core/exception/exception_custom.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirbaseAuthService {
  static final GoogleSignIn googleSignin = GoogleSignIn.instance;
  static bool inistialized = false;

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  /// create user with email and password
  Future<User> createEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException1.createUserWithEmailAndPassword${e.toString()}',
      );
      switch (e.code) {
        case 'invalid-email':
          throw ExceptionCustom(message: S.current.invalidEmail);
        case 'weak-password':
          throw ExceptionCustom(message: S.current.weakPassword);
        case 'email-already-in-use':
          throw ExceptionCustom(message: S.current.emailAlreadyInUse);
        case 'user-disabled':
          throw ExceptionCustom(message: S.current.userDisabled);
        case 'user-not-found':
          throw ExceptionCustom(message: S.current.userNotFound);
        case 'wrong-password':
          throw ExceptionCustom(message: S.current.wrongPassword);
        case 'network-request-failed':
          throw ExceptionCustom(message: S.current.networkRequestFailed);
        case 'too-many-requests':
          throw ExceptionCustom(message: S.current.tooManyRequests);
        default:
          throw ExceptionCustom(message: S.current.SignupFailed);
      }
    } catch (e) {
      log(
        'FirebaseAuthException.createUserWithEmailAndPassword${e.toString()}',
      );
      throw ExceptionCustom(message: S.current.unexpected);
    }
  }

  /// sign in with email and password
  Future<User> sigininWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException1.signInWithEmailAndPassword${e.toString()}');
      switch (e.code) {
        case 'invalid-email':
          throw ExceptionCustom(message: S.current.invalidEmail);
        case 'weak-password':
          throw ExceptionCustom(message: S.current.weakPassword);
        case 'email-already-in-use':
          throw ExceptionCustom(message: S.current.emailAlreadyInUse);
        case 'user-disabled':
          throw ExceptionCustom(message: S.current.userDisabled);
        case 'user-not-found':
          throw ExceptionCustom(message: S.current.userNotFound);
        case 'wrong-password':
          throw ExceptionCustom(message: S.current.wrongPassword);
        case 'network-request-failed':
          throw ExceptionCustom(message: S.current.networkRequestFailed);
        case 'too-many-requests':
          throw ExceptionCustom(message: S.current.tooManyRequests);
        default:
          throw ExceptionCustom(message: S.current.SignupFailed);
      }
    } catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword${e.toString()}');
      throw ExceptionCustom(message: S.current.unexpected);
    }
  }

  /// initialize Google SignIn
  static Future<void> initSignInWithGoogle() async {
    if (!inistialized) {
      await googleSignin.initialize(
        clientId:
            '479868314043-v5um73fmmqufjnk2q6cvdvkgs613s12g.apps.googleusercontent.com',
      );
    }
    inistialized = true;
  }

  /// sign in with Google
  Future<User> signInWithGoogle() async {
    await initSignInWithGoogle();
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
    if (credential.accessToken == null) {
      throw FirebaseAuthException(
        code: 'No Access Token',
        message: 'fail to retrieve access token',
      );
    }
    var user = (await FirebaseAuth.instance.signInWithCredential(
      credential,
    )).user!;

    return user;
  }

  /// sign in with facebook

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    switch (loginResult.status) {
      case LoginStatus.success:
        {
          final AccessToken? accessToken = loginResult.accessToken;
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken!.tokenString);
          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          final User? user = userCredential.user;
          return user!;
        }
      case LoginStatus.cancelled:
        throw ExceptionCustom(message: S.current.FacebookLoginCancelled);
      case LoginStatus.failed:
        throw ExceptionCustom(message: S.current.SigninFailed);
      case LoginStatus.operationInProgress:
        throw ExceptionCustom(
          message: S.current.FacebookLoginOperationInProgress,
        );
    }
  }

  bool isSignedIn() => FirebaseAuth.instance.currentUser != null;

  /// sign out from Firebase and Google
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignin.signOut();
  }
}
