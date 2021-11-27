import 'package:flutter/material.dart';

class FirebaseLogin extends StatelessWidget {
  const FirebaseLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}
