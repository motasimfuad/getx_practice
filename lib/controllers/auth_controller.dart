import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/firebase_home.dart';
import 'package:getx_practice/screens/firebase_login.dart';

class AuthController extends GetxController {
  // making an instance for auth controller
  // Use it by - AuthController.instance
  static AuthController instance = Get.find();

  // getting the properties from the firebase instance
  late Rx<User?> _user;

  // make an instance for accessing the firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // for notifing the users login/logout
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print('Not logged in.');
      Get.offAll(() => FirebaseLogin());
    } else {
      print('logged in.');
      Get.to(
        () => FirebaseHome(email: user.email!),
      );
    }
  }

  // Register
  Future<User?> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        'Success',
        'Registration done successfully.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        messageText: Text(
          'Registration done successfully.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      Get.snackbar(
        'Caution',
        'User registration failed',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        messageText: Text(
          e.message.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  // login functionality
  Future<User?> login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        'Success',
        'LoggedIn successfully.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        messageText: const Text(
          'LoggedIn successfully.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error!',
        'Log in failed',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        messageText: Text(
          e.message.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  // log out
  Future<void> logout() async {
    await auth.signOut();
  }
}
