import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptvl_moef_book/views/bottomnav/bottomnavpage.dart';
import 'package:ptvl_moef_book/views/home/homepage.dart';
import 'package:ptvl_moef_book/views/plain_search/plain_search.dart';

import '../../themedata/theme_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeDataController themeDataController = Get.put(ThemeDataController());
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade800,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "পরিবেশ, বন ও জলবায়ু পরিবর্তন মন্ত্রণালয়",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "শুরু করতে লগইন করুন ",
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "আপনার ইউজার আইডি / অফিস আইডি ",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "পাসওয়ার্ড",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => BottomNavPage());
                    },
                    child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff27AE60),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "লগইন",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forget password?",
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PlainSearch());
                              },
                              child: Text(
                                "RESET NOW",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: Color(0xff27AE60),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "নিবন্ধন করুন",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: screenWidth / 2 - 50,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/bangladesh-govt.png",
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
