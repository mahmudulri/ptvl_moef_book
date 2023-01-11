import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeDataController extends GetxController {
  RxBool isDark = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    isDark.value = box.read('themevalue');
    super.onInit();
  }
}
