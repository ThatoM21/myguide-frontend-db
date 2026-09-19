import 'package:flutter/material.dart';

import 'authentication/welcome_screen.dart';

void main() {
  runApp(const MyGuideApp());
}

class MyGuideApp extends StatelessWidget {
  const MyGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "MyGuide",

      theme: ThemeData(
        useMaterial3: true,
      ),

      home: const WelcomeScreen(),
    );
  }
}