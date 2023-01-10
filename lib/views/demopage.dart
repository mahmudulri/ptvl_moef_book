import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});

  ThemeDataController themeDataController = Get.put(ThemeDataController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 100,
                  width: 100,
                  color: themeDataController.isDark.value
                      ? Colors.black
                      : Colors.yellow,
                  child: Text("Demo Page")),
            ),
          ),
        ));
  }
}
