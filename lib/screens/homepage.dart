import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/components/dialog/dialog_page.dart';
import 'package:getx_practice/screens/bottom_sheet_page.dart';
import 'package:getx_practice/screens/snackbar_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonItem(
                buttonPage: DialogPage(),
                buttonTitle: 'Dialog page',
              ),
              ButtonItem(
                buttonPage: BottomSheetPage(),
                buttonTitle: 'Bottom Sheet page',
              ),
              ButtonItem(
                buttonPage: SnackbarPage(),
                buttonTitle: 'Snackbar page',
              ),
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
        ElevatedButton(
          onPressed: () {
            Get.to(
              () => buttonPage,
            );
          },
          child: Text(buttonTitle),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
