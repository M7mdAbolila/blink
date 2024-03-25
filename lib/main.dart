import 'package:blink2/blink_app.dart';
import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(BlinkApp(
    appRouter: AppRouter(),
  ));
  
}
