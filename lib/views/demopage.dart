import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Demopage extends StatefulWidget {
  const Demopage({super.key});

  @override
  State<Demopage> createState() => _DemopageState();
}

class _DemopageState extends State<Demopage> {
  String mytext =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters";
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mytext),
              ElevatedButton(
                child: Text('Share now'),
                onPressed: () async {
                  await Share.share('check out my website https://example.com');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
