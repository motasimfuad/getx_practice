import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ModuleTwo extends StatelessWidget {
  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text('-'),
                  onPressed: () {
                    decrement();
                  },
                ),
                SizedBox(width: 20),
                Obx(
                  () => Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text('+'),
                  onPressed: () {
                    increment();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
