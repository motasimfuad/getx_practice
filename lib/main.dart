import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_practice/controllers/auth_controller.dart';
import 'package:getx_practice/screens/homepage.dart';
import 'package:getx_practice/services/storage_service.dart';
import 'package:getx_practice/themes/themes.dart';
import 'package:getx_practice/controllers/themes_controller.dart';

Future<void> main() async {
  // init firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => Get.put(
      AuthController(),
    ),
  );
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  debugPrint('starting services...');
  await Get.putAsync(() => StorageService().init());
  debugPrint('services started...');
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
