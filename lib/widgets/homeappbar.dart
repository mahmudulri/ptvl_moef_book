import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';

class Homeappbar extends StatelessWidget {
  Homeappbar({super.key});
  ThemeDataController themeDataController = Get.put(ThemeDataController());

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: screenHeight * 0.060,
        width: screenWidth,
        decoration: BoxDecoration(
          color: box.read("themevalue") ? Color(0xff333333) : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.010),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.sort,
                color:
                    box.read("themevalue") ? Color(0xff777777) : Colors.black,
              ),
              Container(
                height: screenHeight * 0.040,
                width: screenWidth * 0.55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(08.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-2.0, -2.0),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.010),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xff777777),
                      ),
                      Spacer(),
                      Icon(
                        Icons.filter_list,
                        color: Color(0xff777777),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.090,
                width: screenWidth * 0.080,
                decoration: BoxDecoration(
                    color: box.read("themevalue") ? Colors.black : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: Icon(
                    Icons.person_pin_circle,
                    color: box.read("themevalue")
                        ? Color(0xff777777)
                        : Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  themeDataController.isDark.value =
                      !themeDataController.isDark.value;
                  box.write('themevalue', themeDataController.isDark.value);
                },
                child: Container(
                  height: screenHeight * 0.090,
                  width: screenWidth * 0.080,
                  decoration: BoxDecoration(
                      color:
                          box.read("themevalue") ? Colors.black : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Center(
                      child: Icon(
                    Icons.dark_mode,
                    color: box.read("themevalue") ? Colors.white : Colors.black,
                  )),
                ),
              ),
              Container(
                height: screenHeight * 0.090,
                width: screenWidth * 0.080,
                decoration: BoxDecoration(
                    color: box.read("themevalue") ? Colors.black : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                    child: Icon(
                  Icons.person_pin_circle,
                  color:
                      box.read("themevalue") ? Color(0xff777777) : Colors.black,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
