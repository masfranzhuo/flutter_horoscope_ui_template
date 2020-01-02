import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/constants/constant.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/horoscope_data.dart';
import 'package:flutter_horoscope_ui_template/src/ui/shared/horoscope_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(APP_TITLE),
            floating: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.9),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => HoroscopeWidget(
                image: dataHoroscope[index].imagePath,
                name: dataHoroscope[index].name,
              ),
              childCount: dataHoroscope.length,
            ),
          ),
        ],
      ),
    );
  }
}
