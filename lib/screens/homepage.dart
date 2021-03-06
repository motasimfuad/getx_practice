import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/firebase_home.dart';
import 'package:getx_practice/screens/firebase_login.dart';
import 'package:getx_practice/screens/get_x_shop.dart';
import 'package:getx_practice/screens/http_login.dart';
import 'package:getx_practice/screens/http_page.dart';
import 'package:getx_practice/screens/module_one.dart';
import 'package:getx_practice/screens/module_two.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1,
            mainAxisExtent: 80,
          ),
          children: [
            ButtonItem(
              buttonPage: ModuleOne(),
              buttonTitle: 'Dialog, Bottom Sheet, Snackbar',
            ),
            ButtonItem(
              buttonPage: ModuleTwo(),
              buttonTitle: 'State Management',
            ),
            ButtonItem(
              buttonPage: HttpLogin(),
              buttonTitle: 'Fetching data from API with http',
            ),
            ButtonItem(
              buttonPage: GetXShop(),
              buttonTitle: 'GetX Shop',
            ),
            ButtonItem(
              buttonPage: FirebaseLogin(),
              buttonTitle: 'Authenticate with Firebase',
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  final Widget buttonPage;
  final String buttonTitle;

  const ButtonItem({required this.buttonPage, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => buttonPage,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: Offset(2, 2),
                spreadRadius: 1,
                color: Colors.deepPurple.withOpacity(.4),
              )
            ]),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
