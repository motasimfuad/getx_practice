import 'package:flutter/material.dart';

class FirebaseRegister extends StatelessWidget {
  const FirebaseRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Register'),
          ),
        ),
      ),
    );
  }
}
