import 'package:flutter/material.dart';

class PixelScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const PixelScaffold({
    super.key,
    required this.child,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Stack(
        children: [
          // 🎮 Pixel background
          Positioned.fill(
            child: Image.asset(
              'assets/black.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🌑 Dark overlay for readability
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.45),
            ),
          ),

          // 📱 Actual page content
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}