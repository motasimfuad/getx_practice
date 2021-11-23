import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_practice/controllers/destination_controller.dart';
import 'package:getx_practice/models/user.dart';

class ModuleTwo extends StatelessWidget {
  var count = 0.obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  final Rx<User> user = User(name: 'Fuad', age: 26).obs;

  void toUppercase() {
    // user.name.value = user.name.value.toUpperCase();
    // user.age = user.age++;

    user.update((user) {
      user!.name = user.name.toUpperCase();
      user.age = user.age + 1;
    });
  }

  void toLowercase() {
    // user.name.value = user.name.value.toLowerCase();
    // user.age = user.age--;
    user.update((user) {
      user!.name = user.name.toLowerCase();
      user.age = user.age - 1;
    });
  }

  final destinationController = Get.put(DestinationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 1st state example
              Column(
                children: [
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
                          '${count.value}',
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
                  Text('(Simple user of .obs)'),
                ],
              ),
              SizedBox(height: 10),
              // 2nd state example
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      '${user.value.name} is ${user.value.age}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          toUppercase();
                        },
                        child: Icon(Icons.keyboard_arrow_up),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          toLowercase();
                        },
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  Text('(Using .obs on a object of a class)'),
                  Text(
                      'Create class > create instance/object > add .obs > make method with "class.update((class) {})" > use variable inside of "Obx(() => widget" '),
                ],
              ),

              // GetxController
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetX<DestinationController>(
                        init: DestinationController(),
                        builder: (controller) => Text(
                          'Country: ${controller.destination.value.country}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          // 'City: ${Get.find<DestinationController>().destination.value.city}',
                          'City: ${destinationController.destination.value.city}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Get.find<DestinationController>().updateDestination(
                      //   country: 'Earth',
                      //   city: 'Afganistan',
                      // );
                      destinationController.updateDestination(
                        country: 'Earth',
                        city: 'Afganistan',
                      );
                    },
                    child: Text('Update destination'),
                  ),
                  Text('(Using GetxController)'),
                  Text(
                    'make modal class > make controller > use class > create instance of the controller in the using page with Get.put() > use the instance in Obx((){})',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('final controller = Get.put(DestinationController());'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
