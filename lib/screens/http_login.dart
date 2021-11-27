import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/http_page.dart';
import 'package:getx_practice/services/api_services.dart';

class HttpLogin extends StatelessWidget {
  final TextEditingController nameController =
      TextEditingController(text: 'mor_2314');
  final TextEditingController passwordController =
      TextEditingController(text: '83r5^_');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Testing'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login'.toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Username'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
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
                  onPressed: () async {
                    final gotToken = await ApiServices().userLogin(
                        nameController.text, passwordController.text);
                    if (gotToken['token'] != null) {
                      Get.snackbar(
                        'Success',
                        'Your token is ${gotToken['token']}',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Get.to(
                          () => HttpPage(),
                        );
                      });
                    } else {
                      Get.snackbar(
                        'Error',
                        'Email or password is incorrect!',
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
