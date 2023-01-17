import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';
import 'package:ptvl_moef_book/widgets/homeappbar.dart';

class PlainSearch extends StatefulWidget {
  const PlainSearch({super.key});

  @override
  State<PlainSearch> createState() => _PlainSearchState();
}

class _PlainSearchState extends State<PlainSearch> {
  ThemeDataController themeDataController = Get.put(ThemeDataController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.sort,
              color: box.read("themevalue") ? Color(0xff777777) : Colors.black,
            ),
            elevation: 0.0,
            flexibleSpace: Container(
              color: box.read("themevalue") ? Color(0xff333333) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                ),
                child: Homeappbar(),
              ),
            ),
          ),
          body: ListView(
            children: [
              Visibility(
                visible: false,
                child: Text(
                  themeDataController.isDark.value.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
