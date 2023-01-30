import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeDataController extends GetxController {
  RxBool isDark = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    // box.write('themevalue', null);

    // print(isDark);

    if (box.read('themevalue') == null) {
      box.write('themevalue', isDark.value);
      print(box.read('themevalue'));

      // box.write('themevalue', false.obs);
    } else {
      print(box.read('themevalue'));
    }

    // isDark.value =
    //     box.read('themevalue') == null || box.read('themevalue') == ""
    //         ? false.obs
    //         : box.read('themevalue');
    // isDark.value = box.read('themevalue');
    super.onInit();
    // print(box.read('themevalue').toString());
  }
}
