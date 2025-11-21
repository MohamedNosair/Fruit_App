import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_app/firebase_options.dart';

class FirebaseEngine {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    _analytics.logEvent(name: name, parameters: parameters);
  }

  static Future<void> logLogin({
    required String loginMethod,
    Map<String, Object>? parameters,
  }) async {
    _analytics.logLogin(loginMethod: loginMethod, parameters: parameters);
  }

  static Future<void> logSignUp({
    required String signUpMethod,
    Map<String, Object>? parameters,
  }) async {
    _analytics.logSignUp(signUpMethod: signUpMethod, parameters: parameters);
  }
}
