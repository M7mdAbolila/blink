import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<dynamic> exitAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure you want to exit?'),
          content: const Text('This will close the app.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  }