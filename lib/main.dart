import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ptvl_moef_book/draft.dart';
import 'package:ptvl_moef_book/utills/constant.dart';
import 'package:ptvl_moef_book/views/demopage.dart';
import 'package:ptvl_moef_book/views/home/homepage.dart';
import 'package:ptvl_moef_book/views/login_page/login_page.dart';
import 'package:ptvl_moef_book/views/plain_search/plain_search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    print(data.size.shortestSide.toString());
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  type = getDeviceType();

  // class DeviceemeDataController extends GetxController {}

  if (type == 'phone') {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    print(">>>>>>>>>>>>>>>>>>>" + type.toString());
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    print(">>>>>>>>>>>>>>>>>>>" + type.toString());
  }

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
