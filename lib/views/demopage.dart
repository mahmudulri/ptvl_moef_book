import 'package:flutter/material.dart';

class Demopage extends StatefulWidget {
  const Demopage({super.key});

  @override
  State<Demopage> createState() => _DemopageState();
}

class _DemopageState extends State<Demopage> {
  bool change_color = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: change_color == true ? Colors.green : Colors.red,
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            setState(() {
              change_color = !change_color;
            });
          },
        ),
      ),
    );
  }
}
