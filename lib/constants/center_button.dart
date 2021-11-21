import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  final String appBarText;
  final String buttonText;
  final onPressed;
  CenterButton({
    required this.appBarText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(buttonText),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
