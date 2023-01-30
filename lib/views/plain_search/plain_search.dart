import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
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
                          fontSize: screenHeight * 0.020,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                    // Text(
                    //   'সব দেখুন ',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: screenHeight * 0.015,
                    //     fontWeight: FontWeight.w500,
                    //     color: box.read("themevalue")
                    //         ? Colors.white
                    //         : Colors.black,
                    //   ),
                    // ),
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
