import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_for_fun/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
