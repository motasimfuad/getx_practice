import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPage extends StatefulWidget {
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final List cities = ['City 1', 'City 2', 'City 3', 'City 4', 'City 5'];

  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Dialog'),
          onPressed: () {
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
      ),
    );
  }

  DropdownButton<Object> customDropdownButton() {
    return DropdownButton(
      hint: Text('Select City'),
      value: selectedCity,
      onChanged: (newValue) {
        setState(() {
          selectedCity = newValue.toString();
        });
      },
      items: cities.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
