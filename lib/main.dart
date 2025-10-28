import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/supabase/supabase_init.dart';
import 'package:fruit_app/core/utils/bloc_observer.dart';
import 'package:fruit_app/fruit_hub_app.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

/// gradlew signingReport => to get SHA1 (get from terminal C:\Users\DELL\projects\fruit_app\android)
void main() async {
  await GetStorage.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  await SupabaseInit.initSupabase();

  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitHubApp(appRouter: AppRouter());
  }
}
