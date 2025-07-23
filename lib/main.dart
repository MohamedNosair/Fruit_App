import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/utils/bloc_observer.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/fruit_hub_app.dart';
import 'firebase_options.dart';
/// gradlew signingReport => to get SHA1 (get from terminal C:\Users\DELL\projects\fruit_app\android)
void main() async {
  await storage.initGetStorge();
  Bloc.observer = MyBlocObserver();
 await setupGetit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitHubApp(appRouter: AppRouter());
  }
}
