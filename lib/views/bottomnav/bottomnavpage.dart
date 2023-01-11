import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ptvl_moef_book/views/home/alldocuments.dart';
import 'package:ptvl_moef_book/views/home/bookmarks.dart';
import 'package:ptvl_moef_book/views/home/homepage.dart';

import '../../themedata/theme_controller.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

ThemeDataController themeDataController = Get.put(ThemeDataController());

final box = GetStorage();

class _BottomNavPageState extends State<BottomNavPage> {
  var _currrentIndex = 1;
  RxBool myColor = true.obs;
  bool rajib = false;
  final pages = [
    AllDocuemnts(),
    Homepage(),
    Bookmarks(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: Obx(
          () => themeDataController.isDark.value == true
              ? BottomNavigationBar(
                  currentIndex: _currrentIndex,
                  backgroundColor: Color(0xffF8F8F8),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "All Documents",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark),
                      label: "Bookmarks",
                    ),
                  ],
                  onTap: (inxdex) {
                    setState(() {
                      _currrentIndex = 1;
                    });
                  },
                )
              : BottomNavigationBar(
                  currentIndex: _currrentIndex,
                  backgroundColor: Color(0xffF8F8F8),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "All Documents",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark),
                      label: "Bookmarks",
                    ),
                  ],
                  onTap: (inxdex) {
                    setState(() {
                      _currrentIndex = 1;
                    });
                  },
                ),
        ),
      ),
      body: pages[1],
    );
  }
}
