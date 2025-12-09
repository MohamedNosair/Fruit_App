import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_app/core/errors/exception_custom.dart';
import 'package:fruit_app/core/utils/backend_end_points.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// @gmail.com
class AuthSupabaseServices {
  final Supabase supabase = Supabase.instance;

  Future<void> deleteUser(userId) async {
    userId = Supabase.instance.client.auth.currentUser?.id;
    String path = BackendEndPoints.getUserData;

    await Supabase.instance.client.from(path).delete().eq('id', userId);
  }

  /// create user with email and password
  Future<User> signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final AuthResponse res = await supabase.client.auth.signUp(
        email: emailAddress,
        password: password,
      );

      return res.user!;
    } on AuthException catch (e) {
      log('AuthException.createUserWithEmailAndPassword${e.toString()}');
      switch (e.code) {
        case 'invalid-email':
          throw ExceptionCustom(message: S.current.invalidEmail);
        case 'user_already_exists':
          throw ExceptionCustom(message: S.current.emailAlreadyInUse);
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

  /// sign in user with email and password
  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final result = await supabase.client.auth.signInWithPassword(
        email: emailAddress,
        password: password,
      );
      return result.user!;
    } on AuthException catch (e) {
      log('AuthException.signInWithEmailAndPassword${e.toString()}');
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
      throw ExceptionCustom(message: S.current.unexpected);
    }
  }

  ///  sign in with Google
  Future<User> signWithGoogle() async {
    final scopes = ['email', 'profile'];
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      serverClientId: webClientId,
      clientId: iosClientId,
    );
    final googleUser = await googleSignIn.authenticate();
    // or await googleSignIn.authenticate(); which will return a GoogleSignInAccount or throw an exception
    if (googleUser == null) {
      throw AuthException('Failed to sign in with Google.');
    }

    /// Authorization is required to obtain the access token with the appropriate scopes for Supabase authentication,
    /// while also granting permission to access user information.
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);
    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw AuthException('No ID Token found.');
    }
    var user = await supabase.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
    );
    return user.user!;
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.tokenString;
        var user = await Supabase.instance.client.auth.signInWithIdToken(
          provider: OAuthProvider.facebook,
          idToken: accessToken,
        );
        // Authentication successful
        return user.user!;
      } else {
        // Handle login cancellation or failure
        throw Exception('Facebook login failed: ${result.status}');
      }
    } catch (e) {
      // Handle errors
      throw Exception('Facebook authentication error: ${e.toString()}');
    }
  }
  //   Future<void> signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await googleSignin.signOut();
  // }

  bool isSignedIn() => supabase.client.auth.currentUser != null;
}
