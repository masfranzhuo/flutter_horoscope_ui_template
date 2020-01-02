import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/constants/constant.dart';
import 'package:flutter_horoscope_ui_template/src/resources/local_images.dart';
import 'package:flutter_horoscope_ui_template/src/ui/shared/horoscope_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        // color: Theme.of(context).primaryColor,
        child: HoroscopeWidget(
          image: LocalImages.cancer,
          name: 'Aries',
          // date: 'March 21 - April 21',
        ),
      ),
    );
  }
}
