import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptvl_moef_book/themedata/theme_controller.dart';
import 'package:ptvl_moef_book/utills/constant.dart';
import 'package:ptvl_moef_book/widgets/homeappbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> allindex = [
    "মন্ত্রনালয়ের আইন ও বিধি সমুহ",
    "পরিবেশ নীতি, আইন ও বিধি",
    "বন নীতি, আইন ও বিধি",
    "বন আইন,ও পরিবেশ বিধি",
  ];

  var categoriesName;

  List<String> categories = [
    "বায়ু দূষণ",
    "পরিবেশ দূষণ",
    "বন ও পরিবেশ বিধি",
    "মন্ত্রণালয়ের আইন",
  ];

  var subcategoriesName;

  List<String> subcategories = [
    "পরিবেশ দূষণ",
    "বায়ু দূষণ",
    "পরিবেশ বিধি দূষণ",
    "মন্ত্রণালয়ের আইন",
    "বন ও পরিবেশ বিধি",
  ];

  ThemeDataController themeDataController = Get.put(ThemeDataController());

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Obx(() => SafeArea(
          child: Scaffold(
            extendBody: true,
            drawer: Drawer(),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Icon(
                Icons.sort,
                color:
                    box.read("themevalue") ? Color(0xff777777) : Colors.black,
              ),
              elevation: 0.0,
              flexibleSpace: Container(
                color:
                    box.read("themevalue") ? Color(0xff333333) : Colors.white,
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
              physics: BouncingScrollPhysics(),
              children: [
                // Homeappbar(),
                Visibility(
                  visible: false,
                  child: Text(
                    themeDataController.isDark.value.toString(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),

                // main Index part..................................main index part///

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
                        'সূচিপত্র',
                        style: GoogleFonts.poppins(
                            fontSize: type == "phone"
                                ? screenHeight * 0.020
                                : screenHeight * 0.030,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                      Text(
                        'সব দেখুন ',
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SizedBox(
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
                                      ? Color(0xffEFEFEF).withOpacity(0.8)
                                      : Color(0xffEFEFEF).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  allindex[index],
                                  style: TextStyle(
                                    fontSize: 12,
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
                // recent views............................recents views/////
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
                        'সাম্প্রতিক দেখা',
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
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                          color: box.read("themevalue")
                              ? Colors.black
                              : Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "বায়ুদূষণ (নিয়ন্ত্রণ) বিধিমালা, ২০২২",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            color: box.read("themevalue")
                                ? Colors.black
                                : Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ঝুঁকিপূর্ণ বর্জ্য (ই-বর্জ্য) ব্যবস্থাপনা বিধিমালা, ২০২১",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            color: box.read("themevalue")
                                ? Colors.black
                                : Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "কঠিন বর্জ্য ব্যবস্থাপনা বিধিমালা ২০২১",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // categories............................categories/////
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ক্যাটেগরি',
                        style: GoogleFonts.poppins(
                          fontSize: type == "phone"
                              ? screenHeight * 0.018
                              : screenHeight * 0.025,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    height: type == "phone"
                        ? screenHeight * 0.050
                        : screenHeight * 0.060,
                    child: DropdownButton<String>(
                      dropdownColor:
                          box.read("themevalue") ? Colors.black : Colors.white,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories[0].toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: box.read("themevalue")
                                ? Color(0xff777777)
                                : Colors.black,
                          ),
                        ),
                      ),
                      value: categoriesName,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(FontAwesomeIcons.chevronDown),
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (chosenValue) {
                        setState(() {
                          categoriesName = chosenValue.toString();
                        });
                      },
                      items: categories.map((quantityValue) {
                        return DropdownMenuItem(
                            value: quantityValue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                quantityValue,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: box.read("themevalue")
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ),

                // Sub categories............................Sub categories/////
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'সাব ক্যাটেগরি',
                        style: GoogleFonts.poppins(
                            fontSize: type == "phone"
                                ? screenHeight * 0.018
                                : screenHeight * 0.025,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    height: type == "phone"
                        ? screenHeight * 0.050
                        : screenHeight * 0.060,
                    child: DropdownButton<String>(
                      dropdownColor:
                          box.read("themevalue") ? Colors.black : Colors.white,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          subcategories[0].toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: box.read("themevalue")
                                ? Color(0xff777777)
                                : Colors.black,
                          ),
                        ),
                      ),
                      value: subcategoriesName,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          FontAwesomeIcons.chevronDown,
                        ),
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (chosenValue) {
                        setState(() {
                          subcategoriesName = chosenValue.toString();
                        });
                      },
                      items: subcategories.map((quantityValue) {
                        return DropdownMenuItem(
                            value: quantityValue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                quantityValue,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: box.read("themevalue")
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
                // Founded Results
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'প্রাপ্ত ফলাফল ',
                        style: GoogleFonts.poppins(
                          fontSize: type == "phone"
                              ? screenHeight * 0.020
                              : screenHeight * 0.030,
                          fontWeight: FontWeight.w500,
                          color: box.read("themevalue")
                              ? Colors.white
                              : Color(0xff333333),
                        ),
                      ),
                      Text(
                        '৩ টি ফলাফল পাওয়া গিয়েছে ',
                        style: GoogleFonts.poppins(
                          fontSize: type == "phone"
                              ? screenHeight * 0.015
                              : screenHeight * 0.022,
                          fontWeight: FontWeight.w500,
                          color: box.read("themevalue")
                              ? Color(0xff777777)
                              : Color(0xff777777),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            color: box.read("themevalue")
                                ? Colors.black
                                : Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.copy,
                                size: 15,
                                color: box.read("themevalue")
                                    ? Color(0xff777777)
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "ওজন স্তর ক্ষয়কারী দ্রব্য (নিয়ন্ত্রণ) বিধিমালা, ২০০৪ ( ২০১৪ সংশোধনীসহ)",
                                style: TextStyle(
                                  fontSize: type == "phone"
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.022,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 15,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            color: box.read("themevalue")
                                ? Colors.black
                                : Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.copy,
                                size: 15,
                                color: box.read("themevalue")
                                    ? Color(0xff777777)
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "ওজন স্তর ক্ষয়কারী দ্রব্য (নিয়ন্ত্রণ) বিধিমালা, ২০০৪ ( ২০১৪ সংশোধনীসহ)",
                                style: TextStyle(
                                  fontSize: type == "phone"
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.022,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 15,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            color: box.read("themevalue")
                                ? Colors.black
                                : Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.copy,
                                size: 15,
                                color: box.read("themevalue")
                                    ? Color(0xff777777)
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "ওজন স্তর ক্ষয়কারী দ্রব্য (নিয়ন্ত্রণ) বিধিমালা, ২০০৪ ( ২০১৪ সংশোধনীসহ)",
                                style: TextStyle(
                                  fontSize: type == "phone"
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.022,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 15,
                                color: Color(0xff777777),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Documents sections...................// documents section
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'সকল ডকুমেন্ট ',
                        style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.020,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'সব দেখুন ',
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.015,
                              fontWeight: FontWeight.w500,
                              color: box.read("themevalue")
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                    right: 12,
                  ),
                  child: Container(
                    height: 600,
                    width: screenWidth,
                    // color: Colors.grey,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          // color: Colors.amberAccent,
                          height: 150,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/book.png",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "পরিবেশ আইন সংকলন ১০১-২০০",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: box.read("themevalue")
                                      ? Color(0xff777777)
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
