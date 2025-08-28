import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/best_seller/ui/veiw/widget/best_seller_body.dart';
import 'package:fruit_app/generated/l10n.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarCustom(text:S.current.bestSeller,),
      body: const BestSellerBody(),
    );
  }
}