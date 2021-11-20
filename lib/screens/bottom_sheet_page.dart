import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/themes/themes_controller.dart';
import 'package:getx_practice/themes/themes.dart';

class BottomSheetPage extends StatelessWidget {
  BottomSheetPage({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('SHOW BOTTOM SHEET'),
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Light Theme'),
                      onTap: () {
                        // Get.changeTheme(ThemeData.light());
                        themeController.changeThemeMode(ThemeMode.light);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Dark Theme'),
                      onTap: () {
                        // Get.changeTheme(ThemeData.dark());
                        themeController.changeThemeMode(ThemeMode.dark);
                      },
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
