import 'package:flutter/material.dart';
import '../../../core/helpers/exit_alert_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
         exitAlertDialog(context);
      },
      child: const Scaffold(
        body: Center(
          child: Text(
            'Home screen',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
