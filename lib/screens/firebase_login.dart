import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/auth_controller.dart';
import 'package:getx_practice/screens/firebase_register.dart';

class FirebaseLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => FirebaseRegister(),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
