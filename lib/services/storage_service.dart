import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences _pref;
  final counter = 0.obs;

  Future<StorageService> init() async {
    print('$runtimeType initialize shared preference');
    _pref = await SharedPreferences.getInstance();
    print('$runtimeType initialize shared ready');
    print('$counter');
    counter.value = _pref.getInt('counter') ?? 0;
    print('$counter');
    return this;
  }
  
}
