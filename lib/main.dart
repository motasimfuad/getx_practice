import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_practice/components/dialog/dialog_page.dart';
import 'package:getx_practice/screens/homepage.dart';
import 'package:getx_practice/themes/themes.dart';
import 'package:getx_practice/themes/themes_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Practice',
      themeMode: themeController.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Getx Practice'),
        ),
        body: Homepage(),
      ),
    );
  }
}
