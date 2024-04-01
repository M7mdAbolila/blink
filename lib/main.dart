import 'package:blink2/blink_app.dart';
import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final onboarding = sharedPreferences.getBool('onboarding') ?? false;
  runApp(
    BlinkApp(
      appRouter: AppRouter(),
      onboarding: onboarding,
    ),
  );
}
