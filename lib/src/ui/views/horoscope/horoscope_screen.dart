import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/horoscope_data.dart';

class HoroscopeScreen extends StatelessWidget {
  static const routeName = '/horoscope';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: Hero(
          tag: id,
          child: Image.asset(dataHoroscope[int.parse(id)].imagePath),
        ),
      ),
    );
  }
}
