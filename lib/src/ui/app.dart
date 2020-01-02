import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';

import 'views/home/home_screen.dart';
import 'views/horoscope/horoscope_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Pallete.primaryColor,
        backgroundColor: Pallete.backGroundColor,
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HoroscopeScreen.routeName: (context) => HoroscopeScreen(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (context) => HomeScreen());
      },
      home: HomeScreen(),
    );
  }
}
