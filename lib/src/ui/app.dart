import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/ui/views/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        accentColor: Colors.blueAccent,
      ),
      home: HomeScreen(),
    );
  }
}
