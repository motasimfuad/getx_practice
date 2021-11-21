import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/constants/center_button.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterButton(
      appBarText: 'Getx Snackbar',
      buttonText: 'Show Snackbar',
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
          duration: Duration(milliseconds: 80000),
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
    );
  }
}
