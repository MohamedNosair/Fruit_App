import 'package:flutter/material.dart';
import 'package:fruit_app/generated/l10n.dart';

class OrCustomDivider extends StatelessWidget {
  const OrCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(height: 1, color: Colors.grey)),
        Text(S.current.or),

        Expanded(child: Divider(height: 1, color: Colors.grey)),
      ],
    );
  }
}
