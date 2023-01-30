import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    bool landPossible = false;

    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          color: Colors.grey,
          child: Center(
            child: Text(""),
          ),
        ),
      ),
    );
  }
}
