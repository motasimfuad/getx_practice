import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/auth_controller.dart';
import 'package:getx_practice/controllers/todo_controller.dart';

class FirebaseHome extends StatelessWidget {
  String email;
  FirebaseHome({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.logout();
                    },
                    child: const Text(
                      'LOG OUT',
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoController.addTodo();
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
