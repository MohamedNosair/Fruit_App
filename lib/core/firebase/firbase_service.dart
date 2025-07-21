import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/exception/exception_custom.dart';

class FirbaseAuthService {
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
          switch (e.code) {
        case 'invalid-email':
          throw ExceptionCustom(message: 'Invalid email address.');
        case 'weak-password':
          throw ExceptionCustom(message: 'The password provided is too weak.');
        case 'email-already-in-use':
          throw ExceptionCustom(message: 'The account already exists for that email.');
        case 'user-disabled':
          throw ExceptionCustom(message: 'This user account has been disabled.');
        case 'user-not-found':
          throw ExceptionCustom(message: 'No user found for that email.');
        case 'wrong-password':
          throw ExceptionCustom(message: 'Incorrect password.');
        case 'network-request-failed':
          throw ExceptionCustom(message: 'Network error. Please check your internet connection.');
        case 'too-many-requests':
          throw ExceptionCustom(message: 'Too many attempts. Please try again later.');
        default:
          throw ExceptionCustom(message: 'Login failed. Please try again.');
      }
    } catch (e) {
       throw ExceptionCustom(message:'Unexpected error. Try again later.');
    }
  }
}
