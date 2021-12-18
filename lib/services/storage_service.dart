import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences _pref;
  final counter = 0.obs;
  final counter2 = 0.obs;

  Future<StorageService> init() async {
    debugPrint('$runtimeType initialize shared preference');
    _pref = await SharedPreferences.getInstance();
    debugPrint('$runtimeType initialize shared ready');
    debugPrint('$counter');
    counter.value = _pref.getInt('counter')!;
    debugPrint('$counter');
    return this;
  }

  Future<void> incrementCounter() async {
    debugPrint('Before increment: ${counter.value}');
    counter.value = (_pref.getInt('counter') ?? 0) + 1;
    debugPrint('After increment: ${counter.value}');
    await _pref.setInt('counter', counter.value);
    counter2.value++;
  }
}
