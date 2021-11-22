import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/themes_controller.dart';

class ModuleOne extends StatelessWidget {
  const ModuleOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog, Bottom Sheet, Snackbar'),
      ),
      body: Container(
        padding: EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogButton(),
              BottomSheetButton(),
              SnackBarButton(),
            ],
          ),
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
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              var data = await Get.to(
                () => buttonPage,
              );
              print('$data');
            },
            child: Text(buttonTitle),
          ),
        ),
      ],
    );
  }
}

// dialog button
Widget DialogButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      child: Text('Dialog'),
      onPressed: () {
        // Get.back(result: 'HI! HI!! HI!!!');
        Get.defaultDialog(
          radius: 15.0,
          title: 'Please select your zone',
          titlePadding: EdgeInsets.all(15),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          content: Column(
            children: const [
              Text(
                'Select city',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Select city',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'CONFIRM ZONE',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          ],
          barrierDismissible: false,
        );
      },
    ),
  );
}

// bottom sheet button
class BottomSheetButton extends StatelessWidget {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Bottom Sheet'),
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
                      themeController.saveTheme(false);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Dark Theme'),
                    onTap: () {
                      // Get.changeTheme(ThemeData.dark());
                      themeController.changeThemeMode(ThemeMode.dark);
                      themeController.saveTheme(true);
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
    );
  }
}

// snack bar
Widget SnackBarButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      child: Text('Snack bar'),
      onPressed: () {
        Get.snackbar(
          "Title",
          "Subtitle",
          titleText: Text(
            '9.10 AM',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            'Dude, Learn Flutter!',
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          backgroundColor: Colors.grey.shade900,
          margin: EdgeInsets.all(10),
          duration: Duration(milliseconds: 8000),
          icon: Icon(
            Icons.alarm,
            color: Colors.grey.shade400,
          ),
          shouldIconPulse: false,
          padding: EdgeInsets.only(
            top: 15,
            right: 27,
            left: 17,
            bottom: 15,
          ),
          mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 7,
              ),
              child: Text(
                'Turn off',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        );
      },
    ),
  );
}
