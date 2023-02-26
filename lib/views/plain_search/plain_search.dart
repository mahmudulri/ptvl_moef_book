import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';
import 'package:ptvl_moef_book/widgets/homeappbar.dart';

import '../../utills/constant.dart';

class PlainSearch extends StatefulWidget {
  const PlainSearch({super.key});

  @override
  State<PlainSearch> createState() => _PlainSearchState();
}

List mydata = [
  {
    "data": "২০ টি অনুচ্ছেদ পাওয়া গিয়েছে",
    "type": "onucched",
  },
  {
    "data": "২ টি চ্যাপ্টার পাওয়া গিয়েছে ",
    "type": "chapter",
  },
  {
    "data": "২ টি ডকুমেন্ট পাওয়া গিয়েছে ",
    "type": "document",
  },
];

class _PlainSearchState extends State<PlainSearch> {
  ThemeDataController themeDataController = Get.put(ThemeDataController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
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
          backgroundColor:
              box.read("themevalue") ? Color(0xff333333) : Colors.white,
          body: ListView(
            children: [
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
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'প্রাপ্ত ফলাফল',
                      style: GoogleFonts.poppins(
                          fontSize: type == "phone"
                              ? screenHeight * 0.020
                              : screenHeight * 0.030,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 12,
                  right: 12,
                ),
                child: SizedBox(
                    width: screenWidth,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: screenHeight * 0.005,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Icon(
                              mydata[index]["type"] == "onucched"
                                  ? Icons.menu
                                  : mydata[index]["type"] == "chapter"
                                      ? Icons.text_format
                                      : Icons.book,
                            ),
                            SizedBox(
                              width: screenWidth * 0.020,
                            ),
                            Text(
                              mydata[index]["data"],
                              style: GoogleFonts.poppins(
                                fontSize: type == "phone"
                                    ? screenHeight * 0.018
                                    : screenHeight * 0.025,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff777777),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "দেখুন",
                              style: GoogleFonts.poppins(
                                fontSize: type == "phone"
                                    ? screenHeight * 0.015
                                    : screenHeight * 0.025,
                                fontWeight: FontWeight.w500,
                                color: box.read("themevalue")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'এছাড়াও',
                      style: GoogleFonts.poppins(
                          fontSize: type == "phone"
                              ? screenHeight * 0.020
                              : screenHeight * 0.030,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
