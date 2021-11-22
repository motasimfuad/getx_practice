import 'package:get/get.dart';
import 'package:getx_practice/models/destination.dart';

class DestinationController extends GetxController {
  Rx<Destination> destination = Destination().obs;

  void updateDestination({String country = '', String city = ''}) {
    destination.update((destination) {
      destination!.country = country;
      destination.city = city;
    });
  }
}
