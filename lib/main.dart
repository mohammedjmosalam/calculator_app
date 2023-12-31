import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 30,
        )),
      ),
      home: Home(),
    );
  }
}
