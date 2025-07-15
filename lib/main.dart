import 'package:flutter/material.dart';
import 'package:fruit_app/core/routing/app_router.dart';
import 'package:fruit_app/core/utils/get_storge.dart';
import 'package:fruit_app/fruit_hub_app.dart';

void main() async {
 await storage.initGetStorge();

  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitHubApp(appRouter: AppRouter());
  }
}
