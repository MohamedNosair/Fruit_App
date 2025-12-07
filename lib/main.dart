import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/utils/bloc_observer.dart';
import 'package:fruit_app/core/utils/constant.dart';
import 'package:fruit_app/firebase_engine.dart';
import 'package:fruit_app/fruit_hub_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// gradlew signingReport => to get SHA1 (get from terminal C:\Users\DELL\projects\fruit_app\android)
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  await GetStorage.init();
  Bloc.observer = MyBlocObserver();
  await FirebaseEngine.init();
  setupGetIt();

  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitHubApp(appRouter: AppRouter());
  }
}
