import 'package:blink2/core/routing/app_router.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlinkApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool onboarding;
  const BlinkApp({super.key, required this.appRouter, this.onboarding = false});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Blink',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: onboarding ? Routes.homeScreen: Routes.onboardingScreen,
      ),
    );
  }
}
