import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/fruit_hub_app.dart';
import 'firebase_options.dart';
void main() async {
 await storage.initGetStorge();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitHubApp(appRouter: AppRouter());
  }
}
