import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptvl_moef_book/views/demopage.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';
import 'package:ptvl_moef_book/widgets/homeappbar.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List<String> categories = [
    "মন্ত্রনালয়ের আইন ও বিধি সমুহ",
    "পরিবেশ নীতি, আইন ও বিধি",
    "বন নীতি, আইন ও বিধি",
    "বন আইন,ও পরিবেশ বিধি",
  ];

  ThemeDataController themeDataController = Get.put(ThemeDataController());

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
          backgroundColor:
              box.read("themevalue") ? Color(0xff333333) : Colors.white,
          body: ListView(
            children: [
              Homeappbar(),
              Visibility(
                visible: false,
                child: Text(
                  themeDataController.isDark.value.toString(),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'সূচিপত্র',
                      style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.020,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                    Text(
                      'সব দেখুন ',
                      style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.w500,
                        color: box.read("themevalue")
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  height: 50,
                  width: screenWidth,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: box.read("themevalue")
                                    ? Color(0xff777777)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
