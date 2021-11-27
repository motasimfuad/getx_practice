import 'package:flutter/material.dart';

class FirebaseHome extends StatelessWidget {
  const FirebaseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('home'),
          ),
        ),
      ),
    );
  }
}
