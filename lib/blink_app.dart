import 'package:blink2/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class BlinkApp extends StatelessWidget {
  final AppRouter appRouter;
  const BlinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
