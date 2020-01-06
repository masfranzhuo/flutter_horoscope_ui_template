import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/horoscope_data.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/shared/horoscope_widget.dart';
import 'package:flutter_horoscope_ui_template/src/ui/views/home/builder/home_appbar_builder.dart';
import 'package:flutter_horoscope_ui_template/src/ui/views/horoscope/horoscope_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: HomeAppbarBuilder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(75)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      VerticalSpacing(),
                      Icon(Icons.drag_handle),
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1),
                          itemCount: dataHoroscope.length,
                          itemBuilder: (context, index) => HoroscopeWidget(
                            id: index.toString(),
                            image: dataHoroscope[index].imagePath,
                            name: dataHoroscope[index].name,
                            onHandler: () {
                              Navigator.of(context).pushNamed(
                                  HoroscopeScreen.routeName,
                                  arguments: index);
                            },
                          ),
                        ),
                      ),
                      VerticalSpacing(spacing: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
