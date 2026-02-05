import 'package:flutter/material.dart';
import 'package:questin/theme/app_theme.dart';
class GameCard extends StatelessWidget {
  final Widget child;
  const GameCard({super.key, required this.child});
   @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
