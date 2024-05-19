import 'package:flutter/material.dart';
import 'package:pickmeup/platform_chooser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PickMeUp',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 183, 27, 204),
      ),
      debugShowCheckedModeBanner: false,
      home: const PlatformChooser(),
    );
  }
}
