import 'package:get/get.dart';
import 'package:getx_practice/models/makeups.dart';

class MakeupsController extends GetxController {
  var makeupList = <Makeups>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {}
}
